using BTLWEB.Data;
using BTLWEB.Models;
using Microsoft.AspNetCore.Mvc;

namespace BTLWEB.ViewComponents
{
    public class LoaiPhimViewComponent : ViewComponent
    {
        private readonly RapPhimContext _context;
        List<LoaiPhim> loaiphims;
        public LoaiPhimViewComponent(RapPhimContext context)
        {
            _context = context;
            loaiphims = _context.LoaiPhims.ToList();
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            
            return View("RenderLoaiPhim", loaiphims);
        }
    }
}
