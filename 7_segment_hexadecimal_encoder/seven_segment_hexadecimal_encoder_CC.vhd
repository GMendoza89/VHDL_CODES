-- Decodificador hexadecimal (binario) a display Siete Segmentos de cátodo común
-- Autor: Ing. Gustavoo David Mendoza Pinto
-- 
--            a
--           ----
--          |    | b
--       f  |  g |
--           ----
--          |    | c
--       e  |  d |
--           ----
--
--

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity seven_segment_hexadecimal_encoder_CC is
    port(
        inputX : in std_logic_vector(3 downto 0);
        outputDisplay : out std_logic_vector(6 downto 0));
End seven_segment_hexadecimal_encoder_CC;

Architecture behavioral of seven_segment_hexadecimal_encoder_CC is
    begin
        process(inputX)
        begin
            case( inputX ) is
                                               --abcdefg
                when "0000" => outputDisplay <= "1111110"; -- Display number 0
                when "0001" => outputDisplay <= "0110000"; -- Display number 1
                when "0010" => outputDisplay <= "1101101"; -- Display number 2
                when "0011" => outputDisplay <= "1111001"; -- Display number 3
                when "0100" => outputDisplay <= "0110011"; -- Display number 4
                when "0101" => outputDisplay <= "1011011"; -- Display number 5
                when "0110" => outputDisplay <= "1011111"; -- Display number 6
                when "0111" => outputDisplay <= "1110000"; -- Display number 7
                when "1000" => outputDisplay <= "1111111"; -- Display number 8
                when "1001" => outputDisplay <= "1110011"; -- Display number 9
                when "1010" => outputDisplay <= "1110111"; -- Display number A
                when "1011" => outputDisplay <= "0011111"; -- Display number B
                when "1100" => outputDisplay <= "1001110"; -- Display number C
                when "1101" => outputDisplay <= "0111101"; -- Display number D
                when "1110" => outputDisplay <= "1001111"; -- Display number E
                when others => outputDisplay <= "1000111"; -- Display number F  
            end case ;
    end process;
End behavioral;
