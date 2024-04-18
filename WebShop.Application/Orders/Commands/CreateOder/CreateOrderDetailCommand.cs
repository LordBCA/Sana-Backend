namespace WebShop.Application.Orders.Commands.CreateOder;

public class CreateOrderDetailCommand
{
    public int ProductId { get; set; }

    public int Quantity { get; set; }

    public decimal Price { get; set; }

    public decimal Total { get; set; }
}
