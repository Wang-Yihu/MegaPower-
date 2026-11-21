'''
Reference: Special Purpose Nuclear Reactor (5 MW) for Reliable Power at Remote Sites Assessment Report
'''
from math import log10
import math
import glob
from IPython.display import Image
import matplotlib.pyplot as plt
import scipy.stats
import numpy as np
import pandas as pd
import openmc
######################################################################################################################################
###########################################################  input  ##################################################################
temp_fuel_ = 950.15
temp_matrix_ = 950.15
temp_struc_ = 950.15
temperature_list = [950.15,950.15,950.15]
basic_hp_circle_center_cood = [0.0, -2.7713, 35.0]
Block_top_cap_height = 0.5
Block_top_axial_reflector = 15.0
Block_fuel_height = 150.0
Block_bottom_axial_reflector = 15.0
Block_fission_gas_plenum = 20.0
Block_bottom_cap_height = 0.5
Block_total_height = Block_top_cap_height + Block_top_axial_reflector + Block_fuel_height + Block_bottom_axial_reflector +\
Block_fission_gas_plenum + Block_bottom_cap_height
num_first_column_hp = 4
Monolith_edge_thickness = 0.2
HP_hole_diameter = 1.575
HP_holes_per_block = 204
#Fuel holes per block is not an independent parameter.
hypotenuse_horizontal_angle = math.pi/6
HP_to_HP_pitch = 2.7713
Fuel_to_fuel_pitch = 1.60
Fuel_channel_hole_outer_diameter = 1.425
Fuel_pellet_outer_diameter = 1.412 #1.412
Radial_air_gap_thickness_between_blocks = 0.4
Drum_outer_diameter = 25.0
drum_gap = 0.2 #This is a guess value.
Drum_inner_diameter = (Drum_outer_diameter/2 - drum_gap)*2
reflector_shield_gap = 1.3 #This value is measured in the figure of Cross-sectional view of the LANL Special Purpose Reactor core
gap_block_to_block_half = 0.75 #This value is measured in the figure of Cross-sectional view of the LANL Special Purpose Reactor core
shield_thickness = 8.2 #This value is measured in the figure of Cross-sectional view of the LANL Special Purpose Reactor core
arc_central_half_angle = math.pi/3 #This value is measured in the figure of Cross-sectional view of the LANL Special Purpose Reactor core
arc_max_thick = 2.0 #This value is measured in the figure of Cross-sectional view of the LANL Special Purpose Reactor core
num_fuel_axial_cell = 50


######################################################################################################################################
####################################################Setting the materials#############################################################
fuel=openmc.Material(name='uox')
fuel.add_nuclide('U235', 4.5036366E-03)
fuel.add_nuclide('U238', 1.8008410E-02)
fuel.add_nuclide('U236', 2.0628819E-05)
fuel.add_nuclide('O16', 4.5128749E-02)
fuel.add_nuclide('O17', 1.7110281E-05)
fuel.temperature = temperature_list[0]

ss316=openmc.Material(name='ss316')
ss316.add_nuclide('C0', 1.2078260E-04)
ss316.add_nuclide('Si28', 1.5880230E-03)
ss316.add_nuclide('Si29', 8.0635278E-05)
ss316.add_nuclide('Si30', 5.3155136E-05)
ss316.add_nuclide('Mn55', 1.7604483E-03)
ss316.add_nuclide('S32', 4.3001287E-05)
ss316.add_nuclide('S33', 3.3874561E-07)
ss316.add_nuclide('S34', 1.8984803E-06)
ss316.add_nuclide('S36', 6.5967370E-09)
ss316.add_nuclide('P31', 7.0256257E-05)
ss316.add_nuclide('Cr50', 6.8696424E-04)
ss316.add_nuclide('Cr52', 1.3247422E-02)
ss316.add_nuclide('Cr53', 1.5021513E-03)
ss316.add_nuclide('Cr54', 3.7391725E-04)
ss316.add_nuclide('Ni58', 6.7306742E-03)
ss316.add_nuclide('Ni60', 2.5926437E-03)
ss316.add_nuclide('Ni61', 1.1270042E-04)
ss316.add_nuclide('Ni62', 3.5933827E-04)
ss316.add_nuclide('Ni64', 9.1512863E-05)
ss316.add_nuclide('Mo100', 1.7110281E-05)
ss316.add_nuclide('Mo92', 1.8457590E-04)
ss316.add_nuclide('Mo94', 1.1575526E-04)
ss316.add_nuclide('Mo95', 1.9999818E-04)
ss316.add_nuclide('Mo96', 2.1007809E-04)
ss316.add_nuclide('Mo97', 1.2073222E-04)
ss316.add_nuclide('Mo98', 3.0607672E-04)
ss316.add_nuclide('Fe54', 3.3098636E-03)
ss316.add_nuclide('Fe56', 5.1957781E-02)
ss316.add_nuclide('Fe57', 1.1999317E-03)
ss316.add_nuclide('Fe58', 1.5968889E-04)
ss316.temperature = temperature_list[1]

helium=openmc.Material(name='Helium')
helium.add_nuclide('He3', 5.3742768E-08)
helium.add_nuclide('He4', 2.6871330E-02)
helium.temperature = temperature_list[2]

potassium=openmc.Material(name='Potassium')
potassium.add_nuclide('K39', 1.8440681E-03)
potassium.add_nuclide('K40', 2.3135360E-07)
potassium.add_nuclide('K41', 1.3308171E-04)
potassium.temperature = temperature_list[2]

al2o3=openmc.Material(name='al2o3')
al2o3.add_nuclide('Al27', 4.6074720E-02)
al2o3.add_nuclide('O16', 6.9085886E-02)
al2o3.add_nuclide('O17', 2.6193478E-05)
al2o3.temperature = temperature_list[2]

beo=openmc.Material(name='beo')
beo.add_nuclide('Be9', 7.2484893E-02)
beo.add_nuclide('O16', 7.2457422E-02)
beo.add_nuclide('O17', 2.7471775E-05)
beo.temperature = temperature_list[2]

