CREATE TABLE us_jobs_monster (
	country text,
	country_code text,
	date_added date, 
	has_expired text,
	job_board text,
	job_description text,
	job_title text,
	job_type text,
	location text,
	organization text,
	page_url text,
	salary text,
	sector text,
	uniq_id text
);

--Refreshed Database here 
--Created data-types here without limits or limitations on nulls because it is very messy
-- Type text because sections have whole paragraphs in them

COPY us_jobs_monster
FROM 'C:\PostgreSQL\monster_job_data.csv'
WITH (FORMAT CSV, HEADER);

--Copying the csv file into postgres database

--Making a backup table just in case 
CREATE TABLE us_jobs_monster_backup AS
SELECT * FROM us_jobs_monster;


--Cleaning to do list: Drop country column, serves no purpose 
--Keep country_code for joins
--Drop date_added, too many nulls
--Take a look at job_titles, they need to be standardized and cleaned
--Job type: full time, part time, or contract 
--Location must be city and state
--Work on organization, it needs fixing, has nulls, may need to drop
--Salary is messed up but needs to be filled in, may need to drop
--Work on sector first 
--Place constraints on unqi_id
--Drop columns last

SELECT DISTINCT sector
FROM us_jobs_monster;

--Backing up the sector table to being transformations 
ALTER TABLE us_jobs_monster ADD COLUMN sector_standard text;

--Updateing values in new column from old column
UPDATE us_jobs_monster
SET sector_standard = sector;

ALTER TABLE us_jobs_monster ADD COLUMN jobs_title_standard text;

UPDATE us_jobs_monster
SET jobs_title_standard = job_title;

--Now transformations can begin
SELECT sector_standard, sector
FROM us_jobs_monster
WHERE sector_standard IS NOT NULL
ORDER BY sector_standard ASC;



UPDATE us_jobs_monster
SET sector_standard = sector;

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE sector LIKE 'Account Management%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounts Payable/Receivable'
WHERE sector LIKE 'Accounts Payable/Receivable%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE sector LIKE 'Administrative%';

UPDATE us_jobs_monster
SET sector_standard = 'Marketing/Advertising'
WHERE sector ILIKE '%preferrably in Marketing or Advertising%';

UPDATE us_jobs_monster
SET sector_standard = 'Brand/Product Marketing'
WHERE sector LIKE 'Brand/Product%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE sector LIKE 'Business Development%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector LIKE 'Business Unit%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Service/Client Care'
WHERE sector LIKE 'Call Center%';

UPDATE us_jobs_monster 
SET sector_standard = 'Logistics/Transportation'
WHERE sector LIKE 'Car, Van and Bus%';

UPDATE us_jobs_monster
SET sector_standard = 'Civil & Structural Engineering'
WHERE sector ILIKE 'Civil & Structural Engineering%';

UPDATE us_jobs_monster
SET sector_standard = 'Electronics Install/Maintain/Repair'
WHERE sector LIKE 'Computer/Electronics/Telecomm Install/Maintain/Repair%';

UPDATE us_jobs_monster
SET sector_standard = 'Computer/Network Security'
WHERE sector LIKE 'Computer/Network Security%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE sector LIKE 'Contracts Administration%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Service/Client Care'
WHERE sector ILIKE 'Customer Support%';

UPDATE us_jobs_monster
SET sector_standard = 'Database Development/Administration'
WHERE sector LIKE 'Database Development/Administration%';

UPDATE us_jobs_monster
SET sector_standard = 'Retail/Customer Service'
WHERE sector ILIKE '%retail sales/customer service%';

UPDATE us_jobs_monster
SET sector_standard = 'Electrical Engineering'
WHERE sector LIKE '%Electronics Engineering%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Install/Maintain/Repair'
WHERE sector LIKE 'Equipment Install/Maintain/Repair%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE sector ILIKE '%Retail/Business Development';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Service/Client Care'
WHERE sector_standard LIKE 'Customer Ser%';

SELECT job_title, sector_standard
FROM us_jobs_monster;
WHERE sector ILIKE '%sales%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%CDL Truck Driver%';

UPDATE us_jobs_monster
SET sector_standard ='IT Support'
WHERE sector LIKE 'Desktop Service and Support';

UPDATE us_jobs_monster 
SET sector_standard = 'Sales/Retail/Business Development'
WHERE sector LIKE 'Field Sales%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Safety and Inspection'
WHERE sector LIKE 'Food Safety and Inspection%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE sector LIKE 'Financial Analysis%' OR sector ILIKE '%Accounting/Finance%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE sector LIKE 'Executive (SVP%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE sector LIKE 'Corporate Accounting';

UPDATE us_jobs_monster
SET sector_standard = 'Software Development'
WHERE sector LIKE 'Passionate coders%';

UPDATE us_jobs_monster
SET sector_standard = 'Installation/Maintenace/Repair'
WHERE sector LIKE 'General/Other: Installation/Maintenance/RepairVehicle Repair and Maintenance';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector ILIKE 'To perform this job successfully, an individual must be able to perform each essential duty satisfactorily. The requirements listed below are representative of the knowledge, skill, and/or ability required. Reasonable accommodations may be made to enable individuals with disabilities to perform the essential functions.   Bilingual (English/Spanish-speaking) skills are required. Diploma, Associate or bachelors degree in nursing or bachelors degree (or higher) in a health or human services related field required. Masters level and/or advanced study in a health-related field desired. Minimum of two (2) years full time equivalent of direct clinical care to consumers required. Case Management and/or Workers’ compensation-related experience strongly preferred. Registered nurse with current, valid state licensure required. Must be eligible to sit for CCM certification and must have a valid driver’s license. Experience in rehabilitation services industry, vocational/ occupational/ industrial nursing preferred. Background in state workers’ compensation law and practices desirable. In the case of an individual in a state that does not require licensure or certification, the individual must have a baccalaureate or graduate degree in social work, or another health or human services field that promotes the physical, psychosocial, and/or vocational well-being of the persons being served, that requires: A degree from an institution that is fully accredited by a nationally recognized educational accreditation organization; The individual must have completed a supervised field experience, in case management, health, or behavioral health as part of the degree requirements; and URAC-recognized certification in case management within four (4) years of hire as a case manager Pursue URAC-recognized certification in case management (CCM, CDMS, CRC, CRRN or COHN) upon eligibility. Excellent interpersonal skills and phone manners. Excellent organizational skills. Must be proficient in Microsoft Office suite with such programs as Word and Excel as well as have experience with internet searches and a comfort level with other software programs. Ability to set priorities and work independently is essential.';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector LIKE 'To perform this job successfully, an individual must be able to perform each essential duty satisfactorily. The requirements listed below are representative of the knowledge, skill, and/or ability required. Reasonable accommodations may be made to enable individuals with disabilities to perform the essential functions Diploma, A.S. degree or B.S. degree in nursing required. Advanced Degree preferred. Minimum of two (2) years full time equivalent of direct clinical care to consumers/clinical practice. Case Management and Workers’ compensation-related experience preferred. Registered nurse with current, valid state licensure required. In the case of an individual in a state that does not require licensure or certification, the individual must have a baccalaureate or graduate degree in social work, or another health or human services field that promotes the physical, psychosocial, and/or vocational well-being of the persons being served, that requires: 1) A degree from an institution that is fully accredited by a nationally recognized educational accreditation organization; 2) The individual must have completed a supervised field experience, in case management, health, or behavioral health as part of the degree requirements; and 3) URAC-recognized certification in case management within four (4) years of hire as a case manager Pursue URAC-recognized certification in case management (CCM, CDMS, CRC, CRRN or COHN) upon eligibility. Other state licenses/certification as required by law. Prior Case Management experience preferred. Excellent interpersonal skills and phone manners. Excellent organizational skills. Ability to set priorities. Ability to work independently and as part of a team. Computer literacy required.';

UPDATE us_jobs_monster
SET sector_standard = 'Public/Media Relations'
WHERE sector ILIKE 'Investor and Public/Media%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE sector ILIKE '%CashierStore/Branch Management%';

UPDATE us_jobs_monster 
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%sales%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title LIKE '.NET%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title LIKE 'Forecast Support Specialist%';

UPDATE us_jobs_monster
SET sector_standard = 'Network & Server Administration'
WHERE sector LIKE 'Network and Server%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE job_title ILIKE '%Project Leader%';

UPDATE us_jobs_monster
SET sector_standard = 'Veterinary/Animal Care'
WHERE job_title ILIKE '%Veterinary Technician%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%Store Managers%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE sector ILIKE '%Administrative/Clerical%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector ILIKE '%Business/Strategic Management%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE sector ILIKE '%Customer Support/Client Care%';

UPDATE us_jobs_monster
SET sector_standard = 'Editorial/Writing'
WHERE sector ILIKE '%Editorial/Writing%';

UPDATE us_jobs_monster
SET sector_standard = 'Engineering'
WHERE sector ILIKE '%Engineering%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services'
WHERE sector ILIKE '%Food Services%';

UPDATE us_jobs_monster
SET sector_standard ='Human Resources'
WHERE sector ILIKE '%Human Resources%';

UPDATE us_jobs_monster
SET sector_standard = 'Installation/Maintenance/Repair'
WHERE sector ILIKE '%Installation/Maintenance/Repair%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE sector ILIKE '%IT/Software Development%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE sector ILIKE '%Legal Paralegal%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE sector ILIKE '%Logistics%';

UPDATE us_jobs_monster
SET sector_standard = 'Marketing/Product'
WHERE sector ILIKE '%Marketing/Product%';

UPDATE us_jobs_monster
SET sector_standard ='Medical/Health'
WHERE sector ILIKE '%Medical/Health%';

UPDATE us_jobs_monster
SET sector_standard = 'Sewing & Tailoring'
WHERE sector ILIKE '%Tailoring%';

UPDATE us_jobs_monster
SET sector_standard = 'Production/Operations'
WHERE sector_standard ILIKE '%Production/Operations%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE sector ILIKE '%Quality Assurance/Safety%';

UPDATE us_jobs_monster
SET sector_standard = 'R&D/Science'
WHERE sector ILIKE '%R&D/Science';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Business Development'
WHERE sector ILIKE '%Sales/Business Development%';

UPDATE us_jobs_monster
SET sector_standard = 'Training/Instruction'
WHERE sector ILIKE '%Training/Instruction%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE sector ILIKE '%Project/Program Management%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%Intake Coordinator%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title LIKE '%Hearing Claims%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title LIKE 'Library Public%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title LIKE '%Director of%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE job_title LIKE '%Lecturer%';

UPDATE us_jobs_monster
SET sector_standard = 'Real Estate'
WHERE job_title LIKE '%Real Estate%' 
OR sector LIKE '%Real Estate%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title LIKE '%Legal Assistant%';

UPDATE us_jobs_monster
SET sector_standard = 'Security'
WHERE job_title ILIKE '%Security Officer%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%Administrative Assistant%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%Store Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Installation/Maintenance/Repair'
WHERE job_title ILIKE 'Heat Press Operator%';

UPDATE us_jobs_monster
SET sector_standard = 'Veterinary/Animal Care'
WHERE job_description ILIKE '%veterinary%';

UPDATE us_jobs_monster
SET sector_standard  = 'Logistics/Transportation'
WHERE job_title ILIKE '%Logistical%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%Executive%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%Account Analyst%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title LIKE 'Account Coordinator%';

UPDATE us_jobs_monster
SET sector_standard = 'Government, Defence & Emergency'
WHERE job_title ILIKE '%B Combat Engineer%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE 'Accounting%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounts Payable/Receivable'
WHERE job_title ILIKE 'Accounts Payable%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Account Manager%' AND sector_standard LIKE 'Entry Level';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Account Specialist%' AND sector_standard LIKE 'Entry Level';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE 'Accountant%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounts Payable/Receivable'
WHERE job_title ILIKE '%Accounts Receivable%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE 'Administrative%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title LIKE 'Admissions%' AND sector_standard = 'Entry Level';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Counselor%' AND sector_standard = 'Entry Level';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%customer service%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Preparation/Cooking'
WHERE job_title ILIKE '%Cook%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Preparation/Cooking'
WHERE job_title ILIKE '%Butcher%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title = 'Apprentice Job in Columbus';


UPDATE us_jobs_monster
SET sector_standard = 'Installation/Maintenance/Repair'
WHERE job_title ILIKE '%technician%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%mechanic%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%Manager%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%Construction%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title LIKE '%Attorney%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title ILIKE '%Paralegal%';

UPDATE us_jobs_monster
SET sector_standard = 'Architecture'
WHERE job_title ILIKE '%Architect%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%Asphalt%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%Supervisor%';

