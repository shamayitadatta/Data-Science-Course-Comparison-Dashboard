create database course;
use course;
CREATE TABLE InitialCourseTracker (
    id INT AUTO_INCREMENT PRIMARY KEY,
    institute VARCHAR(100),
    course_name VARCHAR(255),
    fees VARCHAR(50),
    duration VARCHAR(50),
    mode VARCHAR(100),
    placement_support VARCHAR(255),
    notes TEXT
);
INSERT INTO InitialCourseTracker (
    institute, course_name, fees, duration, mode, placement_support, notes
)
VALUES
-- IIT Delhi
('IIT Delhi', 'Certificate in Data Science & ML (CEP)', '₹1,50,000 + GST', '6 months', 'Live online', 'Certificate', 'Starts 29 Jun 2025'),
-- IIT Mandi
('IIT Mandi', 'AI & Data Science Program (CCE)', 'Not explicitly stated', '9 months', 'Online, flexible payments', 'Yes', '3-trimester structure'),
-- IIT Madras
('IIT Madras', 'BS in Data Science & Applications', '₹3–4 Lakh total', '4 years (UG)', 'Hybrid (online + on-campus)', 'Scholarships available', 'Flexible exit options'),
-- NIT Jalandhar
('NIT Jalandhar', 'M.Tech in Data Analytics', '₹1.40 Lakh total', '2 years', 'Full-time (campus)', 'Degree + placements', 'Govt institute'),
-- NIT Trichy
('NIT Trichy', 'M.Tech in Data Analytics', '₹2.18 Lakh total', '2 years', 'Full-time', 'Yes (median ~₹7 LPA)', 'NIRF #9 engineering'),
-- NIT Delhi
('NIT Delhi', 'M.Tech in Data Analytics', '₹5.33 Lakh total', '2 years', 'Full-time', 'Yes (hostel avail.)', '₹2.77L/year tuition+others'),
-- NIT Warangal
('NIT Warangal', 'PG Certificate in Data Science & AI (with Edureka/IIIT Kurnool)', '₹2.25 Lakh + GST', '9 months', 'Hybrid (virtual)', 'Placement assisted', '400+ hrs, project-based'),
-- NITTE University
('NITTE University', 'B.Sc in Data Analytics', '₹6.38 Lakh total', '4 years UG', 'Full-time (campus)', 'Degree + placements', 'Includes hostel & exam fees'),
-- IIIT Dharwad
('IIIT Dharwad', 'B.Tech in Data Science & AI', 'Not listed', '4 years UG', 'On-campus', 'Degree + placements', 'National Importance institute'),
-- IIIT Raichur
('IIIT Raichur', 'B.Tech in AI & Data Science', 'Not listed', '4 years UG', 'On-campus', 'Degree + placements', 'Started Aug 2023'),
-- IIIT Kalyani
('IIIT Kalyani', 'M.Tech in AI & Data Science (Executive for working pros)', 'Not listed', 'Not listed', 'Online', 'Yes', 'Online working‑professional format');

# List All Courses
SELECT * FROM InitialCourseTracker;
# Filter by Course Duration Under 1 Year
SELECT * FROM InitialCourseTracker
WHERE duration LIKE '%months%';
# List Courses with Fees Mentioned
SELECT * FROM InitialCourseTracker
WHERE fees NOT LIKE 'Not listed' AND fees NOT LIKE 'Not explicitly stated';
# Courses Offered in Online or Hybrid Mode
SELECT * FROM InitialCourseTracker
WHERE mode LIKE '%online%' OR mode LIKE '%Hybrid%';
# Add new columns.
ALTER TABLE InitialCourseTracker
ADD COLUMN placement_rate VARCHAR(50),
ADD COLUMN intake_estimate INT,
ADD COLUMN eligibility TEXT,
ADD COLUMN popularity TEXT;
# INSERT THE VALUES.
-- IIT Delhi
UPDATE InitialCourseTracker
SET 
    placement_rate = 'N/A',
    intake_estimate = NULL,
    eligibility = 'Graduate/Diploma with ≥50% in Class XII Math/Stats; no JEE required',
    popularity = 'High demand, starts June 2025'
WHERE id = 1;

-- IIT Mandi
UPDATE InitialCourseTracker
SET 
    placement_rate = 'Unknown',
    intake_estimate = NULL,
    eligibility = 'Open to all graduates or working professionals',
    popularity = 'Moderate'
