import 'package:flutter/material.dart';
import 'package:shoppe/core/utils/colors.dart';
import 'package:shoppe/core/constants/image_constants.dart';

class MessageriesScreen extends StatefulWidget {
  const MessageriesScreen({super.key});

  @override
  State<MessageriesScreen> createState() => _MessageriesScreenState();
}

class _MessageriesScreenState extends State<MessageriesScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = [
    Message(
      sender: 'Maggy Lee',
      text: 'Bonjour, comment puis-je vous aider aujourd\'hui ?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      isUser: false,
      avatar: ImageConstants.avatargirl,
    ),
  ];
  bool _isTyping = false;
  
  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;
    
    final userMessage = Message(
      sender: 'Moi',
      text: _messageController.text.trim(),
      timestamp: DateTime.now(),
      isUser: true,
    );
    
    setState(() {
      _messages.add(userMessage);
      _messageController.clear();
      _isTyping = true;
    });
    
    // Scroll to bottom after adding message
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    
    // Simulate typing response after delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Simulate response
    final botMessage = Message(
      sender: 'Maggy Lee',
      text: _getResponse(userMessage.text),
      timestamp: DateTime.now(),
      isUser: false,
      avatar: ImageConstants.avatargirl,
    );
    
    if (mounted) {
      setState(() {
        _isTyping = false;
        _messages.add(botMessage);
      });
      
      // Scroll to bottom after response
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
  }
  
  String _getResponse(String message) {
    message = message.toLowerCase();
    
    if (message.contains('bonjour') || message.contains('salut') || message.contains('hello')) {
      return 'Bonjour ! Comment puis-je vous aider aujourd\'hui ?';
    } else if (message.contains('commande') && (message.contains('où') || message.contains('statut') || message.contains('status'))) {
      return 'J\'ai vérifié le statut de votre commande. Elle est en cours d\'expédition et devrait arriver dans 2 jours.';
    } else if (message.contains('remboursement') || message.contains('retour')) {
      return 'Pour effectuer un retour, rendez-vous dans la section "Mes commandes", sélectionnez votre commande et cliquez sur "Retourner". Nous vous enverrons une étiquette de retour par email.';
    } else if (message.contains('merci')) {
      return 'Avec plaisir ! Y a-t-il autre chose dont vous avez besoin ?';
    } else if (message.contains('problème') || message.contains('aide')) {
      return 'Je suis désolé pour ce problème. Pouvez-vous me donner plus de détails pour que je puisse mieux vous aider ?';
    } else if (message.contains('promotion') || message.contains('réduction') || message.contains('code promo')) {
      return 'Nous avons actuellement une promotion de 15% avec le code "SHOPPE15". Valable jusqu\'à la fin du mois !';
    } else {
      return 'Merci pour votre message. Je vais vous aider à résoudre cela. Pouvez-vous me donner plus de détails ?';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(ImageConstants.avatargirl),
              radius: 18,
              onBackgroundImageError: (_, __) {},
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maggy Lee',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Service Client',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: AppColors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
          ),
          if (_isTyping)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(ImageConstants.avatargirl),
                    radius: 15,
                    onBackgroundImageError: (_, __) {},
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.person, color: Colors.white, size: 15),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Maggy écrit...',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: message.isUser 
            ? MainAxisAlignment.end 
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            CircleAvatar(
              backgroundImage: message.avatar != null ? AssetImage(message.avatar!) : null,
              radius: 16,
              onBackgroundImageError: (_, __) {},
              backgroundColor: Colors.grey[300],
              child: message.avatar == null 
                  ? const Icon(Icons.person, color: Colors.white, size: 16) 
                  : null,
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: message.isUser 
                    ? AppColors.blue 
                    : Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!message.isUser)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        message.sender,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  Text(
                    message.text,
                    style: TextStyle(
                      color: message.isUser ? Colors.white : Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _formatTime(message.timestamp),
                    style: TextStyle(
                      fontSize: 10,
                      color: message.isUser ? Colors.white70 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (message.isUser) const SizedBox(width: 8),
        ],
      ),
    );
  }
  
  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.attach_file, color: Colors.grey),
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Écrivez un message...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                textCapitalization: TextCapitalization.sentences,
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
            const SizedBox(width: 8),
            FloatingActionButton(
              onPressed: _sendMessage,
              backgroundColor: AppColors.blue,
              elevation: 0,
              mini: true,
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final DateTime timestamp;
  final bool isUser;
  final String? avatar;

  Message({
    required this.sender,
    required this.text,
    required this.timestamp,
    required this.isUser,
    this.avatar,
  });
}