function [rows] = distortion_points(limit_left_top, limit_y_top, limit_right_top, limit_left_bottom, limit_y_bottom, limit_right_bottom)
% hold on;
global horizontal_points ;
global vertical_points ;
rows = cell(vertical_points+1,1);  %Pré-aloca o array vertical

center = [(((limit_right_top(1) - limit_left_top(1)) / 2) + limit_left_top(1)), (((limit_y_bottom(2) - limit_y_top(2))/2) + limit_y_top(2))]; %Centro

[top_points] =  map_ellipse(limit_left_top, limit_y_top, limit_right_top, center); %Elipse do ponto superior
[bottom_points] = map_ellipse(limit_left_bottom, limit_y_bottom, limit_right_bottom, center); %Elipse do ponto inferior

rows(1) = {top_points};
for row_index = 1:vertical_points-1
    row = zeros(horizontal_points,2);  %Zera o array horizontal
    for col_index = 1:horizontal_points
        top_point = top_points(col_index, :); %Elipse dos pontos superiores
        bottom_point = bottom_points(col_index, :);%Elipse dos pontos inferiores
        delta = (top_point - bottom_point) / (vertical_points - 1); %Taxa de inclinação
        point = top_point - delta * row_index; %Ponto a ser transformado
        row(col_index, :) = point; 
%         plot(point(1),point(2), 'r.', 'MarkerSize',10);
    end
   rows(row_index+1) = {row}; %Armazena o array horizontal como celula
end

end

