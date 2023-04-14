clear
if(isunix)
    executable = '"../../build/bin/FaceLandmarkImg"';
else
    executable = '"../../x64/Release\FaceLandmarkImg.exe"';
end
    
% in_dir  = '../../samples';
% in_dir  = 'E:\※学习资料※\postgraduate\210721疼痛识别小系统\01获取AU43\01_get_ear\dataset';
% in_dir = 'E:\※学习资料※\postgraduate\COMplex\徐紫薇\提取疼痛AU的技术流程';
% in_dir = 'E:\※学习资料※\postgraduate\COMplex\徐紫薇\提取疼痛AU的技术流程\22.3.1修改\大论文图片\不同姿态';
% in_dir = 'E:\New_OpenFace\Datasets\UNBC\Images\042-ll042\ll042t1aaaff';
in_dir = 'C:\Users\43785\Desktop\kx';



out_dir = './demo_kx/';
% out_dir = 'E:\※学习资料※\postgraduate\210721疼痛识别小系统\01获取AU43\01_get_ear\dataset';


% model = 'model/main_ceclm_general.txt'; % Trained on in the wild, menpo and multi-pie data (a CE-CLM model)

% Uncomment the below models if you want to try them
model = 'model/main_clnf_general.txt'; % Trained on in the wild and multi-pie data (a CLNF model)

%model = 'model/main_clnf_wild.txt'; % Trained on in-the-wild data only

%model = 'model/main_clm_general.txt'; % Trained on in the wild and multi-pie data (less accurate SVR/CLM model)
%model = 'model/main_clm_wild.txt'; % Trained on in-the-wild

% Load images (-fdir), output images and all the features (-out_dir), use a
% user specified model (-mloc), and visualize everything (-verbose)
% command = sprintf('%s -fdir "%s" -out_dir "%s" -verbose "%s" ', executable, in_dir, out_dir, model);
command = sprintf('%s -fdir "%s" -ofdir "%s" -oidir "%s" -mloc "%s" -verbose ', executable, in_dir, out_dir,out_dir, model);
% Demonstrates the multi-hypothesis slow landmark detection (more accurate
% when dealing with non-frontal faces and less accurate face detections)
% Comment to skip this functionality
% command = cat(2, command, ' -wild -multi_view 1');
command = cat(2, command, ' -wild');

if(isunix)
    unix(command);
else
    dos(command);
end