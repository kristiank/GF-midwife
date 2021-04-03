concrete MidwifeEst of Midwife =
  open Prelude, SyntaxEst, ParadigmsEst,
  LexiconEst, (G=GrammarEst), (R=ResEst) in {

  lincat
    Statement = S ;
    Complaint, Complaints = NP ;
    Limb = {s : NP ; prep : Prep } ;
    Subject = NP ;
    FetalMovement = Adv ;


  lin
    Has subject complaints  = mkS (mkCl subject have_V2 complaints) ; -- "patsiendil on pearinglus"
    HasNoComplaints subject = mkS negativePol (mkCl subject have_V2 (mkNP aPl_Det (mkN "kaebus")))
                            | mkS (mkCl subject (SyntaxEst.mkAdv without_Prep (mkNP thePl_Det (mkN "kaebusteta" "kaebusteta" "kaebusteta" "kaebusteta" "kaebusteta" "kaebusteta"))));

    -- Subjects
    Patient   = mkNP (mkN "patsient") ;
    -- Myself = mkNP i_Pron ;

    -- Swelling of Limbs
    Swelling limb = mkNP (mkNP aPl_Det (mkCN (mkN "turse"))) (SyntaxEst.mkAdv limb.prep limb.s) ;

    Hands = {s = mkNP aPl_Det (mkN "käsi" "käe" "kätt" "käesse" "käte" "käsi");
             prep = on_Prep} ;
    Feet  = {s = mkNP aPl_Det (mkN "jalg" "jala" "jalga");
             prep = on_Prep} ;
    HandsAndFeet = {s = G.ConjNP and_Conj (G.BaseNP Hands.s Feet.s)
                      | G.ConjNP and_Conj (G.BaseNP Feet.s Hands.s);
                    prep = on_Prep};


    -- Complaints
    Nausea       = mkNP         (mkN "iiveldus") ;
    Dizziness    = mkNP         (mkN "pea" (mkN "ringlus")) ;
    Heartburn    = mkNP aPl_Det (mkN "kõrvetis") ;
    Constipation = mkNP         (mkN "kõhu" (mkN "kinnisus")) ;

    -- Conjunctions of several complaints
    Complaints1 c        = c ; -- "pearinglus"
    Complaints2 c1 c2    = G.ConjNP and_Conj (G.BaseNP c1 c2) ; -- "pearinglus ja pearinglus"
    Complaints3 c1 c2 c3 = G.ConjNP and_Conj (G.ConsNP c3 (G.BaseNP c1 c2)) ; -- "pearinglus, pearinglus ja pearinglus"




    FeelsFetalMovements level = mkS (mkCl (mkNP (mkN "patsient")) (mkVP (mkVP (mkV2 (mkV "tundma" "tunda" "tunneb")) (mkNP (mkN "loote" (mkN "liigutusi")))) level)) ;
    Strong = SyntaxEst.mkAdv (invA "hästi") ;    -- hästi
    Active = SyntaxEst.mkAdv (mkA  "aktiivne") ; -- aktiivselt
    Weak   = SyntaxEst.mkAdv (invA "vähe") ;     -- vähe
}