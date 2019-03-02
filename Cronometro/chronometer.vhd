LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity chronometer is
    port(
    CLK,RST     : in  std_logic;
    C           : out std_logic; 
    US,DS,UM,DM : out std_logic_vector(6 downto 0));
End chronometer;

Architecture Behavioral of chronometer is
    signal H,HDS,HUM,HDM  : std_logic;
    signal USB,DSB,UMB,DMB: std_logic_vector(3 downto 0);
    
	 component TB_1S
        port(
        CLK,RST : in  std_logic;                    -- Relog y Reset maestro
        H       : out std_logic);                   -- Salida de señal
    end component;
    component FSM_05
        port(
        CLK,RST,Ei    : in  std_logic;
        N      : out std_logic_vector(3 downto 0);
        Eo     : out std_logic);
    end component;
    component FSM_09
        port(
        CLK,RST,Ei    : in  std_logic;
        N      : out std_logic_vector(3 downto 0);
        Eo     : out std_logic);
    end component;
    component Cod_Bin7Seg
    port(
        B : in  std_logic_vector(3 downto 0);
        D : out std_logic_vector(6 downto 0));
    end component;
Begin
    TB_block : TB_1S Port Map (CLK,RST,H);
    US_block : FSM_09 Port Map (CLK,RST,H,USB,HDS);
    DS_block : FSM_05 Port Map (CLK,RST,HDS,DSB,HUM);
    UM_block : FSM_09 Port Map (CLK,RST,HUM,UMB,HDM);
    DM_block : FSM_05 Port Map (CLK,RST,HDM,DMB,C);
    DUS_block: Cod_Bin7Seg Port Map (USB,US);
    DDS_block: Cod_Bin7Seg Port Map (DSB,DS);
    DUM_block: Cod_Bin7Seg Port Map (UMB,UM);
    DDM_block: Cod_Bin7Seg Port Map (DMB,DM);
End Behavioral;
