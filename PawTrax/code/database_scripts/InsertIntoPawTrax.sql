use PawTrax;

insert into owner (Name) values ('Tyler Apple');
insert into owner (Name) values ('Jackson Trust');
insert into owner (Name) values ('Kate Pendavinji');
insert into owner (Name) values ('Megan Kang');
insert into owner (Name) values ('Ahmed Alali');

insert into dog (Owner_ID, Dog_Name, Breed, Birthday, Gender, Total_Time_Outside_Hours, Total_Distance_Traveled_Miles, Weight_Pounds, Last_Month_Weight_Pounds) values (2, 'Sophie', 'Miniature Pinscher', '2011-09-04', 'Female', 1.5, 3.0, 15.3, 15.3);
insert into dog (Owner_ID, Dog_Name, Breed, Birthday, Gender, Total_Time_Outside_Hours, Total_Distance_Traveled_Miles, Weight_Pounds, Last_Month_Weight_Pounds) values (1, 'Gunther', 'Golden Retreiver', '2008-05-17', 'Male', 8.0, 6.0, 75.0, 80.0);
insert into dog (Owner_ID, Dog_Name, Breed, Birthday, Gender, Total_Time_Outside_Hours, Total_Distance_Traveled_Miles, Weight_Pounds, Last_Month_Weight_Pounds) values (3, 'Dakota', 'Mutt', '2006-04-01', 'Female', 3.0, 5.0, 20.0, 20.0);
insert into dog (Owner_ID, Dog_Name, Breed, Birthday, Gender, Total_Time_Outside_Hours, Total_Distance_Traveled_Miles, Weight_Pounds, Last_Month_Weight_Pounds) values (4, 'Adolf', 'Miniature Schnauzer', '2001-07-23', 'Male', 0.5, 1.0, 17.4, NULL);
insert into dog (Owner_ID, Dog_Name, Breed, Birthday, Gender, Total_Time_Outside_Hours, Total_Distance_Traveled_Miles, Weight_Pounds, Last_Month_Weight_Pounds) values (5, 'Oreo', 'Rat Terrier', '2005-07-04', 'Male', 6.0, 8.0, 22.2, 23.7);

insert into workout values ('00010001', 1, 2, '2020-06-01', 'Walk', 1.0, 0.5);
insert into workout values ('00010002', 1, 2, '2020-06-03', 'Stairs', 0.2, 0.4);
insert into workout values ('00020001', 2, 1, '2019-12-25', 'Run', 2.0, 3.0);
insert into workout values ('00030001', 3, 3, '2020-06-17', 'Hike', 5.2, 3.7);
insert into workout values ('00040001', 4, 4, '2020-04-01', 'Other', 9.6, 5.4);
insert into workout values ('00050001', 5, 5, '2006-09-15', 'Run', 1.4, 0.3);