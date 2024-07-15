
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name AritStruct -dir "C:/Users/Korisnik/OneDrive/Desktop/Xillinx share/AritStruct/planAhead_run_1" -part xc3s1500fg676-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Korisnik/OneDrive/Desktop/Xillinx share/AritStruct/ArithStruct.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Korisnik/OneDrive/Desktop/Xillinx share/AritStruct} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "ArithStruct.ucf" [current_fileset -constrset]
add_files [list {ArithStruct.ucf}] -fileset [get_property constrset [current_run]]
link_design
