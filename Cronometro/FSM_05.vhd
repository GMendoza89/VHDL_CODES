LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

Entity FSM_05 is
    port(
    CLK,RST,Ei : in  std_logic;
        N      : out std_logic_vector(3 downto 0);
        Eo     : out std_logic);
End FSM_05;

Architecture Behavioral of FSM_05 is
    signal Qp,Qn : std_logic_vector(2 downto 0);

Begin

    Combinational: Process(Qp,Ei)
    begin
        case Qp is
            when "000" =>
					if(Ei ='1') then
						Qn <= "001";
						else
						Qn <= Qp;
					end if;
						Eo <= '0';
						N <="0000";
            when "001" =>
					 if(Ei = '1') then
						Qn <= "010";
					else
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <="0001";
            when "010" =>
					 if (Ei = '1') then
						Qn <= "011";
					 else
						Qn <= Qp;
					end if;
						Eo <= '1';
						N <="0010";
            when "011" =>
					 if (Ei = '1') then
						Qn <= "100";
					else
						Qn <= Qp;
						end if;
					Eo <= '0';
					N <="0011";
            when "100" =>
					 if (Ei = '1') then
						Qn <= "101";
					else
						Qn <= Qp;
					end if;
					Eo <= '0';
					N <="0100";
            when "101" =>
					if (Ei = '1') then
						Qn <= "110";
					else
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <="0101";
           when others => 
                Qn <= "000";
                Eo <= '1';
					 N <="0000";
        end Case;
    end Process Combinational;

    Secuential : process(CLK,RST)
    begin
        if(RST = '0')then
            Qp <= (others => '0');
        elsif(CLK'event and CLK = '1') then
            Qp <= Qn;
        end if;
    end Process Secuential;
End Behavioral;
