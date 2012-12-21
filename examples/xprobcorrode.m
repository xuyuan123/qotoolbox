echo off
% XPROBCORRODE Calculation of correlations and spectra using quantum regression theorem

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

echo on
%-----------------------------------------------------------------------------
% XPROBCORR Calculation of correlations and spectra using quantum regression theorem
%  for a two-level atom in a driven high-Q cavity
%-----------------------------------------------------------------------------
pause % Press [Enter] to view PROBCORR.M, the function called by this routine
%-----------------------------------------------------------------------------
%
type probcorr
%
%--------------------------------------------------------------------------
% Note how the differential equation involving the Liouvillian L is used to
%  find the time-dependence of the correlation function using the appropriate
%  initial condition matrix
%--------------------------------------------------------------------------
pause % Press [Enter] to set up parameters and call PROBCORR
%-----------------------------------------------------------------------------
kappa = 2; gamma = 0.2; g = 5;
wc = 0; w0 = 0; wl = 0;
N = 4; E = 0.5; Nfft = 512;
tlist = linspace(0,30,Nfft/2);
[corr,cov] = probcorrode(E,kappa,gamma,g,wc,w0,wl,N,tlist);
%-----------------------------------------------------------------------------
pause % Press [Enter] to view the correlation and covariance functions
%-----------------------------------------------------------------------------
f1 = figure(1); plot(tlist,real(corr),tlist,real(cov));
xlabel('Time'); ylabel('Correlation and covariance');
%-----------------------------------------------------------------------------
pause % Press [Enter] to view the spectrum
%-----------------------------------------------------------------------------
dt = tlist(2)-tlist(1);
dw = 2*pi/(Nfft*dt);
w = [-Nfft/2:Nfft/2-1]*dw;
spect = fftshift(abs(fft([0,cov(end:-1:2),cov(1:end)])*dt));
f2 = figure(2); plot(w,spect);
xlabel('Angular frequency'); ylabel('Spectral amplitude');
%-----------------------------------------------------------------------------
pause % Press [Enter] to end demonstration
%-----------------------------------------------------------------------------
delete(f1); delete(f2);
echo off