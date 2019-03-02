LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

Entity TB_1S is
    port(
    CLK,RST : in  std_logic;                    -- Relog y Reset maestro
    H       : out std_logic);                   -- Salida de señal
End TB_1S;

Architecture Behavioral of TB_1S is
    signal T,Qn,Qp,A : unsigned(25 downto 0);
    signal Z : std_logic;
begin
   T <= "10111110101111000010000000"; -- BASE DE TIEMPO 1.0 SEG.
   --T <= "01011111010111100001000000"; -- BASE DE TIEMPO 0.5 SEG.
   
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


