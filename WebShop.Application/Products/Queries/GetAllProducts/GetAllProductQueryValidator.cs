using FluentValidation;

namespace WebShop.Application.Products.Queries.GetAllProducts;

public class GetAllProductQueryValidator : AbstractValidator<GetAllProductsQuery>
{
    private int[] allowPageSizes = [5, 10, 15, 30];

    public GetAllProductQueryValidator()
    {
        RuleFor(r => r.PageNumber)
             .GreaterThanOrEqualTo(1);

        RuleFor(r => r.PageSize)
            .Must(value => allowPageSizes.Contains(value))
            .WithMessage($"Page size must be in [{string.Join(",", allowPageSizes)}]");
    }
}
