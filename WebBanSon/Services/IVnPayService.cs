using WebBanSon.ViewModel;

namespace WebBanSon.Services
{
    public interface IVnPayService
    {
        string CreatePaymentUrl(HttpContext context, VnPaymentRequestModel model);
        VnPaymentResponseModels PaymentExecute(IQueryCollection collections);
    }
}