UPDATE us_jobs_monster
SET sector_standard = 'Government, Defence & Emergency'
WHERE job_title ILIKE '%Infantryman%';

UPDATE us_jobs_monster
SET sector_standard = 'Government, Defence & Emergency'
WHERE job_title ILIKE '%Military%';

UPDATE us_jobs_monster
SET sector_standard = 'Goverment, Defence & Emergency'
WHERE job_title ILIKE 'B Information%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%Desk Job%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Preparation/Cooking'
WHERE job_title ILIKE '%Food Production%';

UPDATE us_jobs_monster
SET sector_standard = 'Installation/Maintenance/Repair'
WHERE job_title LIKE 'Assembler%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE 'Automotive%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Medical%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Therapist%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Safety and Inspection'
WHERE job_title ILIKE '%Banquet%';

UPDATE us_jobs_monster
SET sector_standard = 'Installation/Maintenance/Repair'
WHERE job_title ILIKE '%Installer%';

UPDATE us_jobs_monster
SET sector_standard = 'Installation/Maintenance/Repair'
WHERE job_title ILIKE '%Automatic%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Nursing%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%Assistant%' AND sector_standard LIKE 'Entry Level';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%customer%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%Cashier%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Preparation/Cooking'
WHERE job_title ILIKE '%Food Service%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%Receptionist%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%CDL%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%driver%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Preparation/Cooking'
WHERE job_title ILIKE '%Barista%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%auto%';

UPDATE us_jobs_monster
SET sector_standard = 'Goverment, Defence & Emergency'
WHERE job_title ILIKE '%B Aircraft%';

UPDATE us_jobs_monster 
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE '%bank teller%';

UPDATE us_jobs_monster 
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE '%banking%';

UPDATE us_jobs_monster 
SET sector_standard = 'Food Preparation/Cooking'
WHERE job_title ILIKE '%Bar Beverage%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounts Payable/Receivable'
WHERE job_title ILIKE '%Accounts Payable%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%Consumer Care%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Biostatistician%';

UPDATE us_jobs_monster
SET sector_standard = 'Installation/Maintenance/Repair'
WHERE job_title ILIKE '%body shop estimator%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%business analyst%';

UPDATE us_jobs_monster 
SET sector_standard = 'Goverment, Defence & Emergency'
WHERE job_title ILIKE '%C Radio%';

UPDATE us_jobs_monster 
SET sector_standard = 'Goverment, Defence & Emergency'
WHERE job_title ILIKE '%C Utilities%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%Call Center Representative%';

UPDATE us_jobs_monster
SET sector_standard = 'Marketing/Advertising'
WHERE job_title ILIKE '%Campaign and Event Marketing%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%Camper Registration%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Cardiac%';

UPDATE us_jobs_monster
SET sector_standard = 'Data Science'
WHERE job_title ILIKE '%Analyst%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%Chauffeur%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title ILIKE '%chemist%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE job_title ILIKE '%child care%';

UPDATE us_jobs_monster
SET sector_standard = 'Insurance/Clerical'
WHERE job_title ILIKE '%claims associate%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%client relations%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title ILIKE '%Laboratory Technologist%'

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%CMA%';

UPDATE us_jobs_monster
SET sector_standard = 'Installation/Maintenance/Repair'
WHERE job_title ILIKE '%CNC%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%Code Compliance Officer%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounts Payable/Receivable'
WHERE job_title ILIKE '%collection representative%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations'
WHERE job_title ILIKE '%color print production%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%commercial caulker%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%commissary representative%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE job_title ILIKE '%counter-sorter%';

UPDATE us_jobs_monster
SET sector_standard = 'Marketing/Advertising'
WHERE job_title ILIKE '%Marketing%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%compliance investigator%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%contact center agent%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%crater/packer%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%crisis response%';

UPDATE us_jobs_monster
SET sector_standard = 'Goverment, Defence & Emergency'
WHERE job_title ILIKE 'D Power%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE '%programmer%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%data entry%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%data processor%';

UPDATE us_jobs_monster 
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%dental%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%cabinetry%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE 'Direct Support%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE 'Dispatcher%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%Records Administrator%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_description LIKE '%CDL%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE job_title ILIKE '%Cleaner%';

UPDATE us_jobs_monster
SET sector_standard ='Customer Support/Client Care'
WHERE job_title ILIKE '%duty officer%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE job_title ILIKE '%teacher%';

UPDATE us_jobs_monster
SET sector_standard = 'Goverment, Defence & Emergency'
WHERE job_description ILIKE '%Army National Guard%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%Eligibility Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%HVAC%';

UPDATE us_jobs_monster
SET sector_standard = 'Engineer'
WHERE job_title LIKE 'Engineer %';

UPDATE us_jobs_monster
SET sector_standard = 'Engineer'
WHERE job_title ILIKE 'Engineering Tech%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title LIKE 'Enrollment and Eligibility%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%Recruiter%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title LIKE '%Accountant%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title ILIKE '%Litigation Associate%';

UPDATE us_jobs_monster
SET sector_standard = 'Delete This Row'
WHERE job_title LIKE 'Associate Job in  function wrap(EL';

UPDATE us_jobs_monster
SET sector_standard = 'Marketing/Advertising'
WHERE job_description ILIKE '%marketing%';

UPDATE us_jobs_monster
SET sector_standard = 'Network & Server Administration'
WHERE job_description ILIKE '%Network Administrator%';

UPDATE us_jobs_monster
SET sector_standard = 'Engineer'
WHERE job_title LIKE '%Engineer%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title LIKE '%Consultant%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Service'
WHERE job_title LIKE '%Experienced Server%';

UPDATE us_jobs_monster
SET sector_standard = 'Manufacturing'
WHERE job_title LIKE '%Fabrication Cell Operator%';

UPDATE us_jobs_monster
SET sector_standard = 'Manufacturing'
WHERE job_title LIKE '%Feeder-Folder%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%field installation specialist%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE job_title ILIKE '%housekeeping%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations'
WHERE job_title ILIKE '%field operations specialist%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%file clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_description ILIKE '%sales rep%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Dentist%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE job_title ILIKE '%housekeeper%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Nurse%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title ILIKE '%Legal Secretary%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%Hourly Team Member%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE '%Financial Representative%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%stock worker%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%stock worker%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Service'
WHERE job_title ILIKE '%food and beverage%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Service'
WHERE job_title ILIKE '%food prep%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations'
WHERE job_title ILIKE '%forklift operators%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations'
WHERE job_title ILIKE '%freight handler%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations'
WHERE job_title ILIKE '%freight handler%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title ILIKE '%Counsel%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%team member%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_description ILIKE '%floral assistant%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title LIKE '%RN%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%grocery store%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%grocery store%';

UPDATE us_jobs_monster
SET sector_standard = 'Manufacturing'
WHERE job_title ILIKE '%manufacturing%';

UPDATE us_jobs_monster
SET sector_standard = 'Lawn Care'
WHERE job_title ILIKE '%groundskeeper%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE job_title ILIKE '%guest service%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%Hardware Inspector%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE job_title ILIKE '%Instructor%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE job_title ILIKE '%help desk%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE job_title ILIKE '%janitor%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE job_title ILIKE '%hospitality%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE job_title ILIKE '%hostess%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE job_title ILIKE '%hotel%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE job_title LIKE '%HR &%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE job_title LIKE '%HR Specialist%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_title ILIKE '%Quality Assurance%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE job_title ILIKE '%IT specialist%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_title ILIKE '%Software tester%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services'
WHERE job_title ILIKE '%Kitchen%';

UPDATE us_jobs_monster
SET sector_standard = 'General Labor'
WHERE job_title ILIKE '%laborers%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title LIKE '%Java%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title LIKE '%iOS Developer%';

UPDATE us_jobs_monster
SET sector_standard = 'Lawn Care'
WHERE job_title LIKE '%Landscape%';

UPDATE us_jobs_monster
SET sector_standard = 'Lawn Care'
WHERE job_title LIKE '%Lawn%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title LIKE '%Inventory Control Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounts Payable/Receivable'
WHERE job_title LIKE '%Payroll%';

UPDATE us_jobs_monster
SET sector_standard = 'Warehouse'
WHERE job_title LIKE '%Warehouse%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations'
WHERE job_title LIKE '%Machine Operator%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title LIKE '%Developer%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title LIKE '%Laboratory%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%Key control Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%Representative%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounts Payable/Receivable'
WHERE job_title LIKE '%Invoice Payment%';

UPDATE us_jobs_monster
SET sector_standard = 'Public Safety'
WHERE job_title ILIKE '%lifeguards%';

UPDATE us_jobs_monster
SET sector_standard = 'Public Safety'
WHERE job_title ILIKE '%lifeguard%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%loader%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounts Payable/Receivable'
WHERE job_title LIKE '%Loan Accounting%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title LIKE '%Cabling%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title LIKE '%LPN%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations'
WHERE job_title ILIKE '%Operator%';

UPDATE us_jobs_monster
SET sector_standard = 'Automotive'
WHERE job_title ILIKE '%tire%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services'
WHERE job_title ILIKE '%Wait Staff%';

UPDATE us_jobs_monster
SET sector_standard = 'Public Safety'
WHERE job_title ILIKE '%public safety%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%Project Coordinator%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations'
WHERE job_title ILIKE '%machinist%';

UPDATE us_jobs_monster
SET sector_standard = 'Public Service'
WHERE job_title ILIKE '%mail clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%material handler%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%member services%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_title ILIKE '%Quality Control%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'Production%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%paramedic%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%Maintenance support%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE 'Painter%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services'
WHERE job_title ILIKE '%Wait Staff%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%solderer%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services'
WHERE job_title ILIKE '%Restaurant%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services'
WHERE job_description ILIKE '%food services%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE job_title ILIKE '%night auditor%';

UPDATE us_jobs_monster
SET sector_standard = 'Energy'
WHERE job_title ILIKE '%offshore riggers%';

UPDATE us_jobs_monster
SET sector_standard = 'Marketing/Advertising'
WHERE job_title ILIKE '%on-line auction%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title LIKE 'Operations%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'Package%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'Packaging%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE job_title ILIKE '%parking attendant%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%patient%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE job_title ILIKE '%Analytic Linguist%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title LIKE '%Prosecution%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title LIKE '%Banker%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%personal care attendants%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_title ILIKE '%police officer%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_title ILIKE '%protection officer%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services'
WHERE job_title ILIKE '%chef%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title LIKE 'Teller%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'stockroom%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%health care%';

UPDATE us_jobs_monster
SET sector_standard = 'Lawn Care'
WHERE job_title ILIKE '%yard worker%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%clerk%' AND sector_standard = 'Entry Level';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%clerical%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE job_title ILIKE '%Utility Worker%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE job_title ILIKE '%Tutors%';

UPDATE us_jobs_monster
SET sector_standard = 'Lawn Care'
WHERE job_title ILIKE '%Tree Maintenance%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE '%Tools Application%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE job_title ILIKE '%Test Administrator%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Surgical%';

UPDATE us_jobs_monster
SET sector_standard = 'Warehouse'
WHERE job_title ILIKE '%Shift Assembly%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%Petco%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'Shipping%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_title ILIKE '%Sheriff%';

UPDATE us_jobs_monster
SET sector_standard = 'Automotive'
WHERE job_title ILIKE '%service porter%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Service'
WHERE job_title ILIKE '%servers%' AND sector_standard = 'Entry Level';

UPDATE us_jobs_monster
SET sector_standard = 'Food Service'
WHERE job_title ILIKE '%server%' AND sector_standard = 'Entry Level';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%Seasonal%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%retail%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%restoration tech%';

UPDATE us_jobs_monster
SET sector_standard = 'Energy'
WHERE job_title ILIKE '%energy auditor%';

UPDATE us_jobs_monster
SET sector_standard = 'Editorial/Writing'
WHERE job_title ILIKE '%research editor%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%reporting specialist%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title LIKE '%REP%' AND sector_standard = 'Entry Level';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title ILIKE '%regulatory%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%reporting specialist%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title LIKE 'Registration%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%hygienist%';

UPDATE us_jobs_monster
SET sector_standard = 'Warehouse'
WHERE job_title LIKE 'Receiving%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title LIKE 'Program Associate%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE 'Print %';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE 'Pipefitter%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'Picker%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%physical therapy%';

UPDATE us_jobs_monster
SET sector_standard = 'Veterinary/Animal Care'
WHERE job_title LIKE 'Pet Groomer%';

--Cleaning the 'Entry Level' Tag is finally done.
--Moving on the to 'Experinced' Tag
--Note to self: Remember to clean the nulls as well

SELECT DISTINCT job_title, job_description 
FROM us_jobs_monster
WHERE sector_standard IS NOT NULL AND sector_standard ILIKE '%Experienced%'
AND job_title ILIKE '%security%'
ORDER BY job_title ASC;

