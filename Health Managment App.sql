CREATE TABLE `Organization` (
  `id` int,
  `OrganizationName` varchar(255),
  `OrgDescription` varchar(255),
  `country_code` int
);

CREATE TABLE `OE` (
  `id` int,
  `Organization_id` int,
  `OEName` varchar(255),
  `OE_Description` varchar(255),
  `country_code` int
);

CREATE TABLE `ServiceOffering` (
  `id` int,
  `OE_id` varchar(255),
  `Service_Name` varchar(255),
  `country_code` int,
  `Service_description` varchar(255)
);

CREATE TABLE `Portfolio` (
  `id` int,
  `ServiceOffering_id` varchar(255),
  `Portfolio_Name` varchar(255),
  `SolutionType` varchar(255),
  `model` char
);

CREATE TABLE `Project` (
  `id` int,
  `Portfolio_id` varchar(255),
  `Project_Name` varchar(255),
  `Head_Count` varchar(255),
  `BusinessWeightage` char,
  `Developmentmethodlogy` char
);

CREATE TABLE `KPI` (
  `id` int,
  `Project_id` varchar(255),
  `KPI_Name` varchar(255),
  `Threshold_Max` varchar(255),
  `Threshold_Min` char
);

CREATE TABLE `KPI_Data` (
  `id` int,
  `KPI_id` varchar(255),
  `KPI_Name` varchar(255),
  `Comment` varchar(255),
  `Period` char,
  `value` int
);

ALTER TABLE `OE` ADD FOREIGN KEY (`Organization_id`) REFERENCES `Organization` (`id`);

ALTER TABLE `ServiceOffering` ADD FOREIGN KEY (`OE_id`) REFERENCES `OE` (`id`);

ALTER TABLE `Portfolio` ADD FOREIGN KEY (`ServiceOffering_id`) REFERENCES `ServiceOffering` (`id`);

ALTER TABLE `KPI` ADD FOREIGN KEY (`Project_id`) REFERENCES `Project` (`id`);

ALTER TABLE `KPI_Data` ADD FOREIGN KEY (`KPI_id`) REFERENCES `KPI` (`id`);

ALTER TABLE `Portfolio` ADD FOREIGN KEY (`id`) REFERENCES `Project` (`Portfolio_id`);

ALTER TABLE `OE` ADD FOREIGN KEY (`country_code`) REFERENCES `Organization` (`country_code`);

ALTER TABLE `ServiceOffering` ADD FOREIGN KEY (`country_code`) REFERENCES `OE` (`country_code`);
