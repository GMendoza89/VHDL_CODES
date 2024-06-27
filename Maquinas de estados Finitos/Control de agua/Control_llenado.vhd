-- Control de llenado de tanque de liquido en vhd

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity Control_llenado is
    port(
        RST  : in  std_logic;    -- Reset Maestro
        CLK  : in  std_logic;    -- Relog Maestro
        B    : in  std_logic;    -- Limite inferior
        T    : in  std_logic;    -- Limite superior
        M    : out  std_logic    -- Encendido de la bomba
    );
end Control_llenado;

Architecture FSM of Control_llenado is
signal Qn, Qp : std_logic;       -- Estados de mi maquina
begin
    Combinacional: process(Qp,B,T)
    begin
        if (Qp = '0') then
            --Estado apagado de la bomba
        M <= '0';
            if(B = '0' AND T = '0') then
                -- Ir a estado de encendido
                Qn <= '1';
            else
                -- permanecer apagado
                Qn <= Qp;
            end if;
        else
            -- estado de encendido
            M <= '1';
            if(B = '1' AND T = '1') then
                -- ir al estado de apagado
                Qn <= '0';
            else
                --permanecer encendido
                Qn <= Qp;
            end if;
        end if;
    end Process Combinacional;
    
    Secuencial: process(RST,CLK)
    begin
        if(RST = '0') then
            Qp <= '0';
        elsif(CLK'EVENT AND CLK='1') then
            Qp <= Qn;
        end if;
    end process Secuencial;
end FSM; 
