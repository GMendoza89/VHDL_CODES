LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity mcom_1 is
    port(
        A  : in  std_logic;   -- Primer Operando
        B  : in  std_logic;   -- Segundo Operando
        Go : out std_logic;   -- Vandera de ganamcia de Salida
        Eo : out std_logic;   -- Bandera de Empate de salida
        Lo : out std_logic ); -- Bandera de perdidLibrary IEEE;
End mcom_1;

Architecture simple of mcom_1 is
begin
    Go <= A AND NOT(B); -- Mayor
    Eo <= A XNOR B;     -- Igual
    Lo <= NOT(A) AND B; -- Menor
End simple;
