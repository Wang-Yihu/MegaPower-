# Reactor thermal power 5 MW
# Number of fuel rods in-core 2,112
# Fuel pellet outer diameter
# 5000000 W/2112=2368 W
# yuxianfenbu 1.412 cm
# 2368 W/(0.25*3.14159265*1.412 cm*1.412 cm*1.5m)
# =10081639.5196777 W/m3

[Mesh]
  [file]
    type = FileMeshGenerator
    file = quanmegapower_daore_shuwangge_cm_m_in.e
  []
[]
[Functions]
  [k_steel]
     type = PiecewiseLinear
     data_file = ./wuxing/stainless_steel316_thermal_conductivity.csv
     format = columns
  []
  [k_uo2]
    type = PiecewiseLinear
    data_file = ./wuxing/uo2_heat_conduction.csv
    format = columns
  []
  [k_he]
    type = PiecewiseLinear #laizi Thermophysical properties of Helium-4 from 2 to 1500 K with pressures to 20 atmospheres    
    x = '275     300     350     400     450     500     600     700     800     900     1000     1100     1200     1300     1400     1500'
    y = '0.147   0.156   0.173   0.190   0.206   0.221   0.251   0.280   0.308   0.334   0.360    0.385    0.410    0.434    0.457    0.480'
  []
#  [cte_func_mean_uo2]
#    type = PiecewiseLinear
#    data_file = ./data_cm/uo2_thermal_expansion_martin_eigenstrain.csv
#    format = columns
#  []
#  [cte_func_mean_steel]
#    type = PiecewiseLinear
#    data_file = ./data_cm/ss316_thermal_expansion_eigenstrain.csv
#    format = columns
#  []
#  [./reyuan]
#    type = ParsedFunction
#    value = 15.836202*sin(3.14159265/150*z)
#    value = 10081639
#  [../]
[]
[Variables]
  [temp]
    order = FIRST
    family = LAGRANGE
    initial_condition = 950.15
# The heat pipes are not explicitly modeled.
# Instead, a constant temperature boundary condition of
# 677°C (950.15 K) was prescribed at the boundaries
  []
[]
[AuxVariables]
  [heat_source]
    family = MONOMIAL
    order = CONSTANT
  []
[]
[Kernels]
  [heat_1]
    type = HeatConduction
    variable = temp
  []
  [heat_2]
    type = CoupledForce
    variable = temp
    v = heat_source
  []
[]
[BCs]
  [reguanbi]
    type = DirichletBC
    variable = temp
    boundary = '     reguanbi_0
                     reguanbi_1
                     reguanbi_2
                     reguanbi_3
                     reguanbi_4
                     reguanbi_5
                     reguanbi_6
                     reguanbi_7
                     reguanbi_8
                     reguanbi_9
                     reguanbi_10
                     reguanbi_11
                     reguanbi_12
                     reguanbi_13
                     reguanbi_14
                     reguanbi_15
                     reguanbi_16
                     reguanbi_17
                     reguanbi_18
                     reguanbi_19
                     reguanbi_20
                     reguanbi_21
                     reguanbi_22
                     reguanbi_23
                     reguanbi_24
                     reguanbi_25
                     reguanbi_26
                     reguanbi_27
                     reguanbi_28
                     reguanbi_29
                     reguanbi_30
                     reguanbi_31
                     reguanbi_32
                     reguanbi_33
                     reguanbi_34
                     reguanbi_35
                     reguanbi_36
                     reguanbi_37
                     reguanbi_38
                     reguanbi_39
                     reguanbi_40
                     reguanbi_41
                     reguanbi_42
                     reguanbi_43
                     reguanbi_44
                     reguanbi_45
                     reguanbi_46
                     reguanbi_47
                     reguanbi_48
                     reguanbi_49
                     reguanbi_50
                     reguanbi_51
                     reguanbi_52
                     reguanbi_53
                     reguanbi_54
                     reguanbi_55
                     reguanbi_56
                     reguanbi_57
                     reguanbi_58
                     reguanbi_59
                     reguanbi_60
                     reguanbi_61
                     reguanbi_62
                     reguanbi_63
                     reguanbi_64
                     reguanbi_65
                     reguanbi_66
                     reguanbi_67
                     reguanbi_68
                     reguanbi_69
                     reguanbi_70
                     reguanbi_71
                     reguanbi_72
                     reguanbi_73
                     reguanbi_74
                     reguanbi_75
                     reguanbi_76
                     reguanbi_77
                     reguanbi_78
                     reguanbi_79
                     reguanbi_80
                     reguanbi_81
                     reguanbi_82
                     reguanbi_83
                     reguanbi_84
                     reguanbi_85
                     reguanbi_86
                     reguanbi_87
                     reguanbi_88
                     reguanbi_89
                     reguanbi_90
                     reguanbi_91
                     reguanbi_92
                     reguanbi_93
                     reguanbi_94
                     reguanbi_95
                     reguanbi_96
                     reguanbi_97
                     reguanbi_98
                     reguanbi_99
                     reguanbi_100
                     reguanbi_101
                     reguanbi_102
                     reguanbi_103
                     reguanbi_104
                     reguanbi_105
                     reguanbi_106
                     reguanbi_107
                     reguanbi_108
                     reguanbi_109
                     reguanbi_110
                     reguanbi_111
                     reguanbi_112
                     reguanbi_113
                     reguanbi_114
                     reguanbi_115
                     reguanbi_116
                     reguanbi_117
                     reguanbi_118
                     reguanbi_119
                     reguanbi_120
                     reguanbi_121
                     reguanbi_122
                     reguanbi_123
                     reguanbi_124
                     reguanbi_125
                     reguanbi_126
                     reguanbi_127
                     reguanbi_128
                     reguanbi_129
                     reguanbi_130
                     reguanbi_131
                     reguanbi_132
                     reguanbi_133
                     reguanbi_134
                     reguanbi_135
                     reguanbi_136
                     reguanbi_137
                     reguanbi_138
                     reguanbi_139
                     reguanbi_140
                     reguanbi_141
                     reguanbi_142
                     reguanbi_143
                     reguanbi_144
                     reguanbi_145
                     reguanbi_146
                     reguanbi_147
                     reguanbi_148
                     reguanbi_149
                     reguanbi_150
                     reguanbi_151
                     reguanbi_152
                     reguanbi_153
                     reguanbi_154
                     reguanbi_155
                     reguanbi_156
                     reguanbi_157
                     reguanbi_158
                     reguanbi_159
                     reguanbi_160
                     reguanbi_161
                     reguanbi_162
                     reguanbi_163
                     reguanbi_164
                     reguanbi_165
                     reguanbi_166
                     reguanbi_167
                     reguanbi_168
                     reguanbi_169
                     reguanbi_170
                     reguanbi_171
                     reguanbi_172
                     reguanbi_173
                     reguanbi_174
                     reguanbi_175
                     reguanbi_176
                     reguanbi_177
                     reguanbi_178
                     reguanbi_179
                     reguanbi_180
                     reguanbi_181
                     reguanbi_182
                     reguanbi_183
                     reguanbi_184
                     reguanbi_185
                     reguanbi_186
                     reguanbi_187
                     reguanbi_188
                     reguanbi_189
                     reguanbi_190
                     reguanbi_191
                     reguanbi_192
                     reguanbi_193
                     reguanbi_194
                     reguanbi_195
                     reguanbi_196
                     reguanbi_197
                     reguanbi_198
                     reguanbi_199
                     reguanbi_200
                     reguanbi_201
                     reguanbi_202
                     reguanbi_203'
    value = 950.15
  []
