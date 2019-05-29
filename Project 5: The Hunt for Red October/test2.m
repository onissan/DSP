 
load SubSonar.mat %load all the signals
 
%% Starboard Beam Direction - Cxy
 
Cxy1 = NormCrossCorrelate(StarboardBeamEcho,LosAngelesSubEcho);
 
figure(1);
plot(abs(hilbert(Cxy1)));
title('Cxy for US Los Angeles Class Attack Submarine & Starboard Beam Echo')
ylabel('Signal Magnitude')
xlabel('Index')
xlim([0 (length(StarboardBeamEcho)-1)])
 
%% Aft Direction - Cxy
 
Cxy2 = NormCrossCorrelate(DeadAsternEcho,AkulaSubEcho);
 
figure(2);
plot(abs(hilbert(Cxy2)));
title('Cxy for Russian Akula? Class Attack Submarine & Aft Echo')
ylabel('Signal Magnitude')
xlabel('Index')
xlim([0 (length(DeadAsternEcho)-1)])
 
 
%% Port Quarter Direction - Cxy
 
Cxy3 = NormCrossCorrelate(PortQuarterEcho,TyphoonSubEcho);
 
figure(3);
plot(abs(hilbert(Cxy3)));
title('Cxy for Russian Typhoon? Class Ballistic Missile Submarine & Port Quarter Echo')
ylabel('Signal Magnitude')
xlabel('Index')
xlim([0 (length(DeadAsternEcho)-1)])
 
Cxy4 = NormCrossCorrelate(PortQuarterEcho,TxPulse);
 
figure(4);
plot(abs(hilbert(Cxy4)));
title('Cxy for TxPulse (Rock) & Port Quarter Echo')
ylabel('Signal Magnitude')
xlabel('Index')
xlim([0 (length(PortQuarterEcho)-1)])
 
 
%% Port Beam Direction - Cxy
 
Cxy5 = NormCrossCorrelate(PortBeamEcho,LosAngelesSubEcho);
 
figure(5);
plot(abs(hilbert(Cxy5)));
title('Cxy for US Los Angeles Class Attack Submarine & Port Beam Echo')
ylabel('Signal Magnitude')
xlabel('Index')
xlim([0 (length(PortBeamEcho)-1)])
 
Cxy6 = NormCrossCorrelate(PortBeamEcho,TxPulse);
 
figure(6);
plot(abs(hilbert(Cxy6)));
title('Cxy for TxPulse (Rock) & Port Beam Echo')
ylabel('Signal Magnitude')
xlabel('Index')
xlim([0 (length(PortBeamEcho)-1)])
 
%% Port Bow Direction - Cxy
 
Cxy7 = NormCrossCorrelate(PortBowEcho, LosAngelesSubEcho);
 
figure(7);
plot(abs(hilbert(Cxy7)));
title('Cxy for US Los Angeles Class Attack Submarine & Port Bow Echo')
ylabel('Signal Magnitude')
xlabel('Index')
xlim([0 (length(PortBowEcho)-1)])
 
