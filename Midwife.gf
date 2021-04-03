abstract Midwife = {

  flags startcat = Statement ;

  cat
    Statement ;
    Subject ;
    Complaint ;
    Complaints ;
    Limb ;
    FetalMovement ;
    

  data
    -- A statement consists of a subject and complaints
    Has : Subject -> Complaints -> Statement ;
    -- TODO has : complaints -> statement ; -- default subject
    HasNoComplaints : Subject -> Statement ;

    -- Complaints can be conjuncted
    Complaints1  : Complaint -> Complaints ;
    Complaints2  : Complaint -> Complaint -> Complaints ;
    Complaints3  : Complaint -> Complaint -> Complaint -> Complaints ;

    -- Subjects
    Myself, Patient : Subject ;

    -- Complaints without modifiers
    Nausea, Heartburn, Constipation, Dizziness : Complaint ;

    -- Swelling of limb
    Swelling : Limb -> Complaint ;
    Hands, Feet, HandsAndFeet, Unspecified : Limb ;

    -- Fetal movement finding
    FeelsFetalMovements : FetalMovement -> Statement ;

    -- Levels of fetal movement
    Strong, Active, Weak : FetalMovement ;
}