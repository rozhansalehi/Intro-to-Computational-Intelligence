%% Assignment 3: Implementing AND, OR, XOR logic gates using single-layer perceptron
% Input Matrix
X = [0 0 1;
     0 1 1;
     1 0 1;
     1 1 1]

% Desired output Matrix
D = [0 0 0;
     0 1 1;
     0 1 1;
     1 1 0]
 
I = 20; % Number of Iterations
eta = 0.0001; % Learning step

%Defining Weight Matrix
w = zeros(3,3,I); % Preallocating weight matrix
w(:, :, 1) = 0.001 * rand(3,3); % initial weight 

% Preallocating Matrices 
Y = zeros(4,3,I); % Output Matrix
e = zeros(4,3,I); % Error Matrix for each epoch 
E_AND = zeros(1,I); % Error Matrix for AND output 
E_OR = zeros(1,I); % Error Matrix for OR output 
E_XOR = zeros(1,I); % Error Matrix for XOR output 

for n = 1:I
    Y(:,:,n) = step_function(X(:,:) * w(:,:,n));
    e(:,:,n) = D(:,:) - Y(:,:,n);
    S = sum(e(:,:,n));
    E_AND(n) = 0.5 * S(1)^2;
    E_OR(n) = 0.5 * S(2)^2;
    E_XOR(n) = 0.5 * S(3)^2;
    w(:,:, n+1) = w(:,:, n) + eta *  transpose(X(:,:)) * e(:,:,n);% Updating weight matrix
end
w
Y
plot(1:I, E_AND,'LineWidth', 2)
hold on
plot(1:I, E_OR,'LineWidth', 2)
hold on
plot(1:I, E_XOR,'LineWidth', 2)
legend('AND gate error','OR gate error','XOR gate error')
xlabel('Number of Iterations')
ylabel('Half of square Error')
grid on
