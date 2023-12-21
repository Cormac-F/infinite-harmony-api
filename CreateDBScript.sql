CREATE DATABASE IF NOT EXISTS IH_AideenMc;

use IH_AideenMc;

CREATE TABLE TeamLead (
  leadID INT PRIMARY KEY NOT NULL,
  leadForename VARCHAR(20) NOT NULL,
  leadSurname VARCHAR(30) NOT NULL,
  leadMessage VARCHAR(240) NOT NULL
);

CREATE TABLE Capability (
  capabilityID INT PRIMARY KEY NOT NULL,
  capabilityName VARCHAR(70) NOT NULL
);

CREATE TABLE Band (
  bandID INT PRIMARY KEY NOT NULL,
  bandName VARCHAR(30) NOT NULL,
  bandLevel TINYINT NOT NULL
);

CREATE TABLE Training (
  trainingID INT PRIMARY KEY NOT NULL,
  trainingName VARCHAR(100) NOT NULL,
  trainingLink VARCHAR(400) NOT NULL,
  trainingType VARCHAR(20) NOT NULL
);

CREATE TABLE Competency (
  competencyID INT PRIMARY KEY NOT NULL,
  competencyName VARCHAR(255) NOT NULL
);

CREATE TABLE Competency_Band (
  competencyID INT NOT NULL,
  bandID INT NOT NULL,
  competencyDescription VARCHAR(500) NOT NULL,
  PRIMARY KEY (competencyID, bandID),
  FOREIGN KEY (competencyID) REFERENCES Competency(competencyID),
  FOREIGN KEY (bandID) REFERENCES Band(bandID)
);

CREATE TABLE JobFamily (
  familyID INT PRIMARY KEY NOT NULL,
  familyName VARCHAR(70) NOT NULL,
  capabilityID INT NOT NULL,
  FOREIGN KEY (capabilityID) REFERENCES Capability(capabilityID)
);

CREATE TABLE JobRole (
  roleID INT PRIMARY KEY NOT NULL,
  roleName VARCHAR(50) NOT NULL,
  bandID INT NOT NULL,
  familyID INT NOT NULL,
  specSummary VARCHAR(900) NOT NULL,
  sharepointLink VARCHAR(1000),
  FOREIGN KEY (bandID) REFERENCES Band(bandID),
  FOREIGN KEY (familyID) REFERENCES JobFamily(familyID)
);

CREATE TABLE Responsibility (
  responsibilityID INT PRIMARY KEY NOT NULL,
  responsibilityName VARCHAR(255) NOT NULL,
  roleID INT NOT NULL,
  FOREIGN KEY (roleID) REFERENCES JobRole(roleID)
);

CREATE TABLE Training_Band (
  trainingID INT NOT NULL,
  bandID INT NOT NULL,
  PRIMARY KEY (trainingID, bandID),
  FOREIGN KEY (trainingID) REFERENCES Training(trainingID),
  FOREIGN KEY (bandID) REFERENCES Band(bandID)
);

CREATE TABLE Family_Lead (
  leadID INT NOT NULL,
  familyID INT NOT NULL,
  subGroupName VARCHAR(30),
  PRIMARY KEY (leadID, familyID),
  FOREIGN KEY (leadID) REFERENCES TeamLead(leadID),
  FOREIGN KEY (familyID) REFERENCES JobFamily(familyID)
);

# USED FOR LOGIN
CREATE TABLE `Role`(
	RoleID TINYINT PRIMARY KEY NOT NULL,
    Name VARCHAR(64) NOT NULL
);

# USED FR LOGIN
CREATE TABLE `User`(
	Username VARCHAR(64) PRIMARY KEY NOT NULL,
    `Password` VARCHAR(64) NOT NULL,
    RoleID TINYINT NOT NULL, 
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
    );
    
#USED FOR LOGIN
CREATE TABLE Token(
	Username VARCHAR(64) NOT NULL,
    Token VARCHAR(64) NOT NULL,
    Expiry DATETIME NOT NULL,
    FOREIGN KEY (Username) REFERENCES User(Username)

);


INSERT INTO TeamLead
(`leadID`, `leadForename`, `leadSurname`, `leadMessage`)
VALUES 
('1','Liam','Johnson','Engineer message'),
('2','Emma','Smith','Eng and arch message'),
('3','Noah','Anderson','Wow I love testing'),
('4','Olivia','Brown','ii love platforms'),
('5','Lucas','Martinez','what'),
('6','Ava','Taylor','gaming time'),
('7','Jackson','White','I am very busy'),
('8','Sophia','Clark','security time'),
('9','Aiden','Turner','business security man'),
('10','Mia','Harris','strat time'),
('11','Mason','Miller','what is hcm'),
('12','Harper','Davis','woah!'),
('13','Ethan','Rodriguez','finance tim'),
('14','Amelia','Wilson','I love finance'),
('15','Logan','Garcia','data analysis'),
('16','Isabella','Thomas','american data is very fun'),
('17','Lucas','Jackson','I enjoy integrating something'),
('18','Ava','Adams','even my name is American'),
('19','Oliver','Thompson','we r slaying guys'),
('20','Sophia','Robinson','This is a unique message'),
('21','Jack','Lee','I love planning'),
('22','Ella','Walker','I too love planning'),
('23','Caleb','Baker','I manage something'),
('24','Lily','Wright','why do I have such a busy job'),
('25','Benjamin','Scott','I love consulting'),
('26','Grace','Nelson','I love to strategize and plan'),
('27','Samuel','Carter','management is my job'),
('28','Chloe','Mitchell','workday my beloved'),
('29','Daniel','Hayes','temporary message'),
('30','Zoe','Price','Operation strategy is so fun which is why it is my job'),
('31','Henry','Foster','Managing staff is my job'),
('32','Addison','Reed','More strategy and planning here guys'),
('33','Wyatt','Phillips','temporary message'),
('34','Scarlett','Turner','temporary message'),
('35','Elijah','Morgan','I am good at my job'),
('36','Sofia','Lewis','I too am good at my job'),
('37','Owen','King','Go team !'),
('38','Aria','Young','Marketing is so fun'),
('39','Grayson','Cooper','I too am in this episode'),
('40','Ava','Brooks','temporary message'),
('41','Noah','Foster','temporary message'),
('42','Harper','Hill','I love people and culture etc'),
('43','Carter','Bennett','temporary message'),
('44','Mia','Hall','temporary message'),
('45','Caleb','Reed','You are doing a great job team'),
('46','Emily','Foster','Yeah! Go team!'),
('47','Owen','Campbell','temporary message'),
('48','Scarlett','Simmons','temporary message'),
('49','Leo','Hughes','queen of all time');




INSERT INTO Capability (capabilityID, capabilityName)
VALUES 
    (1, 'Engineering'),
    (2, 'Platforms'),
    (3, 'Data and Artificial Intelligence'),
    (4, 'Cyber Security'),
    (5, 'Workday'),
    (6, 'Experience Design'),
    (7, 'Product'),
    (8, 'Delivery'),
    (9, 'Operations'),
    (10, 'Business Development and Marketing'),
    (11, 'Organisational Strategy and Planning'),
    (12, 'People'),
    (13, 'Commercial and Financial Management'),
    (14, 'Business Services Support');



INSERT INTO JobFamily (familyID, familyName, capabilityID)
VALUES
    (1, 'Engineering Strategy and Planning', 1),
    (2, 'Engineering', 1),
    (3, 'Architecture', 1),
    (4, 'Testing and Quality Assurance', 1),
    (5, 'Product Specialist', 1),
    (6, 'Low Code Engineering', 1),
    (7, 'Platform Strategy and Planning', 2),
    (8, 'Platform Engineering', 2),
    (9, 'Platform Architecture', 2),
    (10, 'Platform Specialists', 2),
    (11, 'Cloud Migration', 2),
    (12, 'Systems Support', 2),
    (13, 'Data Engineering', 3),
    (14, 'Data Architecture', 3),
    (15, 'Artificial Intelligence Engineering', 3),
    (16, 'Data Science', 3),
    (17, 'Data Consulting', 3),
    (18, 'Data Analytics', 3),
    (19, 'Security Strategy and Planning', 4),
    (20, 'Security Engineering', 4),
    (21, 'Corporate Security', 4),
    (22, 'Strategy and Planning', 5),
    (23, 'HCM', 5),
    (24, 'Financials', 5),
    (25, 'Data', 5),
    (26, 'Integrations', 5),
    (27, 'Change & User Adoption', 5),
    (28, 'Adaptive Planning', 5),
    (29, 'Product Services', 5),
    (30, 'Product Development', 5),
    (31, 'Extend', 5),
    (32, 'Spending Management', 5),
    (33, 'Insights', 6),
    (34, 'Content Design', 6),
    (35, 'UX/Visual Design', 6),
    (36, 'Service Design', 6),
    (37, 'Product Consultancy', 7),
    (38, 'Digital Advisory Consultancy', 7),
    (39, 'Low Code Consultancy', 7),
    (40, 'Delivery Strategy and Planning', 8),
    (41, 'Delivery Management', 8),
    (42, 'Engineering Management', 8),
    (43, 'Service Management', 8),
    (44, 'Workday Engagement Management', 8),
    (45, 'Project Management Office', 8),
    (46, 'Operations Strategy and Planning', 9),
    (47, 'Operational Management', 9),
    (48, 'Staff Management', 9),
    (49, 'Strategy and Planning', 10),
    (50, 'Business Development', 10),
    (51, 'Client Management', 10),
    (52, 'Partners', 10),
    (53, 'Bid Production', 10),
    (54, 'Inside Sales', 10),
    (55, 'Marketing - Business', 10),
    (56, 'Marketing - Martech', 10),
    (57, 'Organisational Strategy and Planning', 11),
    (58, 'People Strategy and Planning', 12),
    (59, 'People Operations / Strategic Partnering', 12),
    (60, 'Engagement, Culture and Development', 12),
    (61, 'Talent Acquisition', 12),
    (62, 'Commercial and Financial Management Strategy and Planning', 13),
    (63, 'Commercial', 13),
    (64, 'Financial Management', 13),
    (65, 'Payroll', 13),
    (66, 'Business Services', 14),
    (67, 'Property Management', 14),
    (68, 'Travel Management', 14),
    (69, 'Corporate Social Responsibility Management', 14);


INSERT INTO Family_Lead (familyID, leadID, subGroupName) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 2, NULL),
(4, 3, NULL),
(5, 2, NULL),
(6, 2, NULL),
(7, 1, NULL),
(8, 4, NULL),
(9, 4, NULL),
(10, 4, NULL),
(11, 5, NULL),
(12, 6, NULL),
(13, 7, NULL),
(14, 7, NULL),
(15, 7, NULL),
(16, 7, NULL),
(17, 7, NULL),
(18, 7, NULL),
(19, 1, NULL),
(20, 8, NULL),
(21, 9, NULL),
(22, 10, NULL),
(23, 11, 'EMEA'),
(23, 12, 'The Americas'),
(24, 14, 'EMEA'),
(24, 13, 'The Americas'),
(25, 15, 'EMEA'),
(25, 16, 'The Americas'),
(26, 17, 'EMEA'),
(26, 18, 'The Americas'),
(27, 19, 'EMEA'),
(27, 20, 'The Americas'),
(28, 21, 'EMEA'),
(28, 22, 'The Americas'),
(32, 23, 'EMEA'),
(33, 24, NULL),
(34, 24, NULL),
(35, 24, NULL),
(36, 24, NULL),
(37, 25, NULL),
(38, 25, NULL),
(39, 25, NULL),
(40, 26, NULL),
(41, 27, NULL),
(42, 27, NULL),
(43, 27, NULL),
(44, 28, 'EMEA'),
(44, 29, 'The Americas'),
(46, 30, NULL),
(47, 31, NULL),
(48, 31, NULL),
(49, 32, NULL),
(50, 33, NULL),
(50, 34, NULL),
(51, 33, NULL),
(51, 34, NULL),
(52, 35, NULL),
(53, 36, NULL),
(54, 37, NULL),
(55, 38, NULL),
(56, 38, NULL),
(58, 39, NULL),
(59, 40, 'People Operations'),
(59, 41, 'Strategic Partnering'),
(60, 42, NULL),
(61, 43, NULL),
(62, 44, NULL),
(63, 45, NULL),
(64, 46, NULL),
(65, 46, NULL),
(66, 47, NULL),
(67, 48, NULL),
(68, 47, NULL),
(69, 49, NULL);