lead=openmc.Material(name='lead')
lead.add_nuclide('Pb204', 4.6153909E-04)
lead.add_nuclide('Pb206', 7.9450658E-03)
lead.add_nuclide('Pb207', 7.2857242E-03)
lead.add_nuclide('Pb208', 1.7274749E-02)
lead.temperature = temperature_list[2]

natural_b4c=openmc.Material(name='b4c')
natural_b4c.add_nuclide('B10', 2.0902003E-02)
natural_b4c.add_nuclide('B11', 8.4557143E-02)
natural_b4c.add_nuclide('C0', 2.6364787E-02)
natural_b4c.temperature = temperature_list[2]

enriched_b4c=openmc.Material(name='90% b4c')
enriched_b4c.add_nuclide('B10', 1.0372589E-01)
enriched_b4c.add_nuclide('B11', 1.1525099E-02)
enriched_b4c.add_nuclide('C0', 2.8812747E-02)
enriched_b4c.temperature = temperature_list[2]

concrete=openmc.Material(name='concrete')
concrete.add_nuclide('Si30', 5.2004747E-04)
concrete.add_nuclide('Si28', 1.5536549E-02)
concrete.add_nuclide('Si29', 7.8890161E-04)
concrete.add_nuclide('O16', 4.7751986E-02)

concrete.add_nuclide('O17', 1.8141168E-05)
concrete.add_nuclide('Ca40', 2.9014477E-03)
concrete.add_nuclide('Ca43', 4.0405549E-06)
concrete.add_nuclide('Ca44', 6.2434056E-05)
concrete.add_nuclide('Ca42', 1.9364733E-05)
concrete.add_nuclide('Ca46', 1.1972015E-07)
concrete.add_nuclide('Ca48', 5.5969168E-06)
concrete.add_nuclide('Al27', 1.1642417E-04)
concrete.add_nuclide('Fe54', 7.2416517E-06)
concrete.add_nuclide('Fe58', 3.4938336E-07)
concrete.add_nuclide('Fe57', 2.6253310E-06)
concrete.add_nuclide('Fe56', 1.1367844E-04)
concrete.add_nuclide('Mg24', 1.1626436E-04)
concrete.add_nuclide('Mg26', 1.6241461E-05)
concrete.add_nuclide('Mg25', 1.4755594E-05)
concrete.add_nuclide('S36', 1.0808848E-08)
concrete.add_nuclide('S33', 5.5503954E-07)
concrete.add_nuclide('S32', 7.0458225E-05)
concrete.add_nuclide('S34', 3.1106871E-06)
concrete.add_nuclide('Na23', 1.9152864E-05)
concrete.add_nuclide('K40', 3.4403911E-09)
concrete.add_nuclide('K41', 1.9790188E-06)
concrete.add_nuclide('K39', 2.7422593E-05)

concrete.add_nuclide('C0', 2.1922677E-03)
concrete.add_nuclide('H1', 1.1985742E-02)
concrete.add_nuclide('H2', 1.8669503E-06)
concrete.temperature = temperature_list[2]

materials_file = openmc.Materials([fuel, ss316, helium, potassium, al2o3, beo, lead, natural_b4c, enriched_b4c, concrete])
materials_file.export_to_xml()
######################################################################################################################################
################################################  axial position plane  ##############################################################
z_axis_key_position = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
z_axis_key_position[3] = basic_hp_circle_center_cood[2]
z_axis_key_position[2] = z_axis_key_position[3] - Block_bottom_axial_reflector
z_axis_key_position[1] = z_axis_key_position[2] - Block_fission_gas_plenum
z_axis_key_position[0] = z_axis_key_position[1] - Block_bottom_cap_height
z_axis_key_position[4] = z_axis_key_position[3] + Block_fuel_height
z_axis_key_position[5] = z_axis_key_position[4] + Block_top_axial_reflector
z_axis_key_position[6] = z_axis_key_position[5] + Block_top_cap_height
z0_plane = openmc.ZPlane(z0 = z_axis_key_position[0],boundary_type='vacuum')
z1_plane = openmc.ZPlane(z0 = z_axis_key_position[1])
z2_plane = openmc.ZPlane(z0 = z_axis_key_position[2])
z3_plane = openmc.ZPlane(z0 = z_axis_key_position[3])
z4_plane = openmc.ZPlane(z0 = z_axis_key_position[4])
z5_plane = openmc.ZPlane(z0 = z_axis_key_position[5])
z6_plane = openmc.ZPlane(z0 = z_axis_key_position[6],boundary_type='vacuum')

z_3_4_plane_list = [0]*(num_fuel_axial_cell-1)
for i in range(0, num_fuel_axial_cell-1):
  z_3_4_plane_list[i] = openmc.ZPlane(  z0 = z_axis_key_position[3] + (z_axis_key_position[4] - z_axis_key_position[3])/(num_fuel_axial_cell)*(i+1)  )

print('z_axis_key_position = ',z_axis_key_position)
######################################################################################################################################
##########################################       isosceles trapezoid plane       #####################################################
monolith_leftside_xcood = basic_hp_circle_center_cood[0] - HP_hole_diameter/2 - Monolith_edge_thickness
monolith_leftside_Plane = openmc.XPlane(x0 = monolith_leftside_xcood)

num_hp_eachcolumn = []
current_num_column_hp = num_first_column_hp
left_num_hp = HP_holes_per_block
for num_hp_column in range(1, 10000):
  num_hp_eachcolumn.append(current_num_column_hp) # num_hp_eachcolumn will be [4, 5, 6, ..., 20]
  left_num_hp = left_num_hp - current_num_column_hp
  current_num_column_hp = current_num_column_hp + 1
  num_hp_column = num_hp_column + 1
  if left_num_hp <= 0:
    break
num_hp_column = num_hp_column - 1 # num_hp_column will be 17

monolith_rightside_xcood = basic_hp_circle_center_cood[0] + (num_hp_column - 1) * HP_to_HP_pitch * math.cos(hypotenuse_horizontal_angle) + HP_hole_diameter/2 + Monolith_edge_thickness
monolith_rightside_Plane = openmc.XPlane(x0 = monolith_rightside_xcood)


