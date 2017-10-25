" Vim syntax file for matlab and part of octave
" Maintainer:	char <github.com/zithub2>
" License:	GPLv3 or later

let s:save_cpo = &cpo
set cpo&vim
syntax clear
set magic
let b:current_syntax = "matlab"

"string{{{1
syn region matlabString		start=+"+ end=+"+	oneline
hi default link matlabString	String
"statement{{{1
"well, i don't know where to put these keywords. so let's put them here.
syn keyword matlabStatement		return function
hi default link matlabStatement		Statement
"repeat{{{1
syn keyword matlabRepeat		do for while end
hi default link matlabRepeat		Repeat
"conditional{{{1
syn keyword matlabConditional		if else elseif otherwise break default end
hi default link matlabConditional	Conditional
"label{{{1
syn keyword matlabLabel			case switch
hi default link matlabLabel		Label
"todo{{{1
syn keyword matlabTodo		TODO	contained
hi default link matlabTodo	Todo
"comment{{{1
syn match matlabOneLineComment		"%.*$"	contains=matlabTodo
syn region matlabMultiLineComment	start="%{"	end="%}"
hi default link matlabOneLineComment	Comment
hi default link matlabMultiLineComment	Comment
"operator{{{1
syn match matlabOperator	"\.[*/]"
syn match matlabOperator	"[-+*/\\]"
syn match matlabOperator	"[-+*/]="
syn match matlabOperator	":"
syn match matlabOperator	","
syn match matlabOperator	"[&|~]"
syn match matlabOperator	"[(){}[\]]"
syn match matlabOperator	"[<>=~]="
syn match matlabOperator	"[<>]"
syn match matlabOperator	";"
syn match matlabOperator	"'"
hi default link matlabOperator	Operator
"number{{{1
syn match matlabNumber		"\<\d\+[iIjJ]\?\>"
syn match matlabNumber		"\<[iIjJ]\>"
syn match matlabNumber		"\<Inf\>"
syn match matlabNumber		"\<NaN\>"
syn match matlabNumber		"\<pi\>"
syn match matlabNumber		"\<eps\>"
hi default link matlabNumber	Number
"float number{{{1
syn match matlabFloat		"\<\d\+\(\.\d*\)\?\([eEdD][-+]\?\d\+\)\?[ij]\?\>"
syn match matlabFloat		"\<\.\d\+\([eEdD][-+]\?\d\+\)\?[ij]\?\>"
hi default link matlabFloat	Float
"line continuation{{{1
syn match matlabLineContinuation	"\.\.\."
hi default link matlabLineContinuation	Special
"tab{{{1
syn match matlabTab		"\t"
hi default link matlabTab	Error