INSERT INTO Band (bandID, bandName, bandLevel)
Values (100, 'Leadership','0'),
(101,'Principal','1'),
(102,'Manager','2'),
(103,'Consultant','3'),
(104,'Senior Associate','4'),
(105,'Associate','5'),
(106,'Trainee','6'),
(107,'Apprentice','7');

INSERT INTO Competency (competencyID, competencyName)
VALUES (1,'Personal Performance'),
(2,'Working with Others'),
(3,'Setting Direction, Development and Accountability'),
(4,'Supporting and Delivering the Strategy'),
(5,'Commerciality and Risk'),
(6,'Communication and Influence');

 
INSERT INTO `Competency_Band` (`competencyID`,`bandID`,`competencyDescription`) VALUES (1,100,'Uses sophisticated tools and sources to continuously learn about own leadership impact across the wider business community and improve personal effectiveness as a senior leader. Understands how pressures associated with carrying out a high-profile role impacts personally and own performance. \nRemains focused on the wider Kainos strategic goals when faced with competing and, at times, conflicting demands arising from differing priorities. Identifies where the need to personally get involved to ac'),
 (1,101,'Reflects on own interactions with a wide and diverse range of individuals and groups from within and beyond immediate service/organisation. Challenges and refreshes own values, beliefs, leadership styles and approaches. Overtly role models the giving and receiving of feedback. \nSuccessfully manages a range of personal and organisational demands and pressures. Demonstrates tenacity and resilience. Overcomes setbacks where goals cannot be achieved and quickly refocuses. Is visible and accessible t'),
 (1,102,'Reflects on how factors such as own values, prejudices and emotions influences own judgement, behaviour, and self-belief. Uses feedback from appraisals and other sources to consider personal impact and changes behaviour. Understands personal sources of stress and wellbeing. \nPlans and manages own time effectively and fulfils work requirements and commitments to a high standard, without compromising own health and wellbeing. Remains calm and focused under pressure.\nProactively manages self and ca'),
 (1,103,'Understands own personal preferences, biases and values different cultures, backgrounds and circumstances in decision making and takes actions. Champions Kainos wellbeing offerings and provides direction to the various wellbeing guides and support available for our people. \nConsistently sets own goals and manages this independently. Making autonomous decisions and are able to ‘get on with the job’ escalating decisions only when appropriate. \nIdentifies and addresses team or individual capability'),
 (1,104,'Understands and confidently articulates own learning and developmental needs and proactively seek opportunities to gain experience. Has a strong level of self-awareness and in tune with own wellbeing needs and intuitive of others. \nSeeks and responds positively to feedback regarding own learning and development. Approach with a willingness to take on tasks that are outside role scope. \nLooks for opportunities to take on new challenges while proactively supporting and encouraging others in identi'),
 (1,105,'Seeks out new challenges and opportunities that may stretch current abilities. Builds on own self- awareness of overall wellbeing.\nRecognises the need for SMART goals, and demonstrates a “can do” attitude, through having own internal standards of performance. Seeks out opportunities to improve skills beyond the role scope whilst also seeking regular feedback. \nEncourages positive behaviours in others, while role modelling the Kainos values.'),
 (1,106,'Understand others strengths and areas for development. Recognising diversity and its value within self and team. Proactively uses wellbeing tools to support self- regulation.\nAble to identify own goals and discusses these with People Manager. Understands the need to work conscientiously to achieve tasks on schedule.\nIdentifies learning gaps and seeks out opportunities to improve skills. Open to developmental feedback from others.\nDemonstrates positive behaviours when dealing with others and ensu'),
 (1,107,'Understands own strengths and areas of development. Self-aware of own wellbeing and seeks support where appropriate.\nWorks with People Manager to sets and achieve goals by monitoring progress regularly against performance. \nFlexible and willingness to learn on the job while proactively keeping up to date with the knowledge and skills needed.\nUnderstands the company values and applies this to own principles. Is open and honest and acts respectfully with others and customers.'),
 (2,100,'Removes barriers to preventing business improvement and innovation across Kainos. Drives innovation and diversity and enables inclusive environments while challenging and empowering others to lead.\nImproves company performance through engaging the company’s purpose both internally and externally. \nPromotes an inclusive culture that enables people to perform to their best, ensuring that appropriate performance management systems are in place and that performance data is systematically evaluated a'),
 (2,101,'Motivates and coaches’ individuals and teams to strengthen their performance and assist with developing their own capabilities and skills. Aligns individual development needs with service goals. \nIntegrates the contributions of a diverse range of stakeholders, being open and honest about the extent to which contributions can be based upon. Challenges others to provide stronger feedback and drive continuous improvement. \nEstablishes rigorous performance measures. Holds self, individuals, and team'),
 (2,102,'Supports others in delivering high quality services and excellence by supporting mobilising teams and contributing to business improvement. \nSeeks and acknowledges the views and inputs of others. Shows respect for the contributions and challenges of others through positive and constructive feedback.\nUses information and data about performance to identify improvements which will strengthen services. \nIdentifies where working and cooperating with others can result in better services. Endeavours to'),
 (2,103,'Support and empower team members through a range of activities to include coaching and mentoring. Demonstrate that leadership and technical skills are equally valued.\nRole model continuous learning and self- development, evaluating own effectiveness and\ngrowth. Motivate others to achieve through challenging times. Regularly monitor and discuss own and team’s performance expectations defined within the performance management system.\nBuilds a strong network of collaborative relationships, in order'),
 (2,104,'Proactively supports the development of other team members while identifying opportunities to increase innovation to achieve team’s objectives.\nEncourages both formal and informal learning opportunities, ensuring others take responsibility for own learning and share this to increase organisational capability. Support and stretches self and others to deliver agreed goals and objectives.\nEffectively builds wider networks across projects, Capabilities and BUs and constructively challenges colleague'),
 (2,105,'Actively take opportunities to learn from a diverse range of people, to maximise performance and mentor/coach more junior colleagues.\nIs creative in finding ways to learn and personally improve results, suggesting new approaches to benefit self and the team. Review progress against goals making necessary adjustments to deliver successfully.\nConsistently collaborates within immediate teams and finds opportunities to build rapport and trust while supporting others.\nProactively contribute to the wo'),
 (2,106,'Shares learning with the team and other colleagues, contributing to the team’s understanding.\nMaintains consistent performance, challenging self and others to be positive and focused on\nachieving results, despite setbacks. Support others to work in a way that is mutually supportive.\nBuilds strong working relationships within team and project teams and start to consider building a wider network.\nAware of the consequences of own behaviour and how this may affect others within the team. Supports th'),
 (2,107,'Understand how to respond constructively to developmental feedback from a diverse range of people and implement changes as a result.\nDisplays high levels of enthusiasm, energy and pace to achieve performance and results.\nRecognises the need to build internal networks within immediate teams and projects.\nRespects others by attending meetings on time and contributing where appropriate. Recognising how current role relates to others within Capability and project.'),
 (3,100,'Develops an in-depth insight into the dynamics and issues surrounding Kainos including political, economic, social, environmental, technological, and legal impacts. Fully understands the impact of change on organisation culture and proactively seeks feedback and ideas from employees and stakeholders while also empowering leaders. \nCreates an environment that fosters knowledge sharing and innovation, demonstrating the courage to take risks to enable significant improvements and empowering others '),
 (3,101,'Actively seeks to learn about internal and external factors which will impact on the business. Interprets the meaning of these for Kainos and incorporates these into business plans and actions. \nUnderstands the complex interdependencies across a range of services. Applies knowledge to set future direction. Challenges colleagues’ thinking to find better and more effective ways of delivering services and quality. Accesses creativity and innovation from relevant individuals and groups. \nRemains acc'),
 (3,102,'Understands the range of factors which determine why changes are made and supports Kainos senior leaders to deliver key messages.\nGathers data and information about aspects of the business, analyses evidence and uses this knowledge to suggest changes that will improve services in the future. Questions established practices which do not add value. Puts forward creative suggestions to improve the quality of service provided. \nConsults with others and contributes to decisions including the future d'),
 (3,103,'Develops effective systems to organise and track workload while, motivating and encouraging others to achieve planned results, delegating work to use people and resources to best effect. Ensuring colleagues are aware of any changing priorities and monitor progress.\nDelegates authority to match responsibilities and holds staff accountable for agreed-upon commitments. Within immediate teams creates accountability by using experience and advice to guide others.\nSets an example of leading internal a'),
 (3,104,'A strong ability to multitask and prioritise to deadlines, overcoming obstacles to ensure the work is completed within time.\nResearching and communicating in advance any barriers that may affect projects.\nDemonstrates individual responsibility for achieving objectives and able to articulate success, failures and proposing remedial actions.\nConsistently prepared for meetings and effectively manages own diary for preparation and an agenda is set in advance. Actively seeks input from colleagues and'),
 (3,105,'Recognises how much time is required for different tasks and start to prioritise and communicate effectively within teams. Seeking appropriate support while supporting peers and junior team members.\nIdentifies commitments and proactively seeks responsibility in delivering towards the wider team and project objectives.\nEstablishes effective meetings through setting an agenda and coming prepared and speaking on projects calls where appropriate. Follows up and delivers upon actions from meetings.\nM'),
 (3,106,'Plans time effectively to ensure deadlines are met, and seen to be honest, escalating in advance any issues with completing tasks within the specified time.\nTakes ownership of all responsibilities within own role and honours commitments to others and to Kainos.\nEffectively manages diary, coming prepared for meetings and actively listen.\nBreaks down issues, and actively seeks further information and understanding.\n'),
 (3,107,'Understands role, tasks and deadlines and work towards these, escalating any issues where appropriate to People/Project Manager.\nAccepts personal responsibility for quality and timelines of work set.\nWorks to manage diary, commitments and ready to attend meetings on time.\nActively supports new initiatives and tries different ways of doing things, learning from others’ experiences.\n'),
 (4,100,'Sets, maintains, and ensures a clear direction for Kainos with highly focused priorities and results by articulating short, medium- and long- term strategies focused on adding real value to Kainos and our customers. \nCreates joined up strategies and plans which help put into practice and support Kainos vision and long-term direction which are challenging yet achievable. Based upon external economic, social, technology and environmental trends. \nEnables the whole company to remain focused on busi'),
 (4,101,'Encourages and demonstrates creative, lateral, critical and systems- based thinking when framing the strategy. \nEngages with key individuals and groups to formulate strategic plans that aligns with the wider Kainos objectives. Identify organisational change requirements and ensure they are understood for organisational readiness decisions. \nEnsures that the strategic plans are translated into workable operational plans, identifying risks, critical success factors and evaluation methods. Champion'),
 (4,102,'Strategic awareness including an understanding and knowledge of how role and those within in immediate team fit with and support delivery of the organisational objectives. \nFeeds in ideas and knowledge from immediate teams and supports the senior leaders in developing a strategy. \nSupport, develop and implement the strategy in immediate teams. \nPassionately advocates the strategy and vision and translates this into action and opportunities within immediate teams. Understands the need for OKR’s/K'),
 (4,103,'Balances own teams needs with wider organisational needs while translating the Vision and Strategy into practical and tangible goals.\nEffectively ensures immediate teams understand how their work contributes to and delivers organisational priorities.\nConsistently role models cultural effectiveness in the demonstration of ethical behaviours while understanding the value diversity brings to Kainos.\nPromoting diversity and inclusion within teams while adapting to the needs of our diverse people.\n'),
 (4,104,'Supports peers and team members in understanding the wider Kainos objectives and how we all have a role in Kainos’ success.\nRecognises and reflects on how personal actions may have a wider impact on other people and teams.\nDemonstrates awareness and appreciation for the global multi-dimensional and diverse perspectives of our people. Provide a protective environment within immediate teams in which colleagues can escalate any issues while demonstrating impartial application of Kainos\npolicies, pr'),
 (4,105,'Articulates individual contribution to the wider Kainos objectives and uses evidence by including SMART goals that align to the Capability/BU.\nClearly defines how individual personal performance can have an impact on the business achieving the vision and objectives.\nRespects differences and promotes inclusion on a transactional level. Displays appropriate ethical behaviours and acknowledges own unconscious bias.\n'),
 (4,106,'Recognises how to contribute to the wider organisational objectives and strategic principles.\nPays attention to organisational information, how well we are doing and\nwhat is changing.\nAwareness of cultural differences and willingness to develop and grow understanding of global and cultural effectiveness.\n'),
 (4,107,'Understands the Kainos Vision, Strategy and Principles.\nUnderstands the organisation structure and the purpose of Kainos.\nPossess general knowledge of local cultural differences and familiar with the Kainos policy towards Diversity and Inclusion.\n'),
 (5,100,'Role models leadership, influencing and accountability in relation to commerciality and risks to create and deliver the corporate plan. Creates and embeds a culture of commercial awareness and solid business acumen, ensuring that all employees understand the commercial environment in which we operate and can pro- actively play a part in delivering change, efficiency and growth. \nRole model for others to follow. Inspires staff across the whole organisation to contribute to BD and celebrate its su'),
 (5,101,'Recognises commercial opportunities and where necessary seeks support in converting those opportunities into income. Leads on the awareness to protect margin through various means by setting the tone within own teams and BU. Encouraging others to challenge profit, spend and process. Creates value add propositions to support growth and negotiates fair deals for customers and services both internal and external. \nTakes ownership and responsibility of creating and executing a strategy to develop ne'),
 (5,102,'Aware of the importance of effective commercial behaviours and the needs of the business. Identifies and ensures that personal objectives are focussed on innovative solutions to achieve commercial outcomes and objectives as well as contributing to our growth ambitions. Recognises when products or services are not being delivered to the required level of quality or standard and takes appropriate action. \nContributes to development of new business through involvement in BD process, for example, bi'),
 (5,103,'Identifies potential new opportunities for Kainos to generate income and proactively takes action to progress. Understanding the commercial implications of changes in scope and negotiate with customers proactively. Able to look beyond the immediate problems/issues to see the impact on the bigger picture.\nUses financial information to find pragmatic new ways of saving cost/effort without reducing output. Review procedures or systems with immediate teams to identify improvements and simplify proce'),
 (5,104,'Demonstrates a clear understanding of how the business makes profit and how individual role effects profitability of the company.\nRespectfully challenges commercial decisions to contribute an increased profitability.\nManages and meets the expectations of customers without compromising budgets. Supports change in a constructive manner to help colleagues and stakeholders understand changes and why they have been introduced.\nUnderstands the organisational structure of Kainos, reporting lines and ca'),
 (5,105,'Comprehends the need for the business to generate additional income and respects that costs need to be managed. Recognises the contribution that role makes to the success of the business, consistently delivering to task deadlines.\nAcknowledges what is required to manage costs within the business. Considers and suggests ideas for improvements, sharing this feedback with others in a constructive manner.\nConstantly achieves personal productive utilisation targets. Appreciating how the team/project '),
 (5,106,'Understands how the business generates income. Supporting the business by assisting in activities such as\nRecruitment events, Career fairs and Work experience mentoring. Keeps up to date with current trends relating to work.\nReviews current practices and constructive in implementing changes to own work.\nConsistently cooperates with business processes completing accurately and honestly e.g.,\ntimesheets/EOY Review and travel requests.\n'),
 (5,107,'Understands the markets and sectors in which Kainos operates while acknowledging how role links in and has an impact on other teams and the business.\nWiling to learn, and embrace new ideas, to improve processes and\nprocedures.\nCooperates with business processes completing accurately and honestly e.g., timesheets/EOY Review and travel requests.\n'),
 (6,100,'Actively engages key stakeholders in creating a bold, innovative, shared vision which reflects the future needs and aspirations of the whole company and the future direction of Kainos. Thinks broadly and aligns the vision to the Kainos values and communicates gaining buy in. \nTakes action to shape and implement a vision for the future of Kainos and our customers while sharing leadership and empowering others to contribute and collaborate. \nEmpowers senior leaders within Kainos to drive change an'),
 (6,101,'Engages people across the business in the vision and strategy and demonstrates a high degree of emotional intelligence and transitioning between influencing style to suit the audience. \nCommunicates the vision and rationale for change and modernisation through engaging and facilitating others to work collaboratively to achieve real change. \nEnergises others to drive change that will improve Kainos by actively managing the change process, drawing on models of effective change management. Recognis'),
 (6,102,'Provides feedback and support in communicating the vision, and advocates within immediate teams. \nCredible communication, displaying authenticity and adapting influencing style for different audiences. \nArticulates the need for changes to processes and systems, acknowledging the impact on people and services. \nApplies and adapts various approaches to stakeholder management through influencing and negotiating to maximise business for Kainos by developing and maintaining internal and external netw'),
 (6,103,'Uses communication to create a shared sense of purpose and direction.\nAdapting own style to effectively communicate and able to demonstrate this when difficult conversations have a positive outcome.\nActs as an influential and effective member of multi- disciplinary teams or projects. Initiate’s collaboration and actively encourages people to cooperate in initiatives where they can add value.\nAssesses customer needs accurately by listening and applying sensitive questioning. Managing customer exp'),
 (6,104,'Recognises and respect that communication is a two-way process and demonstrate effective questioning and active listening skills to achieve this.\nConfidently handles challenging conversations and is clear and constructive in response.\nPersuades and influences with sound rationale argument ‘appealing to others’ interest or reason to gain support.\nAuthentic in stakeholder relationships and take pride in being inclusive and trustworthy while keeping promises made with customers. Responds honestly a'),
 (6,105,'Involved at meetings, asking questions, listening and develops and presents a well-reasoned point of view.\nRemaining communicative and clear in own thoughts and ideas when approached by others,\ngiving consideration to the communication needs of other staff and customers.\nDemonstrates influencing skills internally and able to communicate points clearly and open to feedback from others.\nDemonstrates how to participate in stakeholder management, escalates effectively, and strives to provide a quali'),
 (6,106,'Communicates own views in a clear and constructive manner, while listening to different views and considers all employees from various backgrounds.\nObserves team/colleagues influencing internally and externally and understands the benefits of adapting personal style to shape, motivate and influence effectively.\nUnderstands who our customers are and what problems the team is trying to solve.\n'),
 (6,107,'Acts in a respectful manner in all forms of communication while being open and honest. Displays a positive approach when interacting with others.\nRecognises influencing as a key skill required to work effectively with internal and external customers.\nActs in accordance with the Kainos values demonstrating through own behaviours and interactions with colleagues and customers.\n');

