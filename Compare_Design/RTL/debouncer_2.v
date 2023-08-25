module debouncer_2 #(parameter num_delay_clks = 100)(
	input wire clk,
	input wire rst_n,
	input wire noisy_in,
	output reg debouncer_out);

reg [num_delay_clks-1:0] Q_reg;

always @ (posedge clk or negedge rst_n) 
begin
	if(!rst_n) begin
		debouncer_out <= 1'b0;
		Q_reg <= 'b0;
		
	end else begin
		Q_reg <= {noisy_in,Q_reg[num_delay_clks-1:1]};
		if(Q_reg == 'b0)
			debouncer_out <= 1'b0;
		else if (Q_reg == 'hFFFFFFFFFFFFFFFFFFFFFFFFF)
			debouncer_out <= 1'b1;
	end
end
endmodule