Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do     
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do 
      mount_devise_token_auth_for 'InternshipCoordinator', at: 'internship_coordinator_auth', controllers: {
        registrations: 'api/v1/internship_coordinators/registrations'
      }
      namespace :internship_coordinators, only: [:index, :validate_user] do
        get 'index', to: 'internship_coordinators#index'
        put 'validate_user/:user_id', to: 'internship_coordinators#validate_user'
        get 'follow_internship_plan', to: 'internship_coordinators#follow_internship_plan' # Route to folow the internship plan
        get 'follow_final_report', to: 'internship_coordinators#follow_final_report' # Route to follow the final report
      end
      
      mount_devise_token_auth_for 'Trainee', at: 'trainee_auth', controllers: {
        registrations: 'api/v1/trainees/registrations',
        sessions: 'api/v1/trainees/sessions'
      }

      mount_devise_token_auth_for 'InternshipSupervisor', at: 'internship_supervisor_auth', controllers: {
        registrations: 'api/v1/internship_supervisors/registrations'
      }
      namespace :internship_supervisors do 
        resources :companies, except: [:edit, :new]
      end  
      
      resources :internship_plans do 
        resources :tasks
        resources :final_reports do 
          member do
            get 'generate_pdf_final_report' # Route to generate final report pdf
          end
        end
        member do
          get 'generate_pdf_plan' # Route to generate plan pdf
        end
      end

      resources :attendances
    end
  end
end
