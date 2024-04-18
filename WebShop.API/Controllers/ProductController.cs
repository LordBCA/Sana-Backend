using MediatR;
using Microsoft.AspNetCore.Mvc;
using WebShop.Application.Products.Dtos;
using WebShop.Application.Products.Queries.GetAllProducts;

namespace WebShop.API.Controllers;

[ApiController]
[Route("api/products")]
public class ProductController(IMediator mediator) : ControllerBase
{  
    [HttpGet]
    public async Task<ActionResult<IEnumerable<ProductDto>>> GetAll([FromQuery] GetAllProductsQuery query)
    {
        var products = await mediator.Send(query);
        return Ok(products);
    }
}
