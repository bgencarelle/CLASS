-- mux4x1.vhd
 ---------------------------
 entity MUX4X1 is
     port( S: in bit_vector(1 downto 0);
           E: in bit_vector(3 downto 0);
          enable: in bit;
           Y: out bit);
     end MUX4X1;

 architecture Behaviour of MUX4X1 is
signal en: bit_vector(2 downto 0);	

 begin
	en <= S & enable;
   with en select
       Y <= E(0) when "000",
           E(1) when "010",
           E(2) when "100",
           E(3) when "110",
	  '0' when others;
       end Behaviour;