INSERT INTO Training (trainingID, trainingName, trainingLink, trainingType)
VALUES (001, 'Discovering your Personal Brand','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Personal-Branding.aspx','All Staff'),
(002,'PowerPoint101','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/PowerPoint101.aspx','All Staff'),
(003,'Train the Trainer','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Train-the-Trainer.aspx','All Staff'),
(004,'Excel','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Excel101.aspx','All Staff'),
(005,'Design Thinking','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Design-Thinking.aspx','All Staff'),
(006,'Communication Skills','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Communication-Skills.aspx','Foundation'),
(007,'Effective Time Management','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Effective-Time-Management.aspx','Foundation'),
(008,'Effective Meetings','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Effective-Meetings.aspx','Foundation'),
(009,'Developing your Presentation Skills','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Presentation-Skills.aspx','Foundation'),
(010,'Customer Service','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Customer-Service.aspx','Foundation'),
(011,'Wellbeing Conversations','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Wellbeing-Conversations.aspx','Core/Advanced'),
(012,'Interviewer Skills','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Interviewer-Skills.aspx','Core/Advanced'),
(013,'Stakeholder Management','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Stakeholder-Management.aspx','Core/Advanced'),
(014,'Negotion and Influence','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Negotiation-%26-Influence.aspx','Core/Advanced'),
(015,'Courageous (Internal) Conversations','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Having-Courageous-Conversations.aspx','Core/Advanced'),
(016,'Effective Manager','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Effective-Manager.aspx','Core/Advanced'),
(017,'Coaching - To make a Differnce','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Coaching-–-To-help-make-a-Difference.aspx','Core/Advanced'),
(018,'Managing Change','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Managing-Change.aspx','Core/Advanced'),
(019,'Decision-Making','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Decision-Making.aspx','Core/Advanced'),
(020,'Recognising Success','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Recognising-Success.aspx','Core/Advanced'),
(021,'Leading Virtually','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Leading-Virtually.aspx','Core/Advanced'),
(022,'Leading Change','https://kainossoftwareltd.sharepoint.com/L%26D/SitePages/Leading-Change.aspx','Core/Advanced'),
(023,'Steps for Success','https://kainos.talentlms.com/learner/courseinfo/id:284','eLearning'),
(024,'Hybrid Working - A Guide to Working Remotely','https://kainos.talentlms.com/learner/courseinfo/id:275','eLearning'),
(025,'A Guide to Mentoring','https://kainos.talentlms.com/learner/courseinfo/id:285','eLearning'),
(026,'Life as a PLC','https://kainos.talentlms.com/learner/courseinfo/id:270','eLearning'),
(027,'Coaching Lessons','https://kainos.talentlms.com/learner/courseinfo/id:233','eLearning'),
(028,'Mindset Modules','https://kainos.talentlms.com/learner/courseinfo/id:240','eLearning'),
(029,'Wellbeing Guides','https://kainos.talentlms.com/learner/courseinfo/id:271','eLearning'),
(030,'Mental Health','https://kainos.talentlms.com/learner/courseinfo/id:283','eLearning'),
(031,'Menapause Awareness','https://kainos.talentlms.com/learner/courseinfo/id:290','eLearning'),
(032,'Sleep Well','https://kainos.talentlms.com/learner/courseinfo/id:289','eLearning'),
(033,'Xpression - Becoming an Ally','https://kainos.talentlms.com/learner/courseinfo/id:276','eLearning'),
(034,'Inclusion, Diversity, Equality & Equity','https://kainos.talentlms.com/learner/courseinfo/id:256','eLearning');

INSERT INTO Training_Band (trainingID, bandID)
VALUES 
(1,107),(1,106),(1,105),(1,104),(1,103),(1,102),(1,101),(1,100),
(2,107),(2,106),(2,105),(2,104),(2,103),(2,102),(2,101),(2,100),
(3,107),(3,106),(3,105),(3,104),(3,103),(3,102),(3,101),(3,100),
(4,107),(4,106),(4,105),(4,104),(4,103),(4,102),(4,101),(4,100),
(5,107),(5,106),(5,105),(5,104),(5,103),(5,102),(5,101),(5,100),
(6,107),(6,106),(6,105),
(7,107),(7,106),(7,105),
(8,107),(8,106),(8,105),
(9,107),(9,106),(9,105),
(10,107),(10,106),(10,105),
(11,102),(11,101),(11,100),
(12,104),(12,103),(12,102),(12,101),
(13,104),(13,103),(13,102),(13,101),(13,100),
(14,104),(14,103),(14,102),(14,101),(14,100),
(15,104),(15,103),(15,102),(15,101),(15,100),
(16,102),
(17,102),
(18,104),(18,103),(18,102),(18,101),(18,100),
(19,104),(19,103),(19,102),(19,101),(19,100),
(20,104),(20,103),(20,102),(20,101),(20,100),
(21,103),(21,102),(21,101),(21,100),
(22,101),(22,100);



