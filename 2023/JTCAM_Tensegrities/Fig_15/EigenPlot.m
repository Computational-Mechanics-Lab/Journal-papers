clear
clc

addpath(genpath('../../matlab2tikz'))

% Load the final data (rad/2) 
% Col 1 = -100deg
% Col 2 = 210 deg
% Col 3 = 10-string
% Modulus = 1.12e11, 1e10, 1e9, 1e7
load('EigenData.mat');

x = [7 8 9 10 11 12];

% Mod = 1.12e11
plot(x,EigenData(7:12,2),'-o');
axis square
hold on
plot(x,EigenData(7:12,3),'-x',...
    'MarkerEdgeColor' , [.2 .2 .2], ...
    'MarkerFaceColor' , [.7 .7 .7]);
legend('9-segrity','10-segrity','Location','SouthEast');
xlabel('Mode number');
ylabel('Frequency');
matlab2tikz_sjs('Fig15a.tikz','type','standardSingleColumn');
close all
%stitle('String modulus = 1.12e11');
% ax = gca;
% ax.XAxis.FontSize = 20;
% ax.YAxis.FontSize = 20;
% ax.Title.FontSize = 20;


% set(gca,'FontName', 'Helvetica' );
% xlabel('Mode number');
% ylabel('Frequency');
% title('String modulus = 1.12e11');    
% set(gca, ...
%   'Box'         , 'off'     , ...
%   'TickDir'     , 'out'     , ...
%   'TickLength'  , [.02 .02] , ...
%   'XMinorTick'  , 'off'      , ...
%   'YMinorTick'  , 'on'      , ...
%   'XColor'      , [.3 .3 .3], ...
%   'YColor'      , [.3 .3 .3], ...
%   'YTick'       , 0:2:10);



% % Mod = 1e10
% subplot(2,2,2)
plot(x,EigenData(7:12,5),'-o');
axis square
hold on
plot(x,EigenData(7:12,6),'-x');
legend('9-segrity','10-segrity','Location','SouthEast');
% ax = gca;
% ax.XAxis.FontSize = 20;
% ax.YAxis.FontSize = 20;
% ax.Title.FontSize = 20;
xlabel('Mode number');
ylabel('Frequency');
matlab2tikz_sjs('Fig15b.tikz','type','standardSingleColumn');
close all
% title('String modulus = 1e10');
% set(gca,'TickLabelInterpreter','Latex')
% 
% % Mod = 1e9
% subplot(2,2,3)
plot(x,EigenData(7:12,8),'-o');
axis square
hold on
plot(x,EigenData(7:12,9),'-x');
legend('9-segrity','10-segrity','Location','SouthEast');
% ax = gca;
% ax.XAxis.FontSize = 20;
% ax.YAxis.FontSize = 20;
% ax.Title.FontSize = 20;
xlabel('Mode number');
ylabel('Frequency');
matlab2tikz_sjs('Fig15c.tikz','type','standardSingleColumn');
close all
% title('String modulus = 1e09','interpreter','latex');
% set(gca,'TickLabelInterpreter','Latex')
% 
% % Mod = 1e7
% subplot(2,2,4)
plot(x,EigenData(7:12,11),'-o');
axis square
hold on
plot(x,EigenData(7:12,12),'-x');
legend('9-segrity','10-segrity','Location','SouthEast');
% ax = gca;
% ax.XAxis.FontSize = 20;
% ax.YAxis.FontSize = 20;
% ax.Title.FontSize = 20;
xlabel('Mode number','interpreter','latex');
ylabel('Frequency','interpreter','latex');
matlab2tikz_sjs('Fig15d.tikz','type','standardSingleColumn');
close all
% title('String modulus = 1e07','interpreter','latex');
% set(gca,'TickLabelInterpreter','Latex')
% set(gca, 'PaperPositionMode', 'auto');

