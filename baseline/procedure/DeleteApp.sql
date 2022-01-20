DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteApp`(
    intAppID        INT
)
BEGIN
    START TRANSACTION;

 

    DELETE FROM AppCoverLetter WHERE AppID = intAppID;
    DELETE FROM AppError WHERE AppID = intAppID;
    DELETE FROM AppFormData WHERE AppID = intAppID;
    DELETE FROM AppJobData WHERE AppID = intAppID;
    DELETE FROM AppTrackingData WHERE AppID = intAppID;
    DELETE FROM FlowLog WHERE AppID = intAppID;
    DELETE FROM App WHERE AppID = intAppID;
    
    COMMIT;

 

END$$
DELIMITER ;
