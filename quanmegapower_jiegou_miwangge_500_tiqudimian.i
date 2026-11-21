#I am astonishing that SideSetsFromPointsGenerator needs a very precise point coordinate.
#I have to use original *.scdoc file.
#I have to input the point coordinate with 9 decimal places
[Mesh]
  [pingmianwangge]
    type = FileMeshGenerator
    file = quanmegapower_jiegou_miwangge_500_in.e
  []
  [tiqu_dimian]
    input = pingmianwangge
    type = SideSetsFromPointsGenerator
    new_boundary = 'DIMIAN'
    points = '0.0224127 -0.045406 0'
    replace = True
  []
[]