INSERT INTO JobRole (roleID, roleName, bandID, familyID, specSummary, sharepointLink)
VALUES
(3001,'Software Engineer',107,2,'This is an excellent opportunity to combine real work and technical experience within our fast-changing company, with the formal studies that you need to progress your career in IT. It’s a no brainer! We’ll pay all of your University fees, provide you with a brand-
new laptop as well as a full-time salary throughout. Oh, and it doesn’t end there. You will be offered a permanent position with us from day one, and we’ll help you to quickly progress up our ranks with our excellent (and award-winning!) in-house
training programme Kainos MAP. It’s a great way to compliment your studies.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Apprentice%20Software%20Engineer%20%28Apprentice%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3002,'Software Engineer',106,2,'As a Trainee Software Engineer with Kainos, you will work on projects where you can make a real difference to people’s lives – the lives of people you know.
 After taking part in our award-winning, seven-week Engineering Academy, you will then join one of our many project teams, to learn from our experienced developers, project managers and customer-facing staff. 
 You’ll have great support and mentoring, balanced with the experience of being given real, meaningful work to do, to help you truly develop both technically and professionally.',
 'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Apprentice%20Software%20Engineer%20%28Apprentice%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3003,'Test Engineer',106,4,'As a Test Engineer (Trainee) in Kainos, you’ll work within a multi-skilled agile team, developing and executing functional automated and manual tests to help the team deliver working application software that meets user needs. 
You’ll do this whilst learning about new technologies and approaches, with talented colleagues who will help you learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20Trainee%20Test%20Engineer%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering'
),
(3004,'Software Engineer',105,2,'As a Software Engineer (Associate) in Kainos, you’ll be responsible for developing high quality solutions which delight our customers and impact the lives of users worldwide. 
You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Software%20Engineer%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3005,'Front-end Engineer',105,2,'As a Front-end Engineer in Kainos, you will have the opportunity to use your expertise in developing high quality user interface solutions which delight our customers and impact the lives of users worldwide.
The projects you will join are varied, and often highly visible. You will be working in fast- paced, agile environments, so it is important for you to make sound, reasoned decisions, and recommendations on front-end and user interfaces with your colleagues.
You are determined, flexible and always constructive; proactive in improving things and are always inclusive and respectful in your interactions with your team. You will be working alongside talented, diverse, enthusiastic colleagues, who will help you learn and develop as you, in turn, mentor those around you.',
'https://kainossoftwareltd.sharepoint.com/sites/PeopleTeam-SharedDrive/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FEngineering%2FEngineering%2FJob%20Profile%20%2D%20Front%2DEnd%20Engineer%20%28A%29%2Epdf&parent=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FEngineering%2FEngineering&p=true&ga=1'
),
(3006,'Support Technician',105,2,'As a Support Technician (Associate) in Kainos, you’ll be responsible for analysing and solving complicated technical issues. You will adhere to ITIL standards and will participate fully in the Incident management lifecycle. 
You will work closely with clients, internal teams and 3rd Party vendors to ensure that problems are resolved.
You’ll do this whilst learning about new approaches, with talented colleagues that will help you to learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Support%20Technician%20%28As%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering'
),
(3007,'Test Engineer',105,4,'As a Test Engineer (Associate) in Kainos, you’ll work within a multi-skilled agile team, developing and executing functional automated and manual tests to help the team deliver working application software that meets user needs.
You’ll do this whilst learning about new technologies and approaches, with talented colleagues who will help you learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%20Test%20Engineer%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering'
),
(3008,'Product Specialist',105,5,'As a Product Specialist at Kainos you will be responsible for delivering high quality solutions which delight our customers and impact the lives of users worldwide. It’s a fast paced environment so it is important for you to make sound, reasoned decisions. 
You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow.
You’ll be responsible for capturing and mapping customer needs to product capabilities,
supporting clients throughout their implementation lifecycle and business processes changes as well as providing information to relevant engineering teams on improvements or fixes required in the products.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Product%20Specialist%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3009,'Low Code Engineer',105,6,'As a Low Code Engineer in Kainos, you’ll be responsible for developing high quality solutions which delight our customers and impact the lives of users worldwide. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow.
You will be responsible for articulating problems and processes in ways understood by all stakeholders - both business and technical, and for facilitating the analysis and design of cost-effective software solutions.
You should actively participate and co-operate within the team, giving consideration to the communication needs of team members and clients. You get involved at meetings with clients, ask questions, listen and give honest information when appropriate. You’re flexible and overcome obstacles to get the job done to achieve personal, team, and business goals.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20specification%20%2D%20Low%20Code%20Engineer%20%28A%29%20%2D%20Low%20Code%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering'
),
(3010,'Senior Software Engineer',104,2,'As a Senior Software Engineer (Senior Associate) in Kainos, you’ll be responsible for developing high quality solutions which delight our customers and impact the lives of users worldwide. 
It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow as you, in turn, mentor those around you.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Senior%20Software%20Engieneer%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3011,'Senior Front-end Engineer',104,2,'As a Senior Front-end Engineer in Kainos, you will have the opportunity to use your expertise in developing high quality user interface solutions which delight our customers and impact the lives of users worldwide.
The projects you will join are varied, and often highly visible. You will be working in fast- paced, agile environments, so it is important for you to make sound, reasoned decisions, and recommendations on front-end and user interfaces with your colleagues. You’ll often be the subject matter expert for user interface construction and front-end/client-side development.
You are determined, flexible and always constructive; proactive in improving things and are always inclusive and respectful in your interactions with your team. You will be working alongside talented, diverse, enthusiastic colleagues, who will help you learn and develop as you, in turn, mentor those around you.',
'https://kainossoftwareltd.sharepoint.com/sites/PeopleTeam-SharedDrive/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FEngineering%2FEngineering%2FJob%20Profile%20%2D%20Senior%20Front%2DEnd%20Engineer%20%28SA%29%2Epdf&parent=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FEngineering%2FEngineering&p=true&ga=1'
),
(3012,'Senior Support Technician',104,2,'As a Senior Support Technician (Senior Associate) in Kainos, you’ll be responsible for analysing and solving complicated technical issues within the Jira, CRM and ServiceNow applications. You will adhere to ITIL standards and will participate fully in the Incident management lifecycle. 
You will work closely with clients, internal teams and 3rd Party vendors to ensure that problems are resolved. 
You’ll do this whilst learning about new approaches, with talented colleagues that will help you to learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Senior%20Support%20Technician%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering'
),
(3013,'Senior Test Engineer',104,4,'As a Senior Test Engineer (Senior Associate) in Kainos, you’ll work within a multi-skilled agile team, developing and executing functional automated and manual tests to help the team deliver working application software that meets user needs. 
You’ll do this whilst learning about new technologies and approaches, with talented colleagues who will help you learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Senior%20Test%20Engineer%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering'
),
(3014,'Senior NFT Engineer',104,4,'As a Senior NFT Engineer (Senior Associate) in Kainos, you’ll work within a multi-skilled agile team, developing and executing Non-Functional tests. You’ll do this whilst learning about new technologies and approaches, with talented colleagues who will help you learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Senior%20NFT%20Engineer%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3015,'Senior Product Specialist',104,5,'As a Senior Product Specialist at Kainos you will be responsible for delivering high quality solutions which delight our customers and impact the lives of users worldwide. It’s a fast- paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow as you, in turn, mentor those around you.
You’ll be responsible for capturing and mapping customer needs to product capabilities, supporting clients throughout their implementation lifecycle and business processes changes as well as providing information to relevant engineering teams on improvements of fixes required in the products.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Senior%20Product%20Specialist%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3016,'Low Coode Engineer',104,6,'As a Low Code Engineer (Senior Associate) in Kainos, you’ll be responsible for developing high quality Low Code solutions which delight our customers and impact the lives of users worldwide. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow as you, in turn, mentor those around you.
You will be responsible for articulating problems and processes in ways understood by all stakeholders - both business and technical, and for facilitating the analysis and design of cost-effective Low Code solutions.
You should actively participate and co-operate within the team, giving consideration to the communication needs of team members and clients. You will facilitate meetings with clients, asking questions, listening and giving honest information.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Low%20Code%20Engineer%20%28SA%29%20%2D%20Low%20Code%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering'
),
(3017,'Innovation Lead',103,1,'As an Innovation Lead (Consultant) in Kainos, you’ll be responsible for leading efforts in providing advice and identifying new ways to use technology to solve customer problems. This is a dynamic and hands-on role which will involve leading the team, implementing and shaping Kainos’ innovation strategy and effectively communicating the exciting work we undertake both internally and within the wider technology community.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Innovation%20Lead%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3018,'Lead Software Engineer',103,2,'As a Lead Software Engineer (Consultant) in Kainos, you’ll be responsible for leading teams and developing high quality solutions which delight our customers and impact the lives of users worldwide. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow. You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together. As the technical leader in the team, you will also interact with customers, share knowledge and mentor those around you.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Lead%20Software%20Engineer%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3019,'Lead Managed Services Engineer',103,2,'As a Lead Managed Services Engineer (Consultant) in Kainos, you’ll be responsible for leading teams, contributing to pre-sales responses, providing high quality support and continuous improvement solutions for existing Live services, which delight our customers and impact the lives of users worldwide. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst working with a wide range of technologies and approaches, with talented colleagues that will help you to learn, develop and grow. You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You will help shape the Managed Services technical landscape and ensure a consistent level of quality across all Managed Services projects.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Lead%20Managed%20Services%20Engineer%20%28C%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3020,'Technical Architect',103,3,'As a Technical Architect (Consultant) in Kainos, you’ll be responsible for leading teams and developing high quality solutions which delight our customers and impact the lives of users worldwide. As a technical leader on a project, you’ll work with customer architects to agree technical designs, advising on estimated effort and technical implications of user stories and user journeys. You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with room to learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Technical%20Architect%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3021,'Lead Test Engineer',103,4,'As a Lead Test Engineer (Consultant) in Kainos, you’ll be a technical leader and innovator in software testing, providing strong test leadership and direction within a multi-skilled agile team. Taking responsibility for the strategy, design and development of automated, manual, and non-functional tests, you’ll help the team to deliver working application software that meets user needs and is of sufficient quality for promotion to users. It’s a fast- paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues who will help you learn, develop and grow.
You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.
As a technical leader in the team, you will also interact with customers, share knowledge and mentor those around you.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Lead%20Test%20Engineer%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering'
),
(3022,'Lead NFT Engineer',103,4,'As a Lead NFT Engineer (Consultant) in Kainos, you’ll be a technical leader and innovator in Non-Functional Testing, providing strong test leadership and direction within a multi- skilled agile team. Taking responsibility for the strategy, design and development of non- functional requirements & tests, you’ll help the team to deliver working application software that is scalable and performant for the users. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues who will help you learn, develop and grow.
You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.
As a technical leader in the team, you will also interact with customers, share knowledge and mentor those around you.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Lead%20NFT%20Engineer%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3023,'Test Manager',103,4,'As a Test Manager in Kainos, you’ll be responsible for ensuring we deliver high quality solutions which delight our customers and impact the lives of users worldwide.
As an experienced test practitioner, you’ll lead our clients and the wider market on better testing and quality, whilst working with client stakeholders to agree a strategy for testing that addresses the needs of fast-changing digital services.
You’ll do this whilst advising Kainos about new tools and approaches, working with your peers to develop policy and standards, share knowledge and mentor those around you, with room to learn, develop and grow. You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development.
As a Testing & QA leader in the team, you will also interact with customers,
share knowledge and mentor those around you. You’ll also provide direction and leadership for your team as you solve challenging problems together.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Test%20Manager%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3024,'Lead Product Specialist',103,5,'As a Lead Product Specialist at Kainos you will be responsible for leading teams and delivering high quality solutions which delight our customers and impact the lives of users worldwide. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow as you, in turn, mentor those around you.
You’ll be responsible for capturing and mapping customer needs to product capabilities, supporting clients throughout their implementation lifecycle and business processes changes as well as providing information to relevant engineering teams on improvements of fixes required in the products.
You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together. As the technical leader in the team, you will also interact with customers, share knowledge and mentor those around you.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Lead%20Product%20Specialist%20%28C%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3025,'Dynamics 365 / Power Platform Solution Architect',102,3,'As a Dynamics 365/Power Platform Solution Architect at Kainos you will lead the architecture on product-based projects, analyse the gap between product offering and customer needs, design technical solutions with the right blend of configuration, customisation, integration and bespoke development needed to deliver a working end to end system.
You’ll lead multi-skilled agile teams to combine configuration and custom development to deliver high quality solutions. You’ll work with customer architects to agree functional and non-functional designs, advising customers and managers on the estimated effort, technical implications and complexity.
You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.
As a technical leader, you will work with your peers to develop policy and standards, share knowledge and mentor those around you. You’ll do this whilst advising about new technologies, approaches and innovations in your area of specialism, with room to learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Dynamics%20365%20PP%20Solution%20Architect%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3026,'Solution Architect',102,3,'As a Solution Architect (Manager) in Kainos, you’ll be responsible for leading multi-skilled agile teams to design and deliver high quality solutions which delight our customers and impact the lives of users worldwide. You’ll work with customer architects to agree functional and non-functional designs, advising customers and managers on the estimated effort, technical implications and complexity surrounding your designs.
You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.
As a technical leader, you will work with your peers to develop policy and standards, share knowledge and mentor those around you. You’ll do this whilst advising about new technologies and approaches, with room to learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Solution%20Architect%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3027,'Test Architect',102,4,'As a Test Architect (Manager) in Kainos, you’ll be responsible for ensuring we deliver high quality solutions which delight our customers and impact the lives of users worldwide.
As an experienced test practitioner, you’ll lead our clients and the wider market on better testing and quality, whilst working with client stakeholders to agree a strategy for testing that addresses the needs of fast-changing digital services.
You’ll do this whilst advising Kainos about new tools and approaches, working with your peers to develop policy and standards, share knowledge and mentor those around you, with room to learn, develop and grow. You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development.
As a technical leader in the team, you will also interact with customers,
share knowledge and mentor those around you. You’ll also provide direction and leadership for your team as you solve challenging problems together.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FTesting%2FJob%20profile%20%2D%20Test%20Architect%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FTesting&p=true&ga=1'
),
(3028,'Intelligent Automation Solution Architect',102,5,'As an Intelligent Automation Solution Architect (Manager) in Kainos, you will lead multi- skilled delivery teams to design and deliver high quality Intelligent Automation solutions which delight our customers and impact the lives of users worldwide.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Intelligent%20Automation%20Solution%20Architect%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering'
),
(3029,'Principal Architect',101,3,'As a Principal Architect (Principal) in Kainos, you’ll be accountable for successful delivery of large-scale high-quality solutions which delight our customers and impact the lives of users worldwide.
You will provide assurance and support to multi-skilled agile teams by understanding the outcomes the solution is trying to achieve, the technical implications and complexity surrounding you and your teams designs and helping teams make the right decisions.
You’ll work with senior stakeholders to agree architectural principles, strategic direction and functional and non-functional designs. You`ll manage other architects and engineers in the capability to help them navigate their careers.
As a technical leader, you will work with your colleagues to lead development of policy and standards, develop customer relationships, develop account strategies and share knowledge and mentor those around you. You’ll do this whilst advising about new technologies and approaches, with room to learn, develop and grow.
You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Principal%20Architect%20%28Principal%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
),
(3030,'Principal Test Architect',101,4,'As a Principal Test Architect (Principal) in Kainos, you’ll be responsible for ensuring we deliver high quality solutions which delight our customers and impact the lives of users worldwide.
As an experienced test practitioner, you’ll lead our clients and the wider market on better testing and quality, whilst working with client stakeholders to agree a strategy for testing that addresses the needs of fast-changing digital services.
You’ll do this whilst advising Kainos about new tools and approaches, working with your
peers to develop policy and standards, share knowledge and mentor those around you, with room to learn, develop and grow. You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development.
As a technical leader in the team, you will also interact with customers,
share knowledge and mentor those around you. You’ll also provide direction and leadership for your team and capability as you solve challenging problems together and make improvements to encourage motivation and confidence.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20profile%20%2D%20Principal%20Test%20Architect%20%28P%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering'
),
(3031,'Low Code Principal Architect',101,6,'As a Low Code Principal Architect (Principal) in Kainos, you’ll be accountable for successful delivery of large-scale high-quality Low Code solutions which delight our customers and impact the lives of users worldwide.
You will provide assurance and support to multi -skilled delivery teams by understanding the outcomes the solution is trying to achieve, the technical implications and complexity surrounding you and your teams designs and helping teams make the right decisions.
You’ll work with senior stakeholders to agree architectural principles, strategic direction and functional and non-functional designs. You`ll manage other architects and engineers in the Low Code practice to help them navigate their careers.
You will work with your colleagues to lead development of policy and standards, develop customer relationships, develop account strategies and share knowledge and mentor those around you. You’ll do this whilst advising about new technologies and approaches, with room to learn, develop and grow.
You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction for your team as you solve problems together.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Low%20Code%20Principal%20Architect%20%28P%29%20%2D%20Low%20Code%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering'
),
(3032,'Technology Leader',100,1,'A technology leader is key strategic role within the business making executive technology decisions on behalf of the business, based upon the sector and practices’ strategic direction and goals.
The core responsibilities of a technology leader in Kainos include setting a Technology direction, a technical advisor to the business and C-level clients, maintaining a commercial edge over other technology services providers, developing and nurturing technical talent across the organisation and representing Kainos as a technology evangelist.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FEngineering%2FJob%20Profile%20%2D%20Technology%20Leader%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FEngineering&p=true&ga=1'
);

