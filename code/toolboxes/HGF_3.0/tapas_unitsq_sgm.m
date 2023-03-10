function logp = tapas_unitsq_sgm(r, infStates, ptrans)
% Calculates the log-probability of response y=1 under the unit-square sigmoid model
%
% --------------------------------------------------------------------------------------------------
% Copyright (C) 2012-2013 Christoph Mathys, TNU, UZH & ETHZ
%
% This file is part of the HGF toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.

% Transform zeta to its native space
ze = exp(ptrans(1));

% Initialize returned log-probabilities as NaNs so that NaN is
% returned for all irregualar trials
logp = NaN(length(infStates(:,1,1)),1);

% Weed irregular trials out from inferred states and responses
x = infStates(:,1,1);
x(r.irr) = [];
y = r.y(:,1);
y(r.irr) = [];

% Calculate log-probabilities for non-irregular trials
logp(not(ismember(1:length(logp),r.irr))) = y.*ze.*log(x./(1-x)) +log((1-x).^ze ./((1-x).^ze +x.^ze));

return;
