source lahman2016.sql;
use `baseball2016`;

-- Remove all foreign keys
alter table baseball2016.Teams DROP FOREIGN KEY Teams_ibfk_1;                              
alter table baseball2016.AllstarFull DROP FOREIGN KEY AllstarFull_ibfk_1;                  
alter table baseball2016.AllstarFull DROP FOREIGN KEY AllstarFull_ibfk_2;                  
alter table baseball2016.Appearances DROP FOREIGN KEY Appearances_ibfk_1;                  
alter table baseball2016.Appearances DROP FOREIGN KEY Appearances_ibfk_2;                  
alter table baseball2016.AwardsManagers DROP FOREIGN KEY AwardsManagers_ibfk_1;            
alter table baseball2016.AwardsPlayers DROP FOREIGN KEY AwardsPlayers_ibfk_1;              
alter table baseball2016.AwardsShareManagers DROP FOREIGN KEY AwardsShareManagers_ibfk_1;  
alter table baseball2016.AwardsSharePlayers DROP FOREIGN KEY AwardsSharePlayers_ibfk_1;    
alter table baseball2016.Batting DROP FOREIGN KEY Batting_ibfk_1;                          
alter table baseball2016.Batting DROP FOREIGN KEY Batting_ibfk_2;                          
alter table baseball2016.BattingPost DROP FOREIGN KEY BattingPost_ibfk_1;                  
alter table baseball2016.BattingPost DROP FOREIGN KEY BattingPost_ibfk_2;                  
alter table baseball2016.CollegePlaying DROP FOREIGN KEY CollegePlaying_ibfk_1;            
alter table baseball2016.CollegePlaying DROP FOREIGN KEY CollegePlaying_ibfk_2;            
alter table baseball2016.Fielding DROP FOREIGN KEY Fielding_ibfk_1;                        
alter table baseball2016.Fielding DROP FOREIGN KEY Fielding_ibfk_2;                        
alter table baseball2016.FieldingOF DROP FOREIGN KEY FieldingOF_ibfk_1;                    
alter table baseball2016.FieldingOFsplit DROP FOREIGN KEY FieldingOFsplit_ibfk_1;          
alter table baseball2016.FieldingOFsplit DROP FOREIGN KEY FieldingOFsplit_ibfk_2;          
alter table baseball2016.FieldingPost DROP FOREIGN KEY FieldingPost_ibfk_1;                
alter table baseball2016.FieldingPost DROP FOREIGN KEY FieldingPost_ibfk_2;                
alter table baseball2016.HallOfFame DROP FOREIGN KEY HallOfFame_ibfk_1;                    
alter table baseball2016.HomeGames DROP FOREIGN KEY HomeGames_ibfk_1;                      
alter table baseball2016.Managers DROP FOREIGN KEY Managers_ibfk_1;                        
alter table baseball2016.Managers DROP FOREIGN KEY Managers_ibfk_2;                        
alter table baseball2016.ManagersHalf DROP FOREIGN KEY ManagersHalf_ibfk_1;                
alter table baseball2016.ManagersHalf DROP FOREIGN KEY ManagersHalf_ibfk_2;                
alter table baseball2016.Pitching DROP FOREIGN KEY Pitching_ibfk_1;                        
alter table baseball2016.Pitching DROP FOREIGN KEY Pitching_ibfk_2;                        
alter table baseball2016.PitchingPost DROP FOREIGN KEY PitchingPost_ibfk_1;                
alter table baseball2016.PitchingPost DROP FOREIGN KEY PitchingPost_ibfk_2;                
alter table baseball2016.Salaries DROP FOREIGN KEY Salaries_ibfk_1;                        
alter table baseball2016.Salaries DROP FOREIGN KEY Salaries_ibfk_2;                        
alter table baseball2016.SeriesPost DROP FOREIGN KEY SeriesPost_ibfk_1;                    
alter table baseball2016.SeriesPost DROP FOREIGN KEY SeriesPost_ibfk_2;                    
alter table baseball2016.TeamsHalf DROP FOREIGN KEY TeamsHalf_ibfk_1; 

INSERT INTO performance_schema.setup_objects VALUES ('EVENT','baseball2016','%','YES','YES');

source test.sql;