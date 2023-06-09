onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group 2a -radix unsigned /tb_4point_BM/u1/u1/data_in
add wave -noupdate -expand -group 2a -radix unsigned /tb_4point_BM/u1/u1/data_out
add wave -noupdate -expand -group 2b -radix unsigned /tb_4point_BM/u1/u2/data_in
add wave -noupdate -expand -group 2b -radix unsigned /tb_4point_BM/u1/u2/data_out
add wave -noupdate -expand -group 4 -radix unsigned /tb_4point_BM/u1/u0/data_in
add wave -noupdate -expand -group 4 -radix unsigned /tb_4point_BM/u1/u0/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {58 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 246
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
WaveRestoreZoom {0 ps} {935 ps}