SELECT DISTINCT job_title, job_description 
FROM us_jobs_monster
WHERE sector_standard IS NOT NULL AND sector_standard ILIKE '%Experienced%'
AND job_description LIKE '%IT%'
ORDER BY job_title ASC;

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%physical therapy%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE job_title ILIKE '%Project Management%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE job_title ILIKE '%change management%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE job_title ILIKE '%order management%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE 'Health Information Management%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE 'Health Information Management%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'Procurement%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Product Portfolio Management%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Network & Server Administration'
WHERE job_title ILIKE 'system management support%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE 'Trust & Estates%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE 'Welding%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE '%Bookkeeper%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE 'ASST STORE MGR%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE 'Associate' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE job_title ILIKE 'Benefits%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Associate Director' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%call center%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Clinical%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Database Development/Administration'
WHERE job_title ILIKE '%Database%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Data Science'
WHERE job_title ILIKE '%Data%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE 'Chaplain%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Caregiver%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE job_title ILIKE '%Desktop Support%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_description ILIKE '%law firm%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_description ILIKE '%litigation%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%electrician%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE job_title ILIKE 'Environmental%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE 'Front Desk%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE job_title ILIKE 'Helpdesk%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE job_title ILIKE 'Human Resource%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE job_title LIKE 'HR%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'Delivery%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'Delivery%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%store support%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE job_title ILIKE 'Instructional%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE 'Merchandising%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE 'Merchandising%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_title ILIKE 'QA%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE 'Merchandising%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE 'Mortgage%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE 'Insurance%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title LIKE 'IT%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations/Install/Maintenance/Repair'
WHERE job_title ILIKE 'Maintenance%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE job_title ILIKE 'Windows%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Editorial/Writing'
WHERE job_title ILIKE 'Writer%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE 'Welder%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE 'Web%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE 'Pharmacist%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%Presiding Officer%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_description ILIKE '%field service engineer%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_description ILIKE '%Registered Nurse%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_description ILIKE '%Administrative Assistant%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE '%.Net%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%Administration Assistant%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_description ILIKE '%Hadoop%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Automotive Care'
WHERE job_description ILIKE '%auto dealer%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_description ILIKE '%cashier%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_description ILIKE '%retail staff%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'General Labor'
WHERE job_description ILIKE '%farm workers%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_description ILIKE '%network engineer%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounts Payable/Receivable'
WHERE job_description ILIKE '%Accounts Receivable%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE 'Dispatch%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE 'Claim%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%file processor%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Director%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE 'Audit%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Contract%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE 'Community%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%phlebotomist%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_title ILIKE 'Armed%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE 'Client%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'AVP%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE 'Controller%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_description ILIKE '%Escrow%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE 'Controller%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_description ILIKE '%Controller%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_description ILIKE '%medical claims%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Automotive Care'
WHERE job_description ILIKE '%automotive%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE 'Systems Administrator%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE 'Linux%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE 'Sr Systems%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE 'UNIX%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE job_title ILIKE 'Sharepoint%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE job_description LIKE '%IT%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE job_title ILIKE 'Citrix%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_description ILIKE '%administrator%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Development%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_title ILIKE '%inspector%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_title LIKE '%QA%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_description ILIKE '%data entry%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE job_description ILIKE '%education%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounts Payable/Receivable'
WHERE job_description ILIKE '%billing%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_description ILIKE '%health care%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_description ILIKE '%quality specialist%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE job_title ILIKE '%human resources%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_title ILIKE 'Security%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations/Install/Maintenance/Repair'
WHERE job_title ILIKE '%maintenance%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_title ILIKE 'Corrections%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations/Install/Maintenance/Repair'
WHERE job_title ILIKE 'Machine%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Editorial/Writing'
WHERE job_title ILIKE '%writer%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%telecommunications%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE job_description ILIKE '%wait staff%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_description ILIKE '%hospital%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations/Install/Maintenance/Repair'
WHERE job_description ILIKE 'Comcast%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title ILIKE '%law firm%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_title ILIKE 'Quality%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Energy'
WHERE job_title ILIKE 'land assistant%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%project planner%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_description ILIKE '%customer support%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_description ILIKE '%maintenance%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE 'Physician%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%elderly care services%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE job_title ILIKE '%bartender%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE job_title ILIKE 'Technical Support%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE job_title ILIKE '%waiter%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title LIKE '%LVN%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_title LIKE '%LVN%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%optician%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_title ILIKE '%watchman%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Public Service'
WHERE job_title ILIKE '%fire fighters%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE 'UX%';

UPDATE us_jobs_monster
SET sector_standard = 'Warehouse'
WHERE job_description ILIKE '%Warehouse%' 
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Manufacturing'
WHERE job_description ILIKE '%manufacturer%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_description ILIKE '%correctional%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_description ILIKE '%staffing associate%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE '%tax%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title ILIKE 'Legal%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title ILIKE 'Legal%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Accessory%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE job_title ILIKE '%Project Mgr%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%staffing associate%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_description ILIKE '%administrative%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE job_description ILIKE '%servers%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE job_title ILIKE '%environmental services%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title ILIKE '%epigeneticist%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title ILIKE '%epigeneticist%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title ILIKE '%nuclear%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title ILIKE '%nuclear%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE job_title ILIKE '%concierge%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%buyer%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%pipe%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%plumber%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE '%software%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%supply%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations/Install/Maintenance/Repair'
WHERE job_title LIKE '%VTC%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%fiber splicer%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Landscaping/Lawn Care'
WHERE job_title ILIKE '%Grounds%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%office assistant%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%logistics%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%ortho tech%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE job_title ILIKE '%surveyor%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_description ILIKE '%construction%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_description LIKE '%QC%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE job_description ILIKE '%strategy director%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE '%Workday Integration%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_title ILIKE '%safety%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Editorial/Writing'
WHERE job_description ILIKE '%publishing%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE job_description ILIKE '%bakery%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Automotive Care'
WHERE job_title ILIKE '%detailer%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_description ILIKE '%Java%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE job_title ILIKE '%educator%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Creative/Design'
WHERE job_title ILIKE '%artist%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%social worker%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%orthodontic%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title ILIKE '%scientist%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%SD professionals%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_description ILIKE '%health%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'VP%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE job_title ILIKE '%embassy suites%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE 'Designer%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE '%loan%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%blender%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%directors%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%coordinator%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%branch examiner%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE '%collections%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%communications%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%business%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE job_title ILIKE '%cleaning%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_title ILIKE '%officer%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Government, Defense & Emergency'
WHERE job_description ILIKE '%navy%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%office%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE job_title ILIKE '%lawyer%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Automotive Care'
WHERE job_title ILIKE '%transmission%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE 'Lead%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%purchasing%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE '%accounting%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_title ILIKE '%EHS specialist%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_description ILIKE '%Fortune 500%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%OB/GYN%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%roofer%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%metal%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%die cutter%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%fitters%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%drywall%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE job_title ILIKE '%hilton%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE job_description ILIKE '%comfort inn%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'General Labor'
WHERE job_title ILIKE '%dockworker%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title ILIKE '%biologic%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title ILIKE '%researcher%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title ILIKE '%research%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%pharmacy%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%care aide%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%surgeon%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Landscaping/Lawn Care'
WHERE job_description ILIKE '%landscape%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Creative/Design'
WHERE job_description ILIKE '%floral%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE job_description LIKE '%HR%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Social Services'
WHERE job_description ILIKE '%family development%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Real Estate'
WHERE job_title ILIKE 'estate%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Social Services'
WHERE job_title ILIKE 'family%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE job_title ILIKE '%meat%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_description ILIKE '%cybersecurity%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE job_description ILIKE '%project management%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE '%runtime%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%translator%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE '%CPA%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Insurance/Clerical'
WHERE job_title ILIKE '%adjuster%'
AND sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard ILIKE '%Experienced%';

UPDATE us_jobs_monster
SET sector_standard = 'Manufacturing'
WHERE job_title ILIKE '%packer%'
AND sector_standard ILIKE '%Experienced%';



--Experinced tag is finally done

SELECT DISTINCT sector_standard
FROM us_jobs_monster
ORDER BY sector_standard ASC;

--Cleaning up the standard sector labels
UPDATE us_jobs_monster
SET sector_standard = 'Government, Defense & Emergency'
WHERE sector_standard = 'Goverment, Defence & Emergency';

SELECT sector_standard, job_title
FROM us_jobs_monster
WHERE sector_standard = 'Other'
ORDER BY job_title ASC;

DELETE FROM us_jobs_monster WHERE sector_standard = 'Delete This Row';



--Cleaning all the nulls in sector_standard

SELECT DISTINCT job_title, job_description, sector_standard
FROM us_jobs_monster
WHERE sector_standard IS NULL
ORDER BY job_title ASC;

SELECT DISTINCT job_title, job_description, sector_standard
FROM us_jobs_monster
WHERE sector_standard IS NULL AND job_title ILIKE '%healthcare%'
ORDER BY job_title ASC;

SELECT DISTINCT job_title, job_description, sector_standard
FROM us_jobs_monster
WHERE sector_standard IS NULL AND job_title ILIKE '%front office%'
ORDER BY job_title ASC;

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE sector_standard IS NULL AND job_title ILIKE '%financal officer%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE sector_standard IS NULL AND job_title ILIKE '%front desk%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_title ILIKE '%healthcare%';

UPDATE us_jobs_monster
SET sector_standard = 'General Labor'
WHERE sector_standard IS NULL AND job_title ILIKE '%alphabroder%';

UPDATE us_jobs_monster
SET sector_standard = 'Production/Operations'
WHERE sector_standard IS NULL AND job_title ILIKE 'assembly%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_title ILIKE '%caregiver%';

UPDATE us_jobs_monster
SET sector_standard = 'Editorial/Writing'
WHERE sector_standard IS NULL AND job_title ILIKE 'captioning%';

UPDATE us_jobs_monster
SET sector_standard = 'Social Services'
WHERE sector_standard IS NULL AND job_title ILIKE '%case management%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE sector_standard IS NULL AND job_title ILIKE '%custodian%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE sector_standard IS NULL AND job_title ILIKE '%office assistant%';

DELETE FROM us_jobs_monster WHERE job_title LIKE '%MPC Job%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE sector_standard IS NULL AND job_description ILIKE '%faculty%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE sector_standard IS NULL AND job_description ILIKE '%law firm%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard IS NULL AND job_title ILIKE '%business%';

UPDATE us_jobs_monster
SET sector_standard = 'Government, Defense & Emergency'
WHERE sector_standard IS NULL AND job_title ILIKE '%government%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_title ILIKE '%electronic%';

UPDATE us_jobs_monster
SET sector_standard = 'R&D/Science'
WHERE sector_standard IS NULL AND job_title LIKE '%R&D%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE sector_standard IS NULL AND job_title LIKE '%QC%';

UPDATE us_jobs_monster
SET sector_standard = 'R&D/Science'
WHERE sector_standard IS NULL AND job_title LIKE '%Research Scientist%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Data Science'
WHERE sector_standard IS NULL AND job_title LIKE '%data scientists%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE sector_standard IS NULL AND job_title ILIKE '%scientist%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE sector_standard IS NULL AND job_title ILIKE '%food%';

UPDATE us_jobs_monster
SET sector_standard = 'Database Development/Administration'
WHERE sector_standard IS NULL AND job_title ILIKE '%sql server%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE sector_standard IS NULL AND job_title ILIKE '%server%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE sector_standard IS NULL AND job_title ILIKE 'Merchandiser%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE sector_standard IS NULL AND job_title ILIKE '%bartender%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE sector_standard IS NULL AND job_description ILIKE '%bartender%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_title ILIKE '%forklift%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE sector_standard IS NULL AND job_title ILIKE '%dishwasher%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE sector_standard IS NULL AND job_title ILIKE '%secretary%';

UPDATE us_jobs_monster
SET sector_standard = 'Public Service'
WHERE sector_standard IS NULL AND job_title ILIKE '%director of public health%';

UPDATE us_jobs_monster
SET sector_standard = 'Public Service'
WHERE sector_standard IS NULL AND job_title ILIKE '%environmental health%';

UPDATE us_jobs_monster
SET sector_standard = 'Public Service'
WHERE sector_standard IS NULL AND job_title ILIKE '%statewide health%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE sector_standard IS NULL AND job_description ILIKE '%sql%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_description ILIKE '%cna%';


UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_description ILIKE '%clinical%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE sector_standard IS NULL AND job_description ILIKE '%human resources%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE sector_standard IS NULL AND job_title ILIKE '%corrections officer%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE sector_standard IS NULL AND job_title ILIKE '%office%';


UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_description ILIKE '%surgery%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_description ILIKE '%hvac%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE sector_standard IS NULL AND job_title ILIKE '%inspector%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_description ILIKE '%plumbing%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE sector_standard IS NULL AND job_description ILIKE '%food%';

UPDATE us_jobs_monster
SET sector_standard = 'Editorial/Writing'
WHERE sector_standard IS NULL AND job_title ILIKE '%write%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_title ILIKE '%care%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE sector_standard IS NULL AND job_description ILIKE '%cyber security%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE sector_standard IS NULL AND job_title ILIKE '%security%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE sector_standard IS NULL AND job_title LIKE 'HR%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE sector_standard IS NULL AND job_title ILIKE '%human resources%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE sector_standard IS NULL AND job_title ILIKE '%technical%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE sector_standard IS NULL AND job_title ILIKE '%cleaning%';

UPDATE us_jobs_monster
SET sector_standard = 'General Labor'
WHERE sector_standard IS NULL AND job_title ILIKE '%packer%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE sector_standard IS NULL AND job_title ILIKE '%measure tech%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE sector_standard IS NULL AND job_title ILIKE '%document%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE sector_standard IS NULL AND job_title ILIKE '%deli%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE sector_standard IS NULL AND job_title ILIKE '%clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Social Services'
WHERE sector_standard IS NULL AND job_title ILIKE '%social%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE sector_standard IS NULL AND job_title ILIKE '%accounting%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE sector_standard IS NULL AND job_title ILIKE '%project%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_title ILIKE '%home%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE sector_standard IS NULL AND job_title LIKE '%QA%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_description ILIKE '%nurse%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_title LIKE '%CNA%';

DELETE FROM us_jobs_monster WHERE job_title LIKE 'Monster';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE sector_standard IS NULL AND job_title ILIKE '%quality%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE sector_standard IS NULL AND job_title ILIKE '%sunrise systems%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE sector_standard IS NULL AND job_description ILIKE '%systems administrator%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE sector_standard IS NULL AND job_title ILIKE '%linux%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard IS NULL AND job_title ILIKE '%administrator%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE sector_standard IS NULL AND job_title ILIKE '%tax%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_title ILIKE '%locksmith%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE sector_standard IS NULL AND job_title ILIKE '%custodial%';

UPDATE us_jobs_monster
SET sector_standard = 'Social Services'
WHERE sector_standard IS NULL AND job_title LIKE 'LVN%';

DELETE FROM us_jobs_monster WHERE job_title LIKE '·         High school diploma or equivalent';

UPDATE us_jobs_monster
SET sector_standard = 'Social Services'
WHERE sector_standard IS NULL AND job_description LIKE '2016%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_title ILIKE 'Tool%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE sector_standard IS NULL AND job_title ILIKE '%admissions%';

UPDATE us_jobs_monster
SET sector_standard = 'Creative/Design'
WHERE sector_standard IS NULL AND job_title ILIKE '%designer%';

UPDATE us_jobs_monster
SET sector_standard = 'Editorial/Writing'
WHERE sector_standard IS NULL AND job_title ILIKE '%editor%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE sector_standard IS NULL AND job_title ILIKE '%educational%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE sector_standard IS NULL AND job_title ILIKE '%bookkeeper%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE sector_standard IS NULL AND job_title ILIKE '%Telecom%';

UPDATE us_jobs_monster
SET sector_standard = 'Warehouse'
WHERE sector_standard IS NULL AND job_title ILIKE '%Shop Foreman%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_description ILIKE '%diagnostic%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE sector_standard IS NULL AND job_title ILIKE 'police%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_description ILIKE '%welder%';

UPDATE us_jobs_monster
SET sector_standard = 'Warehouse'
WHERE sector_standard IS NULL AND job_description ILIKE '%warehouse%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_description ILIKE '%repair%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE sector_standard IS NULL AND job_description ILIKE '%dealership%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE sector_standard IS NULL AND job_description ILIKE '%waitstaff%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_description ILIKE '%rehab%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations/Install/Maintenance/Repair'
WHERE sector_standard IS NULL AND job_description ILIKE '%machine%';

DELETE FROM us_jobs_monster WHERE job_title LIKE '%Various Positions%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE sector_standard IS NULL AND job_description ILIKE '%procurement specialist%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE sector_standard IS NULL AND job_title ILIKE '%ua monitor%';

UPDATE us_jobs_monster
SET sector_standard = 'Editorial/Writing'
WHERE sector_standard IS NULL AND job_title ILIKE '%typist%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard IS NULL AND job_title ILIKE '%staffing%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard IS NULL AND job_title ILIKE '%title commitment%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_description ILIKE '%contractors%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE sector_standard IS NULL AND job_title ILIKE '%teaching%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE sector_standard IS NULL AND job_description ILIKE '%customer service%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE sector_standard IS NULL AND job_description ILIKE '%production%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE sector_standard IS NULL AND job_title ILIKE '%paraprofessional%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE sector_standard IS NULL AND job_description ILIKE '%firm%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE sector_standard IS NULL AND job_description ILIKE '%dispatcher%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE sector_standard IS NULL AND job_title ILIKE 'Sr%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE sector_standard IS NULL AND job_description ILIKE '%laboratory%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE sector_standard IS NULL AND job_title ILIKE '%tutor%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE sector_standard IS NULL AND job_title ILIKE '%software%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_title ILIKE '%builders%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE sector_standard IS NULL AND job_title ILIKE '%safety%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard IS NULL AND job_title ILIKE '%sharepoint%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE sector_standard IS NULL AND job_title ILIKE '%audit%';

UPDATE us_jobs_monster
SET sector_standard = 'Other'
WHERE sector_standard IS NULL AND job_title ILIKE 'resident assistants%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE sector_standard IS NULL AND job_title ILIKE '%research associate%';

UPDATE us_jobs_monster
SET sector_standard = 'Editorial/Writing'
WHERE sector_standard IS NULL AND job_title ILIKE '%reporter%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard IS NULL AND job_title ILIKE '%director%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_description ILIKE '%therapist%';

UPDATE us_jobs_monster
SET sector_standard = 'Production/Operations'
WHERE sector_standard IS NULL AND job_description ILIKE '%product%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard IS NULL AND job_description ILIKE '%management%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE sector_standard IS NULL AND job_description ILIKE '%program coordinator%';

DELETE FROM us_jobs_monster WHERE job_title LIKE 'Please apply only if you are qualified%';

UPDATE us_jobs_monster
SET sector_standard = 'Project/Program Management'
WHERE sector_standard IS NULL AND job_title ILIKE '%planner%';

UPDATE us_jobs_monster
SET sector_standard = 'General Labor'
WHERE sector_standard IS NULL AND job_title ILIKE '%packing%';

DELETE FROM us_jobs_monster WHERE job_title LIKE 'All Positions%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_title ILIKE '%pharmacist%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_title ILIKE '%orthodontic%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_title ILIKE '%ophthalmic%';

UPDATE us_jobs_monster
SET sector_standard = 'Social Services'
WHERE sector_standard IS NULL AND job_description ILIKE '%social services%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE sector_standard IS NULL AND job_description ILIKE '%servers%';

DELETE FROM us_jobs_monster WHERE job_title LIKE 'Multiple Positions!%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE sector_standard IS NULL AND job_title ILIKE '%casino%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE sector_standard IS NULL AND job_description ILIKE '%mortgage%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations/Install/Maintenance/Repair'
WHERE sector_standard IS NULL AND job_description ILIKE '%maintenance%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_description ILIKE '%lpn%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE sector_standard IS NULL AND job_title ILIKE '%litigator%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_title ILIKE '%lcsw%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE sector_standard IS NULL AND job_title ILIKE '%translator%';

UPDATE us_jobs_monster
SET sector_standard = 'Social Services'
WHERE sector_standard IS NULL AND job_title ILIKE '%support specialist%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_title ILIKE '%journeyman%';

DELETE FROM us_jobs_monster WHERE job_title ILIKE 'Jobs %';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE sector_standard IS NULL AND job_description ILIKE '%bookkeeping%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_title ILIKE '%journeyman%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE sector_standard IS NULL AND job_title LIKE 'IT%';

DELETE FROM us_jobs_monster WHERE job_description ILIKE '#NAME?%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE sector_standard IS NULL AND job_description ILIKE '%receptionist%';

UPDATE us_jobs_monster
SET sector_standard = 'Legal'
WHERE sector_standard IS NULL AND job_description ILIKE '%legal%';

UPDATE us_jobs_monster
SET sector_standard = 'Insurance/Clerica'
WHERE sector_standard IS NULL AND job_title ILIKE '%insurance%';

DELETE FROM us_jobs_monster WHERE job_title ILIKE 'Infinity Resources%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE sector_standard IS NULL AND job_title ILIKE '%hairstylist%';

UPDATE us_jobs_monster
SET sector_standard = 'General Labor'
WHERE sector_standard IS NULL AND job_title ILIKE '%labor%';

UPDATE us_jobs_monster
SET sector_standard = 'General Labor'
WHERE sector_standard IS NULL AND job_title ILIKE '%grain%';

UPDATE us_jobs_monster
SET sector_standard = 'Public Service'
WHERE sector_standard IS NULL AND job_title ILIKE '%forestry%';

UPDATE us_jobs_monster
SET sector_standard = 'Public Service'
WHERE sector_standard IS NULL AND job_title ILIKE '%medic%';

UPDATE us_jobs_monster
SET sector_standard = 'Social Services'
WHERE sector_standard IS NULL AND job_description ILIKE '%family%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_description ILIKE '%metal%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_description ILIKE '%construction%';

DELETE FROM us_jobs_monster WHERE job_title ILIKE 'Evangelist%';

UPDATE us_jobs_monster
SET sector_standard = 'Public Service'
WHERE sector_standard IS NULL AND job_title ILIKE '%emt%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard IS NULL AND job_title ILIKE '%dietary%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_title ILIKE '%estimator%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE sector_standard IS NULL AND job_title ILIKE '%devops%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE sector_standard IS NULL AND job_title ILIKE '%copy center%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE sector_standard IS NULL AND job_title ILIKE '%controller%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE sector_standard IS NULL AND job_title ILIKE '%line worker%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE sector_standard IS NULL AND job_title ILIKE '%hourly%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE sector_standard IS NULL AND job_title ILIKE '%call center%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE sector_standard IS NULL AND job_title ILIKE '%CQ%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE sector_standard IS NULL AND job_title ILIKE '%interpreter%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard IS NULL AND job_title ILIKE '%surveyor%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard IS NULL AND job_title ILIKE '%public relations%';
-- Cleaning Nulls is done
-- Now cleaning job titles by sector
SELECT DISTINCT sector_standard
FROM us_jobs_monster
ORDER BY sector_standard ASC;

--Accounting/Finance/Insurance first
--Remember to clean them in job_title_standard

SELECT DISTINCT job_title
FROM us_jobs_monster
WHERE sector_standard = 'Accounting/Finance/Insurance'
ORDER BY job_title ASC;

UPDATE us_jobs_monster
SET jobs_title_standard = INITCAP(jobs_title_standard);

SELECT DISTINCT jobs_title_standard
FROM us_jobs_monster
WHERE sector_standard = 'Accounting/Finance/Insurance' 
AND jobs_title_standard LIKE 'Accountant%'
ORDER BY jobs_title_standard ASC;

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE jobs_title_standard LIKE 'Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Clerk'
WHERE jobs_title_standard LIKE '%Accounting Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Assistant'
WHERE jobs_title_standard LIKE 'Accounting Assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Associate'
WHERE jobs_title_standard LIKE 'Accounting Associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Associate'
WHERE jobs_title_standard LIKE 'Accounting Assoicate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Assistant Controller'
WHERE jobs_title_standard LIKE 'Assistant Controller%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Specialist'
WHERE jobs_title_standard LIKE 'Accounting Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Specialist'
WHERE jobs_title_standard LIKE 'Accounting Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'A/R Specialist'
WHERE jobs_title_standard LIKE 'A/R Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounts Payable'
WHERE jobs_title_standard LIKE 'Account Payable%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounts Receivable'
WHERE jobs_title_standard LIKE 'Account Receivable%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE jobs_title_standard LIKE 'Account Support Rep%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Admin'
WHERE jobs_title_standard LIKE 'Accounting Admin%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE jobs_title_standard ILIKE 'Accounting / Finance Associate Job In Arlington';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE jobs_title_standard ILIKE 'Accounting / F%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Claims Specialist'
WHERE jobs_title_standard LIKE 'Accounting Claims%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Coordinator'
WHERE jobs_title_standard LIKE 'Accounting Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Leadership Development Program'
WHERE jobs_title_standard LIKE 'Accounting Leadership%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Director'
WHERE jobs_title_standard LIKE 'Accounting Director%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE jobs_title_standard LIKE 'Accounting Job%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounting Processor'
WHERE jobs_title_standard LIKE 'Accounting Pr%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounts Payable'
WHERE jobs_title_standard LIKE 'Accounts Pay%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Analytical Accountant'
WHERE jobs_title_standard LIKE 'Analytical Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Anti-Money Laundering Specialist'
WHERE jobs_title_standard LIKE 'Anti-Money Laundering Specialist%';


