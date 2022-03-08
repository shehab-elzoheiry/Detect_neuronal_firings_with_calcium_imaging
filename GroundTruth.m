n=6 ;                                                               %number of cells
SR=10000;
fn = fieldnames(AllRawDATA);
All_Units=zeros(n,2400);
%timeforUnits=zeros(n,2400);

for i=1:numel(fn)/3

Units  = butterband   (AllRawDATA.(fn{i}),SR,200,2000,8);            % high bandpass filter
LFP    = butterband   (AllRawDATA.(fn{i}),SR,5,200,8);               % low pass filter

figure
plot(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR    ,    LFP(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR),'Color', 'blue') % plots the LFP
hold on
plot(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR    ,    Units(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR) + (max(Units)-min(Units))*1.5 ,'Color', 'red' ) % plots the units

%timeforUnits(i,1:length(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR))=AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR;  % take the time points for the LFP and Units
All_Units(i,1:length(Units(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR)))=Units(AllRawDATA.(fn{i+n})(1)*SR:AllRawDATA.(fn{i+n})(end)*SR);                                                                                                         % take the Units

% yyaxis right
% fn_inside = fieldnames(AllRawDATA.(fn{i+2*n}));
% for Ca=1:length(fn_inside)                                    
%     if length(fn_inside) > 1                                   
%         if   length(AllRawDATA.(fn{i+(2*n)}).(fn_inside{Ca}))    ~=     length(AllRawDATA.(fn{i+(2*n)}).(fn_inside{2}))
%              plot(AllRawDATA.(fn{i+n})(1:end-3)*10000   ,AllRawDATA.(fn{i+(2*n)}).(fn_inside{Ca})  +  400*(Ca-1) , 'Color', [0 0 0.09*Ca],'LineWidth',1,'LineStyle','-','Marker','none'), hold on     % plot calcium traces
%         else 
%              plot(AllRawDATA.(fn{i+n})*10000   ,AllRawDATA.(fn{i+(2*n)}).(fn_inside{Ca})  +  400*(Ca-1) , 'Color', [0 0 0.09*Ca],'LineWidth',1,'LineStyle','-','Marker','none'), hold on     % plot calcium traces
%         end
%     else
%         plot(AllRawDATA.(fn{i+n})*10000   ,AllRawDATA.(fn{i+(2*n)}).(fn_inside{Ca})  +  400*(Ca-1) , 'Color', [0 0 0.09*Ca],'LineWidth',1,'LineStyle','-','Marker','none'), hold on     % plot calcium traces
%     end
% end
title([fn{i}(end-2:end)]);
clear LFP Units fn_inside

end


%% changing the variables from denoised traces to cleaned taces

files={   '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/14thAugust2018/Imaging/206/Cleaned_traces_206.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/14thAugust2018/Imaging/207/Cleaned_traces_207.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/14thAugust2018/Imaging/208/Cleaned_traces_208.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/14thAugust2018/Imaging/209/Cleaned_traces_209.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/14thAugust2018/Imaging/210/Cleaned_traces_210.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/14thAugust2018/Imaging/211/Cleaned_traces_211.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/14thAugust2018/Imaging/213/Cleaned_traces_213.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/14thAugust2018/Imaging/215/Cleaned_traces_215.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/14thAugust2018/Imaging/216/Cleaned_traces_216.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/14thAugust2018/Imaging/217/Cleaned_traces_217.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/21stAugust2018/Imaging/218/Cleaned_traces_218.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/21stAugust2018/Imaging/219/Cleaned_traces_219.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/21stAugust2018/Imaging/220/Cleaned_traces_220.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/21stAugust2018/Imaging/221/Cleaned_traces_221.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/21stAugust2018/Imaging/224/Cleaned_traces_224.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/21stAugust2018/Imaging/225/Cleaned_traces_225.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/21stAugust2018/Imaging/226/Cleaned_traces_226.mat', ...
          '/media/agkann/Elements/PhD/Experiments/Rotenone Calcium Imaging/8.August/21stAugust2018/Imaging/227/Cleaned_traces_227.mat', ...
           };
clear clean_traces
for i=1
load(files{i},'clean_traces');
AllRawDATA.ROIdenoised206.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+1},'clean_traces');
AllRawDATA.ROIdenoised207.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+2},'clean_traces'); 
AllRawDATA.ROIdenoised208.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+3},'clean_traces'); 
AllRawDATA.ROIdenoised209.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+4},'clean_traces'); 
AllRawDATA.ROIdenoised210.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+5},'clean_traces'); 
AllRawDATA.ROIdenoised211.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+6},'clean_traces'); 
AllRawDATA.ROIdenoised213.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+7},'clean_traces'); 
AllRawDATA.ROIdenoised215.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+8},'clean_traces'); 
AllRawDATA.ROIdenoised216.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+9},'clean_traces'); 
AllRawDATA.ROIdenoised217.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+10},'clean_traces'); 
AllRawDATA.ROIdenoised218.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+11},'clean_traces'); 
AllRawDATA.ROIdenoised219.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+12},'clean_traces'); 
AllRawDATA.ROIdenoised220.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+13},'clean_traces'); 
AllRawDATA.ROIdenoised221.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+14},'clean_traces'); 
AllRawDATA.ROIdenoised224.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+15},'clean_traces'); 
AllRawDATA.ROIdenoised225.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+16},'clean_traces'); 
AllRawDATA.ROIdenoised226.ROI1= clean_traces(1,:)';    clear clean_traces
load(files{i+17},'clean_traces'); 
AllRawDATA.ROIdenoised227.ROI1= clean_traces(1,:)';    clear clean_traces
end

%% creating summary

summary=cell(1,1);
fn=fieldnames(UnitsAnalysis);
for i=1: length(fn)
    fn_inside=fieldnames(UnitsAnalysis.(fn{i}));
    %for ii=1:length(fn_inside)
        summary{i,1}=[fn{i}];
        summary{i,2}='raw_units';
        summary{i,3}=UnitsAnalysis.(fn{i}).(fn_inside{2});
        summary{i,4}='average_firing/sec';
        summary{i,5}=length(summary{i,3})/300;
        summary{i,6}='InterSpikeInterval';
        summary{i,7}=diff(summary{i,3});
        histogram(summary{i,7},round(0.1*length(summary{i,7})));
    %end
end

