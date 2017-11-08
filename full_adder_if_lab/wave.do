onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_ctr/u1/clk
add wave -noupdate /testbench_ctr/u1/reset
add wave -noupdate /testbench_ctr/u1/enable
add wave -noupdate -radix unsigned -childformat {{/testbench_ctr/u1/count_out(1) -radix decimal} {/testbench_ctr/u1/count_out(0) -radix decimal}} -expand -subitemconfig {/testbench_ctr/u1/count_out(1) {-height 15 -radix decimal} /testbench_ctr/u1/count_out(0) {-height 15 -radix decimal}} /testbench_ctr/u1/count_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {139 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 200
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {950 ns}