#Data and artifical Intelligence Capability, RoleID-5000
INSERT INTO JobRole (roleID, roleName, bandID, familyID, specSummary, sharepointLink)
VALUES
(5012,'Senior Data Analyst',104,18,'As a Senior Data Analyst (Senior Associate) at Kainos, you’ll be responsible for matching the needs of data insight with understanding of the available data. Data analysts work closely with customers to produce insight products including reports, dashboards and visualisations but also contribute to project understanding of existing data structures so that inputs and outputs are fully understood. It therefore has a strong consulting element.
Most of our work comes through repeat business and direct referrals, which comes down to the quality of our people. The success of our Data Engineering teams means that customers are bringing us an increasing number of exciting data projects using cutting- edge technology to solve real-world problems. We are seeking more high calibre people to join our Data & Analytics capability where you will grow and contribute to industry- leading technical expertise.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20profile%20%2D%20Senior%20Data%20Analyst%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence'
),
(5013,'Data Technical Architect',103,13,'As a Data Technical Architect (Consultant) in Kainos, you’ll be responsible for designing and delivering technical components as part of a larger data solution. You will work closely with Solution Architects and Customer Architects to integrate these components into quality data solutions',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20profile%20%2D%20Data%20Technical%20Architect%20%28C%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
),
(5014,'Data Engineer',103,13,'As a Data Engineer (Associate) in Kainos you will work within a multi-skilled agile team to design and develop large-scale data processing software to meet user needs in demanding production environments.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20profile%20%2D%20Lead%20Data%20Engineer%20%28C%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
),
(5015,'Data Migration Architect',103,14,'As a Data Migration Architect (Consultant) at Kainos, you will be responsible for designing and leading the successful implementation of migration activities covering scenarios such as data migrations to support new digital services and cloud analytic platforms, and database migration within a cloud adoption program.
You will understand commercial constraints and ensure that all technology decisions satisfy both commercial and technical success criteria. You will be comfortable in liaising with clients and representing the technical face of Kainos externally.
You will provide strong technical competence within Kainos. You will continuously innovate, manage risk appropriately and ensure that Kainos’ and client’s capabilities are enhanced. You will devise and cost significant solutions from scratch. You will define technical direction both within Kainos and throughout project teams. ',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FArchive%2FJob%20profile%20%2D%20Data%20Architect%20%28C%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FArchive&p=true&ga=1'
),
(5016,'Lead Artificial Intelligence Engineer',103,15,'As a Lead Artificial Intelligence (AI) Engineer in Kainos, you’ll be responsible for leading teams and developing high quality AI and ML solutions which delight our customers and impact the lives of users worldwide. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow. As the technical leader in the team, you will also lead projects, interact with customers, share knowledge, provide thought leadership and mentor those around you.
You will manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20Profile%20%2D%20Lead%20AI%20Engineer%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
),
(5017,'Consultant Data Scientist',103,16,'As a Consultant Data Scientist in Kainos, you’ll be responsible for leading teams and developing high quality solutions that use AI and ML technologies to delight our customers and impact the lives of users worldwide. It’s a fast-paced environment so it is important for you to make sound, reasoned decisions. You’ll do this whilst learning about new technologies and approaches, with talented colleagues that will help you to learn, develop and grow. As the technical leader in the team, you will also interact with customers, share knowledge and mentor those around you.
You will manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20Profile%20%2D%20Consultant%20Data%20Scientist%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
),
(5018,'Data Consultant',103,17,'As a Data Consultant (Consultant) in Kainos, you will be responsible for ensuring that your team has a good understanding of business needs so that our customer data solutions meet the needs of them and their users.
You will be responsible for articulating problems and processes in ways understood by all stakeholders - both business and technical, and for facilitating the analysis and design of data solutions that impact users worldwide.
You will be comfortable directing teams, encouraging engagement and discussion. You will plan and run workshops, engaging with a variety of stakeholders to facilitate consensus in areas of uncertainty.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20Profile%20%2D%20Data%20Consultant%20%28C%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
),
(5019,'Data Migration Architect',103,17,' ',
' '
),
(5020,'Lead Data Analyst',103,18,'As a Lead Data Analyst (Consultant) in Kainos, you’ll work within a multi-skilled agile team to collect and analyse data and enable insight to senior customers that drives business
improvement.',
'https://kainossoftwareltd.sharepoint.com/sites/PeopleTeam-SharedDrive/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FData%2FJob%20profile%20%2D%20Lead%20Data%20Analyst%20%28C%29%2Epdf&parent=%2Fsites%2FPeopleTeam%2DSharedDrive%2FShared%20Documents%2FPeople%20Team%20Shared%20Drive%2FOrganisational%20Development%20%26%20Learning%2FCareer%20Lattice%2FApproved%20Job%20Profiles%2FData&p=true&ga=1'
),
(5021,'Data Solution Architect',102,13,'As a Data Solution Architect (Manager) in Kainos, you’ll be responsible for a multi- skilled agile teams to design and deliver contemporary data solutions. You will be a quality orientated pragmatist, where you balance trade-offs to successfully deliver complex solutions. You will be viewed as an authority figure for data technology solutions, providing strong technical and thought leadership.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20profile%20%2D%20Data%20Solution%20Architect%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
),
(5022,'Data Architect',102,14,'As a Data Architect (Manager) in Kainos, you’ll be responsible for providing SME guidance in traditional data architecture disciplines around data structures, data flows, data sourcing and data governance. Data Architects work closely with clients to understand their data requirements and take responsibility for ensuring solutions are fit for purpose. They also provide technical leadership for the rest of the team in the area of data. Data Architects may also work at the solution or enterprise level - for example resolving data definition and mastering issues across complex stakeholder environments.
Most of our work comes through repeat business and direct referrals, which comes down to the quality of our people. 
You will manage, coach and develop a a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20profile%20%2D%20Data%20Architect%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
),
(5023,'Artificial Intelligence Engineer Manager',102,15,'As an Artificial Intelligence (AI) Engineer Manager in Kainos, you’ll be responsible for successful delivery of large-scale high-quality solutions that use AI and ML technologies that delight our customers and impact the lives of users worldwide.
You will provide leadership and support to AI engineering teams by understanding the outcomes the solution is trying to achieve, the engineering implications and complexity surrounding you and your teams designs and helping teams make the right decisions.
You’ll work with senior stakeholders to agree architectural principles, strategic direction and functional and non-functional designs.
As a technical leader, you will work with your colleagues to inform development of policy and standards, develop customer relationships, account management and share knowledge and mentor those around you. You’ll do this whilst advising about new technologies and approaches to AI/ML, with room to learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20Profile%20%2D%20AI%20Engineering%20Manager%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
),
(5024,'Data Scientist Manager',102,16,'As a Data Scientist Manager in Kainos, you’ll be responsible for successful delivery of large- scale high-quality solutions that use AI and ML technologies that delight our customers and impact the lives of users worldwide.
You will provide leadership and support to data science teams by understanding the outcomes the solution is trying to achieve, the data implications and complexity surrounding you and your teams designs and helping teams make the right decisions.
You’ll work with senior stakeholders to agree data architectural principles, strategic direction and functional and non-functional designs.
As a technical leader, you will work with your colleagues to inform development of policy and standards, develop customer relationships, account management and share knowledge and mentor those around you. You’ll do this whilst advising about new technologies and approaches to data, with room to learn, develop and grow.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20Profile%20%2D%20Data%20Scientist%20Manager%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
),
(5025,'Data Consultant',102,17,'As a Data Consultant (Manager) in Kainos, you will combine thought leadership, delivery and commercial experience to identify, secure new business as we help customers on their digital transformation journeys which have vital data considerations where value can be unlocked.
You will be responsible for articulating the opportunity and the value it can bring in ways understood by all stakeholders - both business and technical, and for facilitating the analysis and design of data solutions that impact users worldwide.
You will be comfortable directing teams, encouraging engagement and discussion. You will plan and run workshops, engaging with a variety of stakeholders to facilitate consensus in areas of uncertainty.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20Profile%20%2D%20Data%20Consultant%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
),
(5026,'Data Analytics Manager',102,18,' ',
' '
),
(5027,'Principal Architect for Data & AI',101,14,'As a Principal Architect for Data & AI in Kainos, you’ll be accountable for successful delivery of contemporary data/ AI solutions across multiple customers.
You’ll have gravitas within the data/ AI community and strong thought leadership, working with senior stakeholders to agree principles, strategic direction and functional and non- functional designs. You`ll manage other architects and engineers in the capability to help them navigate their careers.
You will provide assurance and support to multi-skilled agile teams by understanding the outcomes the solution is trying to achieve, the technical implications and complexity surrounding you and your teams designs and helping teams make the right decisions. As a technical leader, you will work with your colleagues to lead the development of policy and standards, develop customer relationships, develop account strategies and share knowledge and mentor those around you.
',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20Profile%20%2D%20Principal%20Architect%20%28Data%20%26%20AI%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
),
(5028,'Principal Data and AI Consultant',101,17,'Kainos is at the forefront of helping organisations with their digital transformation journey. We recognise that any digital transformation will have vital data considerations and AI can help organisations unlock greater value from their data as part of a digital service. Most of our work comes through repeat business and direct referrals, which comes down to the quality of our people. The success of our Data Engineering and Data Science teams means that customers are bringing us an increasing number of exciting data projects using cutting-edge technology to solve real-world problems. We are looking for a strong data and AI advocate who combines delivery and commercial experience to identify, secure and shape new business across public and private sectors.
',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence%2FJob%20Profile%20%2D%20Principal%20Data%20and%20AI%20Consultant%20%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FData%20and%20Artificial%20Intelligence&p=true&ga=1'
);

INSERT INTO JobRole (roleID, roleName, bandID, familyID, specSummary, sharepointLink)
VALUES
(6005,'Senior Security Engineer',104,20,'As a Senior Security Engineer, you will work in close collaboration with our technology teams to design and implement secure, cloud-based software solutions for our clients. Working as part of a multi-disciplinary Agile team, you will implement DevSecOps practices throughout the software development lifecycle, embedding security practices (e.g. vulnerability management, threat modelling etc.) and automating security artifact generation (e.g. secret scanning, container security, SAST, DAST etc.). You will provide subject matter expertise in application security or cloud security – sharing knowledge on threats and vulnerabilities, identifying appropriate security controls, and increasing cyber security awareness within teams.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FCyber%20Security%2FJob%20profile%20%2D%20Senior%20Security%20Engineer%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FCyber%20Security&p=true&ga=1'
),
(6006,'Senior Security Analyst',104,21,'As a Senior Security Analyst (Senior Associate) in Kainos, you will provide support to protect Kainos’ networks from security threats. You will be responsible for responding to advanced security alerts, escalating as required. You will also lead software security reviews and oversee security gap analysis. You will assist in the development of Corporate Security at Kainos, develop playbooks and processes, and support the design and delivery of training of internal teams on security awareness.
You’ll work within the Corporate Security team to develop and embed good security practices throughout Kainos. You’ll learn about and apply new security tools and approaches, with talented colleagues who will help you develop and grow.  You’ll share knowledge and help educate people – both the wider Kainos community and your security and systems team members. ',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FCyber%20Security%2FJob%20profile%20%2D%20Senior%20Security%20Analyst%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FCyber%20Security&p=true&ga=1'
),
(6007,'Security Architect',103,20,'As a Security Architect (Consultant) in Kainos, you’ll be responsible for the design and application of good security practices in the platforms and services we build for our customers. You’ll work with Agile delivery teams to develop good security practices throughout the software development journey. You’ll learn about and apply new technologies and approaches, with talented colleagues who will help you develop and grow. 
You’ll share knowledge and help educate people – both customers and Kainos team members.  You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FCyber%20Security%2FJob%20profile%20%2D%20Security%20Architect%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FCyber%20Security&p=true&ga=1'
),
(6008,'Lead Security Engineer',103,20,'As a Lead Security Engineer (Consultant) in Kainos, you will be responsible for leading our security engineering and security testing efforts across Kainos Platforms and Services. They will set direction on our security testing methodology, engagement scoping, outputs and tool/technology selections, whilst developing our more junior security engineers accordingly.
They’ll work with agile delivery teams to develop good security practices throughout the software development journey. As a technical leader in the team, you will share knowledge and help educate our customers and Kainos team members on good security practices.
You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FCyber%20Security%2FJob%20profile%20%2D%20Lead%20Security%20Engineer%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FCyber%20Security&p=true&ga=1'
),
(6009,'Lead Security Analyst',103,21,'As a Lead Security Analyst (Consultant) in Kainos, you will be responsible for delivering high quality, security services to protect Kainos’ network, such a reviewing security configuration, software security and performing threat hunting. You will be expected to carry out business analysis and ensure security incident responses, solutions and processes delivered to the business aligns with the Kainos strategy, business, and user needs. You will set direction for incident management, whilst developing our more junior security analysts accordingly.
You will work closely with the Corporate Security Manager to ensure Kainos systems and access are protected, monitored and that any incidents which occur are identified and managed swiftly and effectively. As a technical leader in the team, you will share knowledge, provide expert advice on a range of security topics and help educate our wider Kainos community on good security practices.
You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development. You’ll also provide direction and leadership for your team as you solve challenging problems together.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FCyber%20Security%2FJob%20profile%20%2D%20Lead%20Security%20Analyst%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FCyber%20Security&p=true&ga=1'
);

INSERT INTO JobRole (roleID, roleName, bandID, familyID, specSummary, sharepointLink)
VALUES
(7001,'Workday Strategy and Delivery Director',101,22,'The role of the Workday Practice Strategy and Planning Delivery Director (Director) at Kainos is to provide direct support to the Leadership Team to enable them to deliver key business priorities through the identification, planning and delivery of strategic projects. The Strategy and Planning Delivery Director will work to ensure problem statements are clarified, projects are scoped and costed using standard internal governance (kBid) and successfully deliver to KPIs (including measures and return) across the full life cycle of each project.
Core responsibilities of the Strategy and Planning Delivery Director include delivering key strategic projects, stakeholder management and supporting strategic planning and acting as a trusted adviser to the key stakeholders in the business.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FStrategy%20and%20Planning%2FJob%20Profile%20%2D%20Workday%20Practice%20Strategy%20and%20Planning%20Delivery%20Director%20%28P%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FStrategy%20and%20Planning'
),
(7002,'HCM Consultant',103,23,'As a Workday HCM Consultant (Consultant) in Kainos, you’ll work in a team to implement and configure enterprise-scale Workday solutions for our global customer base, typically leading a project workstream. You will build relationships with our customers, shaping and delivering solutions that are aligned to customer needs, fit for purpose and commercially viable. You’ll provide excellent guidance to customers, understanding their business and requirements. You’ll support more junior members of the team and share your knowledge with them.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FHCM%2FJob%20profile%20%2D%20Workday%20HCM%20Consultant%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FHCM&p=true&ga=1'
),
(7003,'Financials Consultant',106,24,'As a Workday Financials Consultant (Trainee) in Kainos, you will be responsible for supporting the successful specification, design and configuration of enterprise-scale Workday product solutions.  This will be done by working with internal delivery teams to provide solutions that are fit for purpose and commercially viable.  Understanding and translating customer requirements, as well as hands-on product configuration is essential for this role.
',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FFinancials%2FJob%20profile%20%2D%20Workday%20Financials%20Consultant%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FFinancials&p=true&ga=1'
),
(7004,'Data Consultant',102,25,'As a Workday Data Consultant (Manager) in Kainos, you’ll be a key part of the team, to implement and configure enterprise-scale Workday solutions for our global customer base, specializing in gathering and transforming the customer’s organizational and employee data prior to loading in to the Workday tenants. You will build relationships with our customers to understand their data needs, leading the delivery of solutions around their data that are aligned to their needs, fit for purpose and commercially viable. You’ll work closely with other functional team leads and stakeholders to keep implementation flowing, and you’ll lead the data workstream on these implementations. You’ll also have the support and guidance of an Engagement Manager and Managing Consultant. As a knowledgeable expert in data consulting, you’ll also fill a leading role in aiding education and growth in the area of Workday Data Consulting within the Kainos Workday practice.
',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FData%2FJob%20profile%20%2D%20Workday%20Data%20Consultant%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FData&p=true&ga=1'
),
(7005,'Integrtaion Consultant',105,26,'As a Workday Integrations Consultant (Associate) in Kainos, you’ll work as part of a team of integration consultants on a project, supporting the successful delivery of integration solutions for the cloud-based Workday HCM system.
With the support of more senior consultants, you’ll work to capture requirements, document, implement, deploy and support integration solutions within a Workday implementation project. You will develop and share expert knowledge of the Workday product and integration platform toolset, as well as HCM / Financials business domain knowledge.
You’ll build strong relationships with our customers to understand their requirements, ensuring that the integration solution is aligned to their needs, fit for purpose and commercially viable. You’ll know when to appropriately escalate issues and seek support from your more experienced team members.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FIntegrations%2FJob%20Profile%20%2D%20Integrations%20Consultant%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FIntegrations&p=true&ga=1'
),
(7006,'Change and User Adoption Consultant',104,27,'As a Change and User Adoption Consultant (Senior Associate) at Kainos, you will work in a team to design and delivery of change management interventions in a Workday environment. You will work closely with team members, as well working independently and confidently to manage your own workload. You’ll be able to understand customer requirements, designing and delivering solutions that are aligned to their needs. You’ll support more junior members of the team and share your knowledge with them.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FChange%20and%20User%20Adoption%2FJob%20profile%20%2D%20Change%20and%20User%20Adoption%20Consultant%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FChange%20and%20User%20Adoption&p=true&ga=1'
),
(7007,'Adaptive Planning Consultant',103,28,'As an Adaptive Planning Consultant (Consultant), you’ll work in a team or independently helping our clients transform their business planning needs (budgeting, revenue, personnel, KPIs, quotas/capacity, territories, reporting & analytics) with the Workday
Adaptive Planning Business Planning Cloud. You will work as part of a delivery team responsible for implementations for customers of all size, across multiple industries. You will be a specialist within your field, providing mentoring and oversight to more junior team
members.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FAdaptive%20Planning%2FJob%20Profile%20%2D%20Adaptive%20Planning%20Consultant%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FAdaptive%20Planning&p=true&ga=1'
),
(7008,'Test Consultant',106,29,'As a Test Consultant (Trainee) at Kainos you`ll take a key role in the implementation, support and on-going improvement of our exciting and highly successful cloud-based automated testing application.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FProduct%20Services%2FJob%20Profile%20%2D%20Test%20Consultant%20%28Trainee%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FProduct%20Services&p=true&ga=1'
),
(7009,'Product Owner',104,30,'We’re currently looking for a Product Owner who will join one of our Scrum teams, developing our cloud-based automated testing tool, Kainos Smart, built exclusively for testing Workday. Kainos Smart can quickly create repeatable tests saving our clients significant man hours on testing and gaining much greater assurance on the correctness of their Workday deployment.
This is a fantastic opportunity for a driven and hands-on individual to become a key member of one of the UK’s leading SaaS companies, at a time of growth and as we roll out new and exciting services.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FProduct%20Development%2FJob%20Profile%20%2D%20Product%20Owner%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FProduct%20Development&p=true&ga=1'
);

