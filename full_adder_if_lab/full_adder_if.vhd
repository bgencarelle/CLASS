
entity full_adder_if is
 port (a,b,c_in: in bit;
 s, c_out : out bit);
end full_adder_if;

ARCHITECTURE full_adder_if_lab OF full_adder_if IS

BEGIN
	PROCESS (a, b,c_in)
  variable IN_cat : bit_vector (2 downto 0);

	BEGIN
  IN_cat := a & b & c_in;
	IF (IN_cat = "000") THEN
	   c_out <= '0' AFTER 10ns;
     s <= '0' AFTER 10ns;
  ELSIF (IN_cat = "001") OR  (IN_cat = "010") OR (IN_cat = "100") THEN
  c_out <= '0' AFTER 10ns;
  s <= '1' AFTER 10ns;

  ELSIF (IN_cat = "011") OR  (IN_cat = "101") OR (IN_cat = "110") THEN
  c_out <= '1' AFTER 10ns;
  s <= '0' AFTER 10ns;

  ELSE 
  c_out <= '1' AFTER 10ns;
  s <= '1' AFTER 10ns;
	END IF;
	END PROCESS;

END full_adder_if_lab;
