library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 	-- library treats std_logic_vector value as unsigned integer
--testbench for adder
entity Testbench_ctr is
end Testbench_ctr;

architecture TestbenchArch of Testbench_ctr is
signal clk_in, reset_in, enable_in : std_logic;
signal c_out: std_logic_vector(1 downto 0);

component n_bit_counter is
	generic (n: integer);
	port(
		clk: 		in std_logic;
		reset: 		in std_logic;
		enable:	 	in std_logic;
		count_out: 	out std_logic_vector(1 downto 0));

END component;


	for u1: n_bit_counter use entity work.n_bit_counter;
begin

	u1: n_bit_counter
	generic map(2)
	port map(clk_in, reset_in, enable_in, c_out);

	clock_sim: process
	begin
		clk_in <= '1';
		wait for 50 ns;
		clk_in <= '0';
		wait for 50 ns;
	end process clock_sim;


	cntr: process
		variable error_count: integer := 0;
	begin
		reset_in <= '1';
		enable_in <= '1';
		wait for 10 ns;

		reset_in <= '0';
		wait for 10 ns;

if (clk_in='1' and clk_in'event) then
    assert c_out = 1 report "Test failed at 1" severity error;
		if (c_out /= 1) then
			error_count := error_count + 1;
		end if;
  end if;

if (clk_in='1' and clk_in'event) then
    assert c_out = 2 report "Test failed at 2" severity error;
		if c_out /= 2 then
			error_count := error_count + 1;
		end if;
    end if;

if (clk_in='1' and clk_in'event) then
    assert c_out = 3 report "Test failed at 3" severity error;
		if c_out /= 3 then
			error_count := error_count + 1;
		end if;
  end if;

if (clk_in='1' and clk_in'event) then
    assert (c_out = 0) report "Error: Test failed at overflow" severity error;
		if c_out /= 0 then
			error_count := error_count + 1;
		end if;
  end if;

if (clk_in='1' and clk_in'event) then
    assert (c_out = 1) report "Error: Test failed after overflow at 1" severity error;
		if c_out /= 1 then
			error_count := error_count + 1;
		end if;
  end if;

if (clk_in='1' and clk_in'event) then
		enable_in <= '0';
		assert error_count /=0 report "2 bit counter verified successfully!" severity note;
end if;

	end process cntr;

END  TestbenchArch;