INSERT INTO JobRole (roleID, roleName, bandID, familyID, specSummary, sharepointLink)
VALUES
(7010,'Workday Extend Principal Architect',101,31,'As a Workday Extend Principal Architect (Principal) in Kainos, you’ll be fully accountable for the quality of how we deliver, develop and deploy Workday Extend solutions for our global customer base. You’ll use your expertise to engage directly on high profile projects, to handle any significant application challenges, and will be an important senior liaison and escalation for our clients.
You’ll work closely with clients to scope, document, implement, deploy and support Workday Extend solutions using the Workday Extend platform toolset and you will lead a team of Extend consultants on a project.
You’ll take part in business development activities, working with the sales team on opportunities within your area and will be jointly accountable for achieving sales targets, providing commercially competitive estimates and content to support the sales process.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FExtend%2FJob%20Profile%20%2D%20Workday%20Extend%20Principal%20Architect%20%28P%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FExtend'
),
(7011,'Spend Management Advisory Manager',102,32,'As a Spend Management Advisory Manager (Manager) at Kainos, you will be responsible for ensuring that Kainos’ innovative digital services and platforms meet the user need and the outcomes agreed between Kainos and the client, whilst ensuring our delivery follows good governance and quality standards. You will empower and support Kainos teams to perform well, learn and grow in a manner that is consistent with Kainos company values. You will leverage successful delivery and strong client relationships to explore opportunities to win follow-on business with existing customers.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FWorkday%2FSpend%20Management%2FJob%20profile%20%2D%20Spend%20Management%20Advisory%20Manager%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FWorkday%2FSpend%20Management'
),
(8001,'User Reseacher',105,33,'As a User Researcher, you will deliver actionable insights that help define the right service experiences and focus them on user needs. You will be passionate about design research and an advocate for user needs-based design, design thinking and service design.
You will be part of and supported by our growing Experience Design capability creating exemplary digital services. We are supportive, collaborative, talented, and hugely passionate about user-centred design. We are not about marketing and dark patterns; we are all about making a positive, measurable impact on millions of people through quality products and services.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FExperience%20Design%2FJob%20Specification%20%2D%20User%20Researcher%20%28Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FExperience%20Design&p=true&ga=1'
),
(8002,'Content Designer',104,34,'As a Content Designer, you will create clear, user-centered content experiences and make use of recognised content design guidelines and principles. You will be passionate about the practice of content design and an advocate for user-centered design, design thinking and service design.
You will be part of our growing Experience Design capability creating exemplary digital services. We are supportive, collaborative, talented, and hugely passionate about user- centred design. We are not about marketing and dark patterns; we are all about making a positive, measurable impact on millions of people through quality products and services.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FExperience%20Design%2FJob%20Specification%20%2D%20Content%20Designer%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FExperience%20Design&p=true&ga=1'
),
(8003,'UX Design Lead',102,35,'As a UX Design Lead, you will deliver intuitive service experiences based on user needs and design principles. You will be passionate about needs-based design and an advocate for design thinking and service design. You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development.
You will be part of and supported by our growing Experience Design capability creating exemplary digital services. We are supportive, collaborative, talented, and hugely passionate about user-centred design. We are not about marketing and dark patterns; we are all about making a positive, measurable impact on millions of people through quality products and services.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FExperience%20Design%2FJob%20Specification%20%2D%20UX%20Design%20Lead%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FExperience%20Design&p=true&ga=1'
),
(8004,'Experience Design Principal',101,36,'As an Experience Design Principal, you will take an active role within the Capability Leadership Team and contribute to an area of expertise e.g. People, Sales, Offerings or Methods. You will possess deep discipline-specific skills and a wide, generalist understanding of other skills within Experience Design. You will be an advocate for needs- based design, design research, design thinking and service design, and are passionate about guiding others in these principles. You’ll manage, coach and develop a small number of staff, with a focus on managing employee performance and assisting in their career development.
You will be part of our growing Experience Design capability creating exemplary digital services. We are supportive, collaborative, talented, and hugely passionate about user- centred design. We are not about marketing and dark patterns; we are all about making a positive, measurable impact on millions of people through quality products and services.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FExperience%20Design%2FJob%20Specification%20%2D%20Experience%20Design%20Principal%20%28Principal%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FExperience%20Design&p=true&ga=1'
);