ROLLBACK;

UPDATE us_jobs_monster
SET jobs_title_standard = 'Benefits Advisor'
WHERE jobs_title_standard LIKE 'Benefits Advisor%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Personal Banker'
WHERE jobs_title_standard LIKE 'Personal Banker%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Benefits Freelancer'
WHERE jobs_title_standard LIKE 'Benefits Freelancer%';


UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Accountant'
WHERE jobs_title_standard LIKE 'Senior Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Staff Accountant'
WHERE jobs_title_standard LIKE 'Staff Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Teller'
WHERE jobs_title_standard LIKE 'Teller%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Controller'
WHERE jobs_title_standard LIKE 'Controller%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Bookkeeper'
WHERE jobs_title_standard LIKE 'Bookkeeper%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Ap Specialist'
WHERE job_title ILIKE 'Ap Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Ap Coordinator'
WHERE job_title ILIKE 'Ap Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Ap Accountant'
WHERE job_title ILIKE 'Ap/Ar%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Ar Accountant'
WHERE job_title ILIKE 'Ar staff%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Assistant Coordinator'
WHERE job_title ILIKE 'Assistant coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Assistant Plant Controller'
WHERE job_title ILIKE 'Assistant plant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Assistant Comptroller'
WHERE job_title ILIKE 'Assistant to the comptroller%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Associate Accountant'
WHERE job_title ILIKE 'Associate Accountant%';

UPDATE us_jobs_monster
SET sector_standard = 'Editorial/Writing'
WHERE job_title ILIKE 'Associate underwriter%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Auditor'
WHERE job_title ILIKE '%Senior Auditor%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Auditor'
WHERE job_title ILIKE 'Audit Senior%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Auditor'
WHERE job_title ILIKE 'Audit Senior%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Audit Clerk'
WHERE job_title ILIKE 'Audit Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Auditor'
WHERE job_title ILIKE 'Auditor%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%Financial Accountants%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Bank Teller'
WHERE job_title ILIKE '%Bank Teller%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Benefits Advisor'
WHERE job_title ILIKE 'Benefits Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Bilingual Accountant'
WHERE job_title ILIKE 'Bilingual Staff Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Billing Associate'
WHERE job_title ILIKE 'Billing Associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Billing Coordinator'
WHERE job_title ILIKE 'Billing Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Billing Specialist'
WHERE job_title ILIKE 'Billing Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Billing Clerk'
WHERE job_title ILIKE 'Billing Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Business Control Specialist%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'Buyer/Planner%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Cash Applications Specialist'
WHERE job_title ILIKE 'Cash Applications Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE 'Certified Public Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Chief Financial Officer'
WHERE job_title ILIKE 'cfo%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Chief Operating Officer'
WHERE job_title ILIKE 'chief operating%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Claims Specialist'
WHERE job_title ILIKE '%Claims Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Claims Adjuster'
WHERE job_title ILIKE 'Claims Adjuster%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Claims Appraiser'
WHERE job_title ILIKE 'Claims Appraiser%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Claims Support Clerk'
WHERE job_title ILIKE 'Claims Support Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE 'Client Service%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Collections Specialist'
WHERE job_title ILIKE '%Collections Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Collections Specialist'
WHERE job_title ILIKE '%Commercial Collector%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%Construction Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%Accounting LEadership%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Controller'
WHERE job_title ILIKE '%Controller%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%staff accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Tax Accountant'
WHERE job_title ILIKE '%tax accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Cost Accountant'
WHERE job_title ILIKE '%cost accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Tax Accountant'
WHERE job_title ILIKE '%tax senior associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Default Mortgage Specialist'
WHERE job_title ILIKE 'default mortgage%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE 'development accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Junior Accountant'
WHERE job_title ILIKE 'entry level accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Auditor'
WHERE job_title ILIKE 'external audit%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Auditor'
WHERE job_title ILIKE '%auditor%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Finance Associate'
WHERE job_title ILIKE 'finance associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Banking Operations'
WHERE job_title ILIKE '%banking operations%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE 'Financial Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Financial Analyst'
WHERE job_title ILIKE 'Financial Analyst%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Financial Analyst'
WHERE job_title ILIKE 'Financial model validation%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Financial Reporting Accountant'
WHERE job_title ILIKE 'Financial reporting accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Financial Services Specialist'
WHERE job_title ILIKE 'Financial Services Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Foreclosure Specialist'
WHERE job_title ILIKE 'Foreclosure Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Bookkeeper'
WHERE job_title ILIKE '%Bookkeeper%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Fraud Specialist'
WHERE job_title ILIKE 'Fraud Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE 'gas accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Nonprofit Gift Processing'
WHERE job_title ILIKE 'gift processing%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Chief Financial Officer'
WHERE job_title ILIKE '%Chief Financial Officer%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Goverment Underwriter'
WHERE jobs_title_standard ILIKE 'Government Underwriter%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Healthcare Insurance Associate'
WHERE job_title ILIKE 'Healthcare Insurance Associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Insurance Account Manger'
WHERE job_title ILIKE '%Insurance- Personal Lines Account Manger%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Insurance Application Specialist'
WHERE job_title ILIKE '%Insurance Application Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Insurance Assistant'
WHERE job_title ILIKE '%Insurance Assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Insurance Eligibility Specialist'
WHERE job_title ILIKE '%Insurance Eligibility Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Insurance Team Lead'
WHERE job_title ILIKE '%Insurance Team Lead%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Auditor'
WHERE job_title ILIKE '%Internal Audit%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'International Tax & Compensation Coordinator'
WHERE job_title ILIKE '%International Tax & Compensation Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Inventory Accountant'
WHERE job_title ILIKE '%Inventory Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Inventory Accountant'
WHERe job_title ILIKE '%Inventory Reconciliation Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Auditor'
WHERE job_title ILIKE '%IT Audit Senior%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%GPo Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%grant accountant%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE 'Instrument%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Bookkeeper'
WHERE job_title ILIKE 'Jjsh Enterprises';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Bank Assistant Manager'
WHERE job_title ILIKE '%Assistant Branch Manager - Banking%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Junior Accountant'
WHERE job_title ILIKE '%Jr. Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Junior Accountant'
WHERE job_title ILIKE '%Junior Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Lead Accountant'
WHERE job_title ILIKE '%Lead Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Lead Teller'
WHERE job_title ILIKE '%Lead Teller%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Lending Compliance Officer'
WHERE job_title ILIKE '%Lending Compliance Officer%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Loan Document Specialist'
WHERE job_title ILIKE '%Loan doc specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Loan Processor'
WHERE job_title ILIKE '%Loan Processor%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Loan Servicing Specialist'
WHERE job_title ILIKE '%Loan Servicing Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%Local cpa%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Loan Processor'
WHERE job_title ILIKE '%Loan Processsor%';

UPDATE us_jobs_monster
SET sector_standard = 'Administrative/Clerical'
WHERE job_title ILIKE '%Mailroom Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Insurance/Clerical'
WHERE job_title ILIKE '%Management Development Program- Claims%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mortgage Closing Specialist'
WHERE job_title ILIKE '%Mortgage Closing Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%Financial Analyst / Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mortgage Loan Closer'
WHERE job_title ILIKE '%mortgage loan closer%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mortgage Loan Originator'
WHERE job_title ILIKE '%mortgage loan originator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mortage Loan Purchase Specialist'
WHERE job_title ILIKE '%Mortgage Loan Purchase specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mortgage Underwriter'
WHERE job_title ILIKE '%Mortgage Re-Underwriter%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mortgage Risk Investigator'
WHERE job_title ILIKE '%Mortgage Risk Investigator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mortgage Servicing Specialist'
WHERE job_title ILIKE '%Mortgage Servicing Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mortgage Underwriter'
WHERE job_title ILIKE '%Mortgage Underwriter%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE '%Ms exchange administrator%';

UPDATE us_jobs_monster
SET sector_standard = 'Customer Support/Client Care'
WHERE job_title ILIKE '%Customer Service Rep%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%Staff and Senior Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%plant accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Project Accountant'
WHERE job_title ILIKE '%Project Accountant%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%pmo coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%plant accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Portfolio Manager'
WHERE job_title ILIKE '%portfolio management%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%equity accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Project Accountant'
WHERE job_title ILIKE '%project accounting assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Property Accountant'
WHERE job_title ILIKE '%property accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%public accountant%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'purchaser%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'purchasing agent%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE 'purchasing catalog%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%Reconciliation Accountant Job In Chicago%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Reimbursement Specialist'
WHERE job_title ILIKE '%reimbursement specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Revenue Accountant'
WHERE job_title ILIKE '%Revenue accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Revenue Cycle Specialist'
WHERE job_title ILIKE '%Revenue Cycle Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Review Appraiser'
WHERE job_title ILIKE '%Review Appraiser%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Revenue Coordinator'
WHERE job_title ILIKE '%Revenue Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE 'sec reporting%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Revneue Coordinator'
WHERE job_title ILIKE 'Revneue Coordinator Job In Boston';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE 'sec reporting%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_title ILIKE '%Securities Operations%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Associate'
WHERE job_title ILIKE 'Senior Associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Auditor'
WHERE job_title ILIKE 'Senior Audit%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Accountant'
WHERE job_title ILIKE 'Senior%Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Collections'
WHERE job_title ILIKE 'Senior credit and collections%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Site acquisition specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Accountant'
WHERE job_title ILIKE 'Sr associate accounting%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Loan Processer'
WHERE job_title ILIKE 'Sr loan%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Accountant'
WHERE job_title ILIKE 'Sr.Development Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Accountant'
WHERE job_title ILIKE '%Senior Accountant%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Site Acquisition Specialist Job In Syracuse%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE job_title ILIKE '%Forklift%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE job_title ILIKE '%Supply Chain & Logistics Jobs Job In Princeton%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE '%Systems Administrator Iv & V Job In Fort Belvoir%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Hedge Fund Tax Director'
WHERE job_title ILIKE '%Tax director hedge fund%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Tax Preparer'
WHERE job_title ILIKE 'Tax Preparer%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Tax Preparer'
WHERE job_title ILIKE 'Tax Reviewer%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Tax Preparer'
WHERE job_title ILIKE 'Tax season help%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Tax Preparer'
WHERE job_title ILIKE 'Tax Senior%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Tax Preparer'
WHERE job_title ILIKE 'Tax Servicing%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Tax Preparer'
WHERE job_title ILIKE 'Tax Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Lead Accounting'
WHERE job_title ILIKE '%Accounting Lead%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE 'Test Manager%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE 'Tier  Network Support%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE job_title ILIKE 'Vp IT Software Development%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Trust & Estate Management'
WHERE job_title ILIKE 'Trust & Estates%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Accountant'
WHERE job_title ILIKE '%Senior Accounting%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE '%real estate firm seeks accountant%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE 'Warranty and service administrator%';


SELECT DISTINCT jobs_title_standard, job_description
FROM us_jobs_monster
WHERE sector_standard = 'Accounting/Finance/Insurance' 
ORDER BY jobs_title_standard ASC;

--Moving on to Accounts Payable

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounts Receivable'
WHERE job_title ILIKE 'Accounts Receivable%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE 'Auto Loan Accounting%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE '%Accountant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accountant'
WHERE job_title ILIKE 'Auto Loan Accounting%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounts Payable'
WHERE job_title ILIKE '%Accounts Payable%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Payroll Coordinator'
WHERE job_title ILIKE '%payroll coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Payroll Coordinator'
WHERE job_title ILIKE '%payroll processor%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Cash Posting Specialist'
WHERE job_title ILIKE '%cash posting specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Payroll Coordinator'
WHERE job_title ILIKE '%payroll coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounts Receivable'
WHERE job_title ILIKE '%Accounts Receivable%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Payroll Coordinator'
WHERE job_title ILIKE '%payroll%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Credit and Collections'
WHERE job_title ILIKE '%credit and collection%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Director of Human Resources'
WHERE job_title ILIKE '%Director of Human Resources%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE job_title ILIKE '%Director of Human Resources%';

