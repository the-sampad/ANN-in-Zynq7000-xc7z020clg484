onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib pixel_buffer_opt

do {wave.do}

view wave
view structure
view signals

do {pixel_buffer.udo}

run -all

quit -force
