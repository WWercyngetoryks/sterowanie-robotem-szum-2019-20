 %% kolko turtlebot
sterowanie = rospublisher('/turtle1/cmd_vel')
pozycja = rossubscriber('/turtle1/pose');
wiadomosc = rosmessage(sterowanie.MessageType)
 
 wiadomosc.Linear.X = 1;

for t=0:0.1:10
    
wiadomosc.Angular.Z = 1;

send(sterowanie,wiadomosc);
pause(0.1);
end
%% pijany kierowca + logging
sterowanie = rospublisher('/turtle1/cmd_vel')
pozycja = rossubscriber('/turtle1/pose');
wiadomosc = rosmessage(sterowanie.MessageType)

wiadomosc.Linear.X = 1;
for t=0:0.1:10
    
wiadomosc.Angular.Z = sin(t);

send(sterowanie,wiadomosc);
pause(0.1);
end
%%  znajdowanie kąta zerowego

sterowanie = rospublisher('/turtle1/cmd_vel')
pozycja = rossubscriber('/turtle1/pose');
wiadomosc = rosmessage(sterowanie.MessageType)

%wiadomosc.Linear.X = 1;

for t=0:0.1:10
 polozenie = receive(pozycja,1); 
 X=polozenie.X;
 Y=polozenie.Y;
 theta=polozenie.Theta;
 
 v=0;
 omega=-theta;
 
 wiadomosc.Linear.X=v;
 wiadomosc.Angular.Z = omega; %obrot addytywny

send(sterowanie,wiadomosc);
pause(0.1);
end

%%  jazda do zadanej pozycji

sterowanie = rospublisher('/turtle1/cmd_vel')
pozycja = rossubscriber('/turtle1/pose');
wiadomosc = rosmessage(sterowanie.MessageType)

%wiadomosc.Linear.X = 1;

for t=0:0.1:10
 polozenie = receive(pozycja,1); 
 X=polozenie.X;
 Y=polozenie.Y;
 theta=polozenie.Theta;
 
 v=0;
 omega=-theta;
 
 wiadomosc.Linear.X=v;
 wiadomosc.Angular.Z = omega; 

send(sterowanie,wiadomosc);
pause(0.1);
end