[]
[Materials]
  [daore_steel]
    type = HeatConductionMaterial
    block = 'MONOLITH'
    temp = temp
    thermal_conductivity_temperature_function = k_steel
  []
  [daore_uo2]
    type = HeatConductionMaterial
    block = 'FUEL_1   FUEL_2   FUEL_3   FUEL_4   FUEL_5   FUEL_6   FUEL_7   FUEL_8   FUEL_9   FUEL_10
             FUEL_11  FUEL_12  FUEL_13  FUEL_14  FUEL_15  FUEL_16  FUEL_17  FUEL_18  FUEL_19  FUEL_20
             FUEL_21  FUEL_22  FUEL_23  FUEL_24  FUEL_25  FUEL_26  FUEL_27  FUEL_28  FUEL_29  FUEL_30
             FUEL_31  FUEL_32  FUEL_33  FUEL_34  FUEL_35  FUEL_36  FUEL_37  FUEL_38  FUEL_39  FUEL_40
             FUEL_41  FUEL_42  FUEL_43  FUEL_44  FUEL_45  FUEL_46  FUEL_47  FUEL_48  FUEL_49  FUEL_50
             FUEL_51  FUEL_52  FUEL_53  FUEL_54  FUEL_55  FUEL_56  FUEL_57  FUEL_58  FUEL_59  FUEL_60
             FUEL_61  FUEL_62  FUEL_63  FUEL_64  FUEL_65  FUEL_66  FUEL_67  FUEL_68  FUEL_69  FUEL_70
             FUEL_71  FUEL_72  FUEL_73  FUEL_74  FUEL_75  FUEL_76  FUEL_77  FUEL_78  FUEL_79  FUEL_80
             FUEL_81  FUEL_82  FUEL_83  FUEL_84  FUEL_85  FUEL_86  FUEL_87  FUEL_88  FUEL_89  FUEL_90
             FUEL_91  FUEL_92  FUEL_93  FUEL_94  FUEL_95  FUEL_96  FUEL_97  FUEL_98  FUEL_99  FUEL_100
             FUEL_101 FUEL_102 FUEL_103 FUEL_104 FUEL_105 FUEL_106 FUEL_107 FUEL_108 FUEL_109 FUEL_110
             FUEL_111 FUEL_112 FUEL_113 FUEL_114 FUEL_115 FUEL_116 FUEL_117 FUEL_118 FUEL_119 FUEL_120
             FUEL_121 FUEL_122 FUEL_123 FUEL_124 FUEL_125 FUEL_126 FUEL_127 FUEL_128 FUEL_129 FUEL_130
             FUEL_131 FUEL_132 FUEL_133 FUEL_134 FUEL_135 FUEL_136 FUEL_137 FUEL_138 FUEL_139 FUEL_140
             FUEL_141 FUEL_142 FUEL_143 FUEL_144 FUEL_145 FUEL_146 FUEL_147 FUEL_148 FUEL_149 FUEL_150
             FUEL_151 FUEL_152 FUEL_153 FUEL_154 FUEL_155 FUEL_156 FUEL_157 FUEL_158 FUEL_159 FUEL_160
             FUEL_161 FUEL_162 FUEL_163 FUEL_164 FUEL_165 FUEL_166 FUEL_167 FUEL_168 FUEL_169 FUEL_170
             FUEL_171 FUEL_172 FUEL_173 FUEL_174 FUEL_175 FUEL_176 FUEL_177 FUEL_178 FUEL_179 FUEL_180
             FUEL_181 FUEL_182 FUEL_183 FUEL_184 FUEL_185 FUEL_186 FUEL_187 FUEL_188 FUEL_189 FUEL_190
             FUEL_191 FUEL_192 FUEL_193 FUEL_194 FUEL_195 FUEL_196 FUEL_197 FUEL_198 FUEL_199 FUEL_200
             FUEL_201 FUEL_202 FUEL_203 FUEL_204 FUEL_205 FUEL_206 FUEL_207 FUEL_208 FUEL_209 FUEL_210
             FUEL_211 FUEL_212 FUEL_213 FUEL_214 FUEL_215 FUEL_216 FUEL_217 FUEL_218 FUEL_219 FUEL_220
             FUEL_221 FUEL_222 FUEL_223 FUEL_224 FUEL_225 FUEL_226 FUEL_227 FUEL_228 FUEL_229 FUEL_230
             FUEL_231 FUEL_232 FUEL_233 FUEL_234 FUEL_235 FUEL_236 FUEL_237 FUEL_238 FUEL_239 FUEL_240
             FUEL_241 FUEL_242 FUEL_243 FUEL_244 FUEL_245 FUEL_246 FUEL_247 FUEL_248 FUEL_249 FUEL_250
             FUEL_251 FUEL_252 FUEL_253 FUEL_254 FUEL_255 FUEL_256 FUEL_257 FUEL_258 FUEL_259 FUEL_260
             FUEL_261 FUEL_262 FUEL_263 FUEL_264 FUEL_265 FUEL_266 FUEL_267 FUEL_268 FUEL_269 FUEL_270
             FUEL_271 FUEL_272 FUEL_273 FUEL_274 FUEL_275 FUEL_276 FUEL_277 FUEL_278 FUEL_279 FUEL_280
             FUEL_281 FUEL_282 FUEL_283 FUEL_284 FUEL_285 FUEL_286 FUEL_287 FUEL_288 FUEL_289 FUEL_290
             FUEL_291 FUEL_292 FUEL_293 FUEL_294 FUEL_295 FUEL_296 FUEL_297 FUEL_298 FUEL_299 FUEL_300
             FUEL_301 FUEL_302 FUEL_303 FUEL_304 FUEL_305 FUEL_306 FUEL_307 FUEL_308 FUEL_309 FUEL_310
             FUEL_311 FUEL_312 FUEL_313 FUEL_314 FUEL_315 FUEL_316 FUEL_317 FUEL_318 FUEL_319 FUEL_320
             FUEL_321 FUEL_322 FUEL_323 FUEL_324 FUEL_325 FUEL_326 FUEL_327 FUEL_328 FUEL_329 FUEL_330
             FUEL_331 FUEL_332 FUEL_333 FUEL_334 FUEL_335 FUEL_336 FUEL_337 FUEL_338 FUEL_339 FUEL_340
             FUEL_341 FUEL_342 FUEL_343 FUEL_344 FUEL_345 FUEL_346 FUEL_347 FUEL_348 FUEL_349 FUEL_350
             FUEL_351 FUEL_352'
    temp = temp
    thermal_conductivity_temperature_function = k_uo2
  []
  [daore_qixi]
    type = HeatConductionMaterial
    block = 'GAP'
    temp = temp
    thermal_conductivity_temperature_function = k_he
  []
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
[MultiApps]
  [openmc]
    type = TransientMultiApp
    app_type = CardinalApp
    input_files = 'openmc.i'
    execute_on = timestep_end
  []
[]
[Transfers]
  [heat_source_from_openmc]
    type = MultiAppMeshFunctionTransfer
    from_multi_app = openmc
    variable = heat_source
    source_variable = heat_source
    from_postprocessors_to_be_preserved = heat_source
    to_postprocessors_to_be_preserved = source_integral
  []
  [temp_to_openmc]
    type = MultiAppMeshFunctionTransfer
    to_multi_app = openmc
    variable = temp
    source_variable = temp
  []
[]
[Postprocessors]
  [source_integral]
    type = ElementIntegralVariablePostprocessor
    variable = heat_source
    execute_on = transfer
  []
[]