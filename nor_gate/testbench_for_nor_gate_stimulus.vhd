LIBRARY ieee;
USE ieee.std_logic_1164.all;


--testbench for NOR gate
entity Testbench_stim is
end Testbench_stim#;

architecture TestbenchArch of Testbench is
signal a_in, b_in : std_ulogic ;
signal c_out :  std_ulogic ;

component nor_gate

	PORT ( a, b : IN std_ulogic ;
		c : OUT std_ulogic) ;

END component;


for u1: nor_gate use entity work.nor_gate(nor_selected);
begin
u1: nor_gate port map (a_in, b_in, c_out);
    a_in <= '0', '0' after 100 ns, '1' after 200 ns, '1' after 300 ns;
    b_in <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns;
END  TestbenchArch;