INSERT INTO JobRole (roleID, roleName, bandID, familyID, specSummary, sharepointLink)
VALUES
(9001,'Product Consultant',103,37,'As a Product Consultant (Consultant level) in Kainos you will be responsible for your teams backlog maturity, taking ownership of features from inception through to delivery. You will drive MVP thinking and communicating the value of it with those in your team, the wider project team and relevant stakeholders.
You will be a leader in your team, comfortable running agile ceremonies, encouraging engagement and discussion. You will plan and run workshops, engaging with a variety of stakeholders to facilitate consensus in areas of uncertainty. You will actively participate within the Product capability, supporting the delivery of initiatives. You will also manage, coach and develop a small number of staff, with a focus on managing employee performance.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FProduct%2FJob%20Profile%20%2D%20Product%20Consultant%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FProduct&p=true&ga=1'
),
(9002,'Digital Advisory Consultant',104,38,'In Kainos Digital Advisory we work with clients from the very early phases of their transformation journey. We begin by understanding their business challenges and setting clear strategic direction, then work with the full depth of Kainos delivery capabilities to execute change. Key areas of advisory work include helping clients to navigate uncertainty, solve complex business and technical problems and structure transformational change, enabled by technology.
As a Senior Associate, you will work on projects from inception to completion, from smaller strategic engagements to large scale transformational delivery. You will have experience in assessing client business challenges, supporting development of solutions and contributing to implementation of business changes enabled by technology. Consulting skills are required, supported by knowledge of digital trends and business models.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FProduct%2FDigital%20Advisory%20Consultant%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FProduct&p=true&ga=1'
),
(9003,'Low Code Principal Consultant',101,39,'In Kainos Low Code, we work with clients from the very early phases of their transformation journey. We begin by understanding their business and identifying clear improvement goals, then work with the full range of low code and automation technologies to execute change.
As a Low Code Principal Consultant, you will work as the trusted advisor for a client, having strategic conversations which have a direct impact on their business, revenue, and cost. You are engaged from the very first conversation, when you explore what the client is looking to achieve. You build teams of experts from Kainos advisory and technical practices to collaborate with client teams and stakeholders. You will direct and shape the Low Code Practice, setting the strategic vision and working to deliver this. You will investigate business challenges, identify potential solutions, demonstrate ideas, support the client to achieve buy in and develop plans for rapid delivery.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FProduct%2FJob%20Profile%20%2D%20Low%20Code%20Consultant%20%28P%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FProduct&p=true&ga=1'
);

INSERT INTO JobRole (roleID, roleName, bandID, familyID, specSummary, sharepointLink)
VALUES
(1101,'Delivery Lead',100,40,'As a Delivery Lead (Leader) at Kainos, you will be accountable for leading the delivery capability for the Sector/Region in the Digital Services/Workday business unit, working closely with delivery managers to ensure successful and efficient delivery of multiple engagements across a ~£20+m portfolio. Take a hands-on role in key accounts leading client relationships from a delivery perspective as a trusted advisor to address business problems through digital delivery. Owns a sector view of demand for people and works with BU Operations to scale our delivery capability to enable the high annual growth in revenue (20% plus).',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FDelivery%2FJob%20profile%20%2D%20Delivery%20Lead%20%28Leader%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FDelivery&p=true&ga=1'
),
(1102,'Agile Practitioner',104,41,'In Kainos Digital Advisory we work with clients from the very early phases of their transformation journey. We begin by understanding their business challenges and setting clear strategic direction, then work with the full depth of Kainos delivery capabilities to execute change. Key areas of advisory work include helping clients to navigate uncertainty, solve complex business and technical problems and structure transformational change, enabled by technology.
At Kainos we put significant emphasis on developing and training our people to be world class. We are committed to an investment in you – our talent – to ensure you not only have industry leading skills but have a clearly defined career path to progress.
As a Senior Associate, you will work on projects from inception to completion, from smaller strategic engagements to large scale transformational delivery. You will have experience in assessing client business challenges, supporting development of solutions and implementing a range of business changes enabled by technology. Consulting skills are essential, supported by a broad knowledge of digital trends and associated business models.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FDelivery%2FJob%20Profile%20%2D%20Agile%20Practitioner%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FDelivery&p=true&ga=1'
),
(1103,'Principal Engineering Manager',101,42,' ',' '),
(1104,'Service Manger',103,43,'As a Service Manager, you will be responsible for managing the day-to-day delivery of support services, as well as engaging in relevant client-relationships, across a variety of projects. This will include managing people, resources, finances, and reporting while ensuring adherence to robust quality standards including but not limited to ISO20000. You will also assist the senior management team with business growth within existing accounts. as well as supporting business development activity for potential new clients.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FDelivery%2FJob%20profile%20%2D%20Service%20Manager%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FDelivery'
),
(1105,'Engagement Manager',102,44,'As an Engagement Manager in Kainos, you’ll fully manage the successful implementation of solutions for customers by working closely with customer business teams and internal delivery teams to drive the scope, definition and delivery of solutions that are fit for purpose and commercially viable. You’ll take accountability for the complete delivery lifecycle alongside Technical and Solution Architects. You’ll manage all aspects of your projects, which will typically be either one large, complex project or multiple smaller projects. This will include project planning, staffing, milestone tracking, commercial management, and customer satisfaction.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FDelivery%2FJob%20profile%20%2D%20Engagement%20Manager%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FDelivery&p=true&ga=1'
),
(1006,'Programme Office Assistant',106,45,'As a Programme Office Assistant (Trainee) at Kainos, you’ll be responsible for ensuring that a high-quality service is provided to the Project Management and Operations capabilities within the Digital Services/Workday/Central Services business unit, demonstrating best practice throughout. You will provide administrative support for our engagements and will have a key role in the efficient management and delivery of these projects.
You’ll work as part of the Digital Services/Workday/Central Services Operations PMO team and report into the Operations Manager. It’s a fast-paced environment so it is important for you to ensure that workload is prioritised, and tasks completed in a timely manner.',
''
);

INSERT INTO JobRole (roleID, roleName, bandID, familyID, specSummary, sharepointLink)
VALUES
(1201,'Director of Operations',100,46,'As Director of Operations (Leader) at Kainos, you will work with the BU COO and Head of Sector/Region in guiding the strategic development and continuous improvement of short and long-term operational and financial goals for the sector/region.
You will be accountable for the successful delivery of all operational processes and enable your team to operationally direct one or more client groups within the sector/region. You will establish and monitor all sector/region budget(s) in line with the growth and needs of the wider BU, working with the sector/region management and leadership team(s) to ensure commercial targets are met or exceeded.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOperations%2FJob%20Profile%20%2D%20Director%20of%20Operations%20%28L%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOperations'
),
(1202,'Head of Operations',101,47,'As Head of Operations (Principal) at Kainos, you will be responsible for supporting the BU COO in the development and continuous of short and long-term strategic operational and financial objectives.
You will be responsible for managing and improving the day to day operational processes within the BU and operationally leading one or more sectors/regions within the BU. You will define and manage a sector/region budget(s) in line with the growth and the needs of the wider BU working with the sector/region management and leadership team(s) to ensure commercial targets are met or exceeded.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOperations%2FJob%20Profile%20%2D%20Head%20of%20Operations%20%28Principal%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOperations&p=true&ga=1'
),
(1203,'Staffing Consultant',104,48,'As a Staffing Consultant (Senior Associate) at Kainos, you will be responsible for the day-to-day staffing of projects within a Business unit. You will ensure the talent pool has the appropriate skills for forecasted projects while maximising profitable utilisation. You will also
be responsible for ensuring the accurate closure of month end accounts.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOperations%2FJob%20Profile%20%2D%20Staffing%20Consultant%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOperations&p=true&ga=1'
);

