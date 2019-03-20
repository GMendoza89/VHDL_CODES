LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity PWM is
    port(RST,CLK : in std_logic;
         Sel : in std_logic_vector(3 downto 0);
         P,Po   : out std_logic);
End PWM;

Architecture Behavioral of PWM is 
    component  FSM_PWM is
    port(RST,CLK : in  std_logic;
         C       : in  std_logic;
         EOC     : in  std_logic;
         STC     : out std_logic;
         P       : out std_logic);
    end component;
    
    component  LUT is
    Port(Sel : in std_logic_vector(3 downto 0);
         K   : out std_logic_vector(15 downto 0));
    end component; 
    
    component Contador_DutyCicle is
    port(RST,CLK : in  std_logic;
         STC     : in  std_logic;
         K       : in  std_logic_vector(15 downto 0);
         EOC     : out std_logic);
    end component;

    component Contador_1KHz is
    port(RST,CLK : in  std_logic;
         C       : out std_logic);
    end component;

    signal K : std_logic_vector(15 downto 0);
    signal STC, EOC, C, Pls : std_logic;

Begin

    -- Maquina de control
    FSM_BLK: FSM_PWM Port Map (RST,CLK,C,EOC,STC,Pls);
    -- Generador de frecuencia base
    T_BLK: Contador_1KHz Port Map (RST,CLK,C);
    -- Seleccion de Ciclo de trabajo
    LUT_BLK: LUT Port Map (Sel,K);
    -- Contador de ciclo de trabajo
     DC_BLK: Contador_DutyCicle Port Map (RST,CLK,C,K,EOC);
	  P <= Pls;
	  Po <= Pls;
End Behavioral;



