Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do     
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do 
      mount_devise_token_auth_for 'InternshipCoordinator', at: 'internship_coordinator_auth'
      as :internship_coordinator do
        # Define routes for InternshipCoordinator within this block.
      end
    
      mount_devise_token_auth_for 'Trainee', at: 'trainee_auth'
      as :trainee do
        # Define routes for Trainee within this block.
      end
    
      mount_devise_token_auth_for 'InternshipSupervisor', at: 'internship_supervisor_auth'
      as :internship_supervisor do
        # Define routes for InternshipSupervisor within this block.
      end    
    end
  end
end