#Equation is y - monolith_downside_keyposition_ycood = k(x - monolith_downside_keyposition_xcood)
#Standard equation in OpenMC is Ax + By + Cz = D
#kx - y = kx0 - y0
monolith_downside_keyposition_xcood = basic_hp_circle_center_cood[0] - (HP_hole_diameter/2 + Monolith_edge_thickness) * math.sin(hypotenuse_horizontal_angle)
monolith_downside_keyposition_ycood = basic_hp_circle_center_cood[1] - (HP_hole_diameter/2 + Monolith_edge_thickness) * math.cos(hypotenuse_horizontal_angle)
monolith_downside_slope = math.tan(math.pi - hypotenuse_horizontal_angle)

monolith_downside_Plane = openmc.Plane(a = monolith_downside_slope, b =  -1,  c = 0, d = monolith_downside_slope*monolith_downside_keyposition_xcood-monolith_downside_keyposition_ycood)

monolith_upside_keyposition_xcood = monolith_downside_keyposition_xcood
monolith_upside_keyposition_ycood = basic_hp_circle_center_cood[1] + (num_first_column_hp - 1) * HP_to_HP_pitch +\
(HP_hole_diameter/2 + Monolith_edge_thickness) * math.cos(hypotenuse_horizontal_angle)
monolith_upside_slope = math.tan(hypotenuse_horizontal_angle)

monolith_upside_Plane = openmc.Plane(a = monolith_upside_slope, b =  -1,  c = 0, d = monolith_upside_slope*monolith_upside_keyposition_xcood-monolith_upside_keyposition_ycood)

#######################################################################################################################################
#####################################     heatpipe hole plane    ######################################################################
hp_circle_center_coodx = [0.0]*HP_holes_per_block
hp_circle_center_coody = [0.0]*HP_holes_per_block
hp_column_num = [0]*HP_holes_per_block # hp_column_num will be [0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, ..., ]
hp_line_num   = [0]*HP_holes_per_block # hp_line_num will be [0, 1, 2, 3, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 5, ..., ]
hp_circle_center_coodx[0] = basic_hp_circle_center_cood[0]
hp_circle_center_coody[0] = basic_hp_circle_center_cood[1]
sum_hp_amount_in_column = [0]*num_hp_column
heatpipe_hole_Plane_list = [0]*HP_holes_per_block
for i in range(0, num_hp_column):
  sum_hp_amount_in_column[i] = 0
  for k in range(0, i+1):
    sum_hp_amount_in_column[i] = sum_hp_amount_in_column[i] + num_hp_eachcolumn[k] #sum_hp_amount_in_column will be [4, 9, 15, ..., 204]
k = 0

for i in range(0, HP_holes_per_block):
  if i <= sum_hp_amount_in_column[0] - 1:
    hp_column_num[i] = k
  else:
    for k in range(0, num_hp_column):
      if i > sum_hp_amount_in_column[k] - 1:
        hp_column_num[i] = k + 1

hp_line_num[0] = 0
for i in range(1, HP_holes_per_block):
  if hp_column_num[i] != hp_column_num[i - 1]:
    hp_line_num[i] = 0
  else:
    hp_line_num[i] = hp_line_num[i - 1] + 1

for i in range(0, HP_holes_per_block):
  hp_circle_center_coodx[i] = basic_hp_circle_center_cood[0] + hp_column_num[i]*HP_to_HP_pitch*math.cos(hypotenuse_horizontal_angle)
  hp_circle_center_coody[i] = basic_hp_circle_center_cood[1] - hp_column_num[i]*HP_to_HP_pitch*math.sin(hypotenuse_horizontal_angle) + hp_line_num[i]*HP_to_HP_pitch

#hp_circle_center_coodx will be [0.0, 0.0, 0.0, 0.0, 2.4000162015078152, 2.4000162015078152, 2.4000162015078152, 2.4000162015078152, 2.4000162015078152, ...]
#hp_circle_center_coody will be [-2.7713, 0.0, 2.7713, 5.5426, -4.15695, -1.38565, 1.38565, 4.15695, 6.92825, ...]
for i in range(0, HP_holes_per_block):
  heatpipe_hole_Plane_list[i] = openmc.ZCylinder(x0=hp_circle_center_coodx[i], y0=hp_circle_center_coody[i], r=HP_hole_diameter/2)

#######################################################################################################################################
#####################################     fuel hole plane    ##########################################################################
num_fuel_column = num_hp_column - 1  # num_fuel_column will be 16
num_fuel_eachcolumn = [0] * num_fuel_column #  num_fuel_eachcolumn will be [7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37]
for i in range(0, num_fuel_column):
  num_fuel_eachcolumn[i] = num_hp_eachcolumn[i] + num_hp_eachcolumn[i] - 1

Fuel_holes_per_block = 0  # Fuel_holes_per_block will be 352.
for i in range(0, num_fuel_column):
  Fuel_holes_per_block = Fuel_holes_per_block + num_fuel_eachcolumn[i]
sum_fuel_amount_in_column = [0]*num_fuel_column

for i in range(0, num_fuel_column):
  sum_fuel_amount_in_column[i] = 0
  for k in range(0, i+1):
    sum_fuel_amount_in_column[i] = sum_fuel_amount_in_column[i] + num_fuel_eachcolumn[k] #sum_fuel_amount_in_column will be [7, 16, 27, 40, 55, 72, 91, 112, 135, 160, 187, 216, 247, 280, 315, 352]


fuel_column_num = [0]*Fuel_holes_per_block #fuel_column_num will be [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ...]
fuel_line_num   = [0]*Fuel_holes_per_block #fuel_line_num will be [0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0,...]
k = 0
for i in range(0, Fuel_holes_per_block):
  if i <= sum_fuel_amount_in_column[0] - 1:
    fuel_column_num[i] = k
  else:
    for k in range(0, num_fuel_column):
      if i > sum_fuel_amount_in_column[k] - 1:
        fuel_column_num[i] = k + 1

fuel_line_num[0] = 0
for i in range(1, Fuel_holes_per_block):
  if fuel_column_num[i] != fuel_column_num[i - 1]:
    fuel_line_num[i] = 0
  else:
    fuel_line_num[i] = fuel_line_num[i - 1] + 1

