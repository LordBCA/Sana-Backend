using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using WebShop.Domain.Repositories;
using WebShop.Infrastructure.Persistence;
using WebShop.Infrastructure.Repositories;
using WebShop.Infrastructure.Seeders;

namespace WebShop.Infrastructure.Extensions;

public static class ServiceCollectionExtensions
{
    public static void AddInfrastructure(this IServiceCollection services, IConfiguration configuration) 
    {
        var connectionString = configuration.GetConnectionString("WebShopDb");
        services.AddDbContext<WebShopDbContext>(options => options.UseSqlServer(connectionString));

        services.AddScoped<IWebShopSeeder, WebShopSeeder>();
        services.AddScoped<IProductRepository, ProductRepository>();
        services.AddScoped<IOrderRepository, OrderRepository>();
    }
}
