function q = horzcat(q1,varargin)
% FSERIES/HORZCAT implements horizontal concatenation for function series
% q = horzcat(q1,varargin)

%% version 0.15 20-Aug-2002
%
%    Copyright (C) 1996-2002  Sze M. Tan
%
%    This program is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation; either version 2 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program; if not, write to the Free Software
%    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
%
%    Address: Physics Department, The University of Auckland, New Zealand
%    Email: s.tan@auckland.ac.nz

%   Revision history:
%   18-Sep-97   S.M. Tan   Implemented for Matlab 5
%    8-Jan-98   S.M. Tan   Modified for new structure
%   21-Dec-98   S.M. Tan   Initial release

q = fseries(q1);
for k = 1:length(varargin)
   q = horzcat2(q,varargin{k});
end

function q = horzcat2(q1,q2)
q2 = fseries(q2);
if prod(size(q1))==0
   q = q2; return;
elseif prod(size(q2))==0
   q = q1; return;
end
if isequal(dims(q1),dims(q2))
   q = struct(qobase([qo(q1.qobase);qo(q2.qobase)]));
   q.ftype = [q1.ftype,q2.ftype];
   q.fparam = {q1.fparam{:},q2.fparam{:}};
   q = fseries(q);   
else
   error('Incompatible Hilbert space dimensions.');
end
