module debouncer_sync #(parameter counter_final_value = 99, num_stages = 2)(
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
	
debouncer #(.counter_final_value(counter_final_value)) debouncer_DUT(
.clk(clk),
.rst_n(rst_n),
.noisy_in(sync_sig),
.debouncer_out(debouncer_out));

endmodule