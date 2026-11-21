#I am astonishing that SideSetsFromPointsGenerator needs a very precise point coordinate.
#I have to use original *.scdoc file.
#I have to input the point coordinate with 9 decimal places
[Mesh]
  [pingmianwangge]
    type = FileMeshGenerator
    file = megapower_pingmianwangge_daireguan.exo
  []
  [lashen]
    type = AdvancedExtruderGenerator
    input = pingmianwangge
    heights = '0.20 0.15 1.50 0.15'
    num_layers = '5 5 50 5'
    direction = '0 0 1'
    subdomain_swaps = ' 
                        1 1
                        2 2
                        3 1
                        4 1
                        5 1
                        6 1
                        7 1
                        8 1
                        9 1
                        10 1
                        11 1
                        12 1
                        13 1
                        14 1
                        15 1
                        16 1
                        17 1
                        18 1
                        19 1
                        20 1
                        21 1
                        22 1
                        23 1
                        24 1
                        25 1
                        26 1
                        27 1
                        28 1
                        29 1
                        30 1
                        31 1
                        32 1
                        33 1
                        34 1
                        35 1
                        36 1
                        37 1
                        38 1
                        39 1
                        40 1
                        41 1
                        42 1
                        43 1
                        44 1
                        45 1
                        46 1
                        47 1
                        48 1
                        49 1
                        50 1
                        51 1
                        52 1
                        53 1
                        54 1
                        55 1
                        56 1
                        57 1
                        58 1
                        59 1
                        60 1
                        61 1
                        62 1
                        63 1
                        64 1
                        65 1
                        66 1
                        67 1
                        68 1
                        69 1
                        70 1
                        71 1
                        72 1
                        73 1
                        74 1
                        75 1
                        76 1
                        77 1
                        78 1
                        79 1
                        80 1
                        81 1
                        82 1
                        83 1
                        84 1
                        85 1
                        86 1
                        87 1
                        88 1
                        89 1
                        90 1
                        91 1
                        92 1
                        93 1
                        94 1
                        95 1
                        96 1
                        97 1
                        98 1
                        99 1
                        100 1
                        101 1
                        102 1
                        103 1
                        104 1
                        105 1
                        106 1
                        107 1
                        108 1
                        109 1
                        110 1
                        111 1
                        112 1
                        113 1
                        114 1
                        115 1
                        116 1
                        117 1
                        118 1
                        119 1
                        120 1
                        121 1
                        122 1
                        123 1
                        124 1
                        125 1
                        126 1
                        127 1
                        128 1
                        129 1
                        130 1
                        131 1
                        132 1
                        133 1
                        134 1
                        135 1
                        136 1
                        137 1
                        138 1
                        139 1
                        140 1
                        141 1
                        142 1
                        143 1
                        144 1
                        145 1
                        146 1
                        147 1
                        148 1
                        149 1
                        150 1
                        151 1
                        152 1
                        153 1
                        154 1
                        155 1
                        156 1
                        157 1
                        158 1
                        159 1
                        160 1
                        161 1
                        162 1
                        163 1
                        164 1
                        165 1
                        166 1
                        167 1
                        168 1
                        169 1
                        170 1
                        171 1
                        172 1
                        173 1
                        174 1
                        175 1
                        176 1
                        177 1
                        178 1
                        179 1
                        180 1
                        181 1
                        182 1
                        183 1
                        184 1
                        185 1
                        186 1
                        187 1
                        188 1
                        189 1
                        190 1
                        191 1
                        192 1
                        193 1
                        194 1
                        195 1
                        196 1
                        197 1
                        198 1
                        199 1
                        200 1
                        201 1
                        202 1
                        203 1
                        204 1
                        205 1
                        206 1
                        207 1
                        208 1
                        209 1
                        210 1
                        211 1
                        212 1
                        213 1
                        214 1
                        215 1
                        216 1
                        217 1
                        218 1
                        219 1
                        220 1
                        221 1
                        222 1
                        223 1
                        224 1
                        225 1
                        226 1
                        227 1
                        228 1
                        229 1
                        230 1
                        231 1
                        232 1
                        233 1
                        234 1
                        235 1
                        236 1
                        237 1
                        238 1
                        239 1
                        240 1
                        241 1
                        242 1
                        243 1
                        244 1
                        245 1
                        246 1
                        247 1
                        248 1
                        249 1
                        250 1
                        251 1
                        252 1
                        253 1
                        254 1
                        255 1
                        256 1
                        257 1
                        258 1
                        259 1
                        260 1
                        261 1
                        262 1
                        263 1
                        264 1
                        265 1
                        266 1
                        267 1
                        268 1
                        269 1
                        270 1
                        271 1
                        272 1
                        273 1
                        274 1
                        275 1
                        276 1
                        277 1
                        278 1
                        279 1
                        280 1
                        281 1
                        282 1
                        283 1
                        284 1
                        285 1
                        286 1
                        287 1
                        288 1
                        289 1
                        290 1
                        291 1
                        292 1
                        293 1
                        294 1
                        295 1
                        296 1
                        297 1
                        298 1
                        299 1
                        300 1
                        301 1
                        302 1
                        303 1
                        304 1
                        305 1
                        306 1
                        307 1
                        308 1
                        309 1
                        310 1
                        311 1
                        312 1
                        313 1
                        314 1
                        315 1
                        316 1
                        317 1
                        318 1
                        319 1
                        320 1
                        321 1
                        322 1
                        323 1
                        324 1
                        325 1
                        326 1
                        327 1
                        328 1
                        329 1
                        330 1
                        331 1
                        332 1
                        333 1
                        334 1
                        335 1
                        336 1
                        337 1
                        338 1
                        339 1
                        340 1
                        341 1
                        342 1
                        343 1
                        344 1
                        345 1
                        346 1
                        347 1
                        348 1
                        349 1
                        350 1
                        351 1
                        352 1
                        353 1
                        354 1
                        355 2
                        ;
                        1 2
                        2 2
                        3 2
                        4 2
                        5 2
                        6 2
                        7 2
                        8 2
                        9 2
                        10 2
                        11 2
                        12 2
                        13 2
                        14 2
                        15 2
                        16 2
                        17 2
                        18 2
                        19 2
                        20 2
                        21 2
                        22 2
                        23 2
                        24 2
                        25 2
                        26 2
                        27 2
                        28 2
                        29 2
                        30 2
                        31 2
                        32 2
                        33 2
                        34 2
                        35 2
                        36 2
                        37 2
                        38 2
                        39 2
                        40 2
                        41 2
                        42 2
                        43 2
                        44 2
                        45 2
                        46 2
                        47 2
                        48 2
                        49 2
                        50 2
                        51 2
                        52 2
                        53 2
                        54 2
                        55 2
                        56 2
                        57 2
                        58 2
                        59 2
                        60 2
                        61 2
                        62 2
                        63 2
                        64 2
                        65 2
                        66 2
                        67 2
                        68 2
                        69 2
                        70 2
                        71 2
                        72 2
                        73 2
                        74 2
                        75 2
                        76 2
                        77 2
                        78 2
                        79 2
                        80 2
                        81 2
                        82 2
                        83 2
                        84 2
                        85 2
                        86 2
                        87 2
                        88 2
                        89 2
                        90 2
                        91 2
                        92 2
                        93 2
                        94 2
                        95 2
                        96 2
                        97 2
                        98 2
                        99 2
                        100 2
                        101 2
                        102 2
                        103 2
                        104 2
                        105 2
                        106 2
                        107 2
                        108 2
                        109 2
                        110 2
                        111 2
                        112 2
                        113 2
                        114 2
                        115 2
                        116 2
                        117 2
                        118 2
                        119 2
                        120 2
                        121 2
                        122 2
                        123 2
                        124 2
                        125 2
                        126 2
                        127 2
                        128 2
                        129 2
                        130 2
                        131 2
                        132 2
                        133 2
                        134 2
                        135 2
                        136 2
                        137 2
                        138 2
                        139 2
                        140 2
                        141 2
                        142 2
                        143 2
                        144 2
                        145 2
                        146 2
                        147 2
                        148 2
                        149 2
                        150 2
                        151 2
                        152 2
                        153 2
                        154 2
                        155 2
                        156 2
                        157 2
                        158 2
                        159 2
                        160 2
                        161 2
                        162 2
                        163 2
                        164 2
                        165 2
                        166 2
                        167 2
                        168 2
                        169 2
                        170 2
                        171 2
                        172 2
                        173 2
                        174 2
                        175 2
                        176 2
                        177 2
                        178 2
                        179 2
                        180 2
                        181 2
                        182 2
                        183 2
                        184 2
                        185 2
                        186 2
                        187 2
                        188 2
                        189 2
                        190 2
                        191 2
                        192 2
                        193 2
                        194 2
                        195 2
                        196 2
                        197 2
                        198 2
                        199 2
                        200 2
                        201 2
                        202 2
                        203 2
                        204 2
                        205 2
                        206 2
                        207 2
                        208 2
                        209 2
                        210 2
                        211 2
                        212 2
                        213 2
                        214 2
                        215 2
                        216 2
                        217 2
                        218 2
                        219 2
                        220 2
                        221 2
                        222 2
                        223 2
                        224 2
                        225 2
                        226 2
                        227 2
                        228 2
                        229 2
                        230 2
                        231 2
                        232 2
                        233 2
                        234 2
                        235 2
                        236 2
                        237 2
                        238 2
                        239 2
                        240 2
                        241 2
                        242 2
                        243 2
                        244 2
                        245 2
                        246 2
                        247 2
                        248 2
                        249 2
                        250 2
                        251 2
                        252 2
                        253 2
                        254 2
                        255 2
                        256 2
                        257 2
                        258 2
                        259 2
                        260 2
                        261 2
                        262 2
                        263 2
                        264 2
                        265 2
                        266 2
                        267 2
                        268 2
                        269 2
                        270 2
                        271 2
                        272 2
                        273 2
                        274 2
                        275 2
                        276 2
                        277 2
                        278 2
                        279 2
                        280 2
                        281 2
                        282 2
                        283 2
                        284 2
                        285 2
                        286 2
                        287 2
                        288 2
                        289 2
                        290 2
                        291 2
                        292 2
                        293 2
                        294 2
                        295 2
                        296 2
                        297 2
                        298 2
                        299 2
                        300 2
                        301 2
                        302 2
                        303 2
                        304 2
                        305 2
                        306 2
                        307 2
                        308 2
                        309 2
                        310 2
                        311 2
                        312 2
                        313 2
                        314 2
                        315 2
                        316 2
                        317 2
                        318 2
                        319 2
                        320 2
                        321 2
                        322 2
                        323 2
                        324 2
                        325 2
                        326 2
                        327 2
                        328 2
                        329 2
                        330 2
                        331 2
                        332 2
                        333 2
                        334 2
                        335 2
                        336 2
                        337 2
                        338 2
                        339 2
                        340 2
                        341 2
                        342 2
                        343 2
                        344 2
                        345 2
                        346 2
                        347 2
                        348 2
                        349 2
                        350 2
                        351 2
                        352 2
                        353 2
                        354 2
                        355 2
                        ;
                        ;
                        1 2
                        2 2
                        3 2
                        4 2
                        5 2
                        6 2
                        7 2
                        8 2
                        9 2
                        10 2
                        11 2
                        12 2
                        13 2
                        14 2
                        15 2
                        16 2
                        17 2
                        18 2
                        19 2
                        20 2
                        21 2
                        22 2
                        23 2
                        24 2
                        25 2
                        26 2
                        27 2
                        28 2
                        29 2
                        30 2
                        31 2
                        32 2
                        33 2
                        34 2
                        35 2
                        36 2
                        37 2
                        38 2
                        39 2
                        40 2
                        41 2
                        42 2
                        43 2
                        44 2
                        45 2
                        46 2
                        47 2
                        48 2
                        49 2
                        50 2
                        51 2
                        52 2
                        53 2
                        54 2
                        55 2
                        56 2
                        57 2
                        58 2
                        59 2
                        60 2
                        61 2
                        62 2
                        63 2
                        64 2
                        65 2
                        66 2
                        67 2
                        68 2
                        69 2
                        70 2
                        71 2
                        72 2
                        73 2
                        74 2
                        75 2
                        76 2
                        77 2
                        78 2
                        79 2
                        80 2
                        81 2
                        82 2
                        83 2
                        84 2
                        85 2
                        86 2
                        87 2
                        88 2
                        89 2
                        90 2
                        91 2
                        92 2
                        93 2
                        94 2
                        95 2
                        96 2
                        97 2
                        98 2
                        99 2
                        100 2
                        101 2
                        102 2
                        103 2
                        104 2
                        105 2
                        106 2
                        107 2
                        108 2
                        109 2
                        110 2
                        111 2
                        112 2
                        113 2
                        114 2
                        115 2
                        116 2
                        117 2
                        118 2
                        119 2
                        120 2
                        121 2
                        122 2
                        123 2
                        124 2
                        125 2
                        126 2
                        127 2
                        128 2
                        129 2
                        130 2
                        131 2
                        132 2
                        133 2
                        134 2
                        135 2
                        136 2
                        137 2
                        138 2
                        139 2
                        140 2
                        141 2
                        142 2
                        143 2
                        144 2
                        145 2
                        146 2
                        147 2
                        148 2
                        149 2
                        150 2
                        151 2
                        152 2
                        153 2
                        154 2
                        155 2
                        156 2
                        157 2
                        158 2
                        159 2
                        160 2
                        161 2
                        162 2
                        163 2
                        164 2
                        165 2
                        166 2
                        167 2
                        168 2
                        169 2
                        170 2
                        171 2
                        172 2
                        173 2
                        174 2
                        175 2
                        176 2
                        177 2
                        178 2
                        179 2
                        180 2
                        181 2
                        182 2
                        183 2
                        184 2
                        185 2
                        186 2
                        187 2
                        188 2
                        189 2
                        190 2
                        191 2
                        192 2
                        193 2
                        194 2
                        195 2
                        196 2
                        197 2
                        198 2
                        199 2
                        200 2
                        201 2
                        202 2
                        203 2
                        204 2
                        205 2
                        206 2
                        207 2
                        208 2
                        209 2
                        210 2
                        211 2
                        212 2
                        213 2
                        214 2
                        215 2
                        216 2
                        217 2
                        218 2
                        219 2
                        220 2
                        221 2
                        222 2
                        223 2
                        224 2
                        225 2
                        226 2
                        227 2
                        228 2
                        229 2
                        230 2
                        231 2
                        232 2
                        233 2
                        234 2
                        235 2
                        236 2
                        237 2
                        238 2
                        239 2
                        240 2
                        241 2
                        242 2
                        243 2
                        244 2
                        245 2
                        246 2
                        247 2
                        248 2
                        249 2
                        250 2
                        251 2
                        252 2
                        253 2
                        254 2
                        255 2
                        256 2
                        257 2
                        258 2
                        259 2
                        260 2
                        261 2
                        262 2
                        263 2
                        264 2
                        265 2
                        266 2
                        267 2
                        268 2
                        269 2
                        270 2
                        271 2
                        272 2
                        273 2
                        274 2
                        275 2
                        276 2
                        277 2
                        278 2
                        279 2
                        280 2
                        281 2
                        282 2
                        283 2
                        284 2
                        285 2
                        286 2
                        287 2
                        288 2
                        289 2
                        290 2
                        291 2
                        292 2
                        293 2
                        294 2
                        295 2
                        296 2
                        297 2
                        298 2
                        299 2
                        300 2
                        301 2
                        302 2
                        303 2
                        304 2
                        305 2
                        306 2
                        307 2
                        308 2
                        309 2
                        310 2
                        311 2
                        312 2
                        313 2
                        314 2
                        315 2
                        316 2
                        317 2
                        318 2
                        319 2
                        320 2
                        321 2
                        322 2
                        323 2
                        324 2
                        325 2
                        326 2
                        327 2
                        328 2
                        329 2
                        330 2
                        331 2
                        332 2
                        333 2
                        334 2
                        335 2
                        336 2
                        337 2
                        338 2
                        339 2
                        340 2
                        341 2
                        342 2
                        343 2
                        344 2
                        345 2
                        346 2
                        347 2
                        348 2
                        349 2
                        350 2
                        351 2
                        352 2
                        353 2
                        354 2                        
                        355 355
                       '
  []
  [shanchu_reguan]
    type = BlockDeletionGenerator
    input = lashen
    block = '355'
  []
