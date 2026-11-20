module vending_machine #(
    parameter PRICE_A = 15,
    parameter PRICE_B = 20
)(
    input clk,
    input rst,
    input [4:0] coin_in,
    input coin_valid,
    input prod_sel_a,
    input prod_sel_b,
    output reg dispense_a,
    output reg dispense_b,
    output reg [4:0] change_out
);

    // State Encoding using standard Verilog
    localparam S_IDLE       = 3'b000;
    localparam S_ACCUMULATE = 3'b001;
    localparam S_CHECK      = 3'b010;
    localparam S_DISPENSE   = 3'b011;
    localparam S_CHANGE     = 3'b100;

    reg [2:0] current_state, next_state;
    reg [5:0] balance, next_balance;
    reg next_dispense_a, next_dispense_b;
    reg [4:0] next_change_out;

    // 1. Sequential Logic (Flip-Flops)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= S_IDLE;
            balance       <= 0;
            dispense_a    <= 0;
            dispense_b    <= 0;
            change_out    <= 0;
        end else begin
            current_state <= next_state;
            balance       <= next_balance;
            dispense_a    <= next_dispense_a;
            dispense_b    <= next_dispense_b;
            change_out    <= next_change_out;
        end
    end

    // 2. Combinational Logic (Next State & Datapath)
    always @(*) begin
        // Default assignments to prevent latches
        next_state      = current_state;
        next_balance    = balance;
        next_dispense_a = 0;
        next_dispense_b = 0;
        next_change_out = 0;

        case (current_state)
            S_IDLE: begin
                if (coin_valid) begin
                    next_balance = balance + coin_in;
                    next_state = S_ACCUMULATE;
                end else if (prod_sel_a || prod_sel_b) begin
                    next_state = S_CHECK;
                end
            end

            S_ACCUMULATE: begin
                // Return to IDLE to wait for more coins or product selection
                next_state = S_IDLE;
            end

            S_CHECK: begin
                if (prod_sel_a && balance >= PRICE_A) begin
                    next_state = S_DISPENSE;
                end else if (prod_sel_b && balance >= PRICE_B) begin
                    next_state = S_DISPENSE;
                end else begin
                    // Insufficient funds, return to idle
                    next_state = S_IDLE;
                end
            end

            S_DISPENSE: begin
                if (prod_sel_a && balance >= PRICE_A) begin
                    next_dispense_a = 1;
                    next_balance = balance - PRICE_A;
                end else if (prod_sel_b && balance >= PRICE_B) begin
                    next_dispense_b = 1;
                    next_balance = balance - PRICE_B;
                end
                next_state = S_CHANGE;
            end

            S_CHANGE: begin
                if (balance > 0) begin
                    next_change_out = balance[4:0];
                    next_balance = 0;
                end
                next_state = S_IDLE;
            end
            
            default: next_state = S_IDLE;
        endcase
    end
endmodule