using MediatR;
using Microsoft.AspNetCore.Mvc;
using WebShop.Application.Orders.Commands.CreateOder;
using WebShop.Application.Orders.Dtos;
using WebShop.Application.Orders.Queries.GetOrderById;

namespace WebShop.API.Controllers;

[ApiController]
[Route("api/orders")]
public class OrderController(IMediator mediator) : ControllerBase
{
    [HttpGet("{id}")]    
    public async Task<ActionResult<OrderDto?>> GetById([FromRoute] int id)
    {
        var order = await mediator.Send(new GetOrderByIdQuery(id));
        return Ok(order);
    }

    [HttpPost]
    public async Task<IActionResult> CreateOrder(CreateOrderCommand createOrderDto)
    {        
        int id = await mediator.Send(createOrderDto);
        //return CreatedAtAction(nameof(GetById), new { id}, null);
        return CreatedAtAction(nameof(CreateOrder), new { id = id }, null);        
    }
}
