function ind = list2ind(ilist,dims)
%
% Convert a collection of multi-dimensional indicies into a vector
%  of one dimensional indicies for finding position in a tensor product
%  of spaces

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
%   7-Oct-97   S.M. Tan   Implemented for Matlab 5
dims = dims(:)';
irev = ilist(:,end:-1:1) - 1;
fact = [1 cumprod(dims(end:-1:2))]';
ind = irev*fact + 1;
