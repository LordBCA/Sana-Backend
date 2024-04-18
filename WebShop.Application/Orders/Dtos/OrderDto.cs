using WebShop.Domain.Constants;
using WebShop.Domain.Entities;

namespace WebShop.Application.Orders.Dtos;

public class OrderDto
{
    public int Id { get; set; }

    public int CustomerId { get; set; }

    public DateTime Date { get; set; }

    public OrderStatus Status { get; set; }    

    public ICollection<OrderDetailDto> OrderDetails { get; set; } = [];
}
