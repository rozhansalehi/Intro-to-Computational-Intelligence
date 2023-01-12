%% Test
%defining test input
N_t = 100; % number of inputs
x_t = 20 * rand(N_t,1);
y_t = 20 * rand(N_t,1);
z_t = 0.2 * (-2*x + y + 6);
input_t = [x_t y_t z_t]

I = 100:20:2500 % Matrix of numbers of iterations
MAError_t = zeros(1,length(I));

for i= 1:length(I)
    
    % Preallocating output and error
    output_t = zeros(N_t,3,I(i));
    e_t = zeros(N,3,I(i));
    
    output_t(:,:,I(i)) = input_t(:,:) * w(:,:,I(i))  ;
    e_t(:,:,I(i)) = input_t(:,:) - output_t(:,:,I(i));
    
    figure(i+255)
    scatter3(x_t,y_t,z_t, 'marker', 'o' , "MarkerFaceColor", 'c', 'MarkerEdgeColor','c')
    hold on
    scatter3(output_t(:,1,I(i)),output_t(:,2,I(i)), output_t(:,3,I(i)), 'marker', 'o' ,'MarkerEdgeColor','m')
    title(sprintf('number of Iterations = %d',I(i)))
    xlabel('x')
    ylabel('y')
    zlabel('z')
    legend('test inputs', 'test outputs')
    hold off
    MAError_t(i) = mae(e_t(:,:,I(i)));
    
end

figure('name','validation')
plot(I,MAError)
hold on
plot(I,MAError_t)
grid on
title('Validation and Training Diagram')
xlabel('Number of Iterations')
ylabel('Mean Absolute Error')
legend('Training', 'Validation')

