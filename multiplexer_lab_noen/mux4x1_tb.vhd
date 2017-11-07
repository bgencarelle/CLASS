-- testbench 4x1 multiplexer
---------------------------------
entity Testbench is
end Testbench;

architecture TestbenchArch of Testbench is
    signal S_in: bit_vector(1 downto 0);
    signal E_in: bit_vector(3 downto 0);
    signal Y_out: bit;
component mux4

  port( S: in bit_vector(1 downto 0);
  E: in bit_vector(3 downto 0);
  Y: out bit);
  end component;
for DUT: MUX4 use entity work.MUX4X1;
    begin
      DUT: MUX4 port map(S_in, E_in, Y_out);
         E_in <= "1011", "0100" after 400 ns;
         S_in <= "00","01" after 100 ns,"10" after 200 ns,"11" after 300 ns,"00" after 400 ns,"01" after 500 ns, "10" after 600 ns, "11" after 700 ns;
    end architecture TestbenchArch;
