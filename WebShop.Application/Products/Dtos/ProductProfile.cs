using AutoMapper;
using WebShop.Domain.Entities;

namespace WebShop.Application.Products.Dtos;

public class OrderProfile : Profile
{
    public OrderProfile()
    {
        CreateMap<Product, ProductDto>();
    }

}
