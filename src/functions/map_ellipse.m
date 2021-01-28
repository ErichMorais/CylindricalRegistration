function [result] = map_ellipse(left, top, right, center_bottle)
    hold on;
    global horizontal_points ;
    
    i = 1; %Inicializa i
    result = zeros(horizontal_points,2); %Pré aloca
    
    center = (left + right) / 2; %Centro
    v_max = abs(center_bottle(2) - top(2)); %Ponto máximo da ellipse
    a = abs((right(1) - left(1))) / 2; %Limite da garrafa
    R = 3.7; %Raio desta garrafa (cm)
    
%     b = abs(top(2) - left(2)) %Tamanho do eixo menor da garrafa
%     d = abs(R*((v_max - b) / b)) %Distancia em (cm)
%     d = 32.3798;
    d = 32;
    for alpha=(-pi/2):(pi/(horizontal_points-1)):(pi/2)
        %Transformation formula between u and alpha 
        u = a*((sqrt(d.^2 - R.^2) * sin(alpha)) /(d - R*cos(alpha)));
        %Transformation formula between v and alpha 
        if ((top(2) - center(2)) > 0)
            v = (v_max*(R/(d + R)) * sqrt(1 - (((d.^2-R.^2)*sin(alpha).^2) /(d - R*cos(alpha)).^2))); %Traça ellipse para baixo
        else
            v = -(v_max*(R/(d + R)) * sqrt(1 - (((d.^2-R.^2)*sin(alpha).^2) /(d - R*cos(alpha)).^2)));  %Traça ellipse para cima
        end
        result(i, :)= [round(u + center(1)), round(v+left(2))];
        i = i + 1;   
%         plot(round(u + center(1)), round(v+left(2)), 'r.', 'MarkerSize',10);
    end   
   
end

