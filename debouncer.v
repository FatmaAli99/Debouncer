module debouncer #(parameter counter_final_value = 99)(
	input wire clk,
	input wire rst_n,
	input wire noisy_in,
	output wire debouncer_out);

	
wire timer_en, timer_done;


FSM FSM_DUT(
.rst_n(rst_n),
.clk(clk),
.noisy_sig(noisy_in), 
.timer_done(timer_done),
.debunced_sig(debouncer_out), 
.timer_en(timer_en));

timer #(.counter_final_value(counter_final_value)) timer_DUT(
.clk(clk),
.rst_n(rst_n),
.enable(timer_en),
.done(timer_done));

endmodule