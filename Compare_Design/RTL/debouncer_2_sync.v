module debouncer_2_sync #(parameter num_delay_clks = 100, num_stages = 2)(
	input wire clk,
	input wire rst_n,
	input wire noisy_in,
	output wire debouncer_out
);

wire sync_sig;


sync #(.num_stages(num_stages))sync_DUT(
.clk(clk),
.rst_n(rst_n),
.in_sig(noisy_in),
.out_sig(sync_sig));
	
debouncer_2 #(.num_delay_clks(num_delay_clks)) debouncer_DUT(
.clk(clk),
.rst_n(rst_n),
.noisy_in(sync_sig),
.debouncer_out(debouncer_out));

endmodule