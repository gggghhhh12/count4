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
entity serial isport(	serialdata : in std_logic;	clk : in std_logic;	csn, wrn, rdn : in std_logic;	addr : in std_logic_vector(1 downto 0);	data : inout std_logic_vector(7 downto 0);	intn : out std_logic	);end serial;architecture behav of serial iscomponent ctrl is
port(	d9, d11 : in std_logic;	sq0, sq1 : in std_logic;	rq : in std_logic_vector(7 downto 0);	clrn  : inout std_logic;   start : out std_logic;	serial, clk : in std_logic;	csn, wrn, rdn : in std_logic;	addr : in std_logic_vector(1 downto 0);	data : inout std_logic_vector(7 downto 0);	intn : out std_logic	);  end component;
  
  component decode4 is
  port(	d : in std_logic_vector(3 downto 0);	enable : in std_logic;	q8, q9, q11 : out std_logic	);end component;component reg8 is
port(	clrn, clk : in std_logic;	d : in std_logic_vector(7 downto 0);	q : out std_logic_vector(7 downto 0)	);end component;
component sreg is
port(	clk, clrn, serial : in std_logic;	q : out std_logic_vector(7 downto 0)	);end component;
component count4 is
port(	clk : in std_logic;	clrn : in std_logic;	q : out std_logic_vector(3 downto 0)	);end component;

 signal c : std_logic_vector(3 downto 0); signal start, t8, t9, t11, clrn : std_logic; signal tdata, treg : std_logic_vector(7 downto 0);begin	my_count4:count4 port map (clk,start,c);
	my_decode4:decode4 port map (c,start,t8,t9,t11);
	my_sreg:sreg port map(clk,start,serialdata,tdata);
	my_reg8:reg8 port map(clrn,t8,tdata,treg);
	my_ctrl:ctrl port map(t9,t11,tdata(0),tdata(1),treg,clrn,start,serialdata,clk,csn,wrn,rdn,addr,data,intn);
	
	end behav;
