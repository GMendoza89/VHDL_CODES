LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity TB_Control_llenado is
end TB_Control_llenado;

Architecture banco of TB_Control_llenado is
    component Control_llenado
        port(
            RST  : in  std_logic;    -- Reset Maestro
            CLK  : in  std_logic;    -- Relog Maestro
            B    : in  std_logic;    -- Limite inferior
            T    : in  std_logic;    -- Limite superior
            M    : out  std_logic    -- Encendido de la bomba
        );
    end component;
    signal RST, CLK, B, T, M : std_logic;
    begin
        -- Instancia del dispositivo a probar
        SIMBLK00: Control_llenado PORT MAP (RST, CLK, B, T, M);

        -- GENERAR BASE DE TIEMPO PARA CLK
        BASE: PROCESS
        BEGIN 
            CLK <= '0';
            WAIT FOR 50 ns;
            CLK <= '1';
            WAIT FOR 50 ns;
        end process BASE;
        -- inicialización por reset
        RESET: process
        begin
            RST <= '0';
            wait for 110 ns;
            RST <= '1';
            WAIT;
        END PROCESS RESET;

        -- ENTRADAS A Y B 

        ENTRADAS: PROCESS
        begin
            B<='1'; -- INICIALMENTE EL TANQUE ESTA LLENO
            T<='1';
            wait for 425 ns;
            B<='1'; -- El Tanque comienza a vaciarce
            T<='0';
            wait for 300 ns;
            B<='0'; -- El tanque esta vacio
            T<='0';
            wait for 300 ns;
            B<='1'; -- El tanque emieza a llenarse
            T<='0';
            wait for 300 ns;
            B<='1'; -- El tanque esta lleno
            T<='1';
            wait;
        end process ENTRADAS;
END banco;


            



