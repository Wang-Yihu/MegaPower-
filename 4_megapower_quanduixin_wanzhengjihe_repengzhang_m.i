[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
[]
[Mesh]
  [fmg]
    type = FileMeshGenerator
    file = 3_1_out_3_2yongyurepengzhang0.e
    use_for_exodus_restart = true
  []
[]
[AuxVariables]
  [temp_jiegou]
    family = LAGRANGE
    order = FIRST
    initial_from_file_var = temp_jiegou
    initial_from_file_timestep = 2
  []
[]
[Functions]
  [cte_func_mean_steel]
    type = PiecewiseLinear
    data_file = ./data/ss316_thermal_expansion_eigenstrain.csv
    format = columns
  []
[]
[BCs]
  [gudingx]
    type = DirichletBC
    variable = disp_x
    boundary = 8001
    value = 0
  []
  [gudingy]
    type = DirichletBC
    variable = disp_y
    boundary = 8001
    value = 0
  []
  [gudingz]
    type = DirichletBC
    variable = disp_z
    boundary = 8001
    value = 0
  []
[]
[Modules/TensorMechanics/Master]
  [all]
    add_variables = true
    eigenstrain_names = thermal
    generate_output = 'vonmises_stress'
    strain = FINITE
    temperature = temp_jiegou
  []
[]
[Materials]
  [expansion_steel]
    type = ComputeMeanThermalExpansionFunctionEigenstrain
    thermal_expansion_function = cte_func_mean_steel
    thermal_expansion_function_reference_temperature = 294.26
    stress_free_temperature = 300
    temperature = temp_jiegou
    eigenstrain_name = thermal
    block ='MONOLITH'
  []
  [youngs_modulus_steel]
    type = PiecewiseLinearInterpolationMaterial # danwei: N/cm2
    x='300            2000'
    y='194714190000   74400600000'
    property = youngs_modulus
    variable = temp_jiegou
    block ='MONOLITH'
  []
  [poissons_ratio_steel]
    type = PiecewiseLinearInterpolationMaterial
    x='300   2000'
    y='0.31  0.31'
    property = poissons_ratio
    variable = temp_jiegou
    block =  'MONOLITH'
  []
  [./elasticity_tensor]
    type = ComputeVariableIsotropicElasticityTensor
    args = temp_jiegou
    youngs_modulus = youngs_modulus
    poissons_ratio = poissons_ratio    
  [../]
  [./stress]
    type = ComputeFiniteStrainElasticStress
  [../]
[]
[Executioner]
  type = Transient
  nl_abs_tol = 1e-4
  num_steps = 5
  nl_max_its = 100
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'
[]
[Outputs]
  exodus = true
[]
