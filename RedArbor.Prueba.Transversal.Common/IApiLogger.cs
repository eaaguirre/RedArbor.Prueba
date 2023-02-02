namespace RedArbor.Prueba.Crosscutting.Common
{
    public interface IApiLogger<T>
    {
        void LogInformation(string message, params object[] args);
        void LogIWarningn(string message, params object[] args);
        void LogError(string message, params object[] args);
    }
}
