%% Different Equations of State to find molar volumes
% Various temperatures, pressures, and acentric factors 
%% Van der Waals equation of state

% Given values
R = 0.08206;   % Ideal gas constant, L·atm/(mol·K)
T = 444.4;     % Temperature, K
P = 5;         % Pressure, atm

Tc = 500;      % Critical temperature, K
Pc = 30;      % Critical pressure, atm

% Van der Waals parameters calculated from critical properties
a = (27/64)*(R^2*Tc^2/Pc);
b = (1/8)*(R*Tc/Pc);

% Define symbolic molar volume
syms V

% Van der Waals equation:
% P = R*T/(V-b) - a/V^2
%
% Cubic form:
% P*V^3 - (P*b + R*T)*V^2 + a*V - a*b = 0

equation = P*V^3- (P*b + R*T)*V^2 + a*V- a*b == 0;

% Solve for molar volume
V_solution = solve(equation, V);
V_all = double(V_solution);

% Select real roots
tolerance = 1e-8;
V_real = real(V_all(abs(imag(V_all)) < tolerance));

% Physical molar volumes must be greater than b
V_physical = V_real(V_real > b);

disp('All mathematical roots (L/mol):')
disp(V_all)

disp('Real physical molar volumes (L/mol):')
disp(V_physical)


%% 7.17 Part c — Soave–
% Given values
R = 0.08206;   % Ideal gas constant, L·atm/(mol·K)
T = 444.4;     % Temperature, K
P = 5;         % Pressure, atm

Tc = 500;      % Critical temperature, K
Pc = 30;       % Critical pressure, atm
omega = 0.45;   % Acentric factor

% Reduced temperature
Tr = T/Tc;

% Soave kappa correlation
kappa = 0.480 + 1.574*omega - 0.176*omega^2;

% Soave–
a_c = 0.42748*R^2*Tc^2/Pc;
alpha = (1 + kappa*(1 - sqrt(Tr)))^2;
a = a_c*alpha;

b = 0.08664*R*Tc/Pc;

% Define symbolic molar volume
syms V

% Soave:
% P = R*T/(V-b) - a/[V*(V+b)]
%
% Cubic form:
% P*V^3 - R*T*V^2 + (a - R*T*b - P*b^2)*V - a*b = 0

equation = P*V^3- R*T*V^2+ (a - R*T*b - P*b^2)*V - a*b == 0;

% Solve for molar volume
V_solution = solve(equation, V);
V_all = double(V_solution);

% Select real roots
tolerance = 1e-8;
V_real = real(V_all(abs(imag(V_all)) < tolerance));

% Physical molar volumes must be greater than b
V_physical = V_real(V_real > b);


disp('All mathematical roots (L/mol):')
disp(V_all)

disp('Real physical molar volumes (L/mol):')
disp(V_physical)
%% Peng-Robinson
% Given values
R = 0.08206;   % Ideal gas constant, L·atm/(mol·K)
T = 444.4;     % Temperature, K
P = 5;         % Pressure, atm

Tc = 500;      % Critical temperature, K
Pc = 30;      % Critical pressure, atm
    omega = 0.45;   % Acentric factor

% Reduced temperature
Tr = T/Tc;

% Peng–Robinson kappa
kappa = 0.37464 + 1.54226*omega - 0.269932*omega^2;

% Peng–Robinson parameters
a_c = 0.45724*R^2*Tc^2/Pc;
alpha = (1 + kappa*(1 - sqrt(Tr)))^2;
a = a_c*alpha;

b = 0.07780*R*Tc/Pc;

% Define symbolic molar volume
syms V

% Peng–Robinson cubic equation
equation = P*V^3 + (P*b - R*T)*V^2 + (a - 2*R*T*b - 3*P*b^2)*V  + (P*b^3 + R*T*b^2 - a*b) == 0;

% Solve for molar volume
V_solution = solve(equation, V);
V_all = double(V_solution);

% Select real roots
tolerance = 1e-8;
V_real = real(V_all(abs(imag(V_all)) < tolerance));

% A physical Peng–Robinson volume must be greater than b
V_physical = V_real(V_real > b);

disp('All mathematical roots (L/mol):')
disp(V_all)

disp('Real physical molar volumes (L/mol):')
disp(V_physical)
%% 7.19 a
% Given values
R = 0.08206;   % Ideal gas constant, L·atm/(mol·K)
T = 562.05;     % Temperature, K
P = 48.314;         % Pressure, atm

Tc = 562.05;      % Critical temperature, K
Pc = 48.314;      % Critical pressure, atm
omega = 0.210;   % Acentric factor

