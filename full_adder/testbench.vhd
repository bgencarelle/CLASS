
LIBRARY ieee;
USE ieee.std_logic_1164.all;


--testbench for adder
entity Testbench_add is
end Testbench_add;

architecture TestbenchArch of Testbench_add is
signal a_in, b_in : std_logic_vector(3 downto 0);
signal s_out: std_logic_vector(3 downto 0);
signal c_bench :  std_logic;

component ripple_adder
 port (a, b : in std_logic_vector(3 downto 0);
--	c0: in std_logic;
 s_out: out std_logic_vector(3 downto 0);
 c_out: out std_logic);

END component;


for u1: ripple_adder use entity work.ripple_adder;
begin
u1: ripple_adder port map (a_in, b_in, s_out, c_bench);
	TESTPATTERN_ERROR_CHECK: PROCESS
	begin
	a_in <= "1101"; 
	b_in <= "0100";
	assert (c_bench = '1') report "Error: test failed" severity error;
	wait for 100 ns;
	a_in <= "1100";  
	b_in <= "0010";
	wait for 100 ns;
	a_in <= "0111";
	b_in <= "0111";
	wait for 100 ns;
	a_in <= "1011";
	b_in <= "0101";
	wait for 100 ns;
end process TESTPATTERN_ERROR_CHECK;
END  TestbenchArch;
