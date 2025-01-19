clear, clc, close all

% signal parameters
fs = 44100;     % sampling frequency, Hz         
m = 256;        % number of the rows of the noise matrix
n = 256;        % number of the columns of the noise matrix

% noise generation
xred = rednoise(m, n); 
xpink = pinknoise(m, n); 
xblue = bluenoise(m, n); 
xviolet = violetnoise(m, n); 

% visual presentation
figure(1)
colormap gray
subplot(2, 2, 1)
imagesc(xred)
title('Red noise')
subplot(2, 2, 2)
imagesc(xpink)
title('Pink noise')
subplot(2, 2, 3)
imagesc(xblue)
title('Blue noise')
subplot(2, 2, 4)
imagesc(xviolet)
title('Violet noise')