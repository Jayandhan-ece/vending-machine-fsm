# Clock signal (100 MHz)
set_property PACKAGE_PIN E3 [get_ports clk]							
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# Reset (Center Button)
set_property PACKAGE_PIN N17 [get_ports rst]						
set_property IOSTANDARD LVCMOS33 [get_ports rst]

# Coin Valid (Top Button - Push to confirm coin)
set_property PACKAGE_PIN M18 [get_ports coin_valid]						
set_property IOSTANDARD LVCMOS33 [get_ports coin_valid]

# Coin In (Switches 0 to 4)
set_property PACKAGE_PIN J15 [get_ports {coin_in[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {coin_in[0]}]
set_property PACKAGE_PIN L16 [get_ports {coin_in[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {coin_in[1]}]
set_property PACKAGE_PIN M13 [get_ports {coin_in[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {coin_in[2]}]
set_property PACKAGE_PIN R15 [get_ports {coin_in[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {coin_in[3]}]
set_property PACKAGE_PIN R17 [get_ports {coin_in[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {coin_in[4]}]

# Product Selection (Switches 14 and 15)
set_property PACKAGE_PIN T18 [get_ports prod_sel_a]					
set_property IOSTANDARD LVCMOS33 [get_ports prod_sel_a]
set_property PACKAGE_PIN U18 [get_ports prod_sel_b]					
set_property IOSTANDARD LVCMOS33 [get_ports prod_sel_b]

# Dispense Outputs (LEDs 14 and 15)
set_property PACKAGE_PIN V11 [get_ports dispense_a]					
set_property IOSTANDARD LVCMOS33 [get_ports dispense_a]
set_property PACKAGE_PIN V12 [get_ports dispense_b]					
set_property IOSTANDARD LVCMOS33 [get_ports dispense_b]

# Change Outputs (LEDs 0 to 4)
set_property PACKAGE_PIN H17 [get_ports {change_out[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {change_out[0]}]
set_property PACKAGE_PIN K15 [get_ports {change_out[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {change_out[1]}]
set_property PACKAGE_PIN J13 [get_ports {change_out[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {change_out[2]}]
set_property PACKAGE_PIN N14 [get_ports {change_out[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {change_out[3]}]
set_property PACKAGE_PIN R18 [get_ports {change_out[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {change_out[4]}]