fuel_circle_center_coodx = [0.0]*Fuel_holes_per_block
fuel_circle_center_coody = [0.0]*Fuel_holes_per_block

fuel_circle_center_coodx[0] = basic_hp_circle_center_cood[0] + (2 * math.cos(hypotenuse_horizontal_angle) * HP_to_HP_pitch - Fuel_to_fuel_pitch)/2
fuel_circle_center_coody[0] = basic_hp_circle_center_cood[1]

for i in range(1, Fuel_holes_per_block):
  if fuel_line_num[i] % 2 == 0:
    fuel_circle_center_coodx[i] = fuel_circle_center_coodx[0] + (  fuel_column_num[i]+ fuel_column_num[i]*math.sin(hypotenuse_horizontal_angle)  )*Fuel_to_fuel_pitch
  if fuel_line_num[i] % 2 == 1:
    fuel_circle_center_coodx[i] = fuel_circle_center_coodx[0] + (  fuel_column_num[i]+ fuel_column_num[i]*math.sin(hypotenuse_horizontal_angle)  )*Fuel_to_fuel_pitch - math.sin(hypotenuse_horizontal_angle)*Fuel_to_fuel_pitch
  fuel_circle_center_coody[i] = fuel_circle_center_coody[0] - fuel_column_num[i]*Fuel_to_fuel_pitch*math.cos(hypotenuse_horizontal_angle) + fuel_line_num[i]*Fuel_to_fuel_pitch*math.cos(hypotenuse_horizontal_angle)

fuel_hole_Plane_list = [0]* Fuel_holes_per_block
for i in range(0, Fuel_holes_per_block):
  fuel_hole_Plane_list[i] = openmc.ZCylinder(x0=fuel_circle_center_coodx[i], y0=fuel_circle_center_coody[i], r=Fuel_channel_hole_outer_diameter/2)

#######################################################################################################################################
##################################################    fuel pin plane  #################################################################
fuel_Plane_list = [0]* Fuel_holes_per_block
for i in range(0, Fuel_holes_per_block):
  fuel_Plane_list[i] = openmc.ZCylinder(x0=fuel_circle_center_coodx[i], y0=fuel_circle_center_coody[i], r=Fuel_pellet_outer_diameter/2)
  print("fuel_circle_center_coodx[{}]={:.3f}; fuel_circle_center_coody[{}]={:.3f}".format(i,fuel_circle_center_coodx[i],i,fuel_circle_center_coody[i]))
#######################################################################################################################################
##################################################    outer gas gap plane  #################################################################
#y = - (A/B)x + (D/B) translation: y = - (A/B)x + (D/B + d/cosX) : Ax + By = D + dB/cosX
#monolith_downside_Plane = openmc.Plane(a = monolith_downside_slope, b =  -1,  c = 0, d = monolith_downside_slope*monolith_downside_keyposition_xcood-monolith_downside_keyposition_ycood)
#monolith_upside_Plane = openmc.Plane(a = monolith_upside_slope, b =  -1,  c = 0, d = monolith_upside_slope*monolith_upside_keyposition_xcood-monolith_upside_keyposition_ycood)
outer_upside_Plane = openmc.Plane(a = monolith_upside_slope, b =  -1,  c = 0, \
d = monolith_upside_slope*monolith_upside_keyposition_xcood-monolith_upside_keyposition_ycood-gap_block_to_block_half/math.cos(hypotenuse_horizontal_angle),\
boundary_type='reflective')

outer_downside_Plane = openmc.Plane(a = monolith_downside_slope, b =  -1,  c = 0, \
d = monolith_downside_slope*monolith_downside_keyposition_xcood-monolith_downside_keyposition_ycood+gap_block_to_block_half/math.cos(hypotenuse_horizontal_angle),\
boundary_type='reflective')

reflector_inner_Plane = openmc.XPlane(x0 = monolith_rightside_xcood + Radial_air_gap_thickness_between_blocks)

#######################################################################################################################################
################################################    control drum plane  ###############################################################
#The equation of monolith_downside is y - monolith_downside_keyposition_ycood = monolith_downside_slope( x - monolith_downside_keyposition_xcood)
monolith_leftdown_vertex_coodx = monolith_leftside_xcood
monolith_leftup_vertex_coodx = monolith_leftside_xcood
monolith_leftdown_vertex_coody = monolith_downside_slope*( monolith_leftdown_vertex_coodx - monolith_downside_keyposition_xcood) + monolith_downside_keyposition_ycood
monolith_leftup_vertex_coody  = monolith_upside_slope*( monolith_leftup_vertex_coodx - monolith_upside_keyposition_xcood) + monolith_upside_keyposition_ycood
monolith_leftside_length = monolith_leftup_vertex_coody - monolith_leftdown_vertex_coody
#!!!!!
whole_core_circle_to_monolith_leftside_distance = monolith_leftside_length/2/math.tan(hypotenuse_horizontal_angle) + gap_block_to_block_half/math.sin(hypotenuse_horizontal_angle)

monolith_rightdown_vertex_coodx = monolith_rightside_xcood
monolith_rightup_vertex_coodx = monolith_rightside_xcood

monolith_leftside_monolith_rightside_distance = monolith_rightside_xcood - monolith_leftside_xcood

drum_upside_center_coodx = monolith_leftside_xcood + monolith_leftside_monolith_rightside_distance + Radial_air_gap_thickness_between_blocks + Drum_outer_diameter/2
drum_downside_center_coodx = drum_upside_center_coodx

drum_upside_center_coody =(monolith_leftdown_vertex_coody+monolith_leftup_vertex_coody)/2+\
(whole_core_circle_to_monolith_leftside_distance + \
monolith_leftside_monolith_rightside_distance + \
Radial_air_gap_thickness_between_blocks + \
Drum_outer_diameter/2)*\
math.tan(hypotenuse_horizontal_angle/2)

drum_downside_center_coody =(monolith_leftdown_vertex_coody+monolith_leftup_vertex_coody)/2-\
(whole_core_circle_to_monolith_leftside_distance + \
monolith_leftside_monolith_rightside_distance + \
Radial_air_gap_thickness_between_blocks + \
Drum_outer_diameter/2)*\
math.tan(hypotenuse_horizontal_angle/2)

