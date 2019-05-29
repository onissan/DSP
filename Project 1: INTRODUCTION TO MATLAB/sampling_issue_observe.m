% Generate each sinusoidal based on on Table #___
[t1,x1] = cosine_gen(1,10,200,pi/3);
[t2,x2] = cosine_gen(1,10,60,pi/3);
[t3,x3] = cosine_gen(1,10,20,pi/3);
[t4,x4] = cosine_gen(1,10,20,pi/2);
[t5,x5] = cosine_gen(1,10,12,pi/3);

% Plot the sinusoidal genrated on the same plot 
figure(1)
hold all
plot(t1,x1, 'b', 'LineWidth', 2);
plot(t2,x2, 'r', 'LineWidth', 3);
plot(t3,x3, 'g', 'LineWidth', 2);
plot(t4,x4,'g', 'LineWidth', 5);
plot(t5,x5, 'r', 'LineWidth', 6);

xlabel('Digital Frequency  F (cycles/sample)')
ylabel('x(t)')


% Closer look at case 3 and 4
figure(2)
subplot(2,1,1)
plot(t3,x3, 'g', 'LineWidth', 2);
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('x(t)')

subplot(2,1,2)
plot(t4,x4, 'g', 'LineWidth', 2);
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('x(t)')


% Big sampling rate = reconstruction of analog signal
[t6,x6] = cosine_gen(1,10,20000,pi/3);
[t7,x7] = cosine_gen(1,10,20000,pi/2);

% Plot "analog" signal versus each sampled signal
figure(3)
subplot(3,2,1)
hold all
plot(t6,x6);
stem(t1,x1)
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('x(t)')

subplot(3,2,2)
hold all
plot(t6,x6,t2,x2);
stem(t2,x2)
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('x(t)')

subplot(3,2,3)
hold all
plot(t6,x6);
stem(t3,x3, 'LineWidth', 2)
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('x(t)')

subplot(3,2,4)
hold all
plot(t7,x7);
stem(t4,x4, 'LineWidth', 2)
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('x(t)')

subplot(3,2,5)
hold all
plot(t6,x6);
stem(t5,x5, 'LineWidth', 2)
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('x(t)')

