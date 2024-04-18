using AutoMapper;
using WebShop.Application.Orders.Commands.CreateOder;
using WebShop.Domain.Entities;

namespace WebShop.Application.Orders.Command;

public class OrderProfile : Profile
{
    public OrderProfile()
    {
        CreateMap<CreateOrderDetailCommand, OrderDetail>();
        CreateMap<CreateOrderCommand, Order>();
    }

}
