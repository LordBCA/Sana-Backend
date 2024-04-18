namespace WebShop.Domain.Entities;

public class Product
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Title { get; set; } = null!;

    public string Description { get; set; } = null!;

    public decimal Price { get; set; }

    public int Stock { get; set; }
    public string Image { get; set; } = null!;

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

    public virtual ICollection<ProductXrefProductCategory> ProductXrefProductCategories { get; set; } = new List<ProductXrefProductCategory>();
}
