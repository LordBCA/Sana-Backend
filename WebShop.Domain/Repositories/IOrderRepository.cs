using WebShop.Domain.Entities;

namespace WebShop.Domain.Repositories;

public interface IOrderRepository
{
    Task<int> Create(Order entity);

    Task<int> CreateOrderDetail(OrderDetail entity);

    Task<Order?> GetByIdAsync(int id);
}
