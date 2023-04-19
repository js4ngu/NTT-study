onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /naiveNTT_tb/datain
add wave -noupdate -radix hexadecimal /naiveNTT_tb/omega
add wave -noupdate -radix hexadecimal /naiveNTT_tb/mod
add wave -noupdate -radix hexadecimal /naiveNTT_tb/o0
add wave -noupdate -radix hexadecimal /naiveNTT_tb/o1
add wave -noupdate -radix hexadecimal /naiveNTT_tb/o2
add wave -noupdate -radix hexadecimal /naiveNTT_tb/o3
add wave -noupdate -radix hexadecimal /naiveNTT_tb/o4
add wave -noupdate -radix hexadecimal /naiveNTT_tb/o5
add wave -noupdate -radix hexadecimal /naiveNTT_tb/o6
add wave -noupdate -radix hexadecimal /naiveNTT_tb/o7
add wave -noupdate -radix hexadecimal /naiveNTT_tb/u0/data_in
add wave -noupdate -radix hexadecimal -childformat {{{/naiveNTT_tb/u0/input_array[7]} -radix hexadecimal} {{/naiveNTT_tb/u0/input_array[6]} -radix hexadecimal} {{/naiveNTT_tb/u0/input_array[5]} -radix hexadecimal} {{/naiveNTT_tb/u0/input_array[4]} -radix hexadecimal} {{/naiveNTT_tb/u0/input_array[3]} -radix hexadecimal} {{/naiveNTT_tb/u0/input_array[2]} -radix hexadecimal} {{/naiveNTT_tb/u0/input_array[1]} -radix hexadecimal} {{/naiveNTT_tb/u0/input_array[0]} -radix hexadecimal}} -expand -subitemconfig {{/naiveNTT_tb/u0/input_array[7]} {-radix hexadecimal} {/naiveNTT_tb/u0/input_array[6]} {-radix hexadecimal} {/naiveNTT_tb/u0/input_array[5]} {-radix hexadecimal} {/naiveNTT_tb/u0/input_array[4]} {-radix hexadecimal} {/naiveNTT_tb/u0/input_array[3]} {-radix hexadecimal} {/naiveNTT_tb/u0/input_array[2]} {-radix hexadecimal} {/naiveNTT_tb/u0/input_array[1]} {-radix hexadecimal} {/naiveNTT_tb/u0/input_array[0]} {-radix hexadecimal}} /naiveNTT_tb/u0/input_array
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {180 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