% Reduced temperature
Tr = T/Tc;

% Peng–Robinson kappa
kappa = 0.37464 + 1.54226*omega - 0.269932*omega^2;

% Peng–Robinson parameters
a_c = 0.45724*R^2*Tc^2/Pc;
alpha = (1 + kappa*(1 - sqrt(Tr)))^2;
a = a_c*alpha;

b = 0.07780*R*Tc/Pc;

% Define symbolic molar volume
syms V

% Peng–Robinson cubic equation
equation = P*V^3 + (P*b - R*T)*V^2 + (a - 2*R*T*b - 3*P*b^2)*V  + (P*b^3 + R*T*b^2 - a*b) == 0;

% Solve for molar volume
V_solution = solve(equation, V);
V_all = double(V_solution);

% Select real roots
tolerance = 1e-8;
V_real = real(V_all(abs(imag(V_all)) < tolerance));

% A physical Peng–Robinson volume must be greater than b
V_physical = V_real(V_real > b);

disp('All mathematical roots (L/mol):')
disp(V_all)

disp('Real physical molar volumes (L/mol):')
disp(V_physical)
%% 7.19 b
% Given values
R = 0.08206;   % Ideal gas constant, L·atm/(mol·K)
T = 277.78;     % Temperature, K
P = 1;         % Pressure, atm

Tc = 562.05;      % Critical temperature, K
Pc = 48.314;      % Critical pressure, atm
omega = 0.210;   % Acentric factor

% Reduced temperature
Tr = T/Tc;

% Peng–Robinson kappa
kappa = 0.37464 + 1.54226*omega - 0.269932*omega^2;

% Peng–Robinson parameters
a_c = 0.45724*R^2*Tc^2/Pc;
alpha = (1 + kappa*(1 - sqrt(Tr)))^2;
a = a_c*alpha;

b = 0.07780*R*Tc/Pc;

% Define symbolic molar volume
syms V

% Peng–Robinson cubic equation
equation = P*V^3 + (P*b - R*T)*V^2 + (a - 2*R*T*b - 3*P*b^2)*V  + (P*b^3 + R*T*b^2 - a*b) == 0;

% Solve for molar volume
V_solution = solve(equation, V);
V_all = double(V_solution);

% Select real roots
tolerance = 1e-8;
V_real = real(V_all(abs(imag(V_all)) < tolerance));

% A physical Peng–Robinson volume must be greater than b
V_physical = V_real(V_real > b);

disp('All mathematical roots (L/mol):')
disp(V_all)

disp('Real physical molar volumes (L/mol):')
disp(V_physical)

%% 7.19 d
% Given values
R = 0.08206;   % Ideal gas constant, L·atm/(mol·K)
T = 444.4;     % Temperature, K
P = 4;         % Pressure, atm

Tc = 562.05;      % Critical temperature, K
Pc = 48.314;      % Critical pressure, atm
omega = 0.20;   % Acentric factor

% Reduced temperature
Tr = T/Tc;

% Peng–Robinson kappa
kappa = 0.37464 + 1.54226*omega - 0.269932*omega^2;

% Peng–Robinson parameters
a_c = 0.45724*R^2*Tc^2/Pc;
alpha = (1 + kappa*(1 - sqrt(Tr)))^2;
a = a_c*alpha;

b = 0.07780*R*Tc/Pc;

% Define symbolic molar volume
syms V

% Peng–Robinson cubic equation
equation = P*V^3 + (P*b - R*T)*V^2 + (a - 2*R*T*b - 3*P*b^2)*V  + (P*b^3 + R*T*b^2 - a*b) == 0;

% Solve for molar volume
V_solution = solve(equation, V);
V_all = double(V_solution);

% Select real roots
tolerance = 1e-8;
V_real = real(V_all(abs(imag(V_all)) < tolerance));

% A physical Peng–Robinson volume must be greater than b
V_physical = V_real(V_real > b);

disp('All mathematical roots (L/mol):')
disp(V_all)

disp('Real physical molar volumes (L/mol):')
disp(V_physical)
%% graphing
r = [0.390, 0.449, 0.500];       % Distance, nm
U = [0.769, -1.000, -0.774];     % Energy, kJ/mol

figure;
plot(r, U, 'ko-','LineWidth', 2, 'MarkerFaceColor', 'k', 'MarkerSize', 7);

xlabel('r (nm)');
ylabel('U (kJ/mol)');
title('Potential Energy vs. Distance');

grid on;
xlim([0.37 0.52]);
ylim([-1.2 1.0]);

