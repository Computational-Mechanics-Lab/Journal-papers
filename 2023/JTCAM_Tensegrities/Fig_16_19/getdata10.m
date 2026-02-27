% Get data for 10-segrity
function [Node,ra,sorttype,endkill] = getdata10(ind)

sheet = 1;
sorttype = [1 1 1 1 1 1 1 1 1 1 1 1 1];
endkill = [1 1 1 1 1 1 1 1 1 1 1 1 1];

% Radius
if(ind < 4)
    ra = 0.01;
else
    ra = 0.001;
end

% Nodal range
if(ind == 1) %Rod 1
    Nrange = 'A2:A42';
    
elseif(ind == 2) %Rod 2
    Nrange = 'B2:B42';
    
elseif(ind == 3) %Rod 2
    Nrange = 'C2:C42';
    
elseif(ind == 4) %S1
    Nrange = 'D2:D34';
    
elseif(ind == 5) %S2
    Nrange = 'E2:E34';
    
elseif(ind == 6) %S3
    Nrange = 'F2:F28';
    
elseif(ind == 7) %S4
    Nrange = 'G2:G28';
    
elseif(ind == 8) %S5
    Nrange = 'H2:H34';
    
elseif(ind == 9) %S6
    Nrange = 'I2:I28';

elseif(ind == 10) %S7
    Nrange = 'J2:J34';
   
elseif(ind == 11) %S8
    Nrange = 'K2:K34';

elseif(ind == 12) %S9
    Nrange = 'L2:L28';
    
elseif(ind == 13) %S10
    Nrange = 'M2:M28';

end

Node = xlsread('FinalNDisp.xlsx',sheet,Nrange);
    
end