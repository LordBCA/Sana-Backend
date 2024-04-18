
namespace WebShop.Application.Products.Dtos;

public class ProductDto
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Title { get; set; } = null!;

    public string Description { get; set; } = null!;

    public decimal Price { get; set; }

    public int Stock { get; set; }

    public string Image { get; set; } = null!;
}
