% Get data for 9-segrity
function [Node,ra,sorttype,endkill] = getdata9(ind)

sheet = 2;
sorttype = [1 1 1 2 2 1 1 1];
endkill = [1 1 1 0 0 1 1 1];

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
    
elseif(ind == 4) %Rod 2
    Nrange = 'D2:D55';
    
elseif(ind == 5) %Rod 2
    Nrange = 'E2:E55';
    
elseif(ind == 6) %Rod 2
    Nrange = 'F2:F38';
    
elseif(ind == 7) %Rod 2
    Nrange = 'G2:G38';
    
elseif(ind == 8) %Rod 2
    Nrange = 'H2:H38';
   

end

Node = xlsread('FinalNDisp.xlsx',sheet,Nrange);
    
end