#  [waibianjie]
#    type = SideSetsAroundSubdomainGenerator
#    input = 'shanchu_reguan'
#    block = 2
#    new_boundary = 'waibubianjie'
#  []
#  [shuzhi_normal]
#    input = waibianjie
#    type = SideSetsFromNormalsGenerator
#    new_boundary = 'shuzhi'
#    normals = '0 0 1'
#    replace = True
#  []
#  [split]
#    input = shuzhi_normal
#    type = SideSetsFromPointsGenerator
#    new_boundary = 'haha'
#    points = '0.360002 -0.0512402 0'
#    replace = True
#  []
#  [split_1]
#    input = split
#    type = SideSetsFromPointsGenerator
#    new_boundary = 'cebian_1'
#    points = '-0.009875 0.0238288 0.725'
#    replace = True
#  []
#  [split_2]
#    input = split_1
#    type = SideSetsFromPointsGenerator
#    new_boundary = 'cebian_2'
#    points = '0.393877592 0.021 1.625'
#    replace = True
#  []
#  [split_3]
#    input = split_2
#    type = SideSetsFromPointsGenerator
#    new_boundary = 'cebian_3'
#    points = '0.31289958 0.247481325 1.625'
#    replace = True
#  []
#  [split_4]
#    input = split_3
#    type = SideSetsFromPointsGenerator
#    new_boundary = 'cebian_4'
#    points = '0.181228822 -0.143748177 1.625'
#    replace = True
#  []
  [split_reguanbi]
