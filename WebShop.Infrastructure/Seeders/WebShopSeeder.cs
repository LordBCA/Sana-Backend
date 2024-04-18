using WebShop.Domain.Entities;
using WebShop.Infrastructure.Persistence;

namespace WebShop.Infrastructure.Seeders;

internal class WebShopSeeder(WebShopDbContext dbContext) : IWebShopSeeder
{
    public async Task Seed()
    {
        if (await dbContext.Database.CanConnectAsync())
        {
            if (!dbContext.Products.Any())
            {
                var categories = GetCategories();
                var products = GetProducts();
                var customers = GetCustomers();

                dbContext.ProductCategories.AddRange(categories);
                dbContext.Products.AddRange(products);
                dbContext.Customers.AddRange(customers);
                
                await dbContext.SaveChangesAsync();
            }
        }
    }

    private IEnumerable<Customer> GetCustomers()
    {
        List<Customer> customers = [
            new (){
                FirstName = "Diego",
                LastName = "Bocanegra",
                Email = "diego_bocanegra@hotmail.com",
                PhoneNumber = "+57 3117572710"
            },
            new (){
                FirstName = "Myriam",
                LastName = "Ramirez",
                Email = "myriam_ramirez@gmail.com",
                PhoneNumber = "+57 3217994912"
            }
            ];

        return customers;
    }

    private IEnumerable<Product> GetProducts()
    {
        List<Product> products = [
            new ()
            {
                Code= "CSRM750",
                Title= "CORSAIR 750W 80 Plus Gold",
                Description= "CORSAIR 750W 80 Plus Gold Fully Modular ATX Power Supply, White - RM Series",
                Price= 109.99m,
                Stock= 10,
                Image = "https://m.media-amazon.com/images/I/61NrhNxWPLL.__AC_SY300_SX300_QL70_FMwebp_.jpg"
            },
            new ()
            {
                Code= "XR80L2024",
                Title= "BRAVIA XR A80L OLED 4K HDR ",
                Description= "Sony 55 Inch BRAVIA XR A80L OLED 4K HDR Google TV SU-WL855 Ultra Slim Wall-Mount Bracket",
                Price= 949.99m,
                Stock= 6,
                Image = "https://m.media-amazon.com/images/I/91W-FzCF3UL.__AC_SX300_SY300_QL70_FMwebp_.jpg"
            },
            new ()
            {
                Code= "PS5US1124",
                Title= "PlayStation 5 Slim",
                Description= "PlayStation 5 Digital Edition – Marvel’s Spider-Man 2 Bundle (Slim)",
                Price= 399.99m,
                Stock= 15,
                Image = "https://m.media-amazon.com/images/I/71rWPpdhwgL._SL1500_.jpg"
            },
            new ()
            {
                Code= "MSFTOF2023",
                Title= "OfficeSuite Home & Business",
                Description= "OfficeSuite Home & Business - Lifetime License - Documents, Sheets, Slides, PDF, Mail & Calendar for Windows",
                Price= 79.99m,
                Stock= 4,
                Image = "https://m.media-amazon.com/images/I/61CYCXmy0pL._AC_UY327_FMwebp_QL65_.jpg"
            },
            new ()
            {
                Code= "AMZDOT2022",
                Title= "Echo Dot (5th Gen, 2022)",
                Description= "Echo Dot (5th Gen, 2022 release) | International Version with US Power Adaptor | Smart speaker with Alexa | Charcoal",
                Price= 49.99m,
                Stock= 25,
                Image = "https://m.media-amazon.com/images/I/71xoR4A6q-L._AC_UY327_FMwebp_QL65_.jpg"
            },
            new ()
            {
                Code= "APP15PRO512",
                Title= "Apple iPhone 15 Pro (512 GB)",
                Description= "Apple iPhone 15 Pro (512 GB) - Natural Titanium | [Locked] | Boost Infinite plan required starting at $60/mo.",
                Price= 899.99m,
                Stock= 2,
                Image = "https://m.media-amazon.com/images/I/81ENMk6KsJL._AC_UY327_FMwebp_QL65_.jpg"
            },
            new ()
            {
                Code= "APPPOD2GN",
                Title= "Apple AirPods (2nd Generation)",
                Description= "Apple AirPods (2nd Generation) Wireless Ear Buds, Bluetooth Headphones with Lightning Charging Case Included",
                Price= 149.99m,
                Stock= 8,
                Image = "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_UY327_FMwebp_QL65_.jpg"
            },
            new ()
            {
                Code= "PMAFERRRED",
                Title= "PUMA Scuderia Ferrari - Shield",
                Description= "PUMA Scuderia Ferrari - Shield Hoody - Men",
                Price= 99.99m,
                Stock= 6,
                Image = "https://m.media-amazon.com/images/I/71meFqc5B9L._AC_SX679_.jpg"
            },
            new ()
            {
                Code= "SKYI5RTX4060",
                Title= "Skytech Gaming Nebula Gaming PC Desktop",
                Description= "Skytech Gaming Nebula Gaming PC Desktop – Intel Core i5 13400F 2.5 GHz, NVIDIA RTX 4060, 1TB NVME SSD, 16GB DDR4 RAM 3200",
                Price= 1069.99m,
                Stock= 1,
                Image = "https://m.media-amazon.com/images/I/61INtCQzv2L._AC_UY327_FMwebp_QL65_.jpg"
            },
            new ()
            {
                Code= "SGT8TBUSB3",
                Title= "Seagate Expansion 8TB External Hard Drive",
                Description= "Seagate Expansion 8TB External Hard Drive HDD - USB 3.0, with Rescue Data Recovery Services (STKP8000400)",
                Price= 114.99m,
                Stock= 10,
                Image = "https://m.media-amazon.com/images/I/61NF1FZUYUL._AC_UY327_FMwebp_QL65_.jpg"
            },
            new () {
                Code= "DOG4STND2",
                Title= "Elevated Dog Bowls, 4 Height Adjustable Raised Dog Bowl Stand",
                Description= "Elevated Dog Bowls, 4 Height Adjustable Raised Dog Bowl Stand with 2 Thick 50oz Stainless Steel Dog Food Bowls",
                Price= 19.99m,
                Stock= 3,
                Image = "https://m.media-amazon.com/images/I/71EeQMpFkHL._AC_UL480_FMwebp_QL65_.jpg"
            },
            new ()
            {
                Code= "BED24ORTH24",
                Title= "Bed Orthopedic for Dogs",
                Description= "Bedsure Orthopedic Bed for Medium Dogs - Waterproof Dog Sofa Bed Medium, Supportive Foam Pet Couch with Removable Washable Cover, Waterproof, Grey",
                Price= 39.99m,
                Stock= 7,
                Image = "https://m.media-amazon.com/images/I/61djdF9UnnL._AC_UL480_FMwebp_QL65_.jpg"
            }
            ];
        return products;
    }

    private IEnumerable<ProductCategory> GetCategories()
    {
        List<ProductCategory> products = [
            new () {
                Description = "Electronics"
            },
            new () {
                Description = "Computers"
            },
            new () {
                Description = "Smart Home"
            },
            new () {
                Description = "Movies & Television"
            },
            new () {
                Description = "Pet Supplies"
            },
            new () {
                Description = "Software"
            },
            new () {
                Description = "Video Games"
            },
            new () {
                Description = "Clothes"
            }
            ];

        return products;
    }


}
