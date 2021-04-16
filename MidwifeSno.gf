concrete MidwifeSno of Midwife =
  open Prelude, SyntaxEng, ParadigmsEng,
  LexiconEng, GrammarEng, ResEng in {

  lincat
    Statement          = {s : Str} ;
    Complaint, Complaints = {s : Str} ;
    Limb               = {s : Str } ;
    Subject            = {s : Str} ;
    FetalMovementLevel = {s : Str} ;


  lin
    --Has subject complaints = mkCl subject have_V2 complaints  ; -- "patsiendil on pearinglus"
    Has subject complaints   = {s = complaints.s} ; -- TODO subject is omitted
    HasNoComplaints subject  = {s = "248264000 |No complaints (finding)|" };

    -- Subjects
    Patient      = {s = "patient"} ;

    -- Complaints
    Nausea       = {s = "162057007 |Nausea present (situation)|"} ;
    Dizziness    = {s = "14760008 |Constipation (finding)|"} ;
    Heartburn    = {s = "16331000 |Heartburn (finding)|"} ;
    Constipation = {s = "162260006 |Dizziness present (situation)|"} ;

    -- Limbs can be swollen
    Swelling limb = limb ;
    Hands         = {s = "299037003 |Swelling of hand (finding)|"} ;
    Feet          = {s = "297142003 |Foot swelling (finding)|"} ;
    HandsAndFeet  = {s = Hands.s ++ "+" ++ Feet.s} ;

    -- Conjunctions of several complaints
    Complaints1 c        = c ;
    Complaints2 c1 c2    = {s = c1.s ++ "+" ++ c2.s} ;
    Complaints3 c1 c2 c3 = {s = c1.s ++ "+" ++ c2.s ++ "+" ++ c3.s} ;


    
    FeelsFetalMovements level = level ;
    Strong = {s = "276371006 |Strong fetal movements (finding)|"} ;
    Active = {s = "276368003 |Baby kicks a lot (finding)|"} ;
    Weak   = {s = "276372004 |Weak fetal movements (finding)|"} ;

    HaemoglobinFinding level = level ;
    HaemoglobinHigh    = {s = "131141003 |Increased hemoglobin (finding)|"} ;
    HaemoglobinNormal  = {s = "165399006 |Hemoglobin normal (finding)|"} ;
    HaemoglobinLow     = {s = "165397008 |Hemoglobin low (finding)|"} ;
    HaemoglobinVeryLow = {s = "165396004 |Hemoglobin very low (finding)|"} ;

}
