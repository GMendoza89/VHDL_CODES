-- Decodificador hexadecimal (binario) a display Siete Segmentos de ánodo común
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

Entity seven_segment_hexadecimal_encoder_CA is
    port(
        inputX : in std_logic_vector(3 downto 0);
        outputDisplay : out std_logic_vector(6 downto 0));
End seven_segment_hexadecimal_encoder_CA;

Architecture behavioral of seven_segment_hexadecimal_encoder_CA is
    begin
        process(inputX)
        begin
            case( inputX ) is
                                               --abcdefg
                when "0000" => outputDisplay <= "0000001"; -- Display number 0
                when "0001" => outputDisplay <= "1001111"; -- Display number 1
                when "0010" => outputDisplay <= "0010010"; -- Display number 2
                when "0011" => outputDisplay <= "0000110"; -- Display number 3
                when "0100" => outputDisplay <= "1001100"; -- Display number 4
                when "0101" => outputDisplay <= "0100100"; -- Display number 5
                when "0110" => outputDisplay <= "0100000"; -- Display number 6
                when "0111" => outputDisplay <= "0001111"; -- Display number 7
                when "1000" => outputDisplay <= "0000000"; -- Display number 8
                when "1001" => outputDisplay <= "0001100"; -- Display number 9
                when "1010" => outputDisplay <= "0001000"; -- Display number A
                when "1011" => outputDisplay <= "1100000"; -- Display number B
                when "1100" => outputDisplay <= "0110001"; -- Display number C
                when "1101" => outputDisplay <= "1000010"; -- Display number D
                when "1110" => outputDisplay <= "0110000"; -- Display number E
                when others => outputDisplay <= "0111000"; -- Display number F  
            end case ;
    end process;
End behavioral;
