function winningmodel = pick_best_pars(results_dir,analysis_name, subject_type, idxx, idxy)

load([results_dir '/bms_results_' sprintf('%d', subject_type)]);
load([results_dir '/parameter_workspace.mat']);


if idxx==0 | idxy==0
    [val idx] = max(allBMS{1}(1:end-3));
    
    idxx = mod(idx,3);
    if idxx==0
        idxx=3;
    end
    idxy = ceil(idx/3);
end
binFEgrid = pars.FE;
omega_all = pars.omega;
theta_all = pars.theta;
beta_all = pars.beta_all;
winningmodel = idxy;
omega = squeeze(omega_all(idxy,idxx,:));
theta = squeeze(theta_all(idxy,idxx,:));
bbeta = squeeze(beta_all(idxy,idxx,:));


save ([results_dir 'parameter_workspace'],'omega_all','theta_all','beta_all','binFEgrid','omega','theta','bbeta','pars');

