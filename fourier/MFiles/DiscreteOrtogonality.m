

ts = 0:0.01:2;
dt = 2/5;
stepAprox = @(dt, f) @(t) f(floor(t/dt)*dt);



ec0d = stepAprox(dt, @(t) t*0 + 1);     % cos(t*pi*0) == 0, T0 jest dowolny
es0d = stepAprox(dt, @(t) t*0);         % cos(t*pi*0) == 1, T0 jest dowolny
ec1d = stepAprox(dt, @(t) cos(t*pi*1)); % T1 == [0, 2*pi/pi] == [0, 2]
es1d = stepAprox(dt, @(t) sin(t*pi*1)); % T1 == [0, 2*pi/pi] == [0, 2]
ec2d = stepAprox(dt, @(t) cos(t*pi*2)); % T2 == [0, 2*pi/2/pi] == [0, 1] == 1/2 * T1
es2d = stepAprox(dt, @(t) sin(t*pi*2)); % T2 == [0, 2*pi/2/pi] == [0, 1] == 1/2 * T1
ec3d = stepAprox(dt, @(t) cos(t*pi*3)); % T3 == [0, 2*pi/3/pi] == [0, 2/3] == 1/3 * T1
es3d = stepAprox(dt, @(t) sin(t*pi*3)); % T3 == [0, 2*pi/3/pi] == [0, 2/3] == 1/3 * T1
ec4d = stepAprox(dt, @(t) cos(t*pi*4)); % T4 == [0, 2*pi/4/pi] == [0, 1/2] == 1/4 * T1
es4d = stepAprox(dt, @(t) sin(t*pi*4)); % T4 == [0, 2*pi/4/pi] == [0, 1/2] == 1/4 * T1
ec5d = stepAprox(dt, @(t) cos(t*pi*5)); % T5 == [0, 2*pi/5/pi] == [0, 2/5] == 1/5 * T1
es5d = stepAprox(dt, @(t) sin(t*pi*5)); % T5 == [0, 2*pi/5/pi] == [0, 2/5] == 1/5 * T1


ec1d_ec1d = quad(@(t) ec1d(t).*ec1d(t), 0, 2)
ec1d_ec2d = quad(@(t) ec1d(t).*ec2d(t), 0, 2)
ec1d_ec3d = quad(@(t) ec1d(t).*ec3d(t), 0, 2)
ec1d_ec4d = quad(@(t) ec1d(t).*ec4d(t), 0, 2)
ec1d_ec5d = quad(@(t) ec1d(t).*ec5d(t), 0, 2)


5*555

ec0 = @(t) t*0 + 1;     % cos(t*pi*0) == 0, T0 jest dowolny
es0 = @(t) t*0;         % sin(t*pi*0) == 1, T0 jest dowolny
ec1 = @(t) cos(t*pi*1); % T1 == [0, 2*pi/pi] == [0, 2]
es1 = @(t) sin(t*pi*1); % T1 == [0, 2*pi/pi] == [0, 2]
ec2 = @(t) cos(t*pi*2); % T2 == [0, 2*pi/2/pi] == [0, 1] == 1/2 * T1
es2 = @(t) sin(t*pi*2); % T2 == [0, 2*pi/2/pi] == [0, 1] == 1/2 * T1
ec3 = @(t) cos(t*pi*3); % T3 == [0, 2*pi/3/pi] == [0, 2/3] == 1/3 * T1
es3 = @(t) sin(t*pi*3); % T3 == [0, 2*pi/3/pi] == [0, 2/3] == 1/3 * T1
ec4 = @(t) cos(t*pi*4); % T4 == [0, 2*pi/4/pi] == [0, 1/2] == 1/4 * T1
es4 = @(t) sin(t*pi*4); % T4 == [0, 2*pi/4/pi] == [0, 1/2] == 1/4 * T1
ec5 = @(t) cos(t*pi*5); % T5 == [0, 2*pi/5/pi] == [0, 2/5] == 1/5 * T1
es5 = @(t) sin(t*pi*5); % T5 == [0, 2*pi/5/pi] == [0, 2/5] == 1/5 * T1


ec1_ec1 = quad(@(t) ec1(t).*ec1(t), 0, 2)
ec1_ec2 = quad(@(t) ec1(t).*ec2(t), 0, 2)
ec1_ec3 = quad(@(t) ec1(t).*ec3(t), 0, 2)
ec1_ec4 = quad(@(t) ec1(t).*ec4(t), 0, 2)
ec1_ec5 = quad(@(t) ec1(t).*ec5(t), 0, 2)

