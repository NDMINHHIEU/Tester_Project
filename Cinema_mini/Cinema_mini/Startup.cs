using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Cinema_mini.Startup))]
namespace Cinema_mini
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
