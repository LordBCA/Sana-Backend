namespace WebShop.Domain.Entities;

public class ProductCategory
{
    public int Id { get; set; }

    public string Description { get; set; } = null!;

    public virtual ICollection<ProductXrefProductCategory> ProductXrefProductCategories { get; set; } = new List<ProductXrefProductCategory>();
}
