-- This will add one column to APP table
ALTER TABLE `ApplyData`.`App` 
ADD COLUMN `AppText6` VARCHAR(45) NULL AFTER `AppUID`;