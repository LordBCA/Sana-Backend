using AutoMapper;
using MediatR;
using Microsoft.Extensions.Logging;
using WebShop.Application.Orders.Dtos;
using WebShop.Domain.Entities;
using WebShop.Domain.Exceptions;
using WebShop.Domain.Repositories;

namespace WebShop.Application.Orders.Queries.GetOrderById;

public class GetOrderByIdQueryHandler(IOrderRepository repository,
    ILogger<GetOrderByIdQueryHandler> logger,
    IMapper mapper) : IRequestHandler<GetOrderByIdQuery, OrderDto>
{
    public async Task<OrderDto> Handle(GetOrderByIdQuery request, CancellationToken cancellationToken)
    {
        logger.LogInformation("Getting Order {OrderId}", request.Id);
        var order = await repository.GetByIdAsync(request.Id) 
            ?? throw new NotFoundException(nameof(Order), request.Id.ToString());

        var orderDto = mapper.Map<OrderDto>(order);

        return orderDto;
    }
}
