function [B] = get_netcdf(f,var_request)
%get_netCDF Returns a variable from a netCDF file.
%
% f            :: Path of source file
% var_request  :: Variable name you want to get
%
% Notes:
% Opens file in RO mode.
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

% Open and validate. Opens in RO mode.
ncid  = netcdf.open(f, 'NC_NOWRITE');
varid = netcdf.inqVarID(ncid, var_request);
B     = netcdf.getVar(ncid, varid); % TODO: Might need to add file type

netcdf.close(ncid);
% C = length(B);

end % All done!
