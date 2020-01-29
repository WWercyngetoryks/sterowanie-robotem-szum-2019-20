clear all;clc; 

% inicjalizacja ros-a
rosinit;
pause(3)

% ustawieni robota w pozycji startowej
reset_fun(45,70,10);

% ustawienie publisherow, wysylanie danych
[pub1,msg1] = rospublisher('/dogbot/back_left_pitch_position_controller/command','std_msgs/Float64');
[pub2,msg2] = rospublisher('/dogbot/back_left_knee_position_controller/command','std_msgs/Float64'); 
[pub3,msg3] = rospublisher('/dogbot/front_right_pitch_position_controller/command','std_msgs/Float64');
[pub4,msg4] = rospublisher('/dogbot/front_right_knee_position_controller/command','std_msgs/Float64');  

[pub5,msg5] = rospublisher('/dogbot/back_right_pitch_position_controller/command','std_msgs/Float64');
[pub6,msg6] = rospublisher('/dogbot/back_right_knee_position_controller/command','std_msgs/Float64'); 
[pub7,msg7] = rospublisher('/dogbot/front_left_pitch_position_controller/command','std_msgs/Float64');
[pub8,msg8] = rospublisher('/dogbot/front_left_knee_position_controller/command','std_msgs/Float64');  



% ustawienie subscribera, odbieranie danych
msg = rossubscriber('/dogbot/joint_states'); 
pause(1);

% petla symulacji
    for i=1:1:30
            pause(1)
         %odebranie aktualnej pozycji   
         rec_data = receive(msg);
         %przypisanie aktualnych pozycji
         t1 = rec_data.Position(2);
         t2 = rec_data.Position(1);
            
         %wyliczenie pozycji stopy, kinematyka prosta
         [x,y] = kinf(t1,t2);
         %ruch nogi przedniej prawej i tylnej lewej
         move_fun(x,y,msg,msg1,msg2,msg3,msg4,pub1,pub2,pub3,pub4);
         pause(0.02)
         %ruch nogi przedniej lewej i tylnej prawej
         move_fun(x,y,msg,msg7,msg8,msg5,msg6,pub7,pub8,pub5,pub6);
    end
    
pause(3)
rosshutdown;