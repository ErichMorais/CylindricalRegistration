%  Calibration results after optimization (with uncertainties):
% 
% Focal Length:          fc = [ 3783.10168   3804.17273 ] +/- [ 16.44492   18.73193 ]
% Principal point:       cc = [ 2109.01871   1262.33602 ] +/- [ 30.99911   25.90506 ]
% Skew:             alpha_c = [ 0.00000 ] +/- [ 0.00000  ]   => angle of pixel axes = 90.00000 +/- 0.00000 degrees
% Distortion:            kc = [ -0.00135   0.02367   -0.00757   -0.00718  0.00000 ] +/- [ 0.02015   0.07294   0.00240   0.00324  0.00000 ]
% Pixel error:          err = [ 2.54378   2.05677 ]

%***********************************************************************************************************

%  filename = sprintf('image_%d.png', i);I_1 = (imread(filename));
%     filename = sprintf('image_%d.png', i);I_2 = (imread(filename));
% 
%         [row, column] = size(I_1);
% 
%     imshow(I_1); hold on;
%     cornersOriginal = detectSURFFeatures(I_1, 'ROI', [column*2/3, 1, column/3, row]);
%     [featuresOriginal, validPtsOriginal] = extractFeatures(I_1, cornersOriginal); 
%     plot(cornersOriginal.selectStrongest(50));
% 
%     figure; imshow(I_2); hold on;
%     cornersDistorted = detectSURFFeatures(I_2, 'ROI', [1, 1, column/3, row]);
%     [featuresDistorted, validPtsDistorted] = extractFeatures(I_2, cornersDistorted);
%     plot(cornersDistorted.selectStrongest(50));
%     
%     index_pairs = matchFeatures(featuresOriginal,featuresDistorted);
%     matchedPtsOriginal  = validPtsOriginal(index_pairs(:,1), :);
%     matchedPtsDistorted = validPtsDistorted(index_pairs(:,2), :);
%     figure; showMatchedFeatures(I_1, I_2, matchedPtsOriginal, matchedPtsDistorted);
%     [tform, inlierPtsDistorted,inlierPtsOriginal ] = estimateGeometricTransform(matchedPtsDistorted, matchedPtsOriginal,'projective', 'Confidence', 99.99);
%     figure; showMatchedFeatures(I_1,I_2,inlierPtsOriginal,inlierPtsDistorted);
   

%***********************************************************************************************************

% for i = 1:4
%     filename = sprintf('image_%d.png', i);I = (imread(filename));
%     [row, column, a] = size(I);
%     init = column/4;
%     final = column*2/4;
%     I2 = imcrop(I,[init 1 final row]);
%     if i < 2      
%         result = I2;
%     else
%        result = [result, I2];
%     end
%  end
%  filename = sprintf('result_45.png');
% imwrite(result,filename);
% imshow(result)
%  for i = 1:4
%     filename = sprintf('image_%d.png', i);I = (imread(filename));
%     [row, column, a] = size(I);
%     init = column/6;
%     final = column*4/6;
%     I2 = imcrop(I,[init 1 final row]);
%     if i < 2      
%         result = I2;
%     else
%        result = [result, I2];
%     end
%  end
% filename = sprintf('result_60.png');
% imwrite(result,filename);
% imshow(result)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%¨%
% figure
% imshow(im2bw(rgb2gray(rectify_image),0.9));
% figure
% times = [0.743, 1.354, 2.436, 4.088, 6.388 ,8.573];
% x = [5*5, 10*10,15*15, 20*20, 25*25, 30*30];
% % x = [5, 10, 15, 20,  25, 30];
% p = plot(x, times);
% p(1).Marker  = '*';
% p(1).LineWidth = 2;
% grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:2:3
    filename = sprintf('image_%d.png', i);I_1_color = ((imread(filename)));
    filename = sprintf('image_%d.png', i+1);I_2_color = ((imread(filename)));
    I_1 = rgb2gray(I_1_color);
    I_2 = rgb2gray(I_2_color);
    [row, column] = size(I_1);

    % imshow(I_1); hold on;
    cornersOriginal = detectSURFFeatures(I_1, 'ROI', [column*2/3, 1, column/3, row]);
    [featuresOriginal, validPtsOriginal] = extractFeatures(I_1, cornersOriginal); 
    % plot(cornersOriginal.selectStrongest(250));

    % figure; imshow(I_2); hold on;
    cornersDistorted = detectSURFFeatures(I_2, 'ROI', [1, 1, column/3, row]);
    [featuresDistorted, validPtsDistorted] = extractFeatures(I_2, cornersDistorted);
    % plot(cornersDistorted.selectStrongest(250));

    index_pairs = matchFeatures(featuresOriginal,featuresDistorted);
    matchedPtsOriginal  = validPtsOriginal(index_pairs(:,1), :);
    matchedPtsDistorted = validPtsDistorted(index_pairs(:,2), :);
    % figure; showMatchedFeatures(I_1, I_2, matchedPtsOriginal, matchedPtsDistorted);
    [tform, inlierPtsDistorted,inlierPtsOriginal ] = estimateGeometricTransform(matchedPtsDistorted, matchedPtsOriginal,'similarity', 'Confidence', 85, 'MaxNumTrials', 2000);
    % figure; showMatchedFeatures(I_1,I_2,inlierPtsOriginal,inlierPtsDistorted);

    panoram_height = row; panoram_width = column * 2;
    R = imref2d([round(panoram_height) round(panoram_width)]); 
    % tform = affine2d([1 0 0;0 1 0 ;1156.9694 1 1]);

    registered = imwarp(I_2_color,tform,'OutputView',R);
    figure
    % imshowpair(I_1,registered,'blend')
    blender = vision.AlphaBlender('Operation', 'Blend');
    final = blender(registered, I_1_color);
    filename = sprintf('panorama_1_%d_%d.jpg', i, i+1);
    imwrite(final,filename);
