using Microsoft.EntityFrameworkCore;
using WebShop.Domain.Entities;
using WebShop.Domain.Repositories;
using WebShop.Infrastructure.Persistence;

namespace WebShop.Infrastructure.Repositories;

internal class OrderRepository(WebShopDbContext dbContext) 
    : IOrderRepository
{ 
    public async Task<int> Create(Order entity)
    {
        dbContext.Orders.Add(entity);
        await dbContext.SaveChangesAsync();
        return entity.Id;
    }

    public async Task<int> CreateOrderDetail(OrderDetail entity)
    {
        dbContext.OrderDetails.Add(entity);
        await dbContext.SaveChangesAsync();
        return entity.Id;
    }

    public async Task<Order?> GetByIdAsync(int id)
    {
        var order = await dbContext.Orders
            .Include(r => r.OrderDetails)
            .FirstOrDefaultAsync(x => x.Id == id);

        return order;
    }
}
