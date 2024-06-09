// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../AdditionalFiles/constants.dart';

import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final Gemini gemini = Gemini.instance;
  final stt.SpeechToText _speech = stt.SpeechToText();

  List<ChatMessage> messages = [];
  bool isLoading = false;

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "WellNest",
    profileImage: "",
  );

  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    await _speech.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "MedX Ai",
        ),
        automaticallyImplyLeading: false,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      inputOptions: InputOptions(trailing: [
        IconButton(
          onPressed: _sendMediaMessage,
          icon: const Icon(
            Icons.image,
          ),
        ),
        IconButton(
          onPressed: _listen,
          icon: Icon(
            _isListening ? Icons.mic : Icons.mic_none,
          ),
        )
      ]),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }

      // System instruction to guide the response
      String systemInstruction = '''
      You are an advanced virtual medical assistant bot named MedX using the Gemini API. MedX will offer personalized health assistance, 
      including symptom assessment, condition information, medication guidance, appointment scheduling, and emergency support. 
      Utilizing natural language processing and a conversational interface, users can interact with MedX through text or voice commands. 
      With continuous learning capabilities and customization options, MedX aims to revolutionize access to reliable medical information
       and support for users
            ''';

      gemini
          .streamGenerateContent(
        '$systemInstruction\n\nUser question: $question',
        images: images,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                "",
                (previous, current) => "$previous ${current.text}",
              ) ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
              isLoading = false;
            },
          );
        } else {
          String response = event.content?.parts?.fold(
                "",
                (previous, current) => "$previous ${current.text}",
              ) ??
              "";
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            messages = [message, ...messages];
            isLoading = false;
          });
        }
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text:
            "Analyze the image and identify the root cause of any abnormal readings. Specify the associated risks, suggest measures to avoid these risks, recommend appropriate food habits, and outline necessary physical activities.",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      _sendMessage(chatMessage);
    }
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => setState(() => _isListening = val == 'listening'),
        onError: (val) => setState(() => _isListening = false),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _sendVoiceMessage();
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _sendVoiceMessage() {
    if (_text.isNotEmpty) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: _text,
      );
      _sendMessage(chatMessage);
      _text = '';
    }
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }
}

/*

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Medical Support",
              style: SubHeadingTextStyle,
            ),
            Text(
              "(in collaboration with TICC)",
              style: AppbarTextStyle,
            ),
            Text(
              "College life is a time of change, growth, and transition. Attending college is an exciting and dynamic experience. It can also be a time of change as you grow and develop your identity. Attending college also presents its challenges. Students may have to deal with much stress due to numerous reasons, including moving away from home for the very first time, financial stress, academic stress, physical or mental illness (e.g., depression, anxiety), end of important relationships, illness, or death of a loved one. Sometimes, coping with one or more of these stresses can be overwhelming. Thapar Institute Counselling Cell, hereinafter referred to as TICC, has a duty to respect and support the rights, needs, and privacy of students experiencing mental health difficulties and provides a supportive environment that assists students with mental health difficulties to realize their full potential and to fully complete their course.",
              style: TextFormTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
*/
