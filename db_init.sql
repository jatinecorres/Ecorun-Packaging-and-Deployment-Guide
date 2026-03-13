-- ==========================================================
-- CLEAN COMPLETE DOCXFER DATABASE SCRIPT 
-- ==========================================================

DROP SCHEMA IF EXISTS `docxfer`;
CREATE SCHEMA IF NOT EXISTS `docxfer`;
USE `docxfer`;

-- ==========================================================
-- TABLE: docxfer_batch_config
-- ==========================================================
CREATE TABLE IF NOT EXISTS `docxfer_batch_config` (
  `batch_id` INT(11) NOT NULL AUTO_INCREMENT,
  `batch_name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(300) DEFAULT NULL,
  `seal_id` INT(11) DEFAULT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ==========================================================
-- TABLE: docxfer_environments
-- ==========================================================
CREATE TABLE IF NOT EXISTS `docxfer_environments` (
  `env_id` INT(11) NOT NULL AUTO_INCREMENT,
  `env_name` VARCHAR(100) NOT NULL,
  `env_type` VARCHAR(100) NOT NULL,
  `is_active` TINYINT(1) DEFAULT '1',
  `config_file` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`env_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ==========================================================
-- TABLE: docxfer_error_log
-- ==========================================================
CREATE TABLE IF NOT EXISTS `docxfer_error_log` (
  `error_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `batch_id` BIGINT(20) NOT NULL,
  `module` VARCHAR(100) NOT NULL,
  `error_code` VARCHAR(100) DEFAULT NULL,
  `error_folder` VARCHAR(200) NOT NULL,
  `error_desc` VARCHAR(255) DEFAULT NULL,
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `error_file` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`error_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ==========================================================
-- TABLE: docxfer_export_file_log
-- ==========================================================
CREATE TABLE IF NOT EXISTS `docxfer_export_file_log` (
  `export_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `batch_id` BIGINT(20) NOT NULL,
  `export_doc_id` VARCHAR(10000) DEFAULT NULL,
  `export_doc_vsid` VARCHAR(100) DEFAULT NULL,
  `file_name` VARCHAR(255) DEFAULT NULL,
  `start_date_time` DATETIME DEFAULT NULL,
  `end_date_time` DATETIME DEFAULT NULL,
  `file_size` FLOAT DEFAULT NULL,
  `success_flag` TINYINT(1) DEFAULT '1',
  `major_version_number` INT(11) DEFAULT NULL,
  `minor_version_number` INT(11) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `error_code` INT(11) DEFAULT NULL,
  PRIMARY KEY (`export_id`)
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=latin1;

-- ==========================================================
-- TABLE: docxfer_global_processing_info
-- ==========================================================
CREATE TABLE IF NOT EXISTS `docxfer_global_processing_info` (
  `row_id` INT(11) NOT NULL AUTO_INCREMENT,
  `global_process_id` VARCHAR(100) NOT NULL,
  `component_name` VARCHAR(100) NOT NULL,
  `step_name` VARCHAR(300) NOT NULL,
  `is_success` TINYINT(1) DEFAULT '1',
  `updated_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  UNIQUE KEY `global_process_id` (`global_process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ==========================================================
-- TABLE: docxfer_mapping_config
-- ==========================================================
CREATE TABLE IF NOT EXISTS `docxfer_mapping_config` (
  `seal_id` INT(11) NOT NULL AUTO_INCREMENT,
  `seal_name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(300) DEFAULT NULL,
  `source_id` INT(11) NOT NULL,
  `target_id` INT(11) NOT NULL,
  `mapping_file` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`seal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ==========================================================
-- TABLE: docxfer_environments
-- ==========================================================
CREATE TABLE IF NOT EXISTS `docxfer_environments` (
  `env_id` INT(11) NOT NULL AUTO_INCREMENT,
  `env_name` VARCHAR(100) NOT NULL,
  `env_type` VARCHAR(50) NOT NULL,
  `is_active` TINYINT(1) NOT NULL DEFAULT 1,
  `config_file` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`env_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ==========================================================
-- TABLE: docxfer_batch_config
-- ==========================================================
CREATE TABLE IF NOT EXISTS `docxfer_batch_config` (
  `batch_id` INT(11) NOT NULL AUTO_INCREMENT,
  `batch_name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(300) DEFAULT NULL,
  `seal_id` INT(11) DEFAULT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ==========================================================
-- TABLE: docxfer_systems
-- ==========================================================
CREATE TABLE IF NOT EXISTS `docxfer_systems` (
  `system_id` INT(11) NOT NULL AUTO_INCREMENT,
  `system_name` VARCHAR(100) NOT NULL,
  `system_type` VARCHAR(50) NOT NULL,
  `description` VARCHAR(300) DEFAULT NULL,
  `driver_class` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- TABLE: docxfer_systems
CREATE TABLE IF NOT EXISTS `docxfer_systems` (
  `system_id` INT(11) NOT NULL,
  `system_code` VARCHAR(100) NOT NULL,
  `system_name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(300) DEFAULT NULL,
  `connector_class` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- TABLE: docxfer_poller_config
CREATE TABLE IF NOT EXISTS `docxfer_poller_config` (
  `poller_id` INT(11) NOT NULL,
  `poller_name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(300) DEFAULT NULL,
  `port` INT(11) NOT NULL,
  `max_instance_allowed` INT(11) NOT NULL DEFAULT 1,
  `config_location` VARCHAR(300) NOT NULL,
  `is_active` TINYINT(1) DEFAULT 1,
  PRIMARY KEY (`poller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- TABLE: docxfer_import_file_log
CREATE TABLE IF NOT EXISTS `docxfer_import_file_log` (
  `import_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `batch_id` BIGINT(20) NOT NULL,
  `import_doc_id` VARCHAR(10000) DEFAULT NULL,
  `import_doc_vsid` VARCHAR(100) DEFAULT NULL,
  `file_name` VARCHAR(255) DEFAULT NULL,
  `start_date_time` DATETIME DEFAULT NULL,
  `end_date_time` DATETIME DEFAULT NULL,
  `file_size` FLOAT DEFAULT NULL,
  `success_flag` TINYINT(1) DEFAULT 1,
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- TABLE: docxfer_transform_file_log
CREATE TABLE IF NOT EXISTS `docxfer_transform_file_log` (
  `transform_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `batch_id` BIGINT(20) NOT NULL,
  `file_name` VARCHAR(255) DEFAULT NULL,
  `start_date_time` DATETIME DEFAULT NULL,
  `end_date_time` DATETIME DEFAULT NULL,
  `file_size` FLOAT DEFAULT NULL,
  `success_flag` TINYINT(1) DEFAULT 1,
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- TABLE: migration_file_log
CREATE TABLE IF NOT EXISTS `migration_file_log` (
  `migration_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `batch_id` BIGINT(20) DEFAULT NULL,
  `file_name` VARCHAR(255) DEFAULT NULL,
  `start_date_time` DATETIME DEFAULT NULL,
  `end_date_time` DATETIME DEFAULT NULL,
  `file_size` FLOAT DEFAULT NULL,
  `success_flag` TINYINT(1) DEFAULT 1,
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`migration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- TABLE: box_upload_file_log
CREATE TABLE IF NOT EXISTS `box_upload_file_log` (
  `box_upload_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `batch_id` BIGINT(20) DEFAULT NULL,
  `file_name` VARCHAR(255) DEFAULT NULL,
  `start_date_time` DATETIME DEFAULT NULL,
  `end_date_time` DATETIME DEFAULT NULL,
  `file_size` FLOAT DEFAULT NULL,
  `success_flag` TINYINT(1) DEFAULT 1,
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`box_upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- TABLE: box_download_file_log
CREATE TABLE IF NOT EXISTS `box_download_file_log` (
  `box_download_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `batch_id` BIGINT(20) DEFAULT NULL,
  `file_name` VARCHAR(255) DEFAULT NULL,
  `start_date_time` DATETIME DEFAULT NULL,
  `end_date_time` DATETIME DEFAULT NULL,
  `file_size` FLOAT DEFAULT NULL,
  `success_flag` TINYINT(1) DEFAULT 1,
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`box_download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- TABLE: activity_logs
CREATE TABLE IF NOT EXISTS activity_logs (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    name VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    success_flag BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS ecorun_batchs (
    batch_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    service VARCHAR(255) NOT NULL,
    source_files_count INT NOT NULL,
    source_files_size BIGINT NOT NULL,
    processed_files INT NOT NULL,
    invalid_files INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);






-- ==========================================================
-- STORED PROCEDURES & FUNCTIONS (DROP IF EXISTS THEN CREATE)
-- ==========================================================

-- Safe replace: drop before create to avoid "already exists" errors
DROP PROCEDURE IF EXISTS `get_docxfer_combined_processing_speed`;
DROP PROCEDURE IF EXISTS `get_docxfer_combined_statistics`;
DROP PROCEDURE IF EXISTS `get_combined_peak_processing_time`;
DROP FUNCTION IF EXISTS `get_environment_name`;

DELIMITER $$

-- ==========================================================
-- PROCEDURE: get_docxfer_combined_processing_speed
-- ==========================================================
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_docxfer_combined_processing_speed`()
BEGIN
    SELECT (COUNT(*)) AS doc_count,
           CASE
             WHEN (AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) IS NULL)
               THEN 0.00
             ELSE ROUND(AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)),2)
           END AS avg_processing_time,
           'ImportProcessingSpeed' AS stat_type
    FROM docxfer_import_file_log
    WHERE update_time >= NOW() - INTERVAL 1 HOUR

    UNION

    SELECT (COUNT(*)) AS doc_count,
           CASE
             WHEN (AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) IS NULL)
               THEN 0.00
             ELSE ROUND(AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)),2)
           END AS avg_processing_time,
           'ExportProcessingSpeed' AS stat_type
    FROM docxfer_export_file_log
    WHERE update_time >= NOW() - INTERVAL 1 HOUR

    UNION

    SELECT (COUNT(*)) AS doc_count,
           CASE
             WHEN (AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) IS NULL)
               THEN 0.00
             ELSE ROUND(AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)),2)
           END AS avg_processing_time,
           'TransformProcessingSpeed' AS stat_type
    FROM docxfer_transform_file_log
    WHERE update_time >= NOW() - INTERVAL 1 HOUR

    UNION

    SELECT COUNT(*) AS doc_count,
    CASE
        WHEN AVG(TIMESTAMPDIFF(MICROSECOND, start_date_time, end_date_time)) IS NULL
        THEN 0.0000
        ELSE ROUND(AVG(TIMESTAMPDIFF(MICROSECOND, start_date_time, end_date_time)) / 1000000, 4)
      END AS avg_processing_time_sec,
        'MigrationProcessingSpeed' AS stat_type
    FROM migration_file_log
    WHERE update_time >= NOW() - INTERVAL 1 HOUR

    UNION

    SELECT COUNT(*) AS doc_count,
    CASE
        WHEN AVG(TIMESTAMPDIFF(MICROSECOND, start_date_time, end_date_time)) IS NULL
        THEN 0.0000
        ELSE ROUND(AVG(TIMESTAMPDIFF(MICROSECOND, start_date_time, end_date_time)) / 1000000, 4)
      END AS avg_processing_time_sec,
        'BoxUploadProcessingSpeed' AS stat_type
    FROM box_upload_file_log
    WHERE update_time >= NOW() - INTERVAL 1 HOUR

    UNION

    SELECT COUNT(*) AS doc_count,
    CASE
        WHEN AVG(TIMESTAMPDIFF(MICROSECOND, start_date_time, end_date_time)) IS NULL
        THEN 0.0000
        ELSE ROUND(AVG(TIMESTAMPDIFF(MICROSECOND, start_date_time, end_date_time)) / 1000000, 4)
      END AS avg_processing_time_sec,
        'BoxDownloadProcessingSpeed' AS stat_type
    FROM box_download_file_log
    WHERE update_time >= NOW() - INTERVAL 1 HOUR;
END$$

DELIMITER ;


-- ==========================================================
-- PROCEDURE: get_docxfer_combined_statistics
-- ==========================================================


CREATE DEFINER=`root`@`localhost` PROCEDURE `get_docxfer_combined_statistics`(
    IN startDateTime DATE,
    IN endDateTime DATE)
BEGIN
    SELECT
        STAT_TYPE_TABLE.stat_type,
        STAT_TYPE_TABLE.query_type,
        COALESCE(STAT_RESULT_TABLE.doc_count,0) AS doc_count,
        COALESCE(STAT_RESULT_TABLE.avg_processing_time,0.0) AS avg_processing_time,
        COALESCE(STAT_RESULT_TABLE.criteria, CAST(endDateTime AS CHAR)) AS criteria
    FROM
    (
        -- IMPORT HOUR WISE (criteria as CHAR, group by criteria)
        SELECT CAST(HOUR(NOW()) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'ImportHourWise' AS stat_type
        FROM docxfer_import_file_log
        WHERE DATE(update_time) = endDateTime
        GROUP BY criteria

        UNION

        -- IMPORT DAY WISE
        SELECT CAST(DATE(update_time) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'ImportDayWise' AS stat_type
        FROM docxfer_import_file_log
        WHERE startDateTime < DATE(update_time) AND DATE(update_time) <= endDateTime
        GROUP BY criteria

        UNION

        -- EXPORT HOUR WISE
        SELECT CAST(HOUR(update_time) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'ExportHourWise' AS stat_type
        FROM docxfer_export_file_log
        WHERE DATE(update_time) = endDateTime
        GROUP BY criteria

        UNION

        -- EXPORT DAY WISE
        SELECT CAST(DATE(update_time) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'ExportDayWise' AS stat_type
        FROM docxfer_export_file_log
        WHERE startDateTime < DATE(update_time) AND DATE(update_time) <= endDateTime
        GROUP BY criteria

        UNION

        -- TRANSFORM HOUR WISE
        SELECT CAST(HOUR(update_time) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'TransformHourWise' AS stat_type
        FROM docxfer_transform_file_log
        WHERE DATE(update_time) = endDateTime
        GROUP BY criteria

        UNION

        -- TRANSFORM DAY WISE
        SELECT CAST(DATE(update_time) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'TransformDayWise' AS stat_type
        FROM docxfer_transform_file_log
        WHERE startDateTime < DATE(update_time) AND DATE(update_time) <= endDateTime
        GROUP BY criteria

        UNION

        -- MIGRATION HOUR WISE
        SELECT CAST(HOUR(update_time) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'MigrationHourWise' AS stat_type
        FROM migration_file_log
        WHERE DATE(update_time) = endDateTime
        GROUP BY criteria

        UNION

        -- MIGRATION DAY WISE
        SELECT CAST(DATE(update_time) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'MigrationDayWise' AS stat_type
        FROM migration_file_log
        WHERE startDateTime < DATE(update_time) AND DATE(update_time) <= endDateTime
        GROUP BY criteria

        UNION

        -- BOX UPLOAD HOUR WISE
        SELECT CAST(HOUR(update_time) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'BoxUploadHourWise' AS stat_type
        FROM box_upload_file_log
        WHERE DATE(update_time) = endDateTime
        GROUP BY criteria

        UNION

        -- BOX UPLOAD DAY WISE
        SELECT CAST(DATE(update_time) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'BoxUploadDayWise' AS stat_type
        FROM box_upload_file_log
        WHERE startDateTime < DATE(update_time) AND DATE(update_time) <= endDateTime
        GROUP BY criteria

        UNION

        -- BOX DOWNLOAD HOUR WISE
        SELECT CAST(HOUR(update_time) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'BoxDownloadHourWise' AS stat_type
        FROM box_download_file_log
        WHERE DATE(update_time) = endDateTime
        GROUP BY criteria

        UNION

        -- BOX DOWNLOAD DAY WISE
        SELECT CAST(DATE(update_time) AS CHAR) AS criteria,
               COUNT(*) AS doc_count,
               AVG(UNIX_TIMESTAMP(end_date_time)-UNIX_TIMESTAMP(start_date_time)) AS avg_processing_time,
               'BoxDownloadDayWise' AS stat_type
        FROM box_download_file_log
        WHERE startDateTime < DATE(update_time) AND DATE(update_time) <= endDateTime
        GROUP BY criteria
    ) AS STAT_RESULT_TABLE

    RIGHT JOIN
    (
        SELECT 'ImportDayWise' AS stat_type,'Day' AS query_type
        UNION SELECT 'ImportHourWise','Hour'
        UNION SELECT 'ExportDayWise','Day'
        UNION SELECT 'ExportHourWise','Hour'
        UNION SELECT 'TransformDayWise','Day'
        UNION SELECT 'TransformHourWise','Hour'
        UNION SELECT 'MigrationDayWise','Day'
        UNION SELECT 'MigrationHourWise','Hour'
        UNION SELECT 'BoxUploadDayWise','Day'
        UNION SELECT 'BoxUploadHourWise','Hour'
        UNION SELECT 'BoxDownloadDayWise','Day'
        UNION SELECT 'BoxDownloadHourWise','Hour'
    ) AS STAT_TYPE_TABLE
    ON STAT_RESULT_TABLE.stat_type = STAT_TYPE_TABLE.stat_type;
END$$

-- ==========================================================
-- FUNCTION: get_combined_peak_processing_time
-- ==========================================================

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_combined_peak_processing_time`()
BEGIN

    /* ================= IMPORT ================= */
    SELECT 
        COALESCE(MAX(minute_count), 0) AS peak_docs_per_min,
        'ImportPeakPerformance' AS stat_type
    FROM (
        SELECT DATE_FORMAT(update_time, '%Y-%m-%d %H:%i') AS minute_slot,
               COUNT(*) AS minute_count
        FROM docxfer_import_file_log
        WHERE update_time >= NOW() - INTERVAL 1 HOUR
        GROUP BY minute_slot
    ) t

    UNION ALL

    /* ================= EXPORT ================= */
    SELECT 
        COALESCE(MAX(minute_count), 0),
        'ExportPeakPerformance'
    FROM (
        SELECT DATE_FORMAT(update_time, '%Y-%m-%d %H:%i') AS minute_slot,
               COUNT(*) AS minute_count
        FROM docxfer_export_file_log
        WHERE update_time >= NOW() - INTERVAL 1 HOUR
        GROUP BY minute_slot
    ) t

    UNION ALL

    /* ================= TRANSFORM ================= */
    SELECT 
        COALESCE(MAX(minute_count), 0),
        'TransformPeakPerformance'
    FROM (
        SELECT DATE_FORMAT(update_time, '%Y-%m-%d %H:%i') AS minute_slot,
               COUNT(*) AS minute_count
        FROM docxfer_transform_file_log
        WHERE update_time >= NOW() - INTERVAL 1 HOUR
        GROUP BY minute_slot
    ) t

    UNION ALL

    /* ================= MIGRATION ================= */
    SELECT 
        COALESCE(MAX(minute_count), 0),
        'MigrationPeakPerformance'
    FROM (
        SELECT DATE_FORMAT(update_time, '%Y-%m-%d %H:%i') AS minute_slot,
               COUNT(*) AS minute_count
        FROM migration_file_log
        WHERE update_time >= NOW() - INTERVAL 1 HOUR
        GROUP BY minute_slot
    ) t

    UNION ALL

    /* ================= BOX UPLOAD ================= */
    SELECT 
        COALESCE(MAX(minute_count), 0),
        'BoxUploadPeakPerformance'
    FROM (
        SELECT DATE_FORMAT(update_time, '%Y-%m-%d %H:%i') AS minute_slot,
               COUNT(*) AS minute_count
        FROM box_upload_file_log
        WHERE update_time >= NOW() - INTERVAL 1 HOUR
        GROUP BY minute_slot
    ) t

    UNION ALL

    /* ================= BOX DOWNLOAD ================= */
    SELECT 
        COALESCE(MAX(minute_count), 0),
        'BoxDownloadPeakPerformance'
    FROM (
        SELECT DATE_FORMAT(update_time, '%Y-%m-%d %H:%i') AS minute_slot,
               COUNT(*) AS minute_count
        FROM box_download_file_log
        WHERE update_time >= NOW() - INTERVAL 1 HOUR
        GROUP BY minute_slot
    ) t;

END$$

DELIMITER ;







-- ==========================================================
-- FUNCTION: get_environment_name (DROP IF EXISTS + CREATE)
-- ==========================================================
CREATE DEFINER=`root`@`localhost` FUNCTION `get_environment_name`(envId INT)
RETURNS TEXT CHARSET latin1 DETERMINISTIC
BEGIN
    DECLARE envName TEXT;
    SELECT env_name INTO envName FROM docxfer_environments WHERE env_id = envId;
    RETURN envName;
END$$

DELIMITER ;

-- ==========================================================
-- INSERT DEFAULT VALUES
-- ==========================================================

INSERT INTO docxfer_systems
(system_id, system_name, system_type, description, driver_class)
VALUES
(1, 'Box', 'Box', 'Box Content Management System', 'com.tcs.docxfer.box.connector.BoxConnectorImpl'),
(2, 'NTFS', 'NTFS', 'New Technology File System', 'com.tcs.docxfer.ntfs.connector.NTFSConnectorImpl'),
(3, 'FileNetP8', 'FileNetP8', 'IBM FileNet P8 System', 'com.ecorun.fn.p8.connector.EcorunP8ConnectorImpl'),
(4, 'OracleWCC', 'OracleWCC', 'Oracle WebCenter Content', 'com.ecorun.wcc.connector.EcorunWCCConnectorImpl'),
(5, 'SharePoint', 'SharePoint', 'Microsoft SharePoint System', 'com.ecorun.sharepoint.connector.EcorunSharePointConnectorImpl')
ON DUPLICATE KEY UPDATE
system_name = VALUES(system_name),
system_type = VALUES(system_type),
description = VALUES(description),
driver_class = VALUES(driver_class);

INSERT INTO `docxfer_poller_config`
(`poller_id`, `poller_name`, `description`, `port`, `max_instance_allowed`, `config_location`, `is_active`)
VALUES
(1,'Extractor','Box Extraction',9004,1,'common/extractor.properties',1),
(2,'Loader','Box Load',9005,1,'common/loader.properties',1)
ON DUPLICATE KEY UPDATE
poller_name = VALUES(poller_name),
description = VALUES(description),
port = VALUES(port),
max_instance_allowed = VALUES(max_instance_allowed),
config_location = VALUES(config_location),
is_active = VALUES(is_active);

CREATE TABLE ECORR_USERS (
    ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    USERNAME VARCHAR(50) UNIQUE NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- ==========================================================
-- END OF FILE
-- ==========================================================
