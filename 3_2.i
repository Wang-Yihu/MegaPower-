[Problem]
  solve = false
[]
[Mesh]
  [file]
    type = FileMeshGenerator
    file = quanmegapower_jiegou_miwangge_500_tiqudimian_in.e
  []
[]
[AuxVariables]
  [temp_jiegou]
    family = LAGRANGE
    order = FIRST
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
