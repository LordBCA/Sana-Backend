using MediatR;
using WebShop.Application.Orders.Dtos;

namespace WebShop.Application.Orders.Queries.GetOrderById;

public class GetOrderByIdQuery(int id): IRequest<OrderDto>
{
    public int Id { get; } = id;
}
