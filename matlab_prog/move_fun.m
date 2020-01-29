function  move_fun(x,y,msg,msg1,msg2,msg3,msg4,pub1,pub2,pub3,pub4)
    
    % pobranie pkt trajektorii
    [p0, p1, p2, p3, p4, p5 ] = points_fun2(x,y);
    points = [num2cell(p0,2), num2cell(p1,2), num2cell(p2,2), num2cell(p3,2), num2cell(p4,2), num2cell(p5,2)];                       
    


    for i=1:1:5
        % pobranie aktualnych katow
        rec_data = receive(msg);

        % aktualna czesc trajektorii
        pakt = cell2mat(points(i));
        pzad = cell2mat(points(i+1));

        %przypisanie aktualnego katow zmienym
        t1 = rec_data.Position(2);
        t2 = rec_data.Position(1);

        % wyliczenie Jakobianu
        JJ = jacobian(t1,t2);
        
        % odwrotnosc Jakobianu
        J_inv = inv(JJ);
        blad = pakt-pzad;

        % wyliczenie nastaw
        q = [t1;t2]+ J_inv*(blad');  


        q1 = q(1);
        q2 = q(2); 
       
        % wyslanie nastaw do robota
        msg1.Data = q1;
        msg2.Data = q2;
        msg3.Data = -q1; % dla prawej nogi
        msg4.Data = -q2; % dla prawej nogi

        send(pub1,msg1); 
        send(pub2,msg2);
        send(pub3,msg3); 
        send(pub4,msg4);
        
        
        %%czas trwana poszczegolnych faz tajektorii
        if i == 1
            pause(0.02)
        elseif i == 2
            pause(0.08)
        elseif i == 3
            pause(0.08) 
        elseif i == 4
            pause(0.08)
        end    
    end

end