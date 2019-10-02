library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and5 is
	 port(
	     A : in std_logic_vector (4 downto 0);
		  Z : out std_logic
		  );
end and5;

architecture struct of and5 is

    component and2
	     port(
		      A, B : in std_logic;
				Z : out std_logic
	         );
    end component;

signal X : std_logic_vector (3 downto 0);
begin
    U0 : and2 port map (A(0), A(1), X(0));
    gen : for i in 2 to 4 generate
	     U : and2 port map (A(i), X(i - 2), X(i - 1));
	 end generate;	
    Z <= X(3);	 
end struct;

architecture beh of and5 is
begin
    Z <= A(0) and A(1) and A(2) and A(3) and A(4);
end beh;