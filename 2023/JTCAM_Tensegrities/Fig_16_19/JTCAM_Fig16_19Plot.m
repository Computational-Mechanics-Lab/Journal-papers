clear
clc

% Add path to the matlab2tikz toolbox
addpath('../Fig_15/matlab2tikz/src');

% Filename of excel sheet with displacement data
filedisp = 'FinalNDisp.xlsx';

% Plot both deformed and undeformed configurations?
deformed = 1;

% Which tensegrity are you plotting?
tenseg = 10; %9 for 9-segrity and 10 for 10-segrity

% Provide the sheet number from where the data is being read
% Fig 16: 9, 6, 7, 8
% Fig 17: 10, 3, 4, 5
% Fig 18: 9
% Fig 19: 10
sheet = 3;

% Provide a base filename to save plotted files
opfilename = 'Fig17';

% Range for coordinate data in the excel sheet
% Please check the excel sheet once before running
if tenseg == 9
    Xrefrange = 'E10:G339';
elseif tenseg == 10
    Xrefrange = 'E10:G412';
end

% Range for the displacement data in the excel sheet
% Please check the excel sheet once before running
if tenseg == 9
    Urange = 'Q10:S339';
elseif tenseg == 10
    Urange = 'Q10:S412';
end

% Read of the excel book for the coordinate data
Xref = xlsread(filedisp,sheet,Xrefrange);

% Read of the excel book for the nodal displacement data
U = xlsread(filedisp,sheet,Urange);

% Initialize the scaling factor for plotting deformed object
factor = linspace(0,1,100);

% Starting point of for loop
% For undeformed configuration = 1
% For deformed shapes in figures 16 and 17 = 50
% For figures 18 and 19 = 20
startloop = 50;

% Increment for for-loop
% For figures 16 an 17 = 49
% For figures 18 and 19 = 10
increment = 49;

% Range of the for-loop
% 1: For only un-deformed plot
% 100: For upto full deformation
if deformed == 1
    range = 100;
elseif deformed == 0
    range = 1;
end

% Loop to get the plots with different displacements
for vid = startloop:increment:range

    % Get the deformed configuration
    X = Xref + factor(vid)*U;

    % Choose range
    if(tenseg == 9)
        lim = 8;
    elseif(tenseg == 10)
        lim = 13;
    end

    if deformed == 1

    % Plot the deformed shape
    % For each member get nodal data
    for ii = 1:lim
        Xdata = []; P =[]; is = []; V = [];

        % Get tensegrity data
        if(tenseg ==9)
            [Node,radius,sorttype,endkill] = getdata9(ii);
        elseif(tenseg == 10)
            [Node,radius,sorttype,endkill] = getdata10(ii);
        end

        % Extract data
        Xdata(:,1) = X(Node(:),1);
        Xdata(:,2) = X(Node(:),2);
        Xdata(:,3) = X(Node(:),3);

        if(sorttype(ii) == 1) % by distance

            % Get distance from first point
            P = Xdata - Xdata(1,:);
            [~,is] = sort(sqrt(P(:,1).^2+P(:,2).^2+P(:,3).^2));

        elseif(sorttype(ii) == 2) %By angle

            % Get mean position
            XdataM = mean(Xdata,1);
            P = Xdata - XdataM;
            [~,~,V] = svd(P,0);

            % get angles
            [~,is] = sort(atan2(P*V(:,1),P*V(:,2)));

        end

        % Sort Xdata
        Xdata = Xdata(is([1:end 1]),:);

        % Remove last item
        if(endkill(ii) == 1)
            Xdata = Xdata(1:end-1,:);
        elseif(endkill(ii) == 0)
            Node = Node(is([1:end 1]),:);
        end

        % Get tube data
       [x,y,z]=tubeplot(Xdata',radius);


    % Plot
    figure(1)
    hold on;
%     surf(x,y,z,'linestyle','--','EdgeColor','black');
    surf(x,y,z,'EdgeColor','black');
    hold off

    end

    end

    % Plot the undeformed shape
    % For each member get nodal data
    for ii = 1:lim
        Xdata = []; P =[]; is = []; V = [];

        % Get tensegrity data
        if(tenseg ==9)
            [Node,radius,sorttype,endkill] = getdata9(ii);
        elseif(tenseg == 10)
            [Node,radius,sorttype,endkill] = getdata10(ii);
        end

        % Extract data
        Xdata(:,1) = Xref(Node(:),1);
        Xdata(:,2) = Xref(Node(:),2);
        Xdata(:,3) = Xref(Node(:),3);

        if(sorttype(ii) == 1) % by distance

            % Get distance from first point
            P = Xdata - Xdata(1,:);
            [~,is] = sort(sqrt(P(:,1).^2+P(:,2).^2+P(:,3).^2));

        elseif(sorttype(ii) == 2) %By angle

            % Get mean position
            XdataM = mean(Xdata,1);
            P = Xdata - XdataM;
            [~,~,V] = svd(P,0);

            % get angles
            [~,is] = sort(atan2(P*V(:,1),P*V(:,2)));

        end

        % Sort Xdata
        Xdata = Xdata(is([1:end 1]),:);

        % Remove last item
        if(endkill(ii) == 1)
            Xdata = Xdata(1:end-1,:);
        elseif(endkill(ii) == 0)
            Node = Node(is([1:end 1]),:);
        end

        % Get tube data
       [x,y,z]=tubeplot(Xdata',radius);

    % Plot
    figure(1)
    hold on;
    surf(x,y,z,'EdgeColor','red');
    hold off

    end

    % Clean up the figure
    figure(1)
    axis equal;
    hold off;
    material metal;
    camlight headlight;
    if(tenseg == 9)
        axis([-1.5 1.5 -1.5 1.5 -0.1 3.75 ])
        view(-103.1641,-0.6760);
    elseif(tenseg == 10)
        view(-27.6682,29.2166);
        axis([-2 2 -2 2 -2 2 ])
    end
    set(gca,'Fontsize',24);

    ax = gca;
    % Requires R2020a or later
    if(vid < 10)
        opfilenamevid = [opfilename,'0',num2str(vid)];
    else
        opfilenamevid = [opfilename,num2str(vid)];
    end

    % Save as SVG
    h = gcf();
    h.Renderer = "painters";
    print([opfilenamevid,'.svg'],"-dsvg");

    % Set the properties of the axis
%     xaxisproperties= get(gca, 'XAxis');
%     xaxisproperties.TickLabelInterpreter = 'latex'; % latex for x-axis
%     yaxisproperties= get(gca, 'YAxis');
%     yaxisproperties.TickLabelInterpreter = 'latex';

    % Export a TIKZ 
%     matlab2tikz([opfilenamevid,'.tex'],'width', '\fwidth');

    % Close figure
    close(figure(1))

end
