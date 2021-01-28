
function [vertical] = retify_image_perspective(limit_left_top, ~, limit_right_top, limit_left_bottom, ~, limit_right_bottom, map, image)
    global horizontal_points ;
    global vertical_points ;
    
    R_pixel_top = abs((limit_left_top(1) - limit_right_top(1))) / 2;
    R_pixel_bottom = abs((limit_left_bottom(1) - limit_right_bottom(1))) / 2;
    R_pixel = (R_pixel_top + R_pixel_bottom)/2;
    perimeter = round(2*R_pixel*pi)/2; %Extensão total da imagem

    top_height = abs(limit_left_top(2) - limit_left_bottom(2));
    bot_height = abs(limit_right_top(2) - limit_right_bottom(2));
    med_height = round((top_height + bot_height)/2);  %Altura total da imagem

    block_width = (perimeter / horizontal_points - 1); %divide o tamanho dos blocos igualmente
    block_height = (med_height / vertical_points - 1);
    
    x = [1;block_width;1;block_width];  y = [1;1;block_height;block_height]; 
    result_matrix = [x, y]; % %Bloco retificado
    R = imref2d([round(block_height) round(block_width)]); %Ajusta o tamanho do bloco de saida
    
    for row_index = 4:vertical_points-1
        horizontal_image = [];
        for col_index = 4:horizontal_points-1
              a = map{row_index,1}; a = a(col_index, :); %Ponto canto superior esquerdo
              b = map{row_index,1}; b = b(col_index + 1, :); %Ponto canto superior direito
              c = map{row_index + 1,1}; c = c(col_index, :); %Ponto canto inferior esquerdo
              d = map{row_index + 1,1}; d = d(col_index+ 1, :); %Ponto canto inferior direito      
%               plot(a(1), a(2), 'm+', 'MarkerSize',10);
%               plot(b(1), b(2), 'm+', 'MarkerSize',10);
%               plot(c(1), c(2), 'm+', 'MarkerSize',10);
%               plot(d(1), d(2), 'm+', 'MarkerSize',10);
%               line([a(1), b(1)], [a(2), b(2)],'Color','blue'); %Traça linhas
%               line([b(1), d(1)], [b(2), d(2)],'Color','blue'); %Traça linhas
%               line([c(1), d(1)], [c(2), d(2)],'Color','blue'); %Traça linhas
%               line([c(1), a(1)], [c(2), a(2)],'Color','blue'); %Traça linhas

              x = [a(1);b(1);c(1);d(1)]; y = [a(2);b(2);c(2);d(2)]; %Bloco com as coordenadas na imagem original
              src_cell = [x,y]; % Bloco com coordenadas

              new_matrix = fitgeotrans(src_cell, result_matrix, 'projective'); %Cria a matriz de transformação
              result_image = imwarp(image, new_matrix, 'OutputView', R); %Transforma a partir da imagem original
              
%               figure
%               imshow(result_image)
%               hold on
%               line_x = line([x(1), x(2)], [y(1), y(2)],'Color','blue','LineWidth',2); %Traça linhas
%               line_x = line([x(2), x(4)], [y(2), y(4)],'Color','blue','LineWidth',2); %Traça linhas
%               line_x = line([x(3), x(4)], [y(3), y(4)],'Color','blue','LineWidth',2); %Traça linhas
%               line_x = line([x(3), x(1)], [y(3), y(1)],'Color','blue','LineWidth',2); %Traça linhas

              if(col_index == 1)
                horizontal_image = result_image;
              else
                horizontal_image = cat(2,horizontal_image, result_image);
              end
        end    
        if(row_index == 1)
            vertical = horizontal_image;
        else
            vertical=cat(1,vertical,horizontal_image);
        end
    end
end

