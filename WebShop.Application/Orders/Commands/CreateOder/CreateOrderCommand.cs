using MediatR;
using WebShop.Domain.Constants;

namespace WebShop.Application.Orders.Commands.CreateOder;

public class CreateOrderCommand : IRequest<int>
{
    public int CustomerId { get; set; }

    public DateTime Date { get; set; }

    public OrderStatus Status { get; set; }

    public List<CreateOrderDetailCommand> OrderDetails { get; set; } = [];
}
