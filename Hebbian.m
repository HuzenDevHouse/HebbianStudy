
# Initial Condition
X_init = [ 1; 0; 0; 0; 0 ];
X = X_init;

W_init = eye(5);
W = W_init;

Y_init = X * W;
Y = Y_init;

# Define Factors
alpha = 0.1;
phi = 0.01;
epoch = 100;
Current = 0;

# Define Fuctions
deltaW = alpha * Y_init' * X_init;
forgettingFactor = phi * Y_init * W_init;


while ( current > epoch )
  current = current + 1;
  APR = activityProductRule(alpha, X, Y);
  FF = forgettingFactor(phi, Y, W);
  W = w + APR - FF;
  Y = X * W;
  print("Current Epoch: %d%% %s\n", current, mat2str(Y))
endwhile


function activityProductRule (alpha, X, Y)
  result = alpha * Y' * X
endfunction

function forgettingFactor (phi, Y, W)
  result = phi * Y' * W
endfunction