%% Filtro Prewitt
% Processamento Digital de Imagens - PDI
% Docente: Prof. Dr. Pedro Pedrosa Rebouças Filho
% Discente: Carlos Estevão Bastos Sousa

%% Carregamento da imagem
imgOriginal = imread('basilicaCaninde.jpg');
imgCinza = rgb2gray(imgOriginal);

%% Execução e Plotagem
plotar(imgCinza);

%% Filtro Laplaciano
function imgPrewitt = FiltroPrewitt(filtro, imgCinza)
horizontal = [-1, 0, 1;
              -1, 0, 1;
              -1, 0, 1];
          
vertical = [-1,-1,-1;
            0,0,0;
            1,1,1];

[linhaIm,colunaIm] = size(imgCinza);
imgTemp = zeros(linhaIm + 2, colunaIm + 2);
imgTemp(2 : linhaIm + 1, 2 : colunaIm + 1) = imgCinza;
imgCinza = imgTemp;
imgVert = zeros(size(imgCinza));
imgHor = zeros(size(imgCinza));
x = linhaIm - 3;
y = colunaIm -3;
for i = 1 : x
    for j = 1 : y
        pixel =  imgCinza(i : i + 2,j : j + 2);
        prodH = pixel .* horizontal;
        imgVert(i+1,j+1) = sum(sum(prodH));
        prodV = pixel .* vertical;
        imgHor(i+1,j+1) = sum(sum(prodV));
    end
end

if filtro == 1
    imgHor = uint8(imgHor);
    imgPrewitt = imgHor;   
end

if filtro == 2
    imgVert = uint8(imgVert);
    imgPrewitt = imgVert;
end

if filtro == 3
    imgVert = uint8(imgVert);
    imgHor = uint8(imgHor);
    imgPrewitt = imgVert + imgHor;    
end
end

%% Execução e Plotagem
function plotar(imgCinza)
figure (1)
subplot(1, 2, 1);
imshow(imgCinza);
title('Níveis cinza');

subplot(1, 2, 2);
imgCinzaM = imcrop(imgCinza,[720 355 300 227]);
imshow(imgCinzaM);
title('Níveis cinza com zoom');

figure (2)
subplot(3, 2, 1);
imgPrewittH = FiltroPrewitt(1, imgCinza);
imshow(imgPrewittH);
title('Com kernel horizontal');

subplot(3, 2, 2);
imgPrewittH = imcrop(imgPrewittH,[720 355 300 227]);
imshow(imgPrewittH);
title('Com kernel horizontal (zoom)');

subplot(3, 2, 3);
imgPrewittV = FiltroPrewitt(2, imgCinza);
imshow(imgPrewittV);
title('Com kernel vertical');

subplot(3, 2, 4);
imgPrewittV = imcrop(imgPrewittV,[720 355 300 227]);
imshow(imgPrewittV);
title('Com kernel vertical (zoom)');

subplot(3, 2, 5);
imgPrewitt = FiltroPrewitt(3, imgCinza);
imshow(imgPrewitt);
title('Com kernel horizontal e vertical');

subplot(3, 2, 6);
imgPrewitt = imcrop(imgPrewitt,[720 355 300 227]);
imshow(imgPrewitt);
title('Com kernel horizontal e vertical (zoom)');


end

