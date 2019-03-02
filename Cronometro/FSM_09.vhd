LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

Entity FSM_09 is
    port(
    CLK,RST,Ei    : in  std_logic;
        N      : out std_logic_vector(3 downto 0);
        Eo     : out std_logic);
End FSM_09;

Architecture Behavioral of FSM_09 is
    signal Qp,Qn : std_logic_vector(3 downto 0);

Begin

    Combinational: Process(Qp,Ei)
    begin
        case Qp is
            when "0000" =>
					if (Ei = '1') then
						Qn <= "0001";
						
					else
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <="0000";
            when "0001" =>
					if (Ei = '1') then	
						Qn <= "0010";
					else
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <="0001";
            when "0010" =>
					if (Ei = '1') then
						Qn <= "0011";
					else 
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <="0010";
            when "0011" =>
					if (Ei = '1') then
						Qn <= "0100";
					else
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <="0011";
            when "0100" =>
					if (Ei = '1') then
						Qn <= "0101";
					else
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <="0100";
            when "0101" =>
					if (Ei = '1') then
						Qn <= "0110";
					else
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <="0101";
            when "0110" =>
					if (Ei = '1') then
						Qn <= "0111";
					else
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <="0110";
            when "0111" =>
					if (Ei = '1') then
                Qn <= "1000";
					else
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <="0111";
            when "1000" =>
					if (Ei = '1') then
                Qn <= "1001";
					else
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <="1000";
			   when "1001" =>
					if (Ei = '1') then
						Qn <= "1010";
					 else	
						Qn <= Qp;
					end if;
                Eo <= '0';
					 N <= "1001";
            when others => 
                Qn <= "0000";
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