"matlab implicit functions{{{1
syn keyword matlabImplicit	abs acos acosh acot acoth acsc acsch actxcontrol actxserver addframe addpath addproperty  airy alim all allchild alpha alphamap angle ans any area asec asech asin asinh assert assignin atan atan2 atanh audiodevinfo audioplayer audiorecorder auread auwrite avifile aviinfo aviread axes axis
syn keyword matlabImplicit	balance bar barh bar3 bar3h base2dec beep besselh besseli besselj besselk bessely beta betainc betaln bicg bicgstab bin2dec bitand bitcmp bitget bitmax bitor bitset bitshift bitxor blanks blkdiag box brighten builtin bvp4c bvpget bvpinit bvpset bvpval
syn keyword matlabImplicit	calendar camdolly camlight camlookat camorbit campan campos camproj camroll camtarget camup camva camzoom capture cart2pol cart2sph cat catch caxis cd cdf2rdf cdfepoch cdfinfo cdfread cdfwrite ceil cell cell2mat cell2struct celldisp cellfun cellplot cellstr cgs char checkin checkout chol cholinc cholupdate circshift cla clabel class clc clear clf clipboard clock close closereq cmopts colamd colmmd colorbar colordef colormap colormapeditor colperm comet comet3 compan compass complex computer cond condeig condest coneplot conj contour contour3 contourc contourf contourslice contrast conv conv2 convhull convhulln convn copyfile copyobj corrcoef cos cosh cot coth cov cplxpair cputime cross csc csch csvread csvwrite cumprod cumsum cumtrapz curl customverctrl cylinder
syn keyword matlabImplicit	daspect date datenum datestr datetick datevec dbclear dbcont dbdown dblquad dbmex dbquit dbstack dbstatus dbstep dbstop dbtype dbup dde23 ddeadv ddeexec ddeget ddeinit ddepoke ddereq ddeset ddeterm ddeunadv deal deblank dec2base dec2bin dec2hex deconv del2 delaunay delaunay3 delaunayn delete deleteproperty demo depdir depfun det detrend deval diag dialog diary diff dir disp display divergence dlmread dlmwrite dmperm doc docopt docroot dos dot double dragrect drawnow dsearch dsearchn
syn keyword matlabImplicit	echo edit eig eigs ellipj ellipke ellipsoid eomday erf erfc erfcx erfinv erfcinv error errorbar errordlg etime etree etreeplot eval evalc evalin eventlisteners events exist exit exp expint expm eye ezcontour ezcontourf ezmesh ezmeshc ezplot ezplot3 ezpolar ezsurf ezsurfc
syn keyword matlabImplicit	factor factorial false fclose feather feof ferror feval fft fft2 fftn fftshift fgetl fgets fieldnames figflag figure file formats fileattrib filebrowser fileparts filesep fill fill3 filter filter2 find findall findfigs findobj findstr finish fitsinfo fitsread fix flipdim fliplr flipud floor flops flow fmin fminbnd fmins fminsearch fopen format fplot fprintf  frame2im frameedit fread freeserial freqspace frewind fscanf fseek ftell full fullfile func2str function_handle functions funm fwrite fzero
syn keyword matlabImplicit	gallery gamma gammainc gammaln gca gcbf gcbo gcd gcf gco genpath get getappdata getenv getfield getframe ginput global gmres gplot gradient graymon grid griddata griddata3 griddatan gsvd gtext guidata guide guihandles
syn keyword matlabImplicit	hadamard hankel hdf hdfinfo hdfread hdftool help helpbrowser helpdesk helpdlg helpwin hess hex2dec hex2num hgload hgsave hidden hilb hist histc hold home horzcat hsv2rgb
syn keyword matlabImplicit	ifft ifft2 ifftn ifftshift im2frame im2java imag image imagesc imfinfo imformats import importdata imread imwrite ind2rgb ind2sub inferiorto info inline inmem inpolygon input inputdlg inputname inspect instrcallback instrfind int2str int8 int16 int32 int64 interp1 interp2 interp3 interpft interpn interpstreamspeed intersect inv invhilb invoke ipermute is* isa isappdata iscell iscellstr ischar isempty isequal isequalwithequalnans isevent  isfield isfinite isglobal ishandle ishold isinf isjava iskeyword isletter islogical ismember ismethod  isnan isnumeric isobject isocaps isocolors isonormals isosurface ispc isprime isprop isreal isruntime issorted isspace issparse isstr isstruct isstudent isunix isvalid isvarname
syn keyword matlabImplicit	javaArray javachk javaMethod javaObject
syn keyword matlabImplicit	keyboard kron
syn keyword matlabImplicit	lasterr lasterror lastwarn lcm legend legendre length license light lightangle lighting lin2mu line linspace listdlg load loadobj log log10 log2 logical loglog logm logspace lookfor lower ls lscov lsqnonneg lsqr lu luinc
syn keyword matlabImplicit	magic mat2cell mat2str material matlab matlabrc matlabroot max mean median memory menu mesh meshc meshz meshgrid methods methodsview mex mexext mfilename min minres mislocked mkdir mkpp mlock mod more move movefile movegui movie movie2avi moviein msgbox mu2lin multibandread multibandwrite munlock
syn keyword matlabImplicit	namelengthmax nargchk nargin, nargout nargoutchk nchoosek ndgrid ndims newplot nextpow2 nnls nnz noanimate nonzeros norm normest notebook now null num2cell num2str numel nzmax
syn keyword matlabImplicit	object ode45 ode23 ode113 ode15s ode23s ode23t ode23tb odefile odeget odeset ones open openfig opengl openvar optimget optimset orderfields orient orth
syn keyword matlabImplicit	pack pagedlg pagesetupdlg pareto partialpath pascal patch path path2rc pathtool pause pbaspect pcg pchip pcode pcolor pdepe pdeval peaks perl perms permute persistent pie pie3 pinv planerot plot plot3 plotedit plotmatrix plotyy pol2cart polar poly polyarea polyder polyeig polyfit polyint polyval polyvalm pow2 ppval prefdir primes print printopt printdlg printpreview prod profile profreport propedit psi pwd
syn keyword matlabImplicit	qmr qr qrdelete qrinsert qrupdate quad quad8 quadl questdlg quit quiver quiver3 qz
syn keyword matlabImplicit	rand randn randperm rank rat rats rbbox rcond readasync real reallog realmax realmin realpow realsqrt record rectangle properties rectint reducepatch reducevolume refresh regexp regexpi regexprep registerevent rehash release rem repmat reset reshape residue rethrow rgb2hsv rgbplot ribbon rmappdata rmdir rmfield rmpath root roots rose rosser rot90 rotate rotate3d round rref rsf2csf run runtime
syn keyword matlabImplicit	save saveas saveobj scatter scatter3 schur script sec sech selectmoveresize semilogx semilogy send sendmail serial serialbreak set setappdata setdiff setfield setstr setxor shading shiftdim shrinkfaces sign sin single sinh size slice smooth3 sort sortrows sound soundsc spalloc sparse spaugment spconvert spdiags speye spfun sph2cart sphere spinmap spline spones spparms sprand sprandn sprandsym sprank sprintf spy sqrt sqrtm squeeze sscanf stairs start startat startup std stem stem3 stop stopasync str2double str2func str2mat str2num strcat strcmp strcmpi stream2 stream3 streamline streamparticles streamribbon streamslice streamtube strfind strings strjust strmatch strncmp strncmpi strread strrep strtok struct struct2cell strvcat sub2ind subplot subsasgn subsindex subspace subsref substruct subvolume sum superiorto support surf surfc surf2patch surface surfl surfnorm svd svds symamd symbfact symmlq symmmd symrcm symvar system
syn keyword matlabImplicit	tan tanh tempdir tempname terminal tetramesh texlabel text textread textwrap tic toc timer timerfind title toeplitz trace trapz treelayout treeplot tril trimesh triplequad triplot trisurf triu true try tsearch tsearchn type
syn keyword matlabImplicit	uicontextmenu uicontrol uigetdir uigetfile uiimport uimenu uint8 uint16 uint32 uint64 uiputfile uiresume uiwait uisetcolor uisetfont uistack undocheckout union unique unix unmkpp unregisterallevents unregisterevent unwrap unzip upper urlread urlwrite usejava
syn keyword matlabImplicit	vander var varargin varargout vectorize ver verctrl version vertcat view viewmtx volumebounds voronoi voronoin
syn keyword matlabImplicit	wait waitbar waitfor waitforbuttonpress warndlg warning waterfall wavplay wavread wavrecord wavwrite web weekday what whatsnew which whitebg who whos wilkinson winopen wk1read wk1write workspace
syn keyword matlabImplicit	xlabel xlim xlsfinfo xlsread xmlread xmlwrite xor xslt
syn keyword matlabImplicit	yes_or_no ylabel ylim
syn keyword matlabImplicit	z_test z_test_2 zeros zip zlabel zlim zoom zscore
syn keyword matlabImplicit	on off equal
hi default link matlabImplicit	Function
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo
"EOF vim: ts=8 noet sw=2 fdm=marker
