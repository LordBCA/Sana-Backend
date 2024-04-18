using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
using WebShop.Domain.Constants;
using WebShop.Domain.Entities;
using WebShop.Domain.Repositories;
using WebShop.Infrastructure.Persistence;

namespace WebShop.Infrastructure.Repositories;

internal class ProductRepository(WebShopDbContext dbContext) 
    : IProductRepository
{ 
    public async Task<IEnumerable<Product>> GetAllAsync()
    {
        var products = await dbContext.Products.ToListAsync();
        return products;
    }

    public async Task<(IEnumerable<Product>, int)> GetAllMatchingAsync(string? searchPhrase,
        int pageSize,
        int pageNumber,
        string? sortBy,
        SortDirection sortDirection)
    {
        var searchPhraseLower = searchPhrase?.ToLower();

        var baseQuery = dbContext
            .Products
            .Where(r => searchPhraseLower == null || (r.Title.ToLower().Contains(searchPhraseLower)
                                                   || r.Description.ToLower().Contains(searchPhraseLower)));

        var totalCount = await baseQuery.CountAsync();

        if (sortBy != null)
        {
            var columnsSelector = new Dictionary<string, Expression<Func<Product, object>>>
            {
                { nameof(Product.Code), r => r.Code },
                { nameof(Product.Description), r => r.Description }                
            };

            var selectedColumn = columnsSelector[sortBy];

            baseQuery = sortDirection == SortDirection.Ascending
                ? baseQuery.OrderBy(selectedColumn)
                : baseQuery.OrderByDescending(selectedColumn);
        }

        var restaurants = await baseQuery
            .Skip(pageSize * (pageNumber - 1))
            .Take(pageSize)
            .ToListAsync();

        return (restaurants, totalCount);
    }
}
