% Projector-Camera Stereo calibration parameters:

% Intrinsic parameters of camera:
fc_left = [ 2407.362394 2407.339557 ]; % Focal Length
cc_left = [ 1216.771866 1028.735612 ]; % Principal point
alpha_c_left = [ 0.000000 ]; % Skew
kc_left = [ -0.129575 0.305964 0.000906 -0.000141 0.000000 ]; % Distortion

% Intrinsic parameters of projector:
fc_right = [ 1720.777441 1722.903287 ]; % Focal Length
cc_right = [ 524.961824 389.871636 ]; % Principal point
alpha_c_right = [ 0.000000 ]; % Skew
kc_right = [ -0.124634 0.748218 0.001245 0.000137 0.000000 ]; % Distortion

% Extrinsic parameters (position of projector wrt camera):
om = [ 0.002813 -0.268266 -0.002422 ]; % Rotation vector
T = [ 135.606907 27.496792 245.241503 ]; % Translation vector
