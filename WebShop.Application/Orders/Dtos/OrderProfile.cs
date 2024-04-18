using AutoMapper;
using WebShop.Domain.Entities;

namespace WebShop.Application.Orders.Dtos;

internal class OrderProfile : Profile
{
    public OrderProfile()
    {
        CreateMap<Order, OrderDto>();
        CreateMap<OrderDetail, OrderDetailDto>();
    }
}