UPDATE us_jobs_monster
SET sector_standard = 'General Labor'
WHERE job_title ILIKE '%Dog groomer%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Loan Accountant'
WHERE job_title ILIKE '%Loan Accounting%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accounts Payable'
WHERE job_title ILIKE '%invoice payment specialist%';

DELETE FROM us_jobs_monster WHERE job_title 
ILIKE 'Optum Siu Senior Pre-Pay Investigator - Us Telecommute Job In Dallas%';

DELETE FROM us_jobs_monster WHERE job_title 
ILIKE 'Revenue';

DELETE FROM us_jobs_monster WHERE job_title 
ILIKE 'State Director - Recovery Choices Job In Columbus';

DELETE FROM us_jobs_monster WHERE job_title 
ILIKE 'Supvisor Revenue Cycle Government Follow Up Job In West Allis';

DELETE FROM us_jobs_monster WHERE job_title 
ILIKE 'University - Finance & Accounting Majors (Recent & New Graduates) Job In Omaha';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Scientist'
WHERE job_title ILIKE 'Scientist%';

UPDATE us_jobs_monster
SET sector_standard = 'Science/Laboratory'
WHERE job_title ILIKE 'Scientist%';

SELECT DISTINCT jobs_title_standard, job_description
FROM us_jobs_monster
WHERE sector_standard = 'Accounts Payable/Receivable' 
ORDER BY jobs_title_standard ASC;

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE sector_standard ILIKE 'Accounts Payable/Receivable';

--Moving on to Administrative/Clerical

DELETE FROM us_jobs_monster WHERE job_title 
ILIKE '#Name?';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Receptionist'
WHERE job_title ILIKE '%Receptionist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant'
WHERE job_title ILIKE '%Administrative Assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Academic Administrator'
WHERE job_title ILIKE '%Academic Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Access Administrator'
WHERE job_title ILIKE '%Access Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Data Entry Clerk'
WHERE job_title ILIKE '%Data Entry Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Accreditation Administrator'
WHERE job_title ILIKE '%Accreditation Admin%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant'
WHERE job_title ILIKE '%Admin Assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Coordinator'
WHERE job_title ILIKE '%Admin Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Processor'
WHERE job_title ILIKE '%Admin Processor%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant'
WHERE job_title ILIKE '%Administration Assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant'
WHERE job_title ILIKE '%Administrative Assist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant'
WHERE job_title ILIKE '%Administrative Asssitant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Coordinator'
WHERE job_title ILIKE '%Administrative Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Executive Assistant'
WHERE job_title ILIKE '%Administrative Executive Assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant'
WHERE job_title ILIKE '%Administrative Professional%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant'
WHERE job_title ILIKE '%Administrative Support%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE jobs_title_standard ILIKE '%Agile Coach%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE jobs_title_standard ILIKE 'Accounts Payable';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Data Entry'
WHERE job_title ILIKE '%Data Entry%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'County Administrative Assistant'
WHERE job_title ILIKE '%Assistant County Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Assistant Vice President of Human Resources'
WHERE job_title ILIKE '%Assistant Vice President-Human Resources Director%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Assistant Vice President of Human Resources'
WHERE job_title ILIKE '%Assistant Vice President-Human Resources Director%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE jobs_title_standard ILIKE 'Associate Readiness Trainer%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE jobs_title_standard ILIKE 'Atm Monitoring Helpdesk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Benefit Administrator'
WHERE job_title ILIKE '%Benefit Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Export Coordinator'
WHERE job_title ILIKE '%Export Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Non-Profit Administrator'
WHERE job_title ILIKE '%Non-Profit Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Referral Coordinator'
WHERE job_title ILIKE '%Referral Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Secretary'
WHERE job_title ILIKE '%Secretary%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Collections Clerk'
WHERE job_title ILIKE '%Collections Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Hospitality'
WHERE job_title ILIKE '%Breakfast Attendant Front Desk Job%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE job_title ILIKE '%Business Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Collections Clerk'
WHERE job_title ILIKE '%Collections Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Office Assistant'
WHERE job_title ILIKE '%Office Assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Casualty Case Worker'
WHERE job_title ILIKE '%Casualty Case Worker%';

UPDATE us_jobs_monster
SET sector_standard = 'Social Services'
WHERE job_title ILIKE '%Casualty Case Worker%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Central Maintenance Planner'
WHERE job_title ILIKE '%Central Maintenance Planner%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations/Install/Maintenance/Repair'
WHERE job_title ILIKE '%Central Maintenance Planner%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Chief Experience Officer'
WHERE job_title ILIKE 'Chief Experience%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE job_title ILIKE '%Cio Job In Saint Paul%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Criminal Traffic Clerk'
WHERE job_title ILIKE '%Criminal Traffic Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Claims Administrator'
WHERE job_title ILIKE '%Claims Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Health Insurance Claims'
WHERE job_title ILIKE '%Claims Submissions/Health%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Clerical Assistant'
WHERE job_title ILIKE '%Clerical Assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Clerical Assistant'
WHERE job_title ILIKE '%Clerical Admin%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Title Clerk'
WHERE job_title ILIKE 'Clerk-Titles%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Client File Processor'
WHERE job_title ILIKE 'Client File Processor%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Clinic Administrator' 
WHERE job_title ILIKE 'Clinic Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Coin Processor' 
WHERE job_title ILIKE 'Coin Processor%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE job_title ILIKE '%Coin Processor%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Collection Warrant Clerk' 
WHERE job_title ILIKE 'Collection Warrant Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE job_title ILIKE '%Community Services Officer Job In Hermosa Beach%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Food Services/Safety and Inspection' 
WHERE job_title ILIKE '%Convenience Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE job_title ILIKE '%Convnenience Sub Shop Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Safety Administrator' 
WHERE job_title ILIKE '%Safety Administrator%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE job_title ILIKE '%Safety Administrator%';

UPDATE us_jobs_monster
SET sector_standard = 'Janitorial & Cleaning'
WHERE job_title ILIKE '%Custodial Worker%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations/Install/Maintenance/Repair'
WHERE job_title ILIKE '%Data Collection Terminals Repair Tech%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Data Management Coordinator' 
WHERE job_title ILIKE '%Data Management Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Bookkeeper' 
WHERE job_title ILIKE '%Data Processor Job In Las Vegas%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE jobs_title_standard ILIKE '%Bookkeeper%';

UPDATE us_jobs_monster
SET sector_standard = 'Human Resources'
WHERE job_title ILIKE '%Human Resources%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE jobs_title_standard ILIKE '%Chief Experience Officer%';


UPDATE us_jobs_monster
SET sector_standard = 'Insurance/Clerical'
WHERE jobs_title_standard ILIKE '%Claims%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE jobs_title_standard ILIKE '%Controller%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Database Administrator' 
WHERE job_title ILIKE '%Dba - Am Job In Dallas%';

UPDATE us_jobs_monster
SET sector_standard = 'Database Development/Administration'
WHERE jobs_title_standard ILIKE '%Database Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Dedicated Services Clerk' 
WHERE job_title ILIKE '%Dedicated Services Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Deli Clerk' 
WHERE job_title ILIKE '%Deli Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE jobs_title_standard ILIKE '%Deli Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE jobs_title_standard ILIKE 'Director%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Development Director' 
WHERE job_title ILIKE 'Development Director%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE jobs_title_standard ILIKE 'Associate Director';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE jobs_title_standard ILIKE 'Development Director';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Dispute Advisory Associate' 
WHERE job_title ILIKE '%Dispute Advisory Associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Docketing/Records Administrator' 
WHERE job_title ILIKE '%Docketing/Records Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Document Control Clerk' 
WHERE job_title ILIKE '%Document Control Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Document Control Clerk' 
WHERE job_title ILIKE '%Document Control Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Document Preparation Clerk' 
WHERE job_title ILIKE '%Document Prep Clerks%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Document Control Clerk' 
WHERE job_title ILIKE '%Documentation Control Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Documentation Coordinator' 
WHERE job_title ILIKE '%Documentation Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Eligibility Clerk' 
WHERE job_title ILIKE '%Eligibility Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Eligibility Clerk' 
WHERE job_title ILIKE '%Eligibility List-Court Legal%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Eligibility Clerk' 
WHERE job_title ILIKE '%Eligibility Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Office Billing' 
WHERE job_title ILIKE '%Office: Billing%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Director of Environmental, Health & Safety' 
WHERE job_title ILIKE 'Environmental';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Executive Helpdesk' 
WHERE job_title ILIKE 'Executive Helpdesk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant' 
WHERE job_title ILIKE 'Experienced Ea Needed-- Great Company Culture Job In South San Francisco';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Executive Helpdesk' 
WHERE job_title ILIKE 'Executive Helpdesk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Facilities Coordinator' 
WHERE job_title ILIKE 'Facilities Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Facilities Coordinator' 
WHERE job_title ILIKE '%Faculty Support Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'File Clerk' 
WHERE job_title ILIKE 'File Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Flex Benefits Administrator' 
WHERE job_title ILIKE 'Flex Benefits Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Food Pantry Coordinator' 
WHERE job_title ILIKE 'Food Pantry Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Cashier' 
WHERE jobs_title_standard ILIKE 'Food Services/Safety and Inspection';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Front Desk Associate' 
WHERE job_title ILIKE 'Front Desk Agent%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Front Desk Associate' 
WHERE job_title ILIKE 'Front Desk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Front Desk Associate' 
WHERE job_title ILIKE 'Front Office%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Adminstrative Assistant' 
WHERE job_title ILIKE '%Adminstrative Assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Grant Development Coordinator' 
WHERE job_title ILIKE 'Grant Development Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Grocery Clerk' 
WHERE job_title ILIKE 'Grocery Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE jobs_title_standard ILIKE 'Grocery Clerk';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE jobs_title_standard ILIKE 'Cashier';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE jobs_title_standard ILIKE 'Director of Environmental, Health & Safety';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Grocery Stock Clerk' 
WHERE job_title ILIKE 'Grocery Stock%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE jobs_title_standard ILIKE 'Grocery Stock Clerk';


UPDATE us_jobs_monster
SET jobs_title_standard = 'Head of Program Management' 
WHERE job_title ILIKE 'Head of Program Management%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE jobs_title_standard ILIKE 'Head of Program Management';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Director of Regional Healthcare Quality' 
WHERE job_title ILIKE 'Healthcare Regional Director%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE jobs_title_standard ILIKE 'Director of Regional Healthcare Quality';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Help Desk Technician' 
WHERE job_title ILIKE 'Helpdesk%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE jobs_title_standard ILIKE 'Help Desk Technician';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Imaging Production Specialist' 
WHERE job_title ILIKE 'Imaging Production%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Intake Coordinator' 
WHERE job_title ILIKE 'Intake Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Inventory Clerk' 
WHERE job_title ILIKE 'Inventory Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Logistics/Transportation'
WHERE jobs_title_standard ILIKE 'Inventory Clerk';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Receptionist' 
WHERE job_title ILIKE 'Irving Materials%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'IT Asset Administrator' 
WHERE job_title ILIKE 'It asset administrator%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE jobs_title_standard ILIKE 'IT Asset Administrator';

UPDATE us_jobs_monster
SET jobs_title_standard = 'IT Director' 
WHERE job_title ILIKE 'It director%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE jobs_title_standard ILIKE 'IT Director';

UPDATE us_jobs_monster
SET jobs_title_standard = 'IT Support Assistant' 
WHERE job_title ILIKE 'It support%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE jobs_title_standard ILIKE 'IT Support Assistant';

UPDATE us_jobs_monster
SET jobs_title_standard = 'JR Systems Administrator' 
WHERE job_title ILIKE 'Jr. Systems Administrator%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE jobs_title_standard ILIKE 'JR Systems Administrator';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Daily Units Processing Coordinator' 
WHERE job_title ILIKE 'Kb Home Daily Units%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Leasing Assistant' 
WHERE job_title ILIKE 'Leasing Assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Library Public Services Assistant' 
WHERE job_title ILIKE 'Library Public Services Assistant%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Loan Document Specialist' 
WHERE job_title ILIKE 'Loan Document Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mail Room Clerk' 
WHERE job_title ILIKE 'Mail Room and Materials%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mail Room Clerk' 
WHERE job_title ILIKE 'Mailroom Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mental Health Specialist' 
WHERE job_title ILIKE 'Mental Health Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Mortgage Associate' 
WHERE job_title ILIKE 'Mortgage Associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant' 
WHERE job_title ILIKE '%Administrative Associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Receptionist' 
WHERE job_title ILIKE '%Weekend Office Person%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Grant Administrator' 
WHERE job_title ILIKE 'Administrator';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Office Assistant' 
WHERE job_title ILIKE 'Office Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Office Assistant' 
WHERE job_title ILIKE 'Office Associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Office Assistant' 
WHERE job_title ILIKE 'Office Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Office Assistant' 
WHERE job_title ILIKE 'Office Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Office Assistant' 
WHERE job_title ILIKE 'Office Services%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Office Assistant' 
WHERE job_title ILIKE 'Office Support Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Office Assistant' 
WHERE job_title ILIKE 'Office/ Clerical%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Order Entry Processor' 
WHERE job_title ILIKE 'Order Entry Processor%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Overnight Billing' 
WHERE job_title ILIKE 'Overnight Billing%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE jobs_title_standard ILIKE 'Overnight Billing';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Overnight Stock Clerk' 
WHERE job_title ILIKE 'Overnight Stock Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE jobs_title_standard ILIKE 'Overnight Stock Clerk';

