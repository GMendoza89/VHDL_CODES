LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity  LUT is
    Port(Sel : in std_logic_vector(3 downto 0);
         K   : out std_logic_vector(15 downto 0));
End LUT;

Architecture MUX of LUT is 
Begin
    Selection: Process(Sel)
    begin
        case Sel is
            when "0000" => K <= "0000000000000000"; --      0   0%
            when "0001" => K <= "0001001110000111"; --  4 999  10%
            when "0010" => K <= "0010011100001111"; --  9 999  20%
            when "0011" => K <= "0011101010010111"; -- 14 999  30%
            when "0100" => K <= "0100111000011111"; -- 19 999  40%
            when "0101" => K <= "0110000110100111"; -- 24 999  50%
            when "0110" => K <= "0111010100101111"; -- 29 999  60%
            when "0111" => K <= "1000100010110111"; -- 34 999  70%
            when "1000" => K <= "1001110000111111"; -- 39 999  80%
            when "1001" => K <= "1010111111000111"; -- 44 999  90% 
            when others => K <= "1100001101001110"; -- 49 999 100%
        end case;
    end Process Selection;
End MUX;
