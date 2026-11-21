[Problem]
  solve = false
[]
[Mesh]
  [file]
    type = FileMeshGenerator
    file = ./2_1_out_2_2baoliujiti0.e
    use_for_exodus_restart = true
  []
[]
[AuxVariables]
  [temp]
    family = LAGRANGE
    order = FIRST
    initial_from_file_var = temp
    initial_from_file_timestep = 2
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
  [3_2yongyurepengzhang]
    type = TransientMultiApp
    positions = '0 0 0'
    input_files = '3_2.i'
    execute_on = FINAL
  []
[]
[Transfers]
  [shuchuwendu]
    type = MultiAppGeometricInterpolationTransfer
    to_multi_app = 3_2yongyurepengzhang
    source_variable = temp
    variable = temp_jiegou
    num_points = 2
  []
[]