whole_core_circle_xcood = basic_hp_circle_center_cood[0] - whole_core_circle_to_monolith_leftside_distance - HP_hole_diameter/2 - Monolith_edge_thickness - gap_block_to_block_half/math.sin(hypotenuse_horizontal_angle)
whole_core_circle_ycood = (monolith_leftdown_vertex_coody + monolith_leftup_vertex_coody)/2

drum_upside_Plane = openmc.ZCylinder(x0=drum_upside_center_coodx, y0=drum_upside_center_coody, r=Drum_outer_diameter/2-drum_gap)
drum_downside_Plane = openmc.ZCylinder(x0=drum_downside_center_coodx, y0=drum_downside_center_coody, r=Drum_outer_diameter/2-drum_gap)
drum_upside_outer_Plane = openmc.ZCylinder(x0=drum_upside_center_coodx, y0=drum_upside_center_coody, r=Drum_outer_diameter/2)
drum_downside_outer_Plane = openmc.ZCylinder(x0=drum_downside_center_coodx, y0=drum_downside_center_coody, r=Drum_outer_diameter/2)
#######################################################################################################################################
################################################    radical reflector plane  ##########################################################

drum_core_upside_slope = math.tan(hypotenuse_horizontal_angle/2)
drum_shield_inter_upside_xcood = drum_upside_center_coodx + math.sqrt( Drum_outer_diameter**2/4/(1+drum_core_upside_slope**2) )
drum_shield_inter_upside_ycood = drum_core_upside_slope*(drum_shield_inter_upside_xcood - drum_upside_center_coodx) + drum_upside_center_coody
#####
#####
drum_core_downside_slope = math.tan(math.pi - hypotenuse_horizontal_angle/2)
drum_shield_inter_downside_xcood = drum_downside_center_coodx + math.sqrt( Drum_outer_diameter**2/4/(1+drum_core_downside_slope**2) )
drum_shield_inter_downside_ycood = drum_core_downside_slope*(drum_shield_inter_downside_xcood - drum_downside_center_coodx) + drum_downside_center_coody

shield_radius = math.sqrt( (drum_shield_inter_upside_xcood - whole_core_circle_xcood)**2+(drum_shield_inter_upside_ycood - whole_core_circle_ycood)**2   )
reflector_outer_Plane = openmc.ZCylinder(x0=whole_core_circle_xcood, y0=whole_core_circle_ycood, r=shield_radius - reflector_shield_gap)
#######################################################################################################################################
################################################    shield plane  #####################################################################
shield_inner_Plane = openmc.ZCylinder(x0=whole_core_circle_xcood, y0=whole_core_circle_ycood, r=shield_radius)
shield_outer_Plane = openmc.ZCylinder(x0=whole_core_circle_xcood, y0=whole_core_circle_ycood, r=shield_radius + shield_thickness,boundary_type='vacuum')
#######################################################################################################################################
##############################################  control drum arc  ######################################################################
# if the control drum diameter is d
# the maximum thickness of arc is t
# the half central angle is B
# the circle center distance between the two arcs is s
# (s + d/2*cosB)^2 + (d/2*sinB)^2 = ( d/2 + s - t )^2
# s = (t^2 - dt)/(2t + dcosB - d)
# for the simplification, the arc is totally opposite to the whole core
# it needs optimizing in the future.

two_arcs_circle_center_distance = (arc_max_thick**2 - Drum_inner_diameter*arc_max_thick)/\
(2*arc_max_thick + Drum_inner_diameter*math.cos(arc_central_half_angle) - Drum_inner_diameter)

drum_arc_radius = Drum_inner_diameter/2 - arc_max_thick + two_arcs_circle_center_distance

arc_upside_coodx = drum_upside_center_coodx - two_arcs_circle_center_distance * math.cos(hypotenuse_horizontal_angle/2)
arc_upside_coody = drum_upside_center_coody - two_arcs_circle_center_distance * math.sin(hypotenuse_horizontal_angle/2)


arc_downside_coodx = drum_downside_center_coodx - two_arcs_circle_center_distance * math.cos(hypotenuse_horizontal_angle/2)
arc_downside_coody = drum_downside_center_coody + two_arcs_circle_center_distance * math.sin(hypotenuse_horizontal_angle/2)

arc_upside_Plane = openmc.ZCylinder(x0=arc_upside_coodx, y0=arc_upside_coody, r=drum_arc_radius)
arc_downside_Plane = openmc.ZCylinder(x0=arc_downside_coodx, y0=arc_downside_coody, r=drum_arc_radius)

#######################################################################################################################################
monolith_region =  +monolith_leftside_Plane & -monolith_rightside_Plane & -monolith_downside_Plane & +monolith_upside_Plane
for i in range(0, HP_holes_per_block):
  monolith_region = monolith_region & +heatpipe_hole_Plane_list[i]
for i in range(0, Fuel_holes_per_block):
  monolith_region = monolith_region & +fuel_hole_Plane_list[i]
fuel_region_list = [0]*Fuel_holes_per_block
#fuel_cell_list = [0]*Fuel_holes_per_block
for i in range(0, Fuel_holes_per_block):
  fuel_region_list[i] = -fuel_Plane_list[i]
#  fuel_cell_list[i] =  openmc.Cell(fill=ss316, region=fuel_region_list[i])

fuel_gap_region_list = [0]*Fuel_holes_per_block
#fuel_gap_cell_list = [0]*Fuel_holes_per_block

for i in range(0, Fuel_holes_per_block):
  fuel_gap_region_list[i] = +fuel_Plane_list[i] & -fuel_hole_Plane_list[i]
#  fuel_gap_cell_list[i] = openmc.Cell(fill=helium, region=fuel_gap_region_list[i])

hp_region_list = [0]*HP_holes_per_block
#hp_cell_list = [0]*HP_holes_per_block

for i in range(0, HP_holes_per_block):
  hp_region_list[i] = -heatpipe_hole_Plane_list[i]
