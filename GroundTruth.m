%%
% This script fits high resolution electrophysiological recordings with low resolution recordings of calcium fluorescent signal. This is required to correspond 
% firing activity of certain neurons with their calcium imaging. The output is count, average firings and interspike interval for each neuron during calcium imaging recordings.
%%
n=6 ;                                                               %number of cells
SR=10000;
fn = fieldnames(AllRawDATA);
All_Units=zeros(n,2400);

for i=1:numel(fn)/3
          Units  = butterband   (AllRawDATA.(fn{i}),SR,200,2000,8);            % high bandpass filter
          LFP    = butterband   (AllRawDATA.(fn{i}),SR,5,200,8);               % low pass filter

          figure
          plot(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR    ,    LFP(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR),'Color', 'blue') % plots the LFP
          hold on
          plot(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR    ,    Units(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR) + (max(Units)-min(Units))*1.5 ,'Color', 'red' ) % plots the units
          %timeforUnits(i,1:length(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR))=AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR;  % take the time points for the LFP and Units
          All_Units(i,1:length(Units(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR)))=Units(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR);     % take the Units
          title([fn{i}(end-2:end)]);
          clear LFP Units fn_inside
end

%% changing the variables from denoised traces to cleaned taces
files={   '/media/Cleaned_traces_1.mat', ...
          '/media/Cleaned_traces_2.mat', ...
           };
clear clean_traces

for i=1
          load(files{i},'clean_traces');
          AllRawDATA.ROIdenoised1.ROI1= clean_traces(1,:)';    clear clean_traces
          load(files{i+1},'clean_traces');
          AllRawDATA.ROIdenoised2.ROI1= clean_traces(1,:)';    clear clean_traces
end

%% creating summary
summary=cell(1,1);
fn=fieldnames(UnitsAnalysis);
for i=1: length(fn)
        fn_inside=fieldnames(UnitsAnalysis.(fn{i}));
        summary{i,1}=[fn{i}];
        summary{i,2}='raw_units';
        summary{i,3}=UnitsAnalysis.(fn{i}).(fn_inside{2});
        summary{i,4}='average_firing/sec';
        summary{i,5}=length(summary{i,3})/300;
        summary{i,6}='InterSpikeInterval';
        summary{i,7}=diff(summary{i,3});
        histogram(summary{i,7},round(0.1*length(summary{i,7})));
end
