# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.cache/wt [current_project]
set_property parent.project_path D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part_repo_paths D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.board [current_project]
set_property board_part digilentinc.com:zedboard:part0:1.0 [current_project]
set_property ip_repo_paths d:/repo [current_project]
set_property ip_output_repo d:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/imports/src/other/characterLib.coe
add_files D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/imports/src/other/init_sequence.coe
read_verilog -library xil_defaultlib {
  D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/imports/src/hdl/OLEDCtrl.v
  D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/imports/src/hdl/SpiCtrl.v
  D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/imports/src/hdl/debouncer.v
  D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/imports/src/hdl/delay_ms.v
  D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/imports/src/hdl/top.v
}
read_ip -quiet D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/ip/init_sequence_rom/init_sequence_rom.xci
set_property used_in_implementation false [get_files -all d:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/ip/init_sequence_rom/init_sequence_rom_ooc.xdc]

read_ip -quiet D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/ip/pixel_buffer/pixel_buffer.xci
set_property used_in_implementation false [get_files -all d:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/ip/pixel_buffer/pixel_buffer_ooc.xdc]

read_ip -quiet D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/ip/charLib/charLib.xci
set_property used_in_implementation false [get_files -all d:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/sources_1/ip/charLib/charLib_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/constrs_1/imports/constraints/zedboard_master.xdc
set_property used_in_implementation false [get_files D:/Major_Project/zynet_Projects_Advanced/Zedboard_OLED_2018/vivado_proj/Zedboard-OLED.srcs/constrs_1/imports/constraints/zedboard_master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top top -part xc7z020clg484-1 -flatten_hierarchy none -directive RuntimeOptimized -fsm_extraction off


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]