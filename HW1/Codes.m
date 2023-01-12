%% Assignment 2: Simulation of Learning in human brain by a linear memory

%% Producing and demonstrating Inputs
% Defining a plane parameters: ax+by+cz+d=0
a = 2;
b = -1;
c = 5;
d = -6;

% Defining input: taking some points on the plane
N = 100; % number of inputs
x = 10 * rand(N,1);
y = 10 * rand(N,1);
z = 0.2 * (-2*x + y + 6);

% Demonstrating Inputs
figure(1)
input = [x y z]
scatter3(x,y,z, 'marker', 'o' , "MarkerFaceColor", 'g', 'MarkerEdgeColor','g')
title(sprintf('inputs: %d points on 2x-y+5z-6=0 plane',N))
xlabel('x')
ylabel('y')
zlabel('z')

%% Training network
r = rand(3,3); % for not changing in each I iteration

I = 100:20:2500 % Matrix of numbers of iterations
MAError = zeros(1,length(I)); %Mean Average Error
eta = 0.0001; % Learning step

for i= 1:length(I)
    
    %Defining Weight Matrix
    w = zeros(3,3,I(i)); % Preallocating weight matrix
    w(:, :, 1) = 0.0001 * r; % initial weight 
    
    % Preallocating output and error
    output = zeros(N,3,I(i));
    e = zeros(N,3,I(i));
    
    for n = 1:I(i)
        output(:,:,n) = input(:,:) * w(:,:,n)  ;
        e(:,:,n) = input(:,:) - output(:,:,n);
        w(:,:, n+1) = w(:,:, n) + eta *  transpose(input(:,:)) * e(:,:,n);% Updating weight matrix
    end
    Number_of_Iterations =sprintf(' %d',I(i))
    weight = w(:,:,I(i))
    
    figure(i+1)
    scatter3(x,y,z, 'marker', 'o' , "MarkerFaceColor", 'g', 'MarkerEdgeColor','g')
    hold on
    scatter3(output(:,1,I(i)),output(:,2,I(i)), output(:,3,I(i)), 'marker', 'o', 'MarkerEdgeColor','r' )
    title(sprintf('number of Iterations = %d',I(i)))
    xlabel('x')
    ylabel('y')
    zlabel('z')
    legend('training inputs', 'training outputs')
    hold off
    MAError(i) = mae(e(:,:,I(i)));
    
end
