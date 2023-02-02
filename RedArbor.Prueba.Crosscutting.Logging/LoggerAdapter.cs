using Microsoft.Extensions.Logging;
using RedArbor.Prueba.Crosscutting.Common;
using WatchDog;

namespace RedArbor.Prueba.Crosscutting.Logging
{
    public class LoggerAdapter<T> : IApiLogger<T>
    {
        private readonly ILogger<T> _logger;
        public LoggerAdapter(ILoggerFactory loggerFactory)
        {
            _logger = loggerFactory.CreateLogger<T>();

        }
        public void LogInformation(string message, params object[] args)
        {
            _logger.LogInformation(message, args);
           WatchLogger.Log(message);
        }

        public void LogIWarningn(string message, params object[] args)
        {
            _logger.LogWarning(message, args);
            WatchLogger.Log(message);
        }

        public void LogError(string message, params object[] args)
        {
            _logger.LogError(message, args);
            WatchLogger.Log(message);
        }

    }
}