function prepProd2_imanaBatch_RY

%vector containing subject IDs in ascending order, add more as needed
subjName={'s01','s02','s03','s04','s05','s06','s07','s08','s09','s10',...
    's11','s12','s13','s14','s15','s16','s17','s18','s19','s20','s21','s22','s23',...
    's24','s25','s26','s27','s28','s29','s30','s31','s32','s33','s34','s35','s36',...
    's37','s38','s39','s40','s41','s42','s43','s44','s45','s46','s47','s48','s49',...
    's50','s51','s52','s53','s54','s55','s56','s57','s58','s59','s60'}; %% chronological without missing subject numbers, for later vector references

%subjects to be analysed
subj=[3,5,6,7,9,10,13,16,17,18,20,21,22,25,26,31,32,34,36,38,40,41,42]; %Ps that reached performance threshold
% subj=[3 4 5 6 7 9 10 11 12 13 15 16 17 18 20 21 22 25 26 31 32 33 34 36 37 38 39 40 41 42]; %all Ps that were scanned regardless of performance
% subj=[25 26 31 32 33 34 36 37 38 39 40 41 42];
% subj = 17;
%   39,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp(['Analysing: ' num2str(subj)])

for i=subj
    disp('Subj#'); disp(subjName{i});
    %
    %     prepProd2_imana_RY('make_nii',i);
    %
    %     prepProd2_imana_RY('set_AC',i); %%TO BE DONE MANUALLY
    %
    %     prepProd2_imana_RY('slice_timing',i);
    %     prepProd2_imana_RY('realign_unwarp',i);
    %     prepProd2_imana_RY('meanepi',i);
    %
    %     prepProd2_imana_RY('coreg',i); %%TO BE DONE MANUALLY
    %
    %     prepProd2_imana_RY('glm_set',i);
    %     prepProd2_imana_RY('glm_estimate',i);
    %     prepProd2_imana_RY('glm_contrast',i);
    %     prepProd2_imana_RY('con_smooth', i);
    %
    %     prepProd2_imana_RY('segment',i);
    %     prepProd2_imana_RY('make_mask',i);
    %     prepProd2_imana_RY('MVA_search',i);
    %     prepProd2_imana_RY('MVA_do_overallMov',i);
    %     prepProd2_imana_RY('MVA_do_overallPrep',i);
    %     prepProd2_imana_RY('MVA_do_spatOneout_Mov',i);
    %     prepProd2_imana_RY('MVA_do_spatOneout_Prep',i);
    %     prepProd2_imana_RY('MVA_do_tempOneout_Mov',i);
    %     prepProd2_imana_RY('MVA_do_tempOneout_Prep',i);
    %     prepProd2_imana_RY('MVA_do_Int_Mov',i);
    %     prepProd2_imana_RY('MVA_do_Int_Prep',i);
    %     prepProd2_imana_RY('MVA_zValue',i);
    %     prepProd2_imana_RY('MVA_zValue_oneOut',i);
    %     prepProd2_imana_RY('MVA_smooth',i);
    %     prepProd2_imana_RY('MNI_normalization',i);
    
    
    %%%%%%%%%%%%%% SUIT ANALYSIS %%%%%%%%%%%%%%
    
    %     prepProd2_imana_RY('suit_segment',i); %hand correct
    %     prepProd2_imana_RY('suit_normalize',i);
    
    %     prepProd2_imana_RY('suit_reslice_contrast',i);
    %
    %     prepProd2_imana_RY('suit_make_mask',i);
    %     prepProd2_imana_RY('MVA_searchSUIT',i);
    %     prepProd2_imana_RY('MVA_do_overallMov_suit',i);
    %     prepProd2_imana_RY('MVA_do_overallPrep_suit',i);
    %     prepProd2_imana_RY('MVA_do_spatOneout_Mov_suit',i);
    %     prepProd2_imana_RY('MVA_do_spatOneout_Prep_suit',i);
    %     prepProd2_imana_RY('MVA_do_tempOneout_Mov_suit',i);
    %     prepProd2_imana_RY('MVA_do_tempOneout_Prep_suit',i);
    %     prepProd2_imana_RY('MVA_do_Int_Mov_suit',i);
    %     prepProd2_imana_RY('MVA_do_Int_Prep_suit',i);
    %
    %     prepProd2_imana_RY('MVA_zValue_suit',i);
    %     prepProd2_imana_RY('MVA_zValue_oneOut_suit',i);
    %     prepProd2_imana_RY('MVA_smooth_suit',i);
    %     prepProd2_imana_RY('suit_normalise',i);
    
