LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

Entity Time_b is
    port(
    CLK,RST : in  std_logic;                    -- Relog y Reset maestro
    S       : in  std_logic_vector(3 downto 0); -- Seleccionador de base de tiempo
    H       : out std_logic);                   -- Salida de señal
End Time_b;

Architecture Behavioral of Time_b is
    signal T,Qn,Qp,A : unsigned(25 downto 0);
    signal Z : std_logic;
begin
    Multiplexor_T : Process(S)
    Begin
        case S is
            when "0000" => T <= "10111110101111000010000000"; -- BASE DE TIEMPO 1.0 SEG.
            when "0001" => T <= "10101011101010010101000000"; -- BASE DE TIEMPO 0.9 SEG.
            when "0010" => T <= "01011000100101101000000000"; -- BASE DE TIEMPO 0.8 SEG.
            when "0011" => T <= "10000101100000111011000000"; -- BASE DE TIEMPO 0.7 SEG.
            when "0100" => T <= "01110010011100001110000000"; -- BASE DE TIEMPO 0.6 SEG.
            when "0101" => T <= "01011111010111100001000000"; -- BASE DE TIEMPO 0.5 SEG.
            when "0110" => T <= "01001100010010110100000000"; -- BASE DE TIEMPO 0.4 SEG.
            when "0111" => T <= "00111001001110000111000000"; -- BASE DE TIEMPO 0.3 SEG.
            when "1000" => T <= "00100110001001011010000000"; -- BASE DE TIEMPO 0.2 SEG.
            when others => T <= "00010011000100101101000000"; -- BASE DE TIEMPO 0.1 SEG.
        end case;
    end Process Multiplexor_T;
    
    Combinational : Process(Qp,A,Z,T)
    begin
        A<="00000000000000000000000001";
        if(Qp = A) then
            Z <= '1';               -- Estado Presente igual a 0
        else
            Z <= '0';               -- Estado Presente diferente de 0
        end if;
        if (Z = '0') then
            Qn <= Qp - 1;
        else
            Qn <= T;
        end if;
    end Process Combinational;

    Secuential : Process(RST,CLK)
    begin
        if(RST = '0') then
            Qp <= "00000000000000000000000001";
        elsif(CLK'event and CLK='1')then
            Qp <= Qn;
        end if;
    end Process;

    H <= Z;
End Behavioral;


