%% Equalização do Histograma
% Processamento Digital de Imagens - PDI
% Docente: Prof. Dr. Pedro Pedrosa Rebouças Filho
% Discente: Carlos Estevão Bastos Sousa

%% Carregamento da imagem
imgOriginal = imread('lena.png');
imgCinza = rgb2gray(imgOriginal);

%% Execução e plotagem
plotar(imgCinza);

%% Equalizar Histograma
function imgEqua = equalizarHist(imgCinza)
[linha, coluna] = size(imgCinza);
imgEqua = uint8(zeros(linha, coluna));
n = linha * coluna; 
f = zeros(256, 1);      
prob = zeros(256, 1);    
probTons = zeros(256, 1);    
somatorio = zeros(256, 1);    
novoTom = zeros(256, 1);    

for i = 1: linha
    for j = 1: coluna
        valor = imgCinza(i, j);
        f(valor + 1) = f(valor + 1) + 1;
        prob(valor + 1) = f(valor+1)/n;
    end
end

soma = 0;
L = 255;

for i = 1: size(prob)
    soma = soma + f(i);
    somatorio(i) = soma;
    probTons(i) = somatorio(i)/n;
    novoTom(i) = round(probTons(i) * L);
end

for i = 1: linha
    for j = 1: coluna
        imgEqua(i, j) = novoTom(imgCinza(i,j) + 1);
    end
end

end
%% Execução e Plotagem
function plotar(imgCinza)
subplot(2,2,1)
imshow(imgCinza);

subplot(2,2,2)
histogram(imgCinza);

subplot(2,2,3)
imgEqua = equalizarHist(imgCinza);
imshow(imgEqua);

subplot(2,2,4)
histogram(imgEqua);
end