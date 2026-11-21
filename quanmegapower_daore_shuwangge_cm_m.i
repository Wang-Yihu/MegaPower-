#I am astonishing that SideSetsFromPointsGenerator needs a very precise point coordinate.
#I have to use original *.scdoc file.
#I have to input the point coordinate with 9 decimal places
[Mesh]
  [duwenjian]
    type = FileMeshGenerator
    file = quanmegapower_daore_shuwangge_cm_in.e
  []
  [suofang_cm_m]
    type = TransformGenerator
    input = duwenjian
    transform = SCALE
    vector_value = '0.01 0.01 0.01'
  []
[]
