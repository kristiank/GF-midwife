concrete MidwifeEst of Midwife =
  open Prelude, SyntaxEst, ParadigmsEst,
  LexiconEst, GrammarEst, ResEst in {

  lincat
    Statement             = S ;
    Complaint, Complaints = NP ;
    Limb                  = {s : NP ; prep : Prep} ;
    Subject               = NP ;
    FetalMovementLevel    = Adv ;
    HaemoglobinLevel      = AP ;


  lin
    Has subject complaints  = mkS             (mkCl subject have_V2 complaints) ; -- "patsiendil on pearinglus"
    HasNoComplaints subject = mkS negativePol (mkCl subject have_V2 (mkNP aPl_Det (mkN "kaebus")))
                            | mkS (mkCl subject (SyntaxEst.mkAdv without_Prep (mkNP thePl_Det (mkN "kaebusteta" "kaebusteta" "kaebusteta" "kaebusteta" "kaebusteta" "kaebusteta"))));

    -- Subjects
    Patient   = mkNP (mkN "patsient") ;

    -- Swelling of Limbs
    Swelling limb = mkNP (mkNP aPl_Det (mkCN (mkN "turse"))) (SyntaxEst.mkAdv limb.prep limb.s) ;

    Hands = {s    = mkNP aPl_Det (mkN "käsi" "käe" "kätt" "käesse" "käte" "käsi");
             prep = on_Prep} ;
    Feet  = {s    = mkNP aPl_Det (mkN "jalg" "jala" "jalga");
             prep = on_Prep} ;
    HandsAndFeet  = {s = GrammarEst.ConjNP and_Conj (GrammarEst.BaseNP Hands.s Feet.s)
                       | GrammarEst.ConjNP and_Conj (GrammarEst.BaseNP Feet.s Hands.s);
                     prep = on_Prep};


    -- Complaints
    Nausea       = mkNP         (mkN "iiveldus") ;
    Dizziness    = mkNP         (mkN "pea" (mkN "ringlus")) ;
    Heartburn    = mkNP aPl_Det (mkN "kõrvetis") ;
    Constipation = mkNP         (mkN "kõhu" (mkN "kinnisus")) ;

    -- Conjunctions of several complaints
    Complaints1 c        = c ; -- "pearinglus"
    Complaints2 c1 c2    = GrammarEst.ConjNP and_Conj (GrammarEst.BaseNP c1 c2) ; -- "pearinglus ja pearinglus"
    Complaints3 c1 c2 c3 = GrammarEst.ConjNP and_Conj (GrammarEst.ConsNP c3 (GrammarEst.BaseNP c1 c2)) ; -- "pearinglus, pearinglus ja pearinglus"




    -- tunneb looteliigitusi aktiivselt
    FeelsFetalMovements level = mkS (mkCl (mkNP (mkN "patsient"))
                                          (mkVP level
                                                (mkVP (mkV2 (mkV "tundma" "tunda" "tunneb"))
                                                (mkNP (mkN "loote" (mkN "liigutusi")))) )) ;
    Strong = SyntaxEst.mkAdv (invA "hästi") ;    -- hästi
    Active = SyntaxEst.mkAdv (mkA  "aktiivne") ; -- aktiivselt
    Weak   = SyntaxEst.mkAdv (invA "vähe") ;     -- vähe


    -- hemoglobiin on väga madal
    HaemoglobinFinding level = mkS (mkCl (mkNP (mkN "hemoglobiin")) level) ;
    HaemoglobinHigh    = mkAP          (mkA "kõrge") ;
    HaemoglobinNormal  = mkAP          (mkA "normaalne") ;
    HaemoglobinLow     = mkAP          (mkA "madal") ;
    HaemoglobinVeryLow = mkAP very_AdA (mkA "madal") ;

}