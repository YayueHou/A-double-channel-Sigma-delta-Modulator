set_clock_latency -source -early -max -rise  -0.243243 [get_ports {mclk512}] -clock mclk512 
set_clock_latency -source -early -max -fall  -0.256163 [get_ports {mclk512}] -clock mclk512 
set_clock_latency -source -late -max -rise  -0.243243 [get_ports {mclk512}] -clock mclk512 
set_clock_latency -source -late -max -fall  -0.256163 [get_ports {mclk512}] -clock mclk512 
