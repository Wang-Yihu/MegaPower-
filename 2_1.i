[Problem]
  solve = false
[]
[Mesh]
  [file]
    type = FileMeshGenerator
    file = megapower_wanzhengjihe_daore_cm_m_out.e
    use_for_exodus_restart = true
  []
[]
[AuxVariables]
  [temp]
    family = LAGRANGE
    order = FIRST
    initial_from_file_var = temp
    initial_from_file_timestep = 6
  []
[]
[Executioner]
  type = Transient
  nl_abs_tol = 1e-4
  num_steps = 1
  nl_max_its = 100
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'
[]
[Outputs]
  exodus = true
[]
[MultiApps]
  [2_2baoliujiti]
    type = TransientMultiApp
    positions = '0 0 0'
    input_files = '2_2.i'
    execute_on = FINAL
  []
[]
[Transfers]
  [shuchuwendu]
    type = MultiAppGeneralFieldNearestNodeTransfer
    to_multi_app = 2_2baoliujiti
    source_variable = temp
    variable = temp
  []
[]