#    input = split_4
    input = shanchu_reguan
    type = SideSetsFromPointsGenerator
    new_boundary = ' reguanbi_0
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
    points = '
               0.391877592  0.277130000  1.8
               0.391877592  0.249417000  1.8
               0.391877592  0.221704000  1.8
               0.391877592  0.193991000  1.8
               0.391877592  0.166278000  1.8
               0.391877592  0.138565000  1.8
               0.391877592  0.110852000  1.8
               0.391877592  0.083139000  1.8
               0.391877592  0.055426000  1.8
               0.391877592  0.027713000  1.8
               0.391877592  0.000000000  1.8
               0.391877592  -0.027713000  1.8
               0.391877592  -0.055426000  1.8
               0.391877592  -0.083139000  1.8
               0.391877592  -0.110852000  1.8
               0.391877592  -0.138565000  1.8
               0.391877592  -0.166278000  1.8
               0.391877592  -0.193991000  1.8
               0.391877592  -0.221704000  1.8
               0.391877592  -0.249417000  1.8
               0.367877430  0.263273500  1.8
               0.367877430  0.235560500  1.8
               0.367877430  0.207847500  1.8
               0.367877430  0.180134500  1.8
               0.367877430  0.152421500  1.8
               0.367877430  0.124708500  1.8
               0.367877430  0.096995500  1.8
               0.367877430  0.069282500  1.8
               0.367877430  0.041569500  1.8
               0.367877430  0.013856500  1.8
               0.367877430  -0.013856500  1.8
               0.367877430  -0.041569500  1.8
               0.367877430  -0.069282500  1.8
               0.367877430  -0.096995500  1.8
               0.367877430  -0.124708500  1.8
               0.367877430  -0.152421500  1.8
               0.367877430  -0.180134500  1.8
               0.367877430  -0.207847500  1.8
               0.367877430  -0.235560500  1.8
               0.343877268  0.249417000  1.8
               0.343877268  0.221704000  1.8
               0.343877268  0.193991000  1.8
               0.343877268  0.166278000  1.8
               0.343877268  0.138565000  1.8
               0.343877268  0.110852000  1.8
               0.343877268  0.083139000  1.8
               0.343877268  0.055426000  1.8
               0.343877268  0.027713000  1.8
               0.343877268  0.000000000  1.8
               0.343877268  -0.027713000  1.8
               0.343877268  -0.055426000  1.8
               0.343877268  -0.083139000  1.8
               0.343877268  -0.110852000  1.8
               0.343877268  -0.138565000  1.8
               0.343877268  -0.166278000  1.8
               0.343877268  -0.193991000  1.8
               0.343877268  -0.221704000  1.8
               0.319877106  0.235560500  1.8
               0.319877106  0.207847500  1.8
               0.319877106  0.180134500  1.8
               0.319877106  0.152421500  1.8
               0.319877106  0.124708500  1.8
               0.319877106  0.096995500  1.8
               0.319877106  0.069282500  1.8
               0.319877106  0.041569500  1.8
               0.319877106  0.013856500  1.8
               0.319877106  -0.013856500  1.8
               0.319877106  -0.041569500  1.8
               0.319877106  -0.069282500  1.8
               0.319877106  -0.096995500  1.8
               0.319877106  -0.124708500  1.8
               0.319877106  -0.152421500  1.8
               0.319877106  -0.180134500  1.8
               0.319877106  -0.207847500  1.8
               0.295876944  0.221704000  1.8
               0.295876944  0.193991000  1.8
               0.295876944  0.166278000  1.8
               0.295876944  0.138565000  1.8
               0.295876944  0.110852000  1.8
               0.295876944  0.083139000  1.8
               0.295876944  0.055426000  1.8
               0.295876944  0.027713000  1.8
               0.295876944  -0.000000000  1.8
               0.295876944  -0.027713000  1.8
               0.295876944  -0.055426000  1.8
               0.295876944  -0.083139000  1.8
               0.295876944  -0.110852000  1.8
               0.295876944  -0.138565000  1.8
               0.295876944  -0.166278000  1.8
               0.295876944  -0.193991000  1.8
               0.271876782  0.207847500  1.8
               0.271876782  0.180134500  1.8
               0.271876782  0.152421500  1.8
               0.271876782  0.124708500  1.8
               0.271876782  0.096995500  1.8
               0.271876782  0.069282500  1.8
               0.271876782  0.041569500  1.8
               0.271876782  0.013856500  1.8
               0.271876782  -0.013856500  1.8
               0.271876782  -0.041569500  1.8
               0.271876782  -0.069282500  1.8
               0.271876782  -0.096995500  1.8
               0.271876782  -0.124708500  1.8
               0.271876782  -0.152421500  1.8
               0.271876782  -0.180134500  1.8
               0.247876621  0.193991000  1.8
               0.247876621  0.166278000  1.8
               0.247876621  0.138565000  1.8
               0.247876621  0.110852000  1.8
               0.247876621  0.083139000  1.8
               0.247876621  0.055426000  1.8
               0.247876621  0.027713000  1.8
               0.247876621  -0.000000000  1.8
               0.247876621  -0.027713000  1.8
               0.247876621  -0.055426000  1.8
               0.247876621  -0.083139000  1.8
               0.247876621  -0.110852000  1.8
               0.247876621  -0.138565000  1.8
               0.247876621  -0.166278000  1.8
               0.223876459  0.180134500  1.8
               0.223876459  0.152421500  1.8
               0.223876459  0.124708500  1.8
               0.223876459  0.096995500  1.8
               0.223876459  0.069282500  1.8
               0.223876459  0.041569500  1.8
               0.223876459  0.013856500  1.8
               0.223876459  -0.013856500  1.8
               0.223876459  -0.041569500  1.8
               0.223876459  -0.069282500  1.8
               0.223876459  -0.096995500  1.8
               0.223876459  -0.124708500  1.8
               0.223876459  -0.152421500  1.8
               0.199876297  0.166278000  1.8
               0.199876297  0.138565000  1.8
               0.199876297  0.110852000  1.8
               0.199876297  0.083139000  1.8
               0.199876297  0.055426000  1.8
               0.199876297  0.027713000  1.8
               0.199876297  -0.000000000  1.8
               0.199876297  -0.027713000  1.8
               0.199876297  -0.055426000  1.8
               0.199876297  -0.083139000  1.8
               0.199876297  -0.110852000  1.8
               0.199876297  -0.138565000  1.8
               0.175876135  0.152421500  1.8
               0.175876135  0.124708500  1.8
               0.175876135  0.096995500  1.8
               0.175876135  0.069282500  1.8
               0.175876135  0.041569500  1.8
               0.175876135  0.013856500  1.8
               0.175876135  -0.013856500  1.8
               0.175876135  -0.041569500  1.8
               0.175876135  -0.069282500  1.8
               0.175876135  -0.096995500  1.8
               0.175876135  -0.124708500  1.8
               0.151875973  0.138565000  1.8
               0.151875973  0.110852000  1.8
               0.151875973  0.083139000  1.8
               0.151875973  0.055426000  1.8
               0.151875973  0.027713000  1.8
               0.151875973  0.000000000  1.8
               0.151875973  -0.027713000  1.8
               0.151875973  -0.055426000  1.8
               0.151875973  -0.083139000  1.8
               0.151875973  -0.110852000  1.8
               0.127875811  0.124708500  1.8
               0.127875811  0.096995500  1.8
               0.127875811  0.069282500  1.8
               0.127875811  0.041569500  1.8
               0.127875811  0.013856500  1.8
               0.127875811  -0.013856500  1.8
               0.127875811  -0.041569500  1.8
               0.127875811  -0.069282500  1.8
               0.127875811  -0.096995500  1.8
               0.103875649  0.110852000  1.8
               0.103875649  0.083139000  1.8
               0.103875649  0.055426000  1.8
               0.103875649  0.027713000  1.8
               0.103875649  -0.000000000  1.8
               0.103875649  -0.027713000  1.8
               0.103875649  -0.055426000  1.8
               0.103875649  -0.083139000  1.8
               0.079875487  0.096995500  1.8
               0.079875487  0.069282500  1.8
               0.079875487  0.041569500  1.8
               0.079875487  0.013856500  1.8
               0.079875487  -0.013856500  1.8
               0.079875487  -0.041569500  1.8
               0.079875487  -0.069282500  1.8
               0.055875325  0.083139000  1.8
               0.055875325  0.055426000  1.8
               0.055875325  0.027713000  1.8
               0.055875325  -0.000000000  1.8
               0.055875325  -0.027713000  1.8
               0.055875325  -0.055426000  1.8
               0.031875163  0.069282500  1.8
               0.031875163  0.041569500  1.8
               0.031875163  0.013856500  1.8
               0.031875163  -0.013856500  1.8
               0.031875163  -0.041569500  1.8
               0.007875001  0.055426000  1.8
               0.007875001  0.027713000  1.8
               0.007875001  -0.000000000  1.8
               0.007875001  -0.027713000  1.8
                                               '
    replace = True
  []
  [suofang_cm]
    type = TransformGenerator
    input = split_reguanbi
    transform = SCALE
    vector_value = '100 100 100'
  []
[]
