%% 18.10.2019 Sterowanie przy pomocy jakobianu manipulatora
% jeden człon
u=[3;4;0];%punkt na osi obrotu
w=[0;0;1];%kierunek obroty- wokol osi z0;0;1
p0=[0;0;0;1];%polozenie poczatkowe, 1 sztuczka matematyczka
v=cross(-w,u); % mnozenie wektorowe 
s=[w;v];
hat=@(s)[0 -w(3) w(2) v(1); w(3) 0 -w(1) v(2); -w(2) w(1) 0 v(3); 0 0 0 0 ];

for theta = 0:0.1:2*pi
    p=expm(hat(s)*theta)*p0;
    plot([u(1),p(1)],[u(2),p(2)],'bo-') 
    axis([-10 10 -10 10 -10 10])
    view(30,60) % camera 
    pause(0.1)
end


%% dwa człony

w=[0;0;1];%OMEGA, kierunek obroty- wokol osi z0;0;1
w2=[0;0;1];%OMEGA, kierunek obroty- wokol osi z0;0;1
u=[0;0;0];%punkt początkowy pierwszego ramienia - na osi obrotu
p0=[0;5;0;1];%końcówka pierwszego ramienia, '1' to sztuczka matematyczna
u2=[0;5;0];%punkt początkowy drugiego ramienia
p02=[0;10;0;1];% końcówka drugiego ramienia
v=cross(-w,u); % mnozenie wektorowe 
v2=cross(-w2,u2); % mnozenie wektorowe 
s=[w;v];
s2=[w2;v2];

hat = @(s)[0 -w(3) w(2) v(1); w(3) 0 -w(1) v(2); -w(2) w(1) 0 v(3); 0 0 0 0 ]; % s z daszkiem
hat2 = @(s)[0 -w2(3) w2(2) v2(1); w2(3) 0 -w2(1) v2(2); -w2(2) w2(1) 0 v2(3); 0 0 0 0 ]; 

for theta = 0:0.1:2*pi 
    p=expm(hat(s)*theta)*p0;
    p2 = expm(hat(s)*theta)* expm(hat2(s2)*theta)* p02;
   
    plot([u(1),p(1)],[u(2),p(2)],'bo-') % dodac plot drugiego ramienia
    hold on
    plot([u2(1),p2(1)],[u2(2),p2(2)],'bo-')
    axis([-10 10 -10 10 -10 10]) % 3 bo 3 wymiary po dodaniu camery
    view(30,60) % camera 
    pause(0.1)
end





%% Sterowanie manipulatorem - ruch koncowki w prawo (dwa stopnie swobody)

syms theta theta2 real
hat = @(s)[0 -s(3) s(2) s(4); s(3) 0 -s(1) s(5); -s(2) s(1) 0 s(6); 0 0 0 0 ]; % s z daszkiem


w=[0;0;1];%OMEGA, kierunek obroty- wokol osi z0;0;1
w2=[0;0;1];%OMEGA, kierunek obroty- wokol osi z0;0;1
u=[0;0;0];%punkt początkowy pierwszego ramienia - na osi obrotu
u2=[0;1;0];%punkt początkowy drugiego ramienia
p01=[0;1;0;1];%końcówka pierwszego ramienia, '1' to sztuczka matematyczna
p02=[0;2;0;1];% końcówka drugiego ramienia


v=cross(-w,u); % mnozenie wektorowe 
v2=cross(-w2,u2); % mnozenie wektorowe 
s=[w;v];
s2=[w2;v2];


A1=expm(hat(s)*theta);

  
p2 = expm(hat(s)*theta) * expm(hat(s2)*theta2)* p02;
J = [hat(s)*p2, A1 * hat(s2)* inv(A1)*p2]; % jakobian dla dwóch członów
J_simplify = simplify(J)

