----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:52:35 07/06/2017 
-- Design Name: 
-- Module Name:    serial - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity serial is
port(
  
  component decode4 is
  port(
port(
component sreg is
port(
component count4 is
port(


	my_decode4:decode4 port map (c,start,t8,t9,t11);
	my_sreg:sreg port map(clk,start,serialdata,tdata);
	my_reg8:reg8 port map(clrn,t8,tdata,treg);
	my_ctrl:ctrl port map(t9,t11,tdata(0),tdata(1),treg,clrn,start,serialdata,clk,csn,wrn,rdn,addr,data,intn);
	
	