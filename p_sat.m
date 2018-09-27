function p =p_sat(T)
%antonie equation
%fit based on textbook,T(drgree),p(kPa)
A =       7.151;
B =        1711;
C =       232.2;
p=10^(A-B/(T+C));
end

