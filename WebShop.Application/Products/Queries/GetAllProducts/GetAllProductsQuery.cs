using MediatR;
using WebShop.Application.Common;
using WebShop.Application.Products.Dtos;
using WebShop.Domain.Constants;

namespace WebShop.Application.Products.Queries.GetAllProducts;

public class GetAllProductsQuery : IRequest<PagedResult<ProductDto>>
{
    public string? SearchPhrase { get; set; }
    public int PageNumber { get; set; }
    public int PageSize { get; set; }
    public string? SortBy { get; set; }
    public SortDirection SortDirection { get; set; }
}
