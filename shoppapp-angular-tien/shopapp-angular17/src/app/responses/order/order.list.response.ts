import { OrderResponse } from "./order.response";

export interface OrderListResponse {

  orders: OrderResponse[];
  totalPages: number;
  }
