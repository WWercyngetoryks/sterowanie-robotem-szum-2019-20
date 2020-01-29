function JJ = jacobian(t1,t2)
% dlugosci przegubow w m
l1=0.315;
l2=0.3;

 % kinematyka prosta, wektor polozenia koncowki roboczej
 e = [l1*cos(t1) + l2*cos(t1 + t2);
     l1*sin(t1) + l2*sin(t1 + t2); 0];
 % pkt poczatkowy 1 ramienia
 p1 = [0;0;0];
 % pkt poczatkowy 2 ramienia
 p2 = [l1*cos(t1); l1*sin(t1); 0];
 % wersor osi 1 przegubu
 a1 = [0 0 1];
 % wersor 2 przewgubu
 a2 = [0 0 1];
 % rzut wektora na osie dla ukladu 1
 w1 = cross(a1,(e-p1)); % mnozenie wektorowe
 % rzut wektora na osie dla ukladu 2
 w2 = cross(a2,(e-p2)); % mnozenie wektorowe

% J = [ w1x  w2x....wix
%       w1y  w2y....wiy
%       w1z  w2z ....wiz]

% jakobian
J = [w1' w2'];

% Jakobian tylko dla x i y


JJ= [J(1) J(4); J(2) J(5)];
% postac
%JJ = [ - l2*sin(t1 + t2) - l1*sin(t1), -l2*sin(t1 + t2);
%       l2*cos(t1 + t2) + l1*cos(t1),  l2*cos(t1 + t2)];

end