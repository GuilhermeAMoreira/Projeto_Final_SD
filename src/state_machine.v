`timescale 1 ns/100 ps

module state_machine( input ck,
					  input inicio,
					  input Vint_z,
					  input enb_3,
					  output reg enb_0,
					  output reg rst_s,
					  output reg ch_vm,
					  output reg ch_ref,
					  output reg ch_zr,
					  output reg ld);

	localparam IDLE=0, START=1, COUNT_TX=2, COUNT_TM=3, STOP=4;

	reg [2:0] state, next_state;

	initial begin
		state = IDLE;
		next_state = IDLE;
	end

	always @ (posedge ck) begin
			state <= next_state;
	end

	always @ (posedge ck) begin
		//next_state = state;
		case(state)
			IDLE: begin
				if(inicio)
					next_state = START;
			end
			START: begin
				next_state = COUNT_TX;
			end
			COUNT_TX: begin
				if(enb_3)
					next_state = COUNT_TM;
			end
			COUNT_TM: begin
				if(Vint_z)
					next_state = STOP;
			end
			STOP: begin
				next_state = IDLE;
			end
		endcase
	end

	always @ (posedge ck) begin
		case(state)
			IDLE: begin
				ch_zr  = 1;
				rst_s  = 1;
				ld = 0;
			end
			START: begin
				ch_zr  = 0;
				rst_s  = 0;
			end
			COUNT_TX: begin
				enb_0 = 1;
				ch_vm  = 1;
			end
			COUNT_TM: begin
				ch_vm  = 0;
				ch_ref = 1;
			end
			STOP: begin
				enb_0  = 0;
				ld = 1;
				ch_ref = 0;
			end
		endcase
	end

endmodule