#  hp_cell_list[i]   = openmc.Cell(fill=helium, region=hp_region_list[i])
#monolith_cell = openmc.Cell(fill=fuel, region=monolith_region)

outer_gap_region =  (-monolith_leftside_Plane | +monolith_rightside_Plane | +monolith_downside_Plane | -monolith_upside_Plane)\
& -outer_downside_Plane & +outer_upside_Plane &  -reflector_inner_Plane
#outer_gap_region = +z3_plane & -z4_plane & -outer_downside_Plane & +outer_upside_Plane &  -reflector_inner_Plane
#outer_gap_cell = openmc.Cell(fill=helium, region=outer_gap_region)

drum_upside_region = -drum_upside_Plane & -arc_upside_Plane
drum_downside_region = -drum_downside_Plane & -arc_downside_Plane

drum_upside_cell = openmc.Cell(fill=al2o3, region=drum_upside_region)
#drum_downside_cell = openmc.Cell(fill=al2o3, region=drum_downside_region)

reflector_region =  +reflector_inner_Plane & -reflector_outer_Plane & -outer_downside_Plane & +outer_upside_Plane &\
+drum_upside_outer_Plane&+drum_downside_outer_Plane
#reflector_cell = openmc.Cell(fill=al2o3, region=reflector_region)

shield_region = +shield_inner_Plane & -shield_outer_Plane & -outer_downside_Plane & +outer_upside_Plane
#shield_cell = openmc.Cell(fill=natural_b4c, region=shield_region)

drum_upside_gas_region = +drum_upside_Plane & -drum_upside_outer_Plane
#drum_upside_gas_cell = openmc.Cell(fill=helium, region=drum_upside_gas_region)

drum_downside_gas_region = +drum_downside_Plane & -drum_downside_outer_Plane
#drum_downside_gas_cell = openmc.Cell(fill=helium, region=drum_downside_gas_region)

reflector_gas_region =  +drum_downside_outer_Plane & +drum_upside_outer_Plane & +reflector_outer_Plane & -outer_downside_Plane & +outer_upside_Plane & -shield_inner_Plane
#reflector_gas_cell = openmc.Cell(fill=helium, region=reflector_gas_region)

arc_upside_region = -drum_upside_Plane & +arc_upside_Plane
#arc_upside_cell = openmc.Cell(fill=enriched_b4c, region=arc_upside_region)

arc_downside_region = -drum_downside_Plane & +arc_downside_Plane
#arc_downside_cell = openmc.Cell(fill=enriched_b4c, region=arc_downside_region)
#Arabic numerals represent axial coordinates.
#Letters represent radial coordinates.
#######################################################################################################################################
######################################### first 1.2.3.4.5.6.(a)   ###################################################################
first_1_2_3_4_5_6_a_region = +z0_plane & -z6_plane & outer_gap_region
first_1_2_3_4_5_6_a_cell = openmc.Cell(cell_id=10100000,fill=helium, region=first_1_2_3_4_5_6_a_region)
#######################################################################################################################################
######################################   second 1.2.3.4.5.6.(b)   #####################################################################
second_1_2_3_4_5_6_b_region = +z0_plane & -z6_plane & monolith_region
second_1_2_3_4_5_6_b_cell = openmc.Cell(cell_id=10200000,fill=ss316, region=second_1_2_3_4_5_6_b_region)
#######################################################################################################################################
######################################   third 1.2.3.(c)   ############################################################################
third_1_2_3_c_region = hp_region_list[0] & +z0_plane & -z3_plane
for i in range(0, HP_holes_per_block):
  third_1_2_3_c_region = third_1_2_3_c_region | hp_region_list[i] & +z0_plane & -z3_plane
third_1_2_3_c_cell = openmc.Cell(cell_id=10300000,fill=ss316, region=third_1_2_3_c_region)
#######################################################################################################################################
######################################   fourth 4.5.6.(c)   ############################################################################
fourth_4_5_6_c_region = hp_region_list[0] & +z3_plane & -z6_plane
for i in range(0, HP_holes_per_block):
  fourth_4_5_6_c_region = fourth_4_5_6_c_region | hp_region_list[i] & +z3_plane & -z6_plane
fourth_4_5_6_c_cell = openmc.Cell(cell_id=10400000,fill=helium, region=fourth_4_5_6_c_region)
#######################################################################################################################################
######################################   fifth 1.(d)(e)   ############################################################################
fifth_1_d_e_region = fuel_gap_region_list[i] & +z0_plane & -z1_plane
for i in range(0, Fuel_holes_per_block):
  fifth_1_d_e_region = fifth_1_d_e_region | fuel_gap_region_list[i] & +z0_plane & -z1_plane
for i in range(0, Fuel_holes_per_block):
  fifth_1_d_e_region = fifth_1_d_e_region | fuel_region_list[i] & +z0_plane & -z1_plane
fifth_1_d_e_cell = openmc.Cell(cell_id=10500000,fill=ss316, region=fifth_1_d_e_region)
######################################################################################################################################
######################################   sixth 2.(d)(e)   ############################################################################
sixth_2_d_e_region = fuel_gap_region_list[i] & +z1_plane & -z2_plane
for i in range(0, Fuel_holes_per_block):
  sixth_2_d_e_region = sixth_2_d_e_region | fuel_gap_region_list[i] & +z1_plane & -z2_plane
for i in range(0, Fuel_holes_per_block):
  sixth_2_d_e_region = sixth_2_d_e_region | fuel_region_list[i] & +z1_plane & -z2_plane
sixth_2_d_e_cell = openmc.Cell(cell_id=10600000,fill=helium, region=sixth_2_d_e_region)
######################################################################################################################################
######################################   seventh 3.(d)(e)   ############################################################################
seventh_3_d_e_region = fuel_gap_region_list[i] & +z2_plane & -z3_plane
for i in range(0, Fuel_holes_per_block):
  seventh_3_d_e_region = seventh_3_d_e_region | fuel_gap_region_list[i] & +z2_plane & -z3_plane
for i in range(0, Fuel_holes_per_block):
  seventh_3_d_e_region = seventh_3_d_e_region | fuel_region_list[i] & +z2_plane & -z3_plane
