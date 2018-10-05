%% Filtro de Sobel 
% Processamento Digital de Imagens - PDI
% Docente: Prof. Dr. Pedro Pedrosa Rebouças Filho
% Discente: Carlos Estevão Bastos Sousa

%% Carregamento da imagem
imgOriginal = imread('basilicaCaninde.jpg');
imgCinza = rgb2gray(imgOriginal);

%% Execução e Plotagem
plotar(imgCinza);

%% Filtro de Sobel  
function imgSobel = FiltroSobel(filtro, imgCinza)
imgCinza = double(imgCinza);
s = size(imgCinza);
imgSobel = imgCinza * 0;

kernelVert = [  -1 0 1; 
                -2 0 2; 
                -1 0 1];
        
kernelHor = [-1 -2 -1; 
              0  0  0; 
              1  2  1];

for i = 2:s(1) - 1
    for j = 2:s(2) - 1
       prodVert = imgCinza(i-1:i+1, j-1: j+1) .* kernelVert;
       imgVert(i+1,j+1) = sum(sum(prodVert));
       prodHor = imgCinza(i-1:i+1, j-1: j+1) .* kernelHor;
       imgHor(i+1,j+1) = sum(sum(prodHor)); 
    end
end
if filtro == 1
    imgSobel = uint8(imgHor);
end

if filtro == 2
    imgSobel = uint8(imgVert);
end

if filtro == 3
    imgHor = uint8(imgHor);
    imgVert = uint8(imgVert);
    imgSobel = (imgVert + imgHor);
end
end

%% Plotagem e chamada de método
function plotar(imgCinza)
    subplot(2, 3, 1);       
    imgSobelH = FiltroSobel(1, imgCinza);
    imshow(imgSobelH);
    title('Horizontal');
    
    subplot(2, 3, 2);   
    imgSobelV = FiltroSobel(2, imgCinza);
    imshow(imgSobelV);
    title('Vertical');

    subplot(2, 3, 3);   
    imgSobel = FiltroSobel(3, imgCinza);
    imshow(imgSobel);
    title('Horizontal e Vertical');
    
    subplot(2, 3, 4);
    imgHorZ = imcrop(imgSobelH,[720 355 300 227]);
    imshow(imgHorZ);
    title('Horizontal (zoom)');

    subplot(2, 3, 5);
    imgVertZ = imcrop(imgSobelV,[720 355 300 227]);
    imshow(imgVertZ);
    title('vertical (zoom)');
       
    subplot(2, 3, 6);
    imgSobelZ = imcrop(imgSobel,[720 355 300 227]);
    imshow(imgSobelZ);
    title('Horizontal e vertical (zoom)');
end