end

%%%%%%%%%%%%% WHOLE BRAIN GROUP %%%%%%%%%%%%
%     prepProd2_imana_RY('glm_contrastGroup');
%     prepProd2_imana_RY('glm_contrastEstimate');
%     prepProd2_imana_RY('MVA_group');
%     prepProd2_imana_RY('MVA_estimate');


%%%%%%%%%%%%% SUIT GROUP %%%%%%%%%%%%%%%
% prepProd2_imana_RY('glm_contrastGroup_suit');
% prepProd2_imana_RY('glm_contrastEstimate_suit');
% prepProd2_imana_RY('MVA_group_suit');
% prepProd2_imana_RY('MVA_estimate_suit')

%%%%%%%%%%%%%% SUBCORTICAL ANALYSIS %%%%%%%%%%%%%%
for i=subj;
    disp(['Subcortical Analysis: ' subjName{i}])
    %     prepProd2_imana_RY('subcortical_make_nii',i)
    %     prepProd2_imana_RY('subcortical_make_structs',i)
    %     prepProd2_imana_RY('subcortical_voxel_counts',i)
    %     prepProd2_imana_RY('subcortical_reslice_structs',i)
    
    %     prepProd2_imana_RY('make_mask_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_search_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_do_overallMov_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_do_overallPrep_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_do_spatOneout_Mov_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_do_spatOneout_Prep_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_do_tempOneout_Mov_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_do_tempOneout_Prep_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_do_Int_Mov_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_do_Int_Prep_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_zValue_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_zValue_oneOut_subcorticalSearch',i)
    %     prepProd2_imana_RY('MVA_smooth_subcorticalSearch',i)
    %     prepProd2_imana_RY('MNI_normalisation_subcorticalSearch',i)
    
%         prepProd2_imana_RY('make_mask_subcorticalArea',i)
        prepProd2_imana_RY('subcortical_define_mva_area',i)
    %     prepProd2_imana_RY('MVA_do_overallMov_subcorticalArea',i)
    %     prepProd2_imana_RY('MVA_do_overallPrep_subcorticalArea',i);
    %     prepProd2_imana_RY('MVA_do_spatOneout_Mov_subcorticalArea',i);
    %     prepProd2_imana_RY('MVA_do_spatOneout_Prep_subcorticalArea',i);
    %     prepProd2_imana_RY('MVA_do_tempOneout_Mov_subcorticalArea',i);
    %     prepProd2_imana_RY('MVA_do_tempOneout_Prep_subcorticalArea',i);
    %     prepProd2_imana_RY('MVA_do_Int_Mov_subcorticalArea',i);
    %     prepProd2_imana_RY('MVA_do_Int_Prep_subcorticalArea',i);
    
    %     prepProd2_imana_RY('PCM_normaliseBetaMaps',i)
    %     prepProd2_imana_RY('PCM_cortical_define_mva_area',i)
    %     prepProd2_imana_RY('PCM_subcorticalSearchLight',i)
    
%     prepProd2_imana_RY('PCM_cb_make_structs',i)
%     prepProd2_imana_RY('PCM_cb_reslice_regions',i)
%     prepProd2_imana_RY('PCM_cb_make_mask',i)
%     prepProd2_imana_RY('PCM_cb_define_mva_area',i)
end

%%% Subcortical group functions %%%
% prepProd2_imana_RY('MVA_group_subcorticalSearch')