seventh_3_d_e_cell = openmc.Cell(cell_id=10700000,fill=beo, region=seventh_3_d_e_region)
######################################################################################################################################
######################################   eighth 4.(d)   ############################################################################
eighth_4_d_region = fuel_gap_region_list[i] & +z3_plane & -z4_plane
for i in range(0, Fuel_holes_per_block):
  eighth_4_d_region = eighth_4_d_region | fuel_gap_region_list[i] & +z3_plane & -z4_plane
eighth_4_d_cell = openmc.Cell(cell_id=10800000,fill=helium, region=eighth_4_d_region)
######################################################################################################################################
######################################   nineth 4.(d)   ##############################################################################
#attention! the number of the z_3_4_plane_list is [num_fuel_axial_cell-1]
nineth_4_e_region_list = [[0 for i in range(num_fuel_axial_cell)] for j in range(Fuel_holes_per_block)]
nineth_4_e_cell_list = [[0 for i in range(num_fuel_axial_cell)] for j in range(Fuel_holes_per_block)]
for j in range(0, Fuel_holes_per_block):
  for i in range(0, num_fuel_axial_cell):
    if i == 0:
      nineth_4_e_region_list[j][i] = fuel_region_list[j] & +z3_plane & -z_3_4_plane_list[0]
    elif i == num_fuel_axial_cell-1:
      nineth_4_e_region_list[j][i] = fuel_region_list[j] & +z_3_4_plane_list[i-1] & -z4_plane
    else:
      nineth_4_e_region_list[j][i] = fuel_region_list[j] & +z_3_4_plane_list[i-1] & -z_3_4_plane_list[i]

for j in range(0, Fuel_holes_per_block):
  for i in range(0, num_fuel_axial_cell):
    nineth_4_e_cell_list[j][i] = openmc.Cell(cell_id=10900000+j*100+i,fill=fuel, region=nineth_4_e_region_list[j][i])
######################################################################################################################################
######################################   tenth 5.(d)(e)   ############################################################################
tenth_5_d_e_region = fuel_gap_region_list[i] & +z4_plane & -z5_plane
for i in range(0, Fuel_holes_per_block):
  tenth_5_d_e_region = tenth_5_d_e_region | fuel_gap_region_list[i] & +z4_plane & -z5_plane
for i in range(0, Fuel_holes_per_block):
  tenth_5_d_e_region = tenth_5_d_e_region | fuel_region_list[i] & +z4_plane & -z5_plane
tenth_5_d_e_cell = openmc.Cell(cell_id=11000000,fill=beo, region=tenth_5_d_e_region)
######################################################################################################################################
######################################   eleventh 6.(d)(e)   ############################################################################
eleventh_6_d_e_region = fuel_gap_region_list[i] & +z5_plane & -z6_plane
for i in range(0, Fuel_holes_per_block):
  eleventh_6_d_e_region = eleventh_6_d_e_region | fuel_gap_region_list[i] & +z5_plane & -z6_plane
for i in range(0, Fuel_holes_per_block):
  eleventh_6_d_e_region = eleventh_6_d_e_region | fuel_region_list[i] & +z5_plane & -z6_plane
eleventh_6_d_e_cell = openmc.Cell(cell_id=11100000,fill=ss316, region=eleventh_6_d_e_region)
#######################################################################################################################################
###################################### twelfth 1.2.3.4.5.6.(f)#########################################################################
twelfth_1_2_3_4_5_6_f_region = reflector_region & +z0_plane & -z6_plane
twelfth_1_2_3_4_5_6_f_cell = openmc.Cell(cell_id=11200000,fill=al2o3, region=twelfth_1_2_3_4_5_6_f_region)
#######################################################################################################################################
#######################################################################################################################################
###################################### thirteenth 1.(g)(h)(i)#########################################################################
thirteenth_1_g_h_i_region = (drum_upside_region | drum_downside_region | \
drum_upside_gas_region | drum_downside_gas_region | \
arc_upside_region | arc_downside_region )\
&+z0_plane & -z1_plane
thirteenth_1_g_h_i_cell = openmc.Cell(cell_id=11300000,fill=ss316, region=thirteenth_1_g_h_i_region)
#####################################  fourteenth_2.3.4.5.(g)  #######################################################################
fourteenth_2_3_4_5_g_region = (drum_upside_region | drum_downside_region)&+z1_plane & -z5_plane
fourteenth_2_3_4_5_g_cell = openmc.Cell(cell_id=11400000,fill=al2o3, region=fourteenth_2_3_4_5_g_region)
#####################################  fifteenth_2.3.4.5.(h)  #######################################################################
fifteenth_2_3_4_5_g_region = (arc_upside_region | arc_downside_region)&+z1_plane & -z5_plane
fifteenth_2_3_4_5_g_cell = openmc.Cell(cell_id=11500000,fill=enriched_b4c, region=fifteenth_2_3_4_5_g_region)
#####################################  sixteenth_2.3.4.5.(h)  #######################################################################
sixteenth_2_3_4_5_g_region = (drum_upside_gas_region | drum_downside_gas_region)&+z1_plane & -z5_plane
sixteenth_2_3_4_5_g_cell = openmc.Cell(cell_id=11600000,fill=helium, region=sixteenth_2_3_4_5_g_region)
###################################### seventeenth 6.(g)(h)(i)#########################################################################
seventeenth_6_g_h_i_region = (drum_upside_region | drum_downside_region | \
drum_upside_gas_region | drum_downside_gas_region | \
arc_upside_region | arc_downside_region )\
&+z5_plane & -z6_plane
seventeenth_6_g_h_i_cell = openmc.Cell(cell_id=11700000,fill=ss316, region=seventeenth_6_g_h_i_region)
###################################### eighteenth 1.2.3.4.5.6.(j)#########################################################################
eighteenth_1_2_3_4_5_6_f_region = reflector_gas_region & +z0_plane & -z6_plane
eighteenth_1_2_3_4_5_6_f_cell = openmc.Cell(cell_id=11800000,fill=helium, region=eighteenth_1_2_3_4_5_6_f_region)
###################################### nineteenth 1.2.3.4.5.6.(j)#########################################################################
nineteenth_1_2_3_4_5_6_j_region = shield_region & +z0_plane & -z6_plane
nineteenth_1_2_3_4_5_6_j_cell = openmc.Cell(cell_id=11900000,fill=natural_b4c, region=nineteenth_1_2_3_4_5_6_j_region)

