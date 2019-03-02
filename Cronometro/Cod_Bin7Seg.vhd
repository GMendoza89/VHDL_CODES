LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity Cod_Bin7Seg is
    port(
        B : in  std_logic_vector(3 downto 0);
        D : out std_logic_vector(6 downto 0));
End Cod_Bin7Seg;

Architecture Behavioral of Cod_Bin7Seg is
begin
    Codex : Process(B)
    begin
        case B is
            when "0000" => D <= "0000001";
            when "0001" => D <= "1001111";
            when "0010" => D <= "0010010";
            when "0011" => D <= "0000110";
            when "0100" => D <= "1001100";
            when "0101" => D <= "0100100";
            when "0110" => D <= "0100000";
            when "0111" => D <= "0001111";
            when "1000" => D <= "0000000";
            when "1001" => D <= "0001100";
            when "1010" => D <= "0001000";
            when "1011" => D <= "1100000";
            when "1100" => D <= "0110001";
            when "1101" => D <= "1000010";
            when "1110" => D <= "0110000";
            when others => D <= "0111000";
        end case;
    end Process Codex;
End Behavioral;
