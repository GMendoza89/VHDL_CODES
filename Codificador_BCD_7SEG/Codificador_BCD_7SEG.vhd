LIBRARY IEEE;
use IEEE.std_logic_1164.all;

Entity Codificador_BCD_7SEG is
    port(
        X : in std_logic_vector(3 downto 0);
        Y : out std_logic_vector(6 downto 0)); -- abcdefg
End Codificador_BCD_7SEG;

Architecture Behavioral of Codificador_BCD_7SEG is
    Begin
        process(X)
        begin
            case X is
                when "0000" =>  Y <= "1111110"; -- 0 
                when "0001" =>  Y <= "0110000"; -- 1
                when "0010" =>  Y <= "1101101"; -- 2
                when "0011" =>  Y <= "1111001"; -- 3
                when "0100" =>  Y <= "0110011"; -- 4
                when "0101" =>  Y <= "1011011"; -- 5
                when "0110" =>  Y <= "1011111"; -- 6
                when "0111" =>  Y <= "1110001"; -- 7
                when "1000" =>  Y <= "1111111"; -- 8
                when "1001" =>  Y <= "1110011"; -- 9
                when others =>  Y <= "0000000"; -- --
            end case;
        end process;
End Behavioral;

