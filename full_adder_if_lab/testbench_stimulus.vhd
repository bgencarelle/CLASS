
--testbench stim
entity Testbench_stim_full_if is
end Testbench_stim_full_if;

architecture TestbenchFullif of Testbench_stim_full_if is
signal a_in, b_in, c_inp : bit ;
signal c_outp, s_out :  bit ;

component full_adder_if

	PORT ( a, b, c_in : IN bit ;
		c_out, s : OUT bit) ;

END component;


for u1: full_adder_if use entity work.full_adder_if(full_adder_if_lab);
begin
u1: full_adder_if port map (a_in, b_in, c_inp, c_outp, s_out);
    a_in <= '0', '0' after 100 ns, '0' after 200 ns, '0' after 300 ns, '1' after 400 ns, '1' after 500 ns, '1' after 600 ns,'1' after 700 ns,'0' after 800 ns;
    b_in <= '0', '0' after 100 ns, '1' after 200 ns, '1' after 300 ns, '0' after 400 ns, '0' after 500 ns, '1' after 600 ns,'1' after 700 ns,'0' after 800 ns;
    c_inp <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns, '0' after 400 ns, '1' after 500 ns, '0' after 600 ns,'1' after 700 ns,'0' after 800 ns;
END  TestbenchFullif;
