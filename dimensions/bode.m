numerator = 1;
denominator = [47.55, 1.81];
sys = tf(numerator, denominator);

[GM, PM, Wcg, Wcp] = margin(sys);

GM_dB = 20*log10(GM);

[mag, phase, w] = bode(sys);
mag = squeeze(mag);
phase = squeeze(phase);
w = squeeze(w);


mag_dB = 20*log10(mag);


figure;
subplot(2,1,1);
semilogx(w, mag_dB, 'b', 'LineWidth', 1.5);
hold on;
grid on;
ylabel('Magnitude (dB)');
title('Bode Plot with Gain and Phase Margins');


yline(0, '--k');

if ~isnan(Wcg)
    mag_Wcg = interp1(w, mag_dB, Wcg);
    plot(Wcg, mag_Wcg, 'ro', 'MarkerFaceColor', 'r');
    xline(Wcg, '--r', sprintf('Wcg = %.2f rad/s', Wcg), 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'bottom');
end

subplot(2,1,2);
semilogx(w, phase, 'b', 'LineWidth', 1.5);
hold on;
grid on;
ylabel('Phase (degrees)');
xlabel('Frequency (rad/s)');

yline(-180, '--k');

if ~isnan(Wcp)
    phase_Wcp = interp1(w, phase, Wcp);
    plot(Wcp, phase_Wcp, 'ro', 'MarkerFaceColor', 'r');
    xline(Wcp, '--r', sprintf('Wcp = %.2f rad/s', Wcp), 'LabelHorizontalAlignment', 'center', 'LabelVerticalAlignment', 'top');
end

annotationText = {
    sprintf('Gain Margin (GM): %s dB', num2str(GM_dB))
    sprintf('Phase Margin (PM): %s degrees', num2str(PM))
   
};

xPos = 0.05; 
yPos = 0.5;  

subplot(2,1,1); 
text('Units', 'normalized', 'Position', [xPos, yPos], 'String', annotationText, 'FontSize', 10, 'BackgroundColor', 'w');