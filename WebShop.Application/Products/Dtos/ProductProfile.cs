using AutoMapper;
using WebShop.Domain.Entities;

namespace WebShop.Application.Products.Dtos;

public class ProductProfile : Profile
{
    public ProductProfile()
    {
        CreateMap<Product, ProductDto>();
    }

}
