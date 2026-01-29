# pip install -U openai-whisper

import whisper

model = whisper.load_model("turbo")
result = model.transcribe("audio_file.mp3")
print(result["text"])
