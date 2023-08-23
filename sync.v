module sync #(parameter num_stages = 2)(
	input wire clk,
	input wire rst_n,
	input wire in_sig,
	output wire out_sig);
	
reg [num_stages-1:0] sync_reg;

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		sync_reg <= 'b0;
		
	end else begin
		sync_reg <= {in_sig,sync_reg[num_stages-1:1]};
	end
end

assign out_sig = sync_reg[0];

endmodule