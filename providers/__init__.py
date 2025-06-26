"""Model provider abstractions for supporting multiple AI providers."""

from .base import ModelCapabilities, ModelProvider, ModelResponse
# from .gemini import GeminiModelProvider  # Gemini now via OpenRouter
from .openai_compatible import OpenAICompatibleProvider
from .openai_provider import OpenAIModelProvider
from .openrouter import OpenRouterProvider
from .registry import ModelProviderRegistry

__all__ = [
    "ModelProvider",
    "ModelResponse",
    "ModelCapabilities",
    "ModelProviderRegistry",
    # "GeminiModelProvider",  # Gemini now via OpenRouter
    "OpenAIModelProvider",
    "OpenAICompatibleProvider",
    "OpenRouterProvider",
]
