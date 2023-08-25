`timescale 1ns/1ps

module debouncer_sync_tb();

parameter num_stages = 2;
parameter counter_final_value = 99;
parameter period = 10;
parameter delay = period*(counter_final_value +1);

reg clk;
reg rst_n;
reg noisy_in;
wire debouncer_out;


initial begin
	
	initialization();
	
	rst();
	
	check();
	
	check();
	
	#(4*delay);
	$stop;		
end

task initialization();
begin
	clk = 0;
	rst_n = 1;
	noisy_in = 0;
end
endtask

task rst();
begin
	@(negedge clk)
	rst_n = 0;
	@(negedge clk)
	rst_n = 1;
end
endtask

task check();
begin
	#(2*delay)
	
	repeat(2) begin
		@(posedge clk)
		noisy_in = 1;
		@(posedge clk)
		noisy_in = 0;
		@(posedge clk)
		noisy_in = 1;
	end
	
	#(2*delay)

	repeat(2) begin
		@(posedge clk)
		noisy_in = 0;
		@(posedge clk)
		noisy_in = 1;
		@(posedge clk)
		noisy_in = 0;
	end
end
endtask

always #(period/2) clk = ~clk;


debouncer_sync #(.counter_final_value(counter_final_value), .num_stages(num_stages)) debouncer_sync_DUT(
.clk(clk),
.rst_n(rst_n),
.noisy_in(noisy_in),
.debouncer_out(debouncer_out));

endmodule