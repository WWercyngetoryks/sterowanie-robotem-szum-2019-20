 %% kolko turtlebot
 
sterowanie = rospublisher('/turtle1/cmd_vel') % ustanowienie połaczenia wysyłanie
pozycja = rossubscriber('/turtle1/pose'); %ustanowienie połaczenia odbieranie
wiadomosc = rosmessage(sterowanie.MessageType) % ustanowienie typu wiadomości
 
% wiadomosc.Linear.X = 1; % widomosci do wyslania 

for t=0:0.1:10 % czs trwania symulacji
    
wiadomosc.Angular.Z = 1; % widomosci do wyslania 

send(sterowanie,wiadomosc); % wyslani wiadomosci
pause(0.1);
end
%% jazda po sinusoidzie + logging
sterowanie = rospublisher('/turtle1/cmd_vel')
pozycja = rossubscriber('/turtle1/pose');
wiadomosc = rosmessage(sterowanie.MessageType)

wiadomosc.Linear.X = 1; % jazda na wprost
for t=0:0.1:10
    
wiadomosc.Angular.Z = sin(t); % zmiana orientacji

send(sterowanie,wiadomosc);
pause(0.1);
end
%%  znajdowanie kąta zerowego

sterowanie = rospublisher('/turtle1/cmd_vel')
pozycja = rossubscriber('/turtle1/pose');
wiadomosc = rosmessage(sterowanie.MessageType)

%wiadomosc.Linear.X = 1;

for t=0:0.1:10
 polozenie = receive(pozycja,1);  % odczytanie polozenai robota
 X=polozenie.X; % polozenie X
 Y=polozenie.Y; % polozenie Y
 theta=polozenie.Theta; % kąt
 
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