UPDATE us_jobs_monster
SET jobs_title_standard = 'File Clerk' 
WHERE job_title ILIKE '%File Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Community Development Director' 
WHERE job_title ILIKE '%Community Development Director%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Business/Strategic Management' 
WHERE job_title ILIKE '%Community Development Director%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Processing Specialist' 
WHERE job_title ILIKE '%Processing Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Stock Clerk' 
WHERE job_title ILIKE '%Stock Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE job_title ILIKE '%Produce Stock Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Product Coordinator' 
WHERE job_title ILIKE '%Product Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Program Administrator' 
WHERE job_title ILIKE '%Program Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Program Administrator' 
WHERE job_title ILIKE '%Program Support Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Document Control Coordinator' 
WHERE job_title ILIKE '%Document Control Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Phlebotomist' 
WHERE job_title ILIKE '%Phlebotomist%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title ILIKE '%Phlebotomist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Front Desk Associate' 
WHERE job_title ILIKE '%Front Desk Agent%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant' 
WHERE job_title ILIKE 'Purchasing Specialist Job In Nashville';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Quality Director' 
WHERE job_title ILIKE '%Quality Director%';

UPDATE us_jobs_monster
SET sector_standard = 'Quality Assurance/Safety'
WHERE job_title ILIKE 'Quality Director%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Property Administrator' 
WHERE job_title ILIKE '%Property Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Reconsideration Specialist' 
WHERE job_title ILIKE '%Reconsideration Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Records Associate' 
WHERE job_title ILIKE '%Records Associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Revenue Cycle Director' 
WHERE job_title ILIKE '%Revenue cycle site transition senior%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Sales Associate' 
WHERE job_title ILIKE '%Sales and service associate%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE jobs_title_standard ILIKE '%Sales Associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Sales Support Coordinator' 
WHERE job_title ILIKE '%Sales Support Coordinator%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE jobs_title_standard ILIKE '%Sales Support Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Scanning & Imaging Specialist' 
WHERE job_title ILIKE '%Scanning / Imaging Specialist%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE jobs_title_standard ILIKE '%Security Specialists%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Operations Administrator' 
WHERE job_title ILIKE '%Senior Operations Administrator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Operations Administrator' 
WHERE job_title ILIKE '%Senior Operations Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE jobs_title_standard ILIKE '%Senior Training Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Service Clerk' 
WHERE job_title ILIKE '%Service Center Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Service Coordinator' 
WHERE job_title ILIKE '%Senior Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'IT Support' 
WHERE job_title ILIKE '%Service Desk Job In Dallas%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE jobs_title_standard ILIKE '%IT Support%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Service Coordinator' 
WHERE job_title ILIKE 'Service Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Service Coordinator' 
WHERE job_title ILIKE 'Service Specialist%';

DELETE FROM us_jobs_monster WHERE job_title 
ILIKE 'Site Id Specialist  In Cincinnati';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Senior Vice President of Technology' 
WHERE job_title ILIKE 'Sr. Vice President Of It Job In Onalaska';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE jobs_title_standard ILIKE '%Senior Vice President of Technology%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Subcontracts Administrator' 
WHERE job_title ILIKE '%Subcontracts Administrator%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE jobs_title_standard ILIKE 'Stock Clerk';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Software Development'
WHERE jobs_title_standard ILIKE '%Systems Admin Mid%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Supervising Operations Associate' 
WHERE job_title ILIKE 'Supervising Operations Associate%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Tax Agent' 
WHERE job_title ILIKE 'Tax Agent Job%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Team Leader' 
WHERE job_title ILIKE 'Team Leader Job%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Technical Specialist' 
WHERE job_title ILIKE 'Technical Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant' 
WHERE job_title ILIKE 'Temporary Operations Project - Working In Excel - Boston Job In Boston';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Title Clerk' 
WHERE job_title ILIKE 'Title Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Training Coordinator' 
WHERE job_title ILIKE 'Trainer/Training Coordinator%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Typist' 
WHERE job_title ILIKE 'Typist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Unit Clerk' 
WHERE job_title ILIKE 'Unit Clerical%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Unit Clerk' 
WHERE job_title ILIKE 'Unit Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Administrative Assistant' 
WHERE job_title ILIKE 'Up to $';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Utilization Management Clerk' 
WHERE job_title ILIKE 'Utilization Management Clerk%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Verification Specialist' 
WHERE job_title ILIKE 'Verification Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Vice President' 
WHERE job_title ILIKE 'Vp';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Warranty Documentation Specialist' 
WHERE job_title ILIKE 'Warranty Documentation Specialist%';

UPDATE us_jobs_monster
SET jobs_title_standard = 'Wraparound Clerk' 
WHERE job_title ILIKE 'Wraparound Clerk%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE jobs_title_standard ILIKE 'Mortgage Associate';

UPDATE us_jobs_monster
SET sector_standard = 'Accounting/Finance/Insurance'
WHERE jobs_title_standard ILIKE 'Tax Agent';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE jobs_title_standard ILIKE 'Team Leader';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Tech Support'
WHERE jobs_title_standard ILIKE 'Technical Specialist';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE jobs_title_standard ILIKE 'Mental Health Specialist';

UPDATE us_jobs_monster
SET sector_standard = 'Education/Training'
WHERE jobs_title_standard ILIKE 'Training Coordinator';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE jobs_title_standard ILIKE 'Vice President%';


SELECT DISTINCT jobs_title_standard, job_description
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical' 
ORDER BY jobs_title_standard ASC;

SELECT DISTINCT jobs_title_standard, job_description
FROM us_jobs_monster
WHERE job_title ILIKE 'Front Desk%' 
ORDER BY jobs_title_standard ASC;

--Exploratory queries 

SELECT DISTINCT job_title, job_description, sector_standard
FROM us_jobs_monster
WHERE sector_standard IS NULL
ORDER BY job_title ASC;

SELECT DISTINCT job_title, job_description, sector_standard
FROM us_jobs_monster
WHERE sector_standard IS NULL AND job_title ILIKE '%diagnostic%'
ORDER BY job_title ASC;

SELECT DISTINCT job_title, job_description, sector_standard
FROM us_jobs_monster
WHERE sector_standard IS NULL AND job_description ILIKE '%diagnostic%'
ORDER BY job_title ASC;

SELECT DISTINCT job_title, job_description, sector_standard
FROM us_jobs_monster
WHERE sector_standard IS NULL AND job_description ILIKE '%customer service%'
ORDER BY job_title ASC;

SELECT DISTINCT job_title, job_description, sector_standard
FROM us_jobs_monster
WHERE sector_standard IS NULL AND job_description ILIKE '%environmental services%'
ORDER BY job_title ASC;

SELECT DISTINCT job_title, job_description 
FROM us_jobs_monster
WHERE sector_standard IS NOT NULL AND sector_standard ILIKE '%Experienced%';


SELECT DISTINCT job_title, job_description 
FROM us_jobs_monster
WHERE sector_standard IS NOT NULL AND sector_standard ILIKE '%Experienced%'
AND job_title ILIKE '%data analysis%';

SELECT DISTINCT job_title, job_description 
FROM us_jobs_monster
WHERE sector_standard IS NOT NULL AND sector_standard ILIKE '%Experienced%'
AND job_description ILIKE '%electrical%';

SELECT DISTINCT job_title, job_description 
FROM us_jobs_monster
WHERE sector_standard IS NOT NULL AND sector_standard ILIKE '%Experienced%'
AND job_title ILIKE '%office%';

SELECT DISTINCT job_title, job_description 
FROM us_jobs_monster
WHERE sector_standard IS NOT NULL AND sector_standard ILIKE '%Experienced%'
AND job_description ILIKE '%navy%';


SELECT DISTINCT job_title, sector_standard, job_description 
FROM us_jobs_monster
WHERE sector_standard IS NOT NULL AND sector_standard ILIKE '%Entry%'
ORDER BY sector_standard ASC;


SELECT DISTINCT job_title, sector_standard, job_description 
FROM us_jobs_monster
WHERE sector_standard IS NOT NULL AND job_title ILIKE '%Manager%'
ORDER BY sector_standard ASC;

SELECT DISTINCT job_title, sector_standard, job_description
FROM us_jobs_monster
WHERE length(sector_standard) > 50;

--Cleaning up useless columns

ALTER TABLE us_jobs_monster
DROP COLUMN country;

ALTER TABLE us_jobs_monster
DROP COLUMN date_added;

ALTER TABLE us_jobs_monster
DROP COLUMN has_expired;

ALTER TABLE us_jobs_monster
DROP COLUMN job_board;

SELECT DISTINCT sector_standard
FROM us_jobs_monster
ORDER BY sector_standard ASC;

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE job_title LIKE '%RN%';

SELECT sector_standard, job_title
FROM us_jobs_monster
WHERE job_title LIKE '%RN%';

UPDATE us_jobs_monster
SET sector_standard = 'Experienced'
WHERE sector_standard LIKE '%Experienced%';

SELECT sector_standard, job_title
FROM us_jobs_monster;

UPDATE us_jobs_monster
SET sector_standard = 'Engineering'
WHERE sector_standard LIKE 'Engineer%';

UPDATE us_jobs_monster
SET sector_standard = 'Food Services/Safety and Inspection'
WHERE sector_standard LIKE 'Food%';

UPDATE us_jobs_monster
SET sector_standard = 'Goverment, Defence & Emergency'
WHERE sector_standard LIKE 'Government%';

UPDATE us_jobs_monster
SET sector_standard = 'Automotive Care'
WHERE sector_standard LIKE 'Automotive%';

UPDATE us_jobs_monster
SET sector_standard = 'IT/Data Science'
WHERE sector_standard LIKE 'Data Science%';

UPDATE us_jobs_monster
SET sector_standard = 'Landscaping/Lawn Care'
WHERE sector_standard LIKE 'Lawn%';

UPDATE us_jobs_monster
SET sector_standard = 'Marketing/Advertising'
WHERE sector_standard LIKE 'Marketing%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard LIKE 'Optical%';

UPDATE us_jobs_monster
SET sector_standard = 'Equipment Operations/Install/Maintenance/Repair'
WHERE sector_standard LIKE 'Installation/Maintenance/Repair%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard LIKE 'Office%';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard LIKE 'Manager%';

UPDATE us_jobs_monster
SET sector_standard = 'Building Construction/Skilled Trades'
WHERE sector_standard LIKE 'Architecture%';

UPDATE us_jobs_monster
SET sector_standard = 'Medical/Health'
WHERE sector_standard LIKE 'Patient Care%';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE sector_standard LIKE 'Security';

UPDATE us_jobs_monster
SET sector_standard = 'Security/Protective Services'
WHERE sector_standard LIKE 'Public Safety';

UPDATE us_jobs_monster
SET sector_standard = 'Business/Strategic Management'
WHERE sector_standard LIKE 'Senior%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE sector_standard LIKE 'Sales%';

UPDATE us_jobs_monster
SET sector_standard = 'Sales/Retail/Business Development'
WHERE sector_standard LIKE 'Retail%';

UPDATE us_jobs_monster
SET sector_standard = 'Accounts Payable/Receivable'
WHERE sector_standard LIKE 'Payroll%';

SELECT *
FROM us_jobs_monster
WHERE sector_standard = 'Sales/Retail/Business Development'

SELECT *
FROM us_jobs_monster;
WHERE has_expired = 'No'

UPDATE us_jobs_monster
SET sector_standard = 'Insurance/Clerical'
WHERE sector_standard LIKE 'Insurance%';

--Moving onto Automotive Care





SELECT DISTINCT jobs_title_standard, job_description
FROM us_jobs_monster
WHERE sector_standard = 'Building Construction/Skilled Trades' 
ORDER BY jobs_title_standard ASC;

SELECT DISTINCT jobs_title_standard, job_description
FROM us_jobs_monster
WHERE job_title ILIKE 'Front Desk%' 
ORDER BY jobs_title_standard ASC;

CREATE TABLE us_jobs_monster_second_backup AS
SELECT * FROM us_jobs_monster;

--Cleaning Admin-realted Columns 

SELECT *
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical' 
ORDER BY jobs_title_standard ASC;