end

    I_1_color = ((imread('panorama_1_1_2.jpg')));
    I_2_color = ((imread('panorama_1_3_4.jpg')));
    I_1 = rgb2gray(I_1_color);
    I_2 = rgb2gray(I_2_color);
    [row, column] = size(I_2);

%     imshow(I_1); hold on;
    cornersOriginal = detectSURFFeatures(I_1, 'ROI', [column*2/3, 1, column/3, row]);
    [featuresOriginal, validPtsOriginal] = extractFeatures(I_1, cornersOriginal); 
%     plot(cornersOriginal.selectStrongest(350));

    figure; imshow(I_2); hold on;
    cornersDistorted = detectSURFFeatures(I_2, 'ROI', [1, 1, column/3, row]);
    [featuresDistorted, validPtsDistorted] = extractFeatures(I_2, cornersDistorted);
%     plot(cornersDistorted.selectStrongest(350));

    index_pairs = matchFeatures(featuresOriginal,featuresDistorted);
    matchedPtsOriginal  = validPtsOriginal(index_pairs(:,1), :);
    matchedPtsDistorted = validPtsDistorted(index_pairs(:,2), :);
%     figure; showMatchedFeatures(I_1, I_2, matchedPtsOriginal, matchedPtsDistorted);
    [tform, inlierPtsDistorted,inlierPtsOriginal ] = estimateGeometricTransform(matchedPtsDistorted, matchedPtsOriginal,'similarity', 'Confidence', 85, 'MaxNumTrials', 2000);
%     figure; showMatchedFeatures(I_1,I_2,inlierPtsOriginal,inlierPtsDistorted);

    panoram_height = row; panoram_width = column * 2;
    R = imref2d([round(panoram_height) round(panoram_width)]); 

    registered = imwarp(I_2_color,tform,'OutputView',R);
    figure
    imshowpair(I_1,registered,'blend')
    blender = vision.AlphaBlender('Operation', 'Blend');
    final = blender(registered, I_1_color);
    imwrite(final,'final_panorama.jpg');
    imshow(final)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          740        1310
%          743        1297
%          753        1284
%          768        1271
%          790        1259
%          817        1247
%          850        1237
%          888        1226
%          931        1217
%          978        1209
%         1029        1202
%         1083        1196
%         1139        1191
%         1197        1188
%         1257        1186
%         1318        1185
%         1378        1186
%         1438        1188
%         1496        1191
%         1552        1196
%         1606        1202
%         1657        1209
%         1704        1217
%         1747        1226
%         1785        1237
%         1818        1247
%         1845        1259
%         1867        1271
%         1882        1284
%         1892        1297