all_cells = []
all_cells.append(first_1_2_3_4_5_6_a_cell)
all_cells.append(second_1_2_3_4_5_6_b_cell)
all_cells.append(third_1_2_3_c_cell)
all_cells.append(fourth_4_5_6_c_cell)
all_cells.append(fifth_1_d_e_cell)
all_cells.append(sixth_2_d_e_cell)
all_cells.append(seventh_3_d_e_cell)
all_cells.append(eighth_4_d_cell)
for j in range(0, Fuel_holes_per_block):
  for i in range(0, num_fuel_axial_cell):
    all_cells.append(nineth_4_e_cell_list[j][i])

all_cells.append(tenth_5_d_e_cell)
all_cells.append(eleventh_6_d_e_cell)
all_cells.append(twelfth_1_2_3_4_5_6_f_cell)
all_cells.append(thirteenth_1_g_h_i_cell)
all_cells.append(fourteenth_2_3_4_5_g_cell)
all_cells.append(fifteenth_2_3_4_5_g_cell)
all_cells.append(sixteenth_2_3_4_5_g_cell)
all_cells.append(seventeenth_6_g_h_i_cell)
all_cells.append(eighteenth_1_2_3_4_5_6_f_cell)
all_cells.append(nineteenth_1_2_3_4_5_6_j_cell)
#for i in range(0, Fuel_holes_per_block):
#  all_cells.append(fuel_cell_list[i])
#  all_cells.append(fuel_gap_cell_list[i])
#for i in range(0, HP_holes_per_block):
#  all_cells.append(hp_cell_list[i])
#all_cells.append(outer_gap_cell)
#all_cells.append(drum_upside_cell)
#all_cells.append(drum_downside_cell)
#all_cells.append(reflector_cell)
#all_cells.append(shield_cell)
#all_cells.append(drum_upside_gas_cell)
#all_cells.append(drum_downside_gas_cell)
#all_cells.append(reflector_gas_cell)
#all_cells.append(arc_upside_cell)
#all_cells.append(arc_downside_cell)
#######################################################################################################################################
print('shield_radius =',shield_radius)
print('reflector_shield_gap =',reflector_shield_gap)
print('drum_upside_center_coodx =',drum_upside_center_coodx)
print('drum_upside_center_coody =',drum_upside_center_coody)
print('drum_downside_center_coodx =',drum_downside_center_coodx)
print('drum_downside_center_coody =',drum_downside_center_coody)
print('whole_core_circle_xcood = ',whole_core_circle_xcood)
print('whole_core_circle_ycood = ',whole_core_circle_ycood)
print('monolith_rightside_xcood = ',monolith_rightside_xcood)
print('2*(shield_radius - reflector_shield_gap) = ', 2*(shield_radius - reflector_shield_gap))
print('arc_upside_coodx = ', arc_upside_coodx)
print('arc_upside_coody = ', arc_upside_coody)
print('drum_arc_radius = ', drum_arc_radius)

#######################################################################################################################################
#color network:https://www.w3.org/TR/SVG11/types.html#ColorKeywords
geometry = openmc.Geometry(all_cells)
geometry.export_to_xml()
plot2 = openmc.Plot()
plot2.filename = 'plot_ceshi'
plot2.width = (200, 200)
plot2.origin = (0,0,75)
plot2.pixels = (2000, 2000)
plot2.color_by = 'material'
plot2.basis = 'xy'
plot2.colors = {beo: 'cyan',fuel: 'red',al2o3:'silver', natural_b4c:'gold', enriched_b4c:'goldenrod',helium:'green',ss316:'yellow'}
plot2.to_ipython_image()

plot3 = openmc.Plot()
plot3.filename = 'plot_ceshi2'
plot3.width = (300, 300)
plot3.origin = (0,0,75)
plot3.pixels = (2000, 2000)
plot3.color_by = 'material'
plot3.basis = 'xz'
plot3.colors = {beo: 'cyan',fuel: 'red',al2o3:'silver', natural_b4c:'gold', enriched_b4c:'goldenrod',helium:'green',ss316:'yellow'}
plot3.to_ipython_image()

plot4 = openmc.Plot()
plot4.filename = 'plot_ceshi3'
plot4.width = (300, 300)
plot4.origin = (0,0,75)
plot4.pixels = (2000, 2000)
plot4.color_by = 'cell'
plot4.basis = 'xz'
plot4.to_ipython_image()

plot5 = openmc.Plot()
plot5.filename = 'plot_ceshi4'
plot5.width = (300, 300)
plot5.origin = (38.4,20.7847,75)
plot5.pixels = (2000, 2000)
plot5.color_by = 'material'
plot5.basis = 'xz'
plot5.colors = {beo: 'cyan',fuel: 'red',al2o3:'silver', natural_b4c:'gold', enriched_b4c:'goldenrod',helium:'green',ss316:'yellow'}
plot5.to_ipython_image()

plot6 = openmc.Plot()
plot6.filename = 'plot_ceshi5'
plot6.width = (300, 30)
plot6.origin = (36.8943,-23.5561,75)
plot6.pixels = (2000, 2000)
plot6.color_by = 'cell'
plot6.basis = 'xz'
plot6.to_ipython_image()
########################################################################################################################################
settings = openmc.Settings()
settings.source = openmc.Source(space=openmc.stats.Box([1.6,-2.7, 3.0],[36.8,5.5, 153.0]))
settings.temperature = {'method':'interpolation'}
settings.batches = 1000
settings.inactive = 100
settings.particles = 10000
settings.export_to_xml()
###############################################################################

###############################################################################
aaatally = openmc.Tally()
aaatallies = openmc.Tallies()
aaatally.filters = [openmc.CellFilter(all_cells)]
aaatally.scores = ['kappa-fission	']

aaatallies.append(aaatally)
aaatallies.export_to_xml()
###############################################################################
#openmc.run()
