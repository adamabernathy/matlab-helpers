function smooth = mean_smooth(array, ns, p);
%
% array :: Input array
% ns    :: No. of elements in smoother, must be odd
% p     :: No. of passes of the filter
% 
% Notes:
% * It is better to smooth with small 'n' and higher 'p' 
% * The first and last elements are set to the original 
%   values on each pass
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


n     = length(array);
tmp   = array;
for j = 1:p
    half                 = (ns - 1) / 2;
    smooth(1:half)       = tmp(1:half);
    smooth(n-half + 1:n) = tmp(n-half + 1:n);

    for i = (half + 1):(n - half)
            values    = tmp( (i - half) : (i + half) );
            smooth(i) = mean(values);
    end % End [i]

    tmp = smooth;
end % End [j]

return; % All done!
