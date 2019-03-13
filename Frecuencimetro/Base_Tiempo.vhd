-- Genrador de Base de Tiempo
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity Base_Tiempo is
    Port(CLK : in  std_logic;
         RST : in  std_logic;
         L   : out std_logic;
         C   : out std_logic;
         H   : out std_logic);
End Base_Tiempo;

Architecture Behavioral of Base_Tiempo is
    signal STC, EOC : std_logic; -- Iniciar cuenta de 1 Segundo, Terminar cuenta de 1 segundo
    component FSM_Control 
    port(CLK,RST : in  std_logic;
         EOC     : in  std_logic;
         STC     : out std_logic;
         L       : out std_logic;
         C       : out std_logic;
         H       : out std_logic);
    end Component;
    
    component Contador_1S 
    port(RST,CLK : in  std_logic;
         STC     : in  std_logic;
         EOC     : out std_logic);
    end Component;

Begin
    Bloque_01: FSM_Control Port Map (CLK,RST,EOC,STC,L,C,H);
    Bloque_02: Contador_1S Port Map (RST,CLK,STC,EOC);
End Behavioral;