INSERT INTO JobRole (roleID, roleName, bandID, familyID, specSummary, sharepointLink)
VALUES
(1301,'Account Lead',100,49,'Our vision is to create a world-class business development and marketing capability for Kainos, fuelled by a diverse range of highly talented and motivated professionals working collaboratively and innovatively to ensure we continue our growth trajectory.
We do this via an open and supportive environment where colleagues can share information, learn from one another and excel in their own career. With consistent ways of working aligned to industry best practice, we build sustainable and predictable sales pipelines for our market-leading offerings.
As an Account Lead (Leader) in Kainos, you will be responsible for running and developing their named account(s) which includes account planning, account management execution, business development, delivery, risk & quality assurance, executive reporting, operations of all areas, people allocation and their morale and personal development.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FBDM%20Strategy%20%26%20Planning%2FJob%20profile%20%2D%20Account%20Lead%20%28Leader%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FBDM%20Strategy%20%26%20Planning&p=true&ga=1'
),
(1302,'Business Development Consultant',103,50,'Our vision is to create a world-class business development and marketing capability for Kainos, fuelled by a diverse range of highly talented and motivated professionals working collaboratively and innovatively to ensure we continue our growth trajectory.
We do this via an open and supportive environment where colleagues can share information, learn from one another and excel in their own career. With consistent ways of working aligned to industry best practice, we build sustainable and predictable sales pipelines for our market-leading offerings.
As a Business Development Consultant in Kainos, you will be responsible for building Kainos’ new business by forging into new accounts, based on building an extensive network of industry contacts.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FBusiness%20Development%2FJob%20profile%20%2D%20Business%20Development%20Consultant%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FBusiness%20Development&p=true&ga=1'
),
(1303,'Customer Success Consultant',104,51,'Our vision is to create a world-class Customer Success capability for Kainos, fuelled by a diverse range of highly talented and motivated professionals working collaboratively and innovatively to ensure we retain clients and expand our footprint within existing clients to continue our growth trajectory.
We do this via an open and supportive environment where colleagues can share information, learn from one another and excel in their own career. With consistent ways of working aligned to industry best practice, we retain and grow our footprint by delivering on the clients desired outcomes for our market-leading offerings.
As a Customer Success Consultant (Senior Associate) at Kainos, you will partner with our customers post-sale to drive adoption and ensure customer satisfaction, growth, and retention. You will be a bridge between our Professional Services, Operational Support and Sales teams. You will join the Smart Customer Success team to work directly with customers to ensure that their overall user experience with Kainos Smart is a success.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FClient%20Management%2FJob%20Profile%20%2D%20Customer%20Success%20Consultant%20%28Senior%20Associate%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FClient%20Management&p=true&ga=1'
),
(1304,'Partners Relationship Manager',102,52,'As a Business Development Partner Relationship Manager in Kainos, you will be responsible for building Kainos’ business through the development of deep relationships with strategic partners and driving new business across Kainos’ offerings and verticals.
You will be accountable for building strong networks, influencing the partner’s promotion of, and investment in, Kainos and encouraging a flow of sales leads from the partner. You will enable mutual stakeholder relationships and coach Business Development and technical staff to leverage the partner opportunity.
You will be working collaboratively with other members of the Business Development teams as well as colleagues from other areas of the business including delivery, legal, marketing and operations.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FPartners%2FJob%20profile%20%2D%20Partner%20Relationship%20Manager%20%28M%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FPartners&p=true&ga=1'
),
(1305,'Bid Production Consultant',103,53,'As a Bid Production Consultant in Kainos, you will be responsible for supporting the Business Development team with responsibility for an area of bid production (e.g. bid management, framework management), ensuring adherence to formal processes, quality reviews, legal review and commercial authorisation.
You will operate in a sales-focused role, requiring a combination of management, analytical skills, authoring skills, industry knowledge and a detailed understanding of the issues within the delivery process.
You will be accountable for building relevant stakeholder relationships within the business development team, capabilities, account teams, senior delivery staff, commercial teams and customers. You will continually seek innovative ways to improve team productivity, enhancement of collateral and procurement success rates.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FBid%20Production%2FJob%20profile%20%2D%20Bid%20Production%20Consultant%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FBid%20Production&p=true&ga=1'
),
(1306,'Sales Development Representative',105,54,'As a Sales Development Representative (Associate) in Kainos, you will initiate long- standing relationships with prospective customers and executive sponsors. You will support in employing effective selling strategies to successfully position the Kainos Smart tool.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FInside%20Sales%2FJob%20profile%20%2D%20Sales%20Development%20Representative%20%28As%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FInside%20Sales&p=true&ga=1'
),
(1307,'Marketing Executive',104,55,'As a Marketing Executive (Senior Assoicate) at Kainos, you will support in creating and delivering the marketing campaigns and activities that are aligned to commercial needs and designed to drive brand awareness/support recruitment/generate leads to fuel the sales pipeline. You will use your experience and commercial knowledge to own key campaigns, content or projects from inception through to evaluation. You will foster strong relationships with key internal and external stakeholders to ensure delivery against plan.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Business%2FJob%20profile%20%2D%20Marketing%20Executive%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Business&p=true&ga=1'
),
(1308,'Digital Strategy Director',101,56,'As the Digital Strategy Director (Principal) at Kainos, you will be responsible globally the company’s digital strategy and the tech stack (including ownership of our website platform), Marketo marketing automation (injecting great practice into our team to drive lead generation) and marketing operations across the world (ensuring marketing is transparent, consistent in approach and accountable via ROI reporting).
You will use your extensive digital experience and commercial knowledge to lead and mentor the martech & Ops team who act as a Digital Centre of Excellence to marketing colleagues on campaigns to generate leads. You will foster strong relationships with key internal stakeholders and external partners acting as a trusted advisor.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Martech%20and%20Ops%2FJob%20profile%20%2D%20Digital%20Strategy%20Director%20%28P%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Development%20and%20Marketing%2FMarketing%20%2D%20Martech%20and%20Ops&p=true&ga=1'
);

INSERT INTO JobRole (roleID, roleName, bandID, familyID, specSummary, sharepointLink)
VALUES
(1401,'Cheif Information Officer',100,57,'The Chief Information Officer – CIO (Leader) at Kainos is a key strategic role within the business with responsibility of the direction over the use of information technology and information security to support its growing business. You will ensure our policies, systems and processes are optimised meet the needs of a fast-moving IT services company.
You will own internal change projects and ensure they are delivered at high quality, on time and within budget. You will work along with our CISO to protect our information and to work with the business units to advise our customers to ensure their information is similarly protected.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning%2FJob%20profile%20%2D%20Chief%20Information%20Officer%20%2D%20CIO%20%28Leader%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FOrganisational%20Strategy%20and%20Planning&p=true&ga=1'
);

INSERT INTO JobRole (roleID, roleName, bandID, familyID, specSummary, sharepointLink)
VALUES
(1701,'Business Services Support Trainee',106,66,'As a Business Support Trainee in Kainos, you will be responsible for providing high quality administrative services and processes that support the core business at Kainos.
You will be accountable for delivering high quality work in line with company policies and process guidelines.
You will be working as part of a team to effectively deliver support to the core business.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Services%20Support%2FJob%20profile%20%2D%20Business%20Support%20Trainee%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Services%20Support&p=true&ga=1'
),
(1702,'Property Team Lead',103,67,'As Property Team Lead in Kainos, you will be responsible for aspects of delivering Property operations. This will include delivering best in class Property services and processes that support the core business. You will ensure that best practices are followed, and that the most suitable working environment is attained for employees.
This role has a broad range of responsibilities. You will be involved in both strategic planning and day-to-day operations, particularly in relation to building and premises.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Services%20Support%2FJob%20profile%20%2D%20%20Property%20Team%20Lead%20%28Consultant%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Services%20Support&p=true&ga=1'
),
(1703,'Travel Manger',102,68,'As Travel Manager in Kainos, you will be responsible for leading all aspects of Travel and Apartment operations. This will include the management of Travel/Apartment services and processes that support the core business. You will ensure that best practices are followed, and that the most suitable working environment is attained for employees.
This is a manager level role, reporting directly into the Group Head of Finance.',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Services%20Support%2FJob%20profile%20%2D%20Travel%20Manager%20%28Manager%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Services%20Support&p=true&ga=1'
),
(1704,'Senior Outreach and Engagement Associate',104,69,'As a Senior Outreach and Engagement Associate at Kainos, you will support the coordination, design, delivery, administration and evaluation of our Outreach initiatives',
'https://kainossoftwareltd.sharepoint.com/people/Job%20Specifications/Forms/AllItems.aspx?id=%2Fpeople%2FJob%20Specifications%2FBusiness%20Services%20Support%2FJob%20profile%20%2D%20Outreach%20and%20Engagement%20%28SA%29%2Epdf&parent=%2Fpeople%2FJob%20Specifications%2FBusiness%20Services%20Support'
);

INSERT INTO Responsibility (responsibilityID, responsibilityName, roleID)
VALUES
(38,'Ensure all Outreach initiatives accurately reflect Kainos values and standards.',1704),
(39,'Supporting research and evaluation of the latest trends, techniques.',1703),
(40,'Coordinating high quality Outreach initiatives in collaboration with partners in the IT Industry, Education and Government sectors',1704),
(41,'Ensuring Travel support service is provided to cover all out of hours periods required',1703),
(42,'Managing and monitoring travel policies, guidelines, processes.',1703),
(43,'Leading, managing and developing the Travel Team.',1703),
(44,'Be amicable and approachable with a mature, collaborative style.',1701),
(45,'Highly flexible, including willingness to work flexible hours at peak times.',1701),
(46,'Be amicable and approachable with a mature, collaborative style.',1701),
(47,' Managing of the month end timetable to ensure timely and accurate completion of all tasks.',1702),
(48,'Developing timely, accurate and high-quality monthly reporting packs, focusing on continuous improvements and meeting the business needs.',1702),
(49,'Performing full end to end legal services as directed by senior team members and have accountability as appropriate for standalone work.',1701),
(50,'Ability to advise on and undertake a wide range of complex and cross jurisdictional legal matters.',1701),
(51,'Developing, maintaining and seeking to continually improve a recruitment function in line with a rapidly growing international business.',1303),
(52,'Managing the Recruitment Budget to achieve maximum return on investment.',1303),
(53,'Creates sound business cases when team expansion is required.',1303),
(54,'Managing and co-ordinating all people related processes and tasks.',1301),
(55,'Supporting our global business.',1301),
(56,'Further develop a new strong customer service ethos for the Systems and Compliance teams to better help the business.',1401),
(57,'Set the objectives and mentor the IT Operations and internal platform team.',1401),
(58,'Inbound and outbound campaigns. Marketing Automation',1308),
(59,'Owning and implementing digital strategy and plans.',1308),
(60,'Developing Kainos as a business. Assisting with strategic alignment.',1306),
(61,'Supporting prospecting and opportunity qualification activities.',1306),
(62,'Providing Business Development Leadership.',1304),
(63,'Developing Kainos as a business.',1304),
(64,'Co-ordinating and managing senior stakeholders',1304),
(65,'Developing and strengthening partnerships.',1302),
(66,'Being a trusted advisor for our customers.',1302),
(67,'Negotiating and managing senior stakeholders',1302),
(68,'Providing support to the Staffing + PMO Lead as required.',1203),
(69,'Managing the day to day staffing and PMO activities across multiple locations.',1203),
(70,'Setting comprehensive goals for commercial performance and growth of their sectors/regions within the BU.',1202),
(71,'Full operational accountability for one or more sector/region(s) within the BU.',1202),
(72,'Full operational accountability for the sector/region, developing and clearly communicating the vision and strategy in a way that engages and empowers others',1201),
(73,'Setting the strategic direction within the sector/region for all operational matters.',1201),
(74,'Acting as the key client interface between functional and technical teams and the client.',1105),
(75,'Commercially managing the implementation of solutions from pre-sales through implementation and hand over.',1105),
(76,'Must be able to exhibit the following; Delivery, Business Development & Account Management, Team, Governance, Professional Development and Growth.',1104),
(77,'Advising on which methodology or hybrid approach is best suited for the specific client needs. Improve Kainos reputation by building strong client relationships',1102);


INSERT INTO Role(RoleID, Name) VALUES
(1, "Admin"),
(2, "Employee");

INSERT INTO User(Username, Password, RoleID) VALUES 
("admin@kainos.com","Password123!",1),
("hremp@kainos.com","TestPass!37", 2);