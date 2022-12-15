function create_new_hgf_copy

old_model = 'ms1_compi_constant_voltemp_exp';
new_model = 'ms3_compi_constant_voltemp_exp';
%model_type = 'prc';
model_type = 'obs';
%root =  'C:\Users\danie\Dropbox\DMPAD_dcm\code\6_ROI_network\hgf\';
%root = fileparts(fileparts(mfilename('fullpath')));
root = cd;

% switch model_type
%     case 'per'
%         root = fullfile(root,'prc_models');
%     case 'obs'
%         root =  fullfile(root,'obs_models');
% end

new_dir = fullfile(root,new_model);
old_dir = fullfile(root,old_model);

cd(root);
mkdir(new_dir);


model_files = ls(old_dir);

for i = 3:size(model_files,1)

    old_file = strtrim(model_files(i,:));
    old_file = old_file(1:(end-2));
    
    new_file = strrep(old_file,old_model,new_model);

    rewrite_hgf_model_file(old_model, new_model, old_file, new_file, old_dir, new_dir)

end




