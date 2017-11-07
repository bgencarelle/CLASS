LIBRARY ieee;
USE ieee.std_logic_1164.all;


--testbench for NOR gate
entity Testbench is
end Testbench;

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
	TESTPATTERN_ERROR_CHECK: PROCESS
	begin
	a_in <= '0';
	b_in <= '0';
	assert (c_out = '1') report "Error: test failed" severity error;
	wait for 100 ns;
	a_in <= '0';
	b_in <= '1';
	wait for 100 ns;
	a_in <= '1';
	b_in <= '0';
	wait for 100 ns;
	a_in <= '1';
	b_in <= '1';
	wait for 100 ns;
end process TESTPATTERN_ERROR_CHECK;
END  TestbenchArch;
