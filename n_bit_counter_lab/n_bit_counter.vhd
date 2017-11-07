-- n_bit_counter.vhd
---------------------------
library IEEE;--IEEE library
use IEEE.std_logic_1164.all;--using std_logic_1164 for port declarations
use IEEE.std_logic_unsigned.all;--and logic functions
-- library treats std_logic_vector value as unsigned integer
entity n_bit_counter is--declaring the n_bit_counter entity
generic(n: INTEGER := 2);--generic is like constant, but can be modified
port( clk : in std_logic;--port declarations
 reset : in std_logic;--in using std_logic
 enable : in std_logic;--in using std_logic
 count_out : out std_logic_vector(n-1 downto 0)--range is set by n out using std_logic
);
end n_bit_counter;--end of the port declarations

architecture behv of n_bit_counter is--declare architecture
 signal count_reg: std_logic_vector(n-1 downto 0);--creating a signal
begin--start of architecture
 process(clk, enable, reset)--sensitivity list, covers clock process, asynchronous enable and reset,
 begin--begins the process just defined
 if reset = '1' then--active high reset
 count_reg <= (count_reg'range => '0');--reset the counter
elsif (clk='1' and clk'event) then--rising edge of clock
    if enable = '1' then--if enable is high,
 count_reg <= count_reg + 1;--increment counter
end if;--enable if statement
end if;--clock if statement
end process;--end of process

count_out <= count_reg;--output the new counting value

end architecture behv;--end of architecture
