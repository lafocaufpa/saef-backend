# Teste de validação e relacionamento no banco de dados
# Internship Coordinator
# ic = InternshipCoordinator.create!(name: 'Carlos Portela', cpf: '45526048937', email: 'carlos@gmail.com', password: '12345678', password_confirmation: '12345678', faculty: 'SI')
ic2 = InternshipCoordinator.create!(name: 'Elton Sarmanho', cpf: '57526048137', email: 'elton@gmail.com', password: '12345678', password_confirmation: '12345678', faculty: 'SI')

# Trainee
# t = Trainee.create!(name: 'Edinaldo', cpf: '15364354321', email: 'edinaldo@gmail.com', password: '12345678', password_confirmation: '12345678', class_room: 2021, conclusion_year: 2025, studentId_number: '28394739274', is_actived: 1, internship_coordinator_id: InternshipCoordinator.first.id)
t2 = Trainee.create!(name: 'Cesar', cpf: '15364354311', email: 'cesar@gmail.com', password: '12345678', password_confirmation: '12345678', class_room: 2017, conclusion_year: 2023, studentId_number: '28394139274', is_actived: 0, internship_coordinator_id: InternshipCoordinator.last.id)

# c = Company.create!(name: 'LAFocA', site: 'lafoca.com.br', activity_branch: 'Tecnologia', company_organization: 'Governamental', cnpj: '75849302839485')
c2 = Company.create!(name: 'LABEX', site: 'labex.com.br', activity_branch: 'Tecnologia', company_organization: 'Governamental', cnpj: '75849302839480')

is = InternshipSupervisor.create!(name: 'Manoel', cpf: '45526048937', email: 'manoel@gmail.com', password: '12345678', password_confirmation: '12345678', function: 'Programador', company_id: Company.last.id)
is2 = InternshipSupervisor.create!(name: 'Rodrigo', cpf: '57526048137', email: 'rodrigo@gmail.com', password: '12345678', password_confirmation: '12345678', function: 'Engenheiro de Software', company_id: Company.first.id)

# ip = InternshipPlan.create!(title: 'Plano 1', general_objective: 'Objetivo geral 1', specific_objective: 'Objetivo específico 1', start_date: '2023-01-30', final_date: '2023-02-28', expected_result: 'Resultados esperados 1', workload: 20, status_concept: 'Excelente', trainee_id: Trainee.last.id, internship_supervisor_id: InternshipSupervisor.first.id)
ip = InternshipPlan.create!(title: 'Plano 2', general_objective: 'Objetivo geral 2', specific_objective: 'Objetivo específico 2', start_date: '2023-03-01', final_date: '2023-04-30', expected_result: 'Resultados esperados 2', workload: 40, status_concept: 'Bom', trainee_id: Trainee.first.id, internship_supervisor_id: InternshipSupervisor.last.id)

t = Task.create!(start_date: '2023-01-01', final_date: '2023-01-31', description: 'Descrição da tarefa 1', status: 1, internship_plan_id: InternshipPlan.first.id)
t2 = Task.create!(start_date: '2023-02-01', final_date: '2023-02-28', description: 'Descrição da tarefa 2', status: 0, internship_plan_id: InternshipPlan.first.id)

t = Task.create!(start_date: '2023-03-01', final_date: '2023-03-31', description: 'Descrição da tarefa 1', status: 1, internship_plan_id: InternshipPlan.last.id)
t2 = Task.create!(start_date: '2023-04-01', final_date: '2023-04-30', description: 'Descrição da tarefa 2', status: 0, internship_plan_id: InternshipPlan.last.id)

fr = FinalReport.create!(effective_workload: 20, note: 9.5, applied_technique: 'Técnica 1', general_assessment: 'Execelente', professional_experience: 'Execelente', verifed_status: 1, status_concept: 1, internship_plan_id: InternshipPlan.first.id)
fr2 = FinalReport.create!(effective_workload: 40, note: 9.0, applied_technique: 'Técnica 2', general_assessment: 'Bom', professional_experience: 'Bom', verifed_status: 0, status_concept: 0, internship_plan_id: InternshipPlan.last.id)


