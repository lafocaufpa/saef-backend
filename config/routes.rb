Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do     
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do 
      mount_devise_token_auth_for 'InternshipCoordinator', at: 'internship_coordinator_auth', controllers: {
        registrations: 'api/v1/internship_coordinators/registrations'
      }
    
      mount_devise_token_auth_for 'Trainee', at: 'trainee_auth', controllers: {
        registrations: 'api/v1/trainees/registrations',
        sessions: 'api/v1/trainees/sessions'
      }

      mount_devise_token_auth_for 'InternshipSupervisor', at: 'internship_supervisor_auth', controllers: {
        registrations: 'api/v1/internship_supervisors/registrations'
      }
      
      namespace :internship_supervisors do 
        resources :companies 
      end

      
    end
  end
end
