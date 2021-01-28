clear;
clc;
global horizontal_points ;
global vertical_points ;
chosed_points = [];

%Seleciona o banco de imagens
% fourImgsDir = fullfile('../../Images/bottle_two', {'0.jpg';'90.jpg';'180.jpg';'270.jpg';}); %Dal Pizzol
fourImgsDir = fullfile('../../Images/novas/Dal_Pisol',{'0.jpg';'90.jpg';'180.jpg';'270.jpg';}); %Dal Pizzol nova
% fourImgsDir = fullfile('../../Images',{'quadriculado.jpg';}); %Quadr[196 271;357 244;502 268;201 940;343 995;483 934]
% fourImgsDir = fullfile('../../Images/dal_pizzol',{'0.jpg';'90.jpg';'180.jpg';'270.jpg';});
% fourImgsDir = fullfile('../../Images/quad',{'quadriculado.jpg';}); 
imagesScene = imageDatastore(fourImgsDir); %Carrega todo o dataset para a memoria

%********************Dal pizzol antiga********************
% chosed_points = [[203, 365]; [362, 325]; [520, 365]; 
%                  [215, 867]; [362, 891]; [510, 867]]; %Pontos pré definidos para esta garrafa(HD)

%********************Dal pizzol nova**********************
chosed_points = [225 434;370 408;513 433;...
                 236 889;374 909;511 883];
%********************Papel quadriculado*******************
% chosed_points = [231 378;356 343;482 372;...
%                  234 946;358 976;486 941];

if(isempty(chosed_points))
    image = imresize(readimage(imagesScene,1),[1280 720]); %Le primeira imagem do dataset
    imshow(image)
     for j=1:6
        [x,y] = ginput(1);
        hold on;
        chosed_points = [chosed_points; [round(x),round(y)]];
        plot(x, y, 'r*', 'LineWidth', 2, 'MarkerSize', 5);
        hold off;
     end
end

horizontal_points = 20;
vertical_points = 20;
compensation = 1;

%*************************Nomeia os pontos************************
limit_left_top = chosed_points(1,:);  limit_left_bottom = chosed_points(6,:);
limit_y_top = chosed_points(2,:);     limit_y_bottom = chosed_points(5,:);
limit_right_top = chosed_points(3,:); limit_right_bottom = chosed_points(4,:);
%*************************Loop de identificaçao e planificação*****
if(compensation > 0)
    for i = 1:numpartitions(imagesScene)
        image = readimage(imagesScene,i);
%         image = (imresize(readimage(imagesScene,i),[1280 720]));


        %Centro da Garrafa analiisada
%         center = [(((limit_right_top(1) - limit_left_top(1)) / 2) + limit_left_top(1)), (((limit_y_bottom(2) - limit_y_top(2)) / 2) + limit_y_top(2))]; %Centro
%         line_x = line([limit_left_top(1), limit_right_top(1)], [limit_left_top(2),limit_right_top(2)],'Color','blue', 'MarkerSize', 7); %Traça linhas
%         line_y = line([center(1),center(1)],[1,limit_y_bottom(2)] ,'Color','blue', 'MarkerSize', 7);

        %De acordo com a equação do Lin, é possivel mapear a distorção em ambos
        %os eixos      
        if(i == 1)
            figure
            imshow(image)
            hold on;
%             plot(chosed_points(:,1), chosed_points(:,2), 'y.', 'MarkerSize',30);
            map = distortion_points(limit_left_top, limit_y_top, limit_right_top, limit_left_bottom, limit_y_bottom, limit_right_bottom);
        end
        %Retificação da imagem
        rectify_image = retify_image_perspective(limit_left_top, limit_y_top, limit_right_top, limit_left_bottom, limit_y_bottom, limit_right_bottom, map, image);

        filename = sprintf('image_%d.png', i);
        imwrite(rectify_image,filename);
        if i < 2      
            result = rectify_image;
        else
           result = [result, rectify_image];
        end
    end
    filename = sprintf('result.png');
    imwrite(result,filename);
end
%*************************Monta a panoramica************************
% for i = 1:4
%     filename = sprintf('image_%d.png', i);I = (imread(filename));
%     [row, column, a] = size(I);
%     init = round(column/4);
%     final = round(column*2/4);
%     I2 = imcrop(I,[init 1 final row]);
%     if i < 2      
%         result = I2;
%     else
%        result = [result, I2];
%     end
%  end
%  filename = sprintf('result_45.png');
% imwrite(result,filename);

