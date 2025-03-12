clf; clc;
Nof = [9 11 16 21 27 30]';
X = [1.66 1.12 0.83 0.62 0.51 0.47]';
f1 = fit(NoF,X,'power1');

scatter(Nof,X,'*',DisplayName='raw data');
hold on;

func1 = cfit(f1,f1.a,f1.b);
plot(func1);


legend=['raw data', 'linear fit', 'non-linear fit']