WHERE id = 2;

-- IIT Madras
UPDATE InitialCourseTracker
SET 
    placement_rate = '30–40%',
    intake_estimate = 10000,
    eligibility = 'Class 10 Math/English + JEE or Qualifier Exam',
    popularity = '38,000+ students, 82% retention'
WHERE id = 3;

-- NIT Jalandhar
UPDATE InitialCourseTracker
SET 
    placement_rate = 'Around 60%',
    intake_estimate = 60,
    eligibility = 'GATE + B.E/B.Tech in CS/IT',
    popularity = 'Govt institute with growing demand'
WHERE id = 4;

-- NIT Trichy
UPDATE InitialCourseTracker
SET 
    placement_rate = '70%',
    intake_estimate = 60,
    eligibility = 'GATE + Engineering background',
    popularity = 'NIRF Top 10 ranked'
WHERE id = 5;

-- NIT Delhi
UPDATE InitialCourseTracker
SET 
    placement_rate = '60–65%',
    intake_estimate = 45,
    eligibility = 'GATE + B.Tech CS/IT',
    popularity = 'New program, mid-level popularity'
WHERE id = 6;

-- NIT Warangal
UPDATE InitialCourseTracker
SET 
    placement_rate = '60%',
    intake_estimate = 100,
    eligibility = 'Bachelor’s + coding background; industry experience preferred',
    popularity = 'In partnership with Edureka/IIIT'
WHERE id = 7;

-- NITTE University
UPDATE InitialCourseTracker
SET 
    placement_rate = 'Unknown',
    intake_estimate = 120,
    eligibility = 'Class 12 with Science and Math',
    popularity = 'Tier-3 institute, moderate demand'
WHERE id = 8;

-- IIIT Dharwad
UPDATE InitialCourseTracker
SET 
    placement_rate = 'Emerging (40–50%)',
    intake_estimate = 50,
    eligibility = 'JEE Advanced AIR required',
    popularity = 'Newer IIIT with NIRF participation'
WHERE id = 9;

-- IIIT Raichur
UPDATE InitialCourseTracker
SET 
    placement_rate = 'Emerging',
    intake_estimate = 50,
    eligibility = 'JEE Advanced AIR required',
    popularity = 'Recently started in 2023'
WHERE id = 10;

-- IIIT Kalyani
UPDATE InitialCourseTracker
SET 
    placement_rate = 'Unknown',
    intake_estimate = NULL,
    eligibility = 'For working professionals; online test/interview',
    popularity = 'Low visibility'
WHERE id = 11;
# Useful Queries for Analysis

# All High-Popularity Courses
SELECT institute, course_name, popularity
FROM InitialCourseTracker
WHERE popularity LIKE '%High%' OR popularity LIKE '%38,000%' OR popularity LIKE '%Top 10%';
# Courses with Placement Rate Over 60%
SELECT institute, course_name, placement_rate
FROM InitialCourseTracker
WHERE placement_rate REGEXP '[6-9][0-9]%|100%';
# Courses with Large Student Intake
SELECT institute, course_name, intake_estimate
FROM InitialCourseTracker
WHERE intake_estimate IS NOT NULL
ORDER BY intake_estimate DESC;
# Eligibility without  JEE
SELECT institute, course_name, eligibility
FROM InitialCourseTracker
WHERE eligibility NOT LIKE '%JEE%';
# Compare NIT vs IIT Programs by Placement
SELECT institute, course_name, placement_rate
FROM InitialCourseTracker
WHERE institute LIKE '%NIT%' OR institute LIKE '%IIT%'
ORDER BY placement_rate DESC;
# safe mode on , thats why it's give us error, so at first we need to off our safe mode in our computer
set sql_safe_updates=0;
UPDATE InitialCourseTracker
SET eligibility = 'Class 10 Math/English + either JEE OR Online Qualifier Exam; flexible diploma/degree exits'
WHERE institute = 'IIT Madras';
UPDATE InitialCourseTracker
SET 
    placement_rate = '65%',
    eligibility = 'Class 10 Math/English + JEE OR Online Qualifier Exam; flexible exit with diploma/degree options',
    popularity = 'Top-ranked program with 38,000+ learners; ~82% retention rate',
    notes = 'Highly flexible program from IITM with online + on-campus options, 240+ placement partners'
WHERE id = 3;

