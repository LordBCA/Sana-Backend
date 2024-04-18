using AutoMapper;
using MediatR;
using Microsoft.Extensions.Logging;
using WebShop.Application.Common;
using WebShop.Application.Products.Dtos;
using WebShop.Domain.Repositories;

namespace WebShop.Application.Products.Queries.GetAllProducts;

public class GetAllProductsQueryHandler(IProductRepository repository,
    ILogger<GetAllProductsQueryHandler> logger,
    IMapper mapper) : IRequestHandler<GetAllProductsQuery, PagedResult<ProductDto>>
{
    public async Task<PagedResult<ProductDto>> Handle(GetAllProductsQuery request, CancellationToken cancellation)
    {
        logger.LogInformation("Getting all products");

        var (products, totalCount) = await repository.GetAllMatchingAsync(request.SearchPhrase,
            request.PageSize,
            request.PageNumber,
            request.SortBy,
            request.SortDirection);

        var productsDtos = mapper.Map<IEnumerable<ProductDto>>(products);

        var result = new PagedResult<ProductDto>(productsDtos, totalCount, request.PageSize, request.PageNumber);
        return result;        
    }
}
