function c = ms2_compi_constant_weight_config
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Contains the configuration for the IOIO constant weight observation model
%
% --------------------------------------------------------------------------------------------------
% Copyright (C) 2012 Christoph Mathys, TNU, UZH & ETHZ
%
% This file is part of the HGF toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.

% Config structure
c = struct;

% Model name
c.model = 'ms2_compi_constant_weight';

% Sufficient statistics of Gaussian parameter priors

% Zeta_1
% Note: This parameter is referred to as social bias zeta in the manuscript.
c.logitze1mu = tapas_logit(0.5,1);
c.logitze1sa = 1;

% Zeta_2
% Note: This parameter is referred to as decision noise nu in the manuscript.
c.logze2mu = log(48);
c.logze2sa = 1;

% Gather prior settings in vectors
c.priormus = [
    c.logitze1mu,...
    c.logze2mu,...
         ];

c.priorsas = [
    c.logitze1sa,...
    c.logze2sa,...
         ];

% Model filehandle
c.obs_fun = @ms2_compi_constant_weight;

% Handle to function that transforms observation parameters to their native space
% from the space they are estimated in
c.transp_obs_fun = @ms2_compi_constant_weight_transp;

return;