ALTER TABLE us_jobs_monster ADD COLUMN job_type_standard text;

UPDATE us_jobs_monster
SET job_type_standard = job_type;

SELECT job_type_standard
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical' 
ORDER BY jobs_title_standard ASC;

UPDATE us_jobs_monster
SET job_type_standard = 'Full Time Employee'
WHERE job_type_standard ILIKE 'Full Time';

UPDATE us_jobs_monster
SET job_type_standard = 'Full Time Employee'
WHERE job_type_standard ILIKE 'Full Time, Employee';

UPDATE us_jobs_monster
SET job_type_standard = 'Part Time Employee'
WHERE job_type_standard ILIKE 'Part Time';

UPDATE us_jobs_monster
SET job_type_standard = 'Full Time, Temporary/Contract/Project'
WHERE job_type_standard ILIKE 'Full Time Temporary/Contract/Project';

SELECT job_type_standard, jobs_title_standard, job_description
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical' AND job_type_standard IS NULL
ORDER BY jobs_title_standard ASC;

UPDATE us_jobs_monster
SET job_type_standard = 'Part Time Employee'
WHERE job_type_standard IS NULL AND job_description ILIKE 'Part Time%';

UPDATE us_jobs_monster
SET job_type_standard = 'Full Time Employee'
WHERE job_type_standard IS NULL AND job_description ILIKE '%Full Time%';

UPDATE us_jobs_monster
SET job_type_standard = 'Part Time Employee'
WHERE job_type_standard IS NULL AND job_description LIKE '%PT%';

UPDATE us_jobs_monster
SET job_type_standard = 'Full Time Employee'
WHERE job_type_standard IS NULL;

SELECT job_type_standard, jobs_title_standard, job_description
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical'
ORDER BY jobs_title_standard ASC;

UPDATE us_jobs_monster
SET job_type_standard = 'Full Time, Temporary/Contract/Project'
WHERE sector_standard = 'Administrative/Clerical' AND job_type_standard ILIKE 'Temporary/Contract/Project' 
AND job_description ILIKE '%full time%'

UPDATE us_jobs_monster
SET job_type_standard = 'Full Time, Temporary/Contract/Project'
WHERE sector_standard = 'Administrative/Clerical' AND job_type_standard ILIKE 'Temporary/Contract/Project';

UPDATE us_jobs_monster
SET job_type_standard = 'Full Time Employee'
WHERE sector_standard = 'Administrative/Clerical' AND job_type_standard ILIKE 'Job Type Full Time Employee';

SELECT *
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical'
ORDER BY jobs_title_standard ASC;

--I'm going to have to drop more columns, so making a second back up of what's already been cleaned
CREATE TABLE us_jobs_monster_second_backup AS
SELECT * FROM us_jobs_monster;

--Moving on to cleaning location, then orginization. Afterward will begin to drop columns and rows 
SELECT location, job_description
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical'
ORDER BY jobs_title_standard ASC;

ALTER TABLE us_jobs_monster ADD COLUMN location_standard text;
UPDATE us_jobs_monster
SET location_standard = location;

--AAAAAAAAAAH
SELECT location_standard, job_description
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
ORDER BY jobs_title_standard ASC;

UPDATE us_jobs_monster
SET location_standard = 'San Antonio, TX'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%San Antonio%'

UPDATE us_jobs_monster
SET location_standard = 'West Hollywood, CA'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%West HollywoodPay%'

UPDATE us_jobs_monster
SET location_standard = 'Beverly Hills, CA'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%Beverly Hills%';

UPDATE us_jobs_monster
SET location_standard = 'Indianapolis, IN 46249'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%Indianapolis, IN 46249%';

UPDATE us_jobs_monster
SET location_standard = 'Lebanon, NJ'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%Lebanon, NJ%';

UPDATE us_jobs_monster
SET location_standard = 'Houston, TX'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%Houston%'; 

UPDATE us_jobs_monster
SET location_standard = 'Irving, TX 75061'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%TX 75061%';

UPDATE us_jobs_monster
SET location_standard = 'Moses Lake, WA'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%Moses Lake, WA%';

UPDATE us_jobs_monster
SET location_standard = 'Fremont, CA 94538'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%Fremont, CA 94538%';

UPDATE us_jobs_monster
SET location_standard = 'Englewood, CO'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%Englewood, CO%';

UPDATE us_jobs_monster
SET location_standard = 'Depew, NY 14043'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%NY 14043%';

UPDATE us_jobs_monster
SET location_standard = 'Christi, TX 78411'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%Christi, TX 78411%';

UPDATE us_jobs_monster
SET location_standard = 'San Jose, CA'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%San Jose%';

UPDATE us_jobs_monster
SET location_standard = 'Sedona, AZ 86340'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%Sedona, AZ 86340%';

UPDATE us_jobs_monster
SET location_standard = 'Needham, MA'
WHERE sector_standard = 'Administrative/Clerical' AND length(location) > 50
AND location ILIKE '%Needham, MA%';

UPDATE us_jobs_monster
SET location_standard = 'Herndon, VA'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard ILIKE '%Herndon Virginia%';

UPDATE us_jobs_monster
SET location_standard = 'Remote'
WHERE sector_standard = 'Administrative/Clerical'
AND job_description ILIKE '%of work: Your home%';

UPDATE us_jobs_monster
SET location_standard = NULL
WHERE sector_standard = 'Administrative/Clerical'
AND length(location_standard) > 50;

--Going over location nulls

SELECT location, job_description
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical' AND location IS NULL
ORDER BY jobs_title_standard ASC;

--Nevermind, there are no nulls

SELECT DISTINCT location_standard
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical' 
ORDER BY location_standard ASC;

--Cleaning location of all oddly formated 
UPDATE us_jobs_monster
SET location_standard =
CASE 
	WHEN location_standard = '14614' THEN 'Rochester, NY 14614'
	WHEN location_standard = '28541' THEN 'Jacksonville, North Carolina 28541'
	WHEN location_standard = '33708' THEN 'Saint Petersburg, FL 33708'
	WHEN location_standard = '46140' THEN 'Greenfield, IN 46140'
	WHEN location_standard = '66725' THEN 'Columbus, KS 66725'
	WHEN location_standard = '73044' THEN 'Guthrie, OK 73044'
	WHEN location_standard = '89106' THEN 'Las Vegas, NV 89106'
	WHEN location_standard = '89121' THEN 'Las Vegas, NV  89121'
ELSE location_standard
END;

UPDATE us_jobs_monster
SET location_standard = 'Westerville, OH 43081'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard ILIKE '%Westerville, OH%';

UPDATE us_jobs_monster
SET location_standard = 'Boston, MA'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard ILIKE '%BostonMA%';

UPDATE us_jobs_monster
SET location_standard = 'Chicago, IL'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard ILIKE 'ChicagoIL';

DELETE FROM us_jobs_monster WHERE location ILIKE '%Select Staffing%';

UPDATE us_jobs_monster
SET location_standard = 'Dallas, TX'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard ILIKE 'DallasTX';

UPDATE us_jobs_monster
SET location_standard = 'District of Columbia, DC'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard ILIKE 'District of ColumbiaDC';

UPDATE us_jobs_monster
SET location_standard = 'San Francisco, CA'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard ILIKE 'Full Time Employee';

UPDATE us_jobs_monster
SET location_standard = 'Cincinnati, OH'
WHERE sector_standard = 'Administrative/Clerical'
AND uniq_id ILIKE '62ef613b91152cd06c25ea2853fa84f1';

UPDATE us_jobs_monster
SET location_standard = 'Tucker, GA'
WHERE sector_standard = 'Administrative/Clerical'
AND uniq_id ILIKE '2cbf455d6f14c9e5eb7a40dcc759e6f8';

UPDATE us_jobs_monster
SET location_standard = 'Philadelphia, PA 19106'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard ILIKE 'Phila, PA%';

DELETE FROM us_jobs_monster WHERE location_standard ILIKE 'Phone (910) 362-7312';

UPDATE us_jobs_monster
SET location_standard = 'Princeton, NJ 08540'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard ILIKE 'Princeton%';

UPDATE us_jobs_monster
SET location_standard = 'Sunnyvale, CA'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard ILIKE 'Senior Operations Clerk';

UPDATE us_jobs_monster
SET location_standard = 'San Francisco, CA 94080'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard ILIKE 'South San Francisco%';

UPDATE us_jobs_monster
SET location_standard = 'San Francisco, CA'
WHERE sector_standard = 'Administrative/Clerical'
AND location_standard IS NULL;

SELECT DISTINCT job_title, organization, job_description
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical' 
ORDER BY organization ASC;

ALTER TABLE us_jobs_monster DROP COLUMN salary;

--Attempted to see if organization can be used for something
--organization can't be used, too much data missing, must be dropped

ALTER TABLE us_jobs_monster DROP COLUMN organization;

--Only column to clean is the job_description coloumn

ALTER TABLE us_jobs_monster ADD COLUMN job_description_standard text;

UPDATE us_jobs_monster
SET job_description_standard = job_description;

--Hlep
--Varchar 500 charcters

UPDATE us_jobs_monster
SET job_description_standard = TRIM(LEADING 'Job Description:' FROM job_description_standard);

UPDATE us_jobs_monster
SET job_description_standard =
CASE 
	WHEN LENGTH(job_description) > 200 THEN CONCAT(LEFT(job_description_standard, 200), '...')
	ELSE job_description_standard
	END;

UPDATE us_jobs_monster
SET job_description_standard = INITCAP(job_description_standard)

UPDATE us_jobs_monster
SET job_description_standard =
TRIM('«*#' FROM job_description_standard)

UPDATE us_jobs_monster
SET job_description_standard =
TRIM(job_description_standard);

SELECT job_description_standard, job_description 
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical' 
ORDER BY jobs_title_standard ASC;

--Putting Everything into it's own table

CREATE TABLE admin_monster_jobs AS 
SELECT *
FROM us_jobs_monster
WHERE sector_standard = 'Administrative/Clerical';

--Dropping and remaning all the columns 

SELECT * 
FROM admin_monster_jobs;

ALTER TABLE admin_monster_jobs DROP COLUMN job_description;
ALTER TABLE admin_monster_jobs DROP COLUMN job_title;
ALTER TABLE admin_monster_jobs DROP COLUMN job_type;
ALTER TABLE admin_monster_jobs DROP COLUMN location;
ALTER TABLE admin_monster_jobs DROP COLUMN sector;

--Changing the data types so they're not a mess

UPDATE admin_monster_jobs
SET country_code = TRIM(country_code);

ALTER TABLE admin_monster_jobs
ALTER COLUMN country_code TYPE char (3);

ALTER TABLE admin_monster_jobs
ALTER COLUMN page_url TYPE varchar (200);

ALTER TABLE admin_monster_jobs
ALTER COLUMN uniq_id TYPE char (32);

ALTER TABLE admin_monster_jobs
ALTER COLUMN sector_standard TYPE varchar (50);

ALTER TABLE admin_monster_jobs
ALTER COLUMN jobs_title_standard TYPE varchar (50);

ALTER TABLE admin_monster_jobs
ALTER COLUMN job_type_standard TYPE varchar (50);

ALTER TABLE admin_monster_jobs
ALTER COLUMN location_standard TYPE varchar (35);

ALTER TABLE admin_monster_jobs
ALTER COLUMN job_description_standard TYPE varchar (205);

--Adding Constraints

ALTER TABLE admin_monster_jobs ADD CONSTRAINT uniq_id_key PRIMARY KEY (uniq_id);
ALTER TABLE admin_monster_jobs ADD CONSTRAINT uniq_id_unique_key UNIQUE (uniq_id);
ALTER TABLE admin_monster_jobs ALTER COLUMN uniq_id SET NOT NULL;

--Adding Index on job_title for faster queries 
CREATE INDEX job_title_idx ON admin_monster_jobs(jobs_title_standard);

--Alternatively could have been on location


SELECT * 
FROM admin_monster_jobs;

SELECT max(LENGTH(page_url))
FROM admin_monster_jobs;

SELECT LENGTH(uniq_id)
FROM admin_monster_jobs;

SELECT LENGTH(sector_standard)
FROM admin_monster_jobs;

SELECT max(LENGTH(jobs_title_standard))
FROM admin_monster_jobs;

SELECT max(LENGTH(jobs_type_standard))
FROM admin_monster_jobs;

SELECT max(LENGTH(location_standard))
FROM admin_monster_jobs;
--Now to extract as a csv/excel file

COPY admin_monster_jobs TO 'C:\Postgresql\admin_monster_jobs.txt'
WITH (FORMAT CSV, HEADER, DELIMITER ',')





		