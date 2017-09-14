--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:37:34 07/10/2017
-- Design Name:   
-- Module Name:   D:/count4/testserial.vhd
-- Project Name:  count4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: serial
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testserial IS
END testserial;
 
ARCHITECTURE behavior OF testserial IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT serial
    PORT(
         serialdata : IN  std_logic;
         clk : IN  std_logic;
         csn : IN  std_logic;
         wrn : IN  std_logic;
         rdn : IN  std_logic;
         addr : IN  std_logic_vector(1 downto 0);
         data : INOUT  std_logic_vector(7 downto 0);
         intn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal serialdata : std_logic := '0';
   signal clk : std_logic := '0';
   signal csn : std_logic := '0';
   signal wrn : std_logic := '0';
   signal rdn : std_logic := '0';
   signal addr : std_logic_vector(1 downto 0) := (others => '0');

	--BiDirs
   signal data : std_logic_vector(7 downto 0);

 	--Outputs
   signal intn : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: serial PORT MAP (
          serialdata => serialdata,
          clk => clk,
          csn => csn,
          wrn => wrn,
          rdn => rdn,
          addr => addr,
          data => data,
          intn => intn
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wrn <= '0';
		csn<='0';
		rdn<='1';

		addr<="01";
		wait for clk_period;
		addr<="10";
		wait for clk_period;
		addr<="11";
		wait for clk_period;
		addr<="00";
		wait for clk_period;	
		addr<="01";
		rdn<='0';
		csn<='0';
		wrn<='1';
      wait for clk_period;	
		
		serialdata <= '0';
		wait for clk_period;	
		serialdata <= '0';
		wait for clk_period;	
		serialdata <= '1';
		wait for clk_period;	
		serialdata <= '0';
		wait for clk_period;	
		serialdata <= '1';
		wait for clk_period;	
		serialdata <= '0';
		wait for clk_period;	
		serialdata <= '1';
		wait for clk_period;	
		serialdata <= '1';
		wait for clk_period;
		
		serialdata <= '0';
		wait for clk_period;
		serialdata <= '1';
		wait for clk_period;
		serialdata <= '1';
		wait for clk_period;
		wait for clk_period;		
		--addr<="01";
		addr<="00";
		wait for clk_period;
		
		wrn <= '0';
		csn<='0';
		rdn<='1';
		addr<="01";
		wait for clk_period;
		addr<="10";
		wait for clk_period;
		addr<="11";
		wait for clk_period;
		addr<="00";
		wait for clk_period;	
		rdn<='0';
		csn<='0';
		wrn<='1';
		addr<="01";
		wait for clk_period;	
		
		
		serialdata <= '0';
		wait for clk_period;	
		
		serialdata <= '0';
		wait for clk_period;	
		serialdata <= '0';
		wait for clk_period;	
		serialdata <= '1';
		wait for clk_period;	
		serialdata <= '0';
		wait for clk_period;	
		serialdata <= '1';
		wait for clk_period;	
		serialdata <= '0';
		wait for clk_period;	
		serialdata <= '1';
		wait for clk_period;	
		serialdata <= '1';
		wait for clk_period;
		
		serialdata <= '1';
		wait for clk_period;
		serialdata <= '1';
		wait for clk_period;
		serialdata <= '1';
	
		wait for clk_period;	
		--addr<="00";
		--wait for clk_period;
		--addr<="10";
		--wait for clk_period;
		serialdata <= '1';
		wrn <= '0';
		csn<='0';
		rdn<='1';
		--addr<="01";
		--wait for clk_period;
		addr<="10";
		wait for clk_period;
		addr<="00";
		wait for clk_period;

		rdn<='0';
		csn<='0';
		wrn<='1';
		addr<="01";
						serialdata <= '0';
			wait for clk_period;
					
		wrn <= '0';
		csn<='0';
		rdn<='1';
		addr<="01";
		wait for clk_period;
		addr<="10";
		wait for clk_period;
		addr<="11";
		wait for clk_period;
		addr<="00";
		wait for clk_period;	
		rdn<='0';
		csn<='0';
		wrn<='1';
		addr<="01";
		wait for clk_period;	
		wait for clk_period;	
		wait for clk_period;
      wait;
   end process;

END;