# List Courses with Placement Rate Between 60%–80%
SELECT institute, course_name, placement_rate
FROM InitialCourseTracker
WHERE 
  CAST(REPLACE(placement_rate, '%', '') AS UNSIGNED) BETWEEN 60 AND 79;
# Courses With Highest Fees Mentioned
SELECT institute, course_name, fees
FROM InitialCourseTracker
WHERE fees REGEXP '^[₹]?[0-9,.]+'
ORDER BY CAST(REPLACE(REPLACE(REPLACE(fees, '₹', ''), ',', ''), ' Lakh total', '') AS DECIMAL(10,2)) DESC;
#Find Courses Offering Diploma Exit Options
SELECT institute, course_name, eligibility
FROM InitialCourseTracker
WHERE eligibility LIKE '%diploma%';
# 4. Courses in Hybrid or Online Mode
SELECT institute, course_name, mode
FROM InitialCourseTracker
WHERE mode LIKE '%online%' OR mode LIKE '%Hybrid%';
#Filter Programs for Working Professionals
SELECT institute, course_name, eligibility, mode
FROM InitialCourseTracker
WHERE eligibility LIKE '%working professional%' OR notes LIKE '%executive%';
#Newer Programs (launched after 2022)
SELECT institute, course_name, popularity
FROM InitialCourseTracker
WHERE popularity LIKE '%new%' OR popularity LIKE '%2023%';
#Average Student Intake by Institute Type
SELECT
  CASE
    WHEN institute LIKE '%IIT%' THEN 'IIT'
    WHEN institute LIKE '%NIT%' THEN 'NIT'
    WHEN institute LIKE '%IIIT%' THEN 'IIIT'
    ELSE 'Other'
  END AS InstituteType,
  AVG(intake_estimate) AS AvgIntake
FROM InitialCourseTracker
WHERE intake_estimate IS NOT NULL
GROUP BY InstituteType;
#Count of Courses by Placement Support
SELECT placement_support, COUNT(*) AS course_count
FROM InitialCourseTracker
GROUP BY placement_support
ORDER BY course_count DESC;
# Top 5 Most Popular Courses (Based on Keywords)
SELECT institute, course_name, popularity
FROM InitialCourseTracker
WHERE popularity LIKE '%high%' OR popularity LIKE '%top%' OR popularity LIKE '%retention%' OR popularity LIKE '%demand%'
LIMIT 5;
#  Courses with Unknown Placement But High Fees
SELECT institute, course_name, fees, placement_rate
FROM InitialCourseTracker
WHERE placement_rate LIKE '%unknown%'
  AND fees LIKE '%Lakh%'
ORDER BY 
  CAST(REPLACE(REPLACE(REPLACE(REPLACE(fees, '₹', ''), ' ', ''), ',', ''), ' Lakh total', '') AS DECIMAL(10,2)) DESC;
# Top Courses with the Best Value for Money (Placement vs Fee)
SELECT institute, course_name, placement_rate, fees
FROM InitialCourseTracker
WHERE placement_rate NOT LIKE '%Unknown%'
  AND fees LIKE '%Lakh%'
ORDER BY 
  CAST(REPLACE(REPLACE(REPLACE(REPLACE(fees, '₹', ''), ' ', ''), ',', ''), ' Lakh total', '') AS DECIMAL(10,2)) / 
  CAST(REPLACE(placement_rate, '%', '') AS DECIMAL(5,2))
ASC
LIMIT 5;
# Courses Eligible Without GATE or JEE
SELECT institute, course_name, eligibility
FROM InitialCourseTracker
WHERE eligibility NOT LIKE '%GATE%' AND eligibility NOT LIKE '%JEE%';
# Top Institutes by Number of Unique Courses Offered
SELECT institute, COUNT(*) AS num_courses
FROM InitialCourseTracker
GROUP BY institute
ORDER BY num_courses DESC;
# Show Programs with Short Duration But High Placement
SELECT institute, course_name, duration, placement_rate
FROM InitialCourseTracker
WHERE duration LIKE '%months%'
  AND CAST(REPLACE(placement_rate, '%', '') AS UNSIGNED) > 50
ORDER BY placement_rate DESC;
# Identify Low Popularity But High Potential Programs
SELECT institute, course_name, popularity, placement_rate
FROM InitialCourseTracker
WHERE popularity LIKE '%low%' OR popularity LIKE '%moderate%'
  AND CAST(REPLACE(placement_rate, '%', '') AS UNSIGNED) > 50
ORDER BY placement_rate DESC;





























