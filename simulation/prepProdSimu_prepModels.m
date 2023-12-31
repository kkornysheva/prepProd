function [M, R] = prepProdSimu_prepModels(models,run,c)

%%% calculate second moment matrix for each model, based on simulated data
%prep only
R.orderPrepModel.G = pcm_estGCrossval(models.ordPrep.data,run,c); R.orderPrepModel.G(isnan(R.orderPrepModel.G)) = 0;
R.timingPrepModel.G = pcm_estGCrossval(models.tempPrep.data,run,c); R.timingPrepModel.G(isnan(R.timingPrepModel.G)) = 0;
R.integratedPrepModel.G = pcm_estGCrossval(models.intPrep.data,run,c); R.integratedPrepModel.G(isnan(R.integratedPrepModel.G)) = 0;

%prod only
R.orderProdModel.G = pcm_estGCrossval(models.ordProd.data,run,c); R.orderProdModel.G(isnan(R.orderProdModel.G)) = 0;
R.timingProdModel.G = pcm_estGCrossval(models.tempProd.data,run,c); R.timingProdModel.G(isnan(R.timingProdModel.G)) = 0;
R.integratedProdModel.G = pcm_estGCrossval(models.intProd.data,run,c); R.integratedProdModel.G(isnan(R.integratedProdModel.G)) = 0;

%maint (prep and prod online, from same distribution (anti-kaufman null space 2016)
R.orderMaintModel.G = pcm_estGCrossval(models.ordMaint.data,run,c); R.orderMaintModel.G(isnan(R.orderMaintModel.G)) = 0;
R.timingMaintModel.G = pcm_estGCrossval(models.tempMaint.data,run,c); R.timingMaintModel.G(isnan(R.timingMaintModel.G)) = 0;
R.integratedMaintModel.G = pcm_estGCrossval(models.intMaint.data,run,c); R.integratedMaintModel.G(isnan(R.integratedMaintModel.G)) = 0;
%because some activity profiles end up being the same, we set nans to 0

% ----------------------------------------------------------------
% ----------------------------------------------------------------
% Now build the models
% Model 1: Null model for baseline: here we use a model which has all finger
% Patterns be independent - i.e. all finger pairs are equally far away from
% each other
M{1}.type       = 'component';
M{1}.numGparams = 1;
M{1}.Gc         = ones(8);
M{1}.name       = 'null';

% Models 2-4: Order models, derived from simulations with
% high order decoding during prep, prod, & switch respectively
M{2}.type       = 'component';
M{2}.numGparams = 1;
M{2}.Gc         = R.orderPrepModel.G;
M{2}.name       = 'Op';

M{3}.type       = 'component';
M{3}.numGparams = 1;
M{3}.Gc         = R.orderProdModel.G;
M{3}.name       = 'OP';

% Models 5-7: Timing models, derived from simulations with
% high timing decoding during prep, prod, & switch respectively
M{4}.type       = 'component';
M{4}.numGparams = 1;
M{4}.Gc         = R.timingPrepModel.G;
M{4}.name       = 'Tp';

M{5}.type       = 'component';
M{5}.numGparams = 1;
M{5}.Gc         = R.timingProdModel.G;
M{5}.name       = 'TP';

% Models 8-10: Integrated models, derived from simulations with
% high integrated decoding
M{6}.type       = 'component';
M{6}.numGparams = 1;
M{6}.Gc         = R.integratedPrepModel.G;
M{6}.name       = 'Ip';

M{7}.type       = 'component';
M{7}.numGparams = 1;
M{7}.Gc         = R.integratedProdModel.G;
M{7}.name       = 'IP';

%generate combination models, but exclude null model
Mtemp = pcm_constructModelFamily(M(2:end));
M = [M(1) Mtemp];

M{end+1}.type       = 'component';
M{end}.numGparams = 1;
M{end}.Gc         = R.orderMaintModel.G;
M{end}.name       = 'OM';

M{end+1}.type       = 'component';
M{end}.numGparams = 1;
M{end}.Gc         = R.timingMaintModel.G;
M{end}.name       = 'TM';

M{end+1}.type       = 'component';
M{end}.numGparams = 1;
M{end}.Gc         = R.integratedMaintModel.G;
M{end}.name       = 'IM';

% Model end-1: Maintained model across all three features
M{end+1}.type       = 'component';
M{end}.numGparams = 3;
M{end}.Gc(:,:,1)  = R.orderMaintModel.G;
M{end}.Gc(:,:,2)  = R.timingMaintModel.G;
M{end}.Gc(:,:,3)  = R.integratedMaintModel.G;
M{end}.name       = 'OM+TM+IM';

% Model 14: Free model as Noise ceiling
% M{15}.type       = 'freechol';
M{end+1}.type     = 'freedirect';
M{end}.numCond    = 8;
M{end}.name       = 'noiseceiling';
M{end}            = pcm_prepFreeModel(M{end});