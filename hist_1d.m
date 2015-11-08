function [bins,data_freq,data_counts] = ...
          hist_1d(data,start_bin,end_bin,dbin)
%HIST_1D Creates 1D histograms
% This program creates the frequency distribution
%
% v1.0.0, Tested in Matlab 2012b.
%
% (C) 2014 Adam Abernathy, adamabernathy@gmail.com
%
% Permission is hereby granted, free of charge, to any person obtaining 
% a copy of this software and associated documentation files 
% (the "Software"), to deal in the Software without restriction, 
% including without limitation the rights to use, copy, modify, merge, 
% publish, distribute, sublicense, and/or sell copies of the Software, 
% and to permit persons to whom the Software is furnished to do so, 
% subject to the following conditions:
%
% The above copyright notice and this permission notice shall be 
% included in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%

% Diagnostic code
%data = randn(100,1);
%start_bin = -3;
%end_bin = 3;
%dbin = (end_bin - start_bin)/100;

bins = start_bin;

% Loop over the bins.
% TODO: DOES NOT have and exit! This needs to be updated to
%       satistify critical code compliance requirements.
while bins(length(bins)) < end_bin + 1;

    bins = [bins; (bins(length(bins)) + 2.0 * dbin) ];

    % Set up the 1D histogram arrays
     data_counts = zeros(length(bins),1);

    % Build the 1D histogram for vvel
    for j = 1:1:length(bins) - 1
        [r,rc] = find(data >= bins(j)-dbin & data < bins(j)+dbin);

        if isempty(rc) == 1
            rc = 0;
        else
            data_counts(j) = sum(rc);
        end % End IF
    end % End [j]

    % Now calculate a frequency array
    data_freq = zeros(length(bins),1);

    if sum(data_counts) > 0
        data_freq = data_counts ./ sum(data_counts);
    end

end % End WHILE

return; % All done!
