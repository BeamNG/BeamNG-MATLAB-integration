pe = pyenv;
if isempty(pe.Version)
    fprintf ('Python is not installed in your MATLAB engine')
else
    fprintf ('   Your Python version is : ')
    fprintf (pe.Version)
    fprintf('\n')

end
