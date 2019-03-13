LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity BCD_7S is
    Port(M : in  std_logic_vector(3 downto 0);
         S : out std_logic_vector(7 downto 1));
End BCD_7S;

Architecture Behavioral of BCD_7S is
begin
    Process(M)
    begin
        case M is
            when "0000" => S <= "0000001";
            when "0001" => S <= "1001111";
            when "0010" => S <= "0010010";
            when "0011" => S <= "0000110";
            when "0100" => S <= "1001100";
            when "0101" => S <= "0100100";
            when "0110" => S <= "0100000";
            when "0111" => S <= "0001111";
            when "1000" => S <= "0000000";
            when "1001" => S <= "0001100";
            when others => S <= "1111111";
        end case;
    end Process;
End Behavioral;

    
