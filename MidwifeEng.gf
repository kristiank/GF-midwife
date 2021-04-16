concrete MidwifeEng of Midwife =
  open Prelude, SyntaxEng, ParadigmsEng,
  LexiconEng, GrammarEng in {

  lincat
    Statement          = S ;
    Complaint, Complaints = NP ;
    Limb               = { s : NP ; prep : Prep } ;
    Subject            = NP ;
    FetalMovementLevel = Adv ;
    HaemoglobinLevel   = AP ;


  lin
    Has subject complaints  = mkS             (mkCl subject have_V2 complaints)  ; -- "patsiendil on pearinglus"
    HasNoComplaints subject = mkS negativePol (mkCl subject have_V2 (mkNP aPl_Det (mkN "complaint"))) ;

    -- Subjects
    Patient   = mkNP (mkN "patient") ;

    -- Limbs
    Hands = {s    = mkNP aPl_Det (mkN "hand");
             prep = possess_Prep} ;
    Feet  = {s    = mkNP aPl_Det (mkN "foot" "feet");
             prep = possess_Prep} ;
    HandsAndFeet  = {s = GrammarEng.ConjNP and_Conj (GrammarEng.BaseNP Hands.s Feet.s)
                       | GrammarEng.ConjNP and_Conj (GrammarEng.BaseNP Feet.s Hands.s);
                     prep = possess_Prep};

    -- Complaints
    --NoComplaints = mkNP (mkN "worryless") ;
    Nausea       = mkNP         (mkN "nausea") ;
    Dizziness    = mkNP         (mkN "dizziness") ;
    Heartburn    = mkNP aPl_Det (mkN "heartburn") ;
    Constipation = mkNP         (mkN "constipation") ;

    Swelling limb = mkNP (mkNP (mkCN (mkN "swelling"))) (SyntaxEng.mkAdv limb.prep limb.s) ;

    -- Conjunctions of several complaints
    Complaints1 c        = c ; -- "pearinglus"
    Complaints2 c1 c2    = GrammarEng.ConjNP and_Conj (GrammarEng.BaseNP c1 c2) ; -- "pearinglus ja pearinglus"
    Complaints3 c1 c2 c3 = GrammarEng.ConjNP and_Conj (GrammarEng.ConsNP c3 (GrammarEng.BaseNP c1 c2)) ; -- "pearinglus, pearinglus ja pearinglus"


    -- the patient feels fetal movements strongly
    FeelsFetalMovements level = mkS (mkCl (mkNP (mkN "patient"))
                                          (mkVP (mkVP (mkV2 (mkV "feel"))
                                                (mkNP (mkN "fetal" (mkN "movement"))))
                                                level)) ;
    Strong = SyntaxEng.mkAdv (mkA "strong") ;
    Active = SyntaxEng.mkAdv (mkA "active") ;
    Weak   = SyntaxEng.mkAdv (mkA "weak") ;



    -- hemoglobin is low
    HaemoglobinHigh    = mkAP          (mkA "high") ;
    HaemoglobinNormal  = mkAP          (mkA "normal") ;
    HaemoglobinLow     = mkAP          (mkA "low") ;
    HaemoglobinVeryLow = mkAP very_AdA (mkA "low") ;
    HaemoglobinFinding level = mkS (mkCl (mkNP (mkN "hemoglobin")) level) ;

}