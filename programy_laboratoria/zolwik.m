%%
figure()
[e,alfa] = meshgrid(-10:0.1:10,deg2rad(-200):deg2rad(10):deg2rad(200)); 
V = -e.*e.*cos(alfa).*cos(alfa)-alfa.*alfa;
surf(e,alfa,V)
%%
figure()
[e,alfa] = meshgrid(-10:0.1:10,deg2rad(-200):deg2rad(10):deg2rad(200)); 
V = -e.*e.*cos(alfa).*cos(alfa);
surf(e,alfa,V)

%% inicjalizacja
sterowanie = rospublisher('/turtle1/cmd_vel')
pozycja = rossubscriber('/turtle1/pose');
wiadomosc = rosmessage(sterowanie.MessageType)
destX = 8;
destY = 1;
destTheta = 20;

% sterowanie
for t=0:0.1:100
 polozenie = receive(pozycja,1); 
 X=polozenie.X
 Y=polozenie.Y
 theta=polozenie.Theta;
 alfa=atan2(Y-destY,X-destX)-theta;
 beta=alfa+theta;
 e=sqrt((X-destX).^2+(Y-destY).^2)
 
 v=-e*cos(alfa);
 %omega=-sin(alfa).*cos(alfa)-((beta.*sin(alfa).*cos(alfa))./alfa)+alfa;
  omega=sin(alfa).*cos(alfa)+((beta.*sin(alfa).*cos(alfa))./alfa)-alfa;
 wiadomosc.Linear.X=v;
 wiadomosc.Angular.Z = omega;

send(sterowanie,wiadomosc);
pause(0.1);
end