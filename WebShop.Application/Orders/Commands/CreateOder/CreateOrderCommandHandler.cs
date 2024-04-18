using AutoMapper;
using MediatR;
using Microsoft.Extensions.Logging;
using WebShop.Domain.Entities;
using WebShop.Domain.Repositories;

namespace WebShop.Application.Orders.Commands.CreateOder;

public class CreateOrderCommandHandler(IOrderRepository repository,
    ILogger<CreateOrderCommandHandler> logger,
    IMapper mapper) : IRequestHandler<CreateOrderCommand, int>
{
    public async Task<int> Handle(CreateOrderCommand request, CancellationToken cancellation)
    {
        logger.LogInformation("Creating a new order");

        var order = mapper.Map<Order>(request);
        order.Date = DateTime.UtcNow;
        int id = await repository.Create(order);

        return id;
    }
}
