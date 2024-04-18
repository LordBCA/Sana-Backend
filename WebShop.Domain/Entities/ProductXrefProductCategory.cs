namespace WebShop.Domain.Entities;

public class ProductXrefProductCategory
{
    public int Id { get; set; }

    public int ProductId { get; set; }

    public int ProductCategoryId { get; set; }

    public virtual Product Product { get; set; } = null!;

    public virtual ProductCategory ProductCategory { get; set; } = null!;
}
