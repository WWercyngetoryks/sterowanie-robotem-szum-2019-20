function reset_fun(i,j,k)
  
                [pub1,msg3] = rospublisher('/dogbot/front_left_pitch_position_controller/command','std_msgs/Float64');
                [pub2,msg4] = rospublisher('/dogbot/front_left_knee_position_controller/command','std_msgs/Float64'); 
              
                [pub3,msg3] = rospublisher('/dogbot/back_left_pitch_position_controller/command','std_msgs/Float64');
                [pub4,msg4] = rospublisher('/dogbot/back_left_knee_position_controller/command','std_msgs/Float64'); 
                
                [pub5,msg1] = rospublisher('/dogbot/back_right_pitch_position_controller/command','std_msgs/Float64');
                [pub6,msg2] = rospublisher('/dogbot/back_right_knee_position_controller/command','std_msgs/Float64'); 
                
                [pub7,msg1] = rospublisher('/dogbot/front_right_pitch_position_controller/command','std_msgs/Float64');
                [pub8,msg2] = rospublisher('/dogbot/front_right_knee_position_controller/command','std_msgs/Float64'); 
                
                [pub9,msg9] = rospublisher('/dogbot/front_left_roll_position_controller/command','std_msgs/Float64');
                [pub10,msg10] = rospublisher('/dogbot/front_right_roll_position_controller/command','std_msgs/Float64'); 
              
                [pub11,msg10] = rospublisher('/dogbot/back_left_roll_position_controller/command','std_msgs/Float64');
                [pub12,msg9] = rospublisher('/dogbot/back_right_roll_position_controller/command','std_msgs/Float64'); 
              
                
                
                 msg1.Data = deg2rad(i);
                 msg2.Data = deg2rad(j);
                 msg3.Data = -deg2rad(i);
                 msg4.Data = -deg2rad(j);
                 msg9.Data = deg2rad(k);
                 msg10.Data = -deg2rad(k);
                 pause(2); 
                   
                 send(pub1,msg3);
                 send(pub5,msg1);
                 send(pub3,msg3);
                 send(pub4,msg4);
                 send(pub8,msg2); 
                 send(pub6,msg2); 
                 send(pub2,msg4);
                 send(pub7,msg1);
                 send(pub9,msg9);
                 send(pub10,msg10);
                 send(pub11,msg10);
                 send(pub12,msg9);
          
                 
         
                  
               
              
end