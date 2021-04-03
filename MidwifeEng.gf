concrete MidwifeEng of Midwife =
  open Prelude, SyntaxEng, ParadigmsEng,
  LexiconEng, (G=GrammarEng), (R=ResEng) in {

  lincat
    Statement = S ;
    Complaint, Complaints = NP ;
    Limb = {s : NP ; prep : Prep } ;
    Subject = NP ;


  lin
    Has subject complaints  = mkS (mkCl subject have_V2 complaints)  ; -- "patsiendil on pearinglus"
    HasNoComplaints subject = mkS negativePol (mkCl subject have_V2 (mkNP aPl_Det (mkN "complaint"))) ;

    -- Subjects
    Patient   = mkNP (mkN "patient") ;
    -- Myself = mkNP i_Pron ;

    -- Limbs
    Hands = {s = mkNP aPl_Det (mkN "hand");
             prep = possess_Prep} ;
    Feet  = {s = mkNP aPl_Det (mkN "foot" "feet");
             prep = possess_Prep} ;
    HandsAndFeet = {s = G.ConjNP and_Conj (G.BaseNP Hands.s Feet.s)
                      | G.ConjNP and_Conj (G.BaseNP Feet.s Hands.s);
                    prep = possess_Prep};

    -- Complaints
    --NoComplaints = mkNP (mkN "worryless") ;
    Nausea    = mkNP (mkN "nausea") ;
    Dizziness = mkNP (mkN "dizziness") ;
    Heartburn = mkNP aPl_Det (mkN "heartburn") ;
    Constipation = mkNP (mkN "constipation") ;

    Swelling limb = mkNP (mkNP (mkCN (mkN "swelling"))) (SyntaxEng.mkAdv limb.prep limb.s) ;

    -- Conjunctions of several complaints
    Complaints1 c        = c ; -- "pearinglus"
    Complaints2 c1 c2    = G.ConjNP and_Conj (G.BaseNP c1 c2) ; -- "pearinglus ja pearinglus"
    Complaints3 c1 c2 c3 = G.ConjNP and_Conj (G.ConsNP c3 (G.BaseNP c1 c2)) ; -- "pearinglus, pearinglus ja pearinglus"

    

}