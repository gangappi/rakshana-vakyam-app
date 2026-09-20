import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const RakshanaVakyamApp());
}

class RakshanaVakyamApp extends StatelessWidget {
  const RakshanaVakyamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'రక్షణ వాక్యం దీపిక',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFF0f0524),
      ),
      home: const HomeScreen(),
    );
  }
}

// హోమ్ పేజీ
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> features = [
      {
        'title': '1. అన్‌లిమిటెడ్ వీడియో క్రియేటర్',
        'subtitle': 'డబ్బింగ్, ఎమోషన్స్, ఫోన్ సేవ్, USB & WhatsApp/YouTube షేర్',
        'icon': Icons.video_library,
        'screen': const UnlimitedVideoScreen(),
      },
      {
        'title': '2. సాంగ్స్ & మ్యూజిక్ మేకర్',
        'subtitle': 'లిరిక్స్ ద్వారా పాటలు & బీజీఎం తయారీ',
        'icon': Icons.audiotrack,
        'screen': const MusicMakerScreen(),
      },
      {
        'title': '3. ప్రాంప్ట్ క్రియేటర్ (మైక్ సపోర్ట్)',
        'subtitle': 'బైబిల్ స్టోరీలు & ప్రాంప్ట్‌ల రచన',
        'icon': Icons.mic,
        'screen': const PromptCreatorScreen(),
      },
      {
        'title': '4. వాట్సాప్ స్టేటస్ ఇమేజ్ మేకర్',
        'subtitle': 'మాటల ద్వారా అందమైన ఇమేజెస్‌ సృష్టి',
        'icon': Icons.image,
        'screen': const StatusImageScreen(),
      },
      {
        'title': '5. AI అవతార్ & వాయిస్ ఛేంజర్ రికార్డర్',
        'subtitle': 'కెమెరా రికార్డింగ్, AI మనిషి, డైరెక్ట్ WhatsApp & YouTube షేర్',
        'icon': Icons.video_camera_front,
        'screen': const AiAvatarRecorderScreen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('రక్షణ వాక్యం దీపిక - హోమ్', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2e0854), Color(0xFF0f0524), Color(0xFF4a154b)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: features.length,
            itemBuilder: (context, index) {
              final item = features[index];
              return Card(
                color: Colors.black.withOpacity(0.6),
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.amber, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Icon(item['icon'], size: 40, color: Colors.amber),
                  title: Text(
                    item['title'],
                    style: const TextStyle(color: Colors.amberAccent, fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      item['subtitle'],
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.amber),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item['screen']),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// 1. అన్‌లిమిటెడ్ వీడియో క్రియేటర్
class UnlimitedVideoScreen extends StatefulWidget {
  const UnlimitedVideoScreen({super.key});

  @override
  State<UnlimitedVideoScreen> createState() => _UnlimitedVideoScreenState();
}

class _UnlimitedVideoScreenState extends State<UnlimitedVideoScreen> {
  String selectedVideoType = 'YouTube Long Video (16:9)';
  bool isVoiceRecording = false;
  String selectedEmotion = 'ఆటోమేటిక్ (Automatic Expression)';
  String uploadedAudioName = 'ఏ ఆడియో ఫైల్ ఎంచుకోలేదు';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('అన్‌లిమిటెడ్ వీడియో క్రియేటర్'), backgroundColor: Colors.amber),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF2e0854), Color(0xFF0f0524)]),
        ),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('వీడియో ఫార్మాట్ ఎంచుకోండి:', style: TextStyle(color: Colors.amber, fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('ఫుల్ లెంత్ (Long)', style: TextStyle(color: Colors.white, fontSize: 12)),
                    value: 'YouTube Long Video (16:9)',
                    groupValue: selectedVideoType,
                    activeColor: Colors.amber,
                    onChanged: (val) => setState(() => selectedVideoType = val!),
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('షార్ట్స్/స్టోరీస్', style: TextStyle(color: Colors.white, fontSize: 12)),
                    value: 'YouTube Shorts / Status (9:16)',
                    groupValue: selectedVideoType,
                    activeColor: Colors.amber,
                    onChanged: (val) => setState(() => selectedVideoType = val!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const TextField(
              maxLines: 3,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'వీడియో స్క్రిప్ట్ లేదా టాపిక్ ఇక్కడ ఇవ్వండి...',
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent, width: 2)),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amberAccent),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ఆడియో ఇన్‌పుట్ & వాయిస్ మేనేజ్‌మెంట్:', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, minimumSize: const Size(double.infinity, 40)),
                    onPressed: () {
                      setState(() {
                        uploadedAudioName = 'my_dubbing_audio.mp3 (అప్లోడ్ చేయబడింది)';
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('ఫోన్ నుండి ఆడియో ఫైల్ విజయవంతంగా అప్లోడ్ చేయబడింది!')),
                      );
                    },
                    icon: const Icon(Icons.upload_file, color: Colors.white),
                    label: const Text('ఫోన్ నుండి ఆడియో అప్లోడ్ చేయి', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 5),
                  Text('ఫైల్: $uploadedAudioName', style: const TextStyle(color: Colors.white70, fontSize: 11)),
                  const Divider(color: Colors.amberAccent, height: 20),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isVoiceRecording ? Colors.red : Colors.amber,
                        ),
                        onPressed: () {
                          setState(() {
                            isVoiceRecording = !isVoiceRecording;
                          });
                          if (!isVoiceRecording) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('డబ్బింగ్ రికార్డ్ అయింది! మగ/ఆడ క్యారెక్టర్ వాయిస్‌కి తగినట్లు మారుతోంది...')),
                            );
                          }
                        },
                        icon: Icon(isVoiceRecording ? Icons.stop : Icons.mic, color: isVoiceRecording ? Colors.white : Colors.black),
                        label: Text(isVoiceRecording ? 'రికార్డింగ్ ఆపు' : 'లైవ్ డబ్బింగ్ రికార్డ్', style: TextStyle(color: isVoiceRecording ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          isVoiceRecording ? 'రికార్డింగ్ జరుగుతోంది...' : 'లైవ్ రికార్డింగ్ సిద్ధం',
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    value: selectedEmotion,
                    dropdownColor: const Color(0xFF2e0854),
                    style: const TextStyle(color: Colors.white),
                    isExpanded: true,
                    items: <String>[
                      'ఆటోమేటిక్ (Automatic Expression)',
                      'సంతోషం (Happy & Joyful)',
                      'బాధ / దుఃఖం (Sad & Emotional)',
                      'కోపం (Angry & Serious)',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedEmotion = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$selectedVideoType, ఆడియో/డబ్బింగ్ మరియు $selectedEmotion ఎమోషన్స్‌తో వీడియో తయారై ఫోన్ గ్యాలరీలోకి సేవ్ అయింది!')),
                );
              },
              icon: const Icon(Icons.play_arrow, color: Colors.black),
              label: Text('$selectedVideoType జనరేట్ & ఫోన్ సేవ్ చేయి', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.amber, thickness: 1.5),
            const SizedBox(height: 10),
            const Text('వీడియో సేవ్ & డైరెక్ట్ షేరింగ్ ఆప్షన్స్:', style: TextStyle(color: Colors.amber, fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, minimumSize: const Size(double.infinity, 45)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('USB కేబుల్ ద్వారా పెన్ డ్రైవ్ లేదా 1TB హార్డ్ డిస్క్‌లోకి వీడియో విజయవంతంగా సేవ్ చేయబడింది!')),
                );
              },
              icon: const Icon(Icons.usb, color: Colors.white),
              label: const Text('USB / పెన్ డ్రైవ్ / 1TB కి సేవ్ చేయి', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: const Size(double.infinity, 45)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('వీడియో ఫైల్ నేరుగా WhatsApp కి షేర్ చేయబడుతోంది!')),
                );
              },
              icon: const Icon(Icons.share, color: Colors.white),
              label: const Text('నేరుగా WhatsApp కి షేర్ చేయి', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, minimumSize: const Size(double.infinity, 45)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('వీడియో ఫైల్ నేరుగా మీ YouTube ఛానెల్‌కి అప్‌లోడ్ అవుతోంది!')),
                );
              },
              icon: const Icon(Icons.video_call, color: Colors.white),
              label: const Text('నేరుగా YouTube కి అప్‌లోడ్ చేయి', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. సాంగ్స్ & మ్యూజిక్ మేకర్
class MusicMakerScreen extends StatelessWidget {
  const MusicMakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('సాంగ్స్ & మ్యూజిక్ మేకర్'), backgroundColor: Colors.amber),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF2e0854), Color(0xFF0f0524)]),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              maxLines: 4,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'పాట లిరిక్స్ లేదా బ్యాక్‌గ్రౌండ్ మ్యూజిక్ మూడ్ వివరించండి...',
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent, width: 2)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('పాట మరియు బ్యాక్‌గ్రౌండ్ మ్యూజిక్ తయారవుతోంది!')),
                );
              },
              icon: const Icon(Icons.music_note, color: Colors.black),
              label: const Text('సంగీతాన్ని సృష్టించు', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. ప్రాంప్ట్ క్రియేటర్
class PromptCreatorScreen extends StatefulWidget {
  const PromptCreatorScreen({super.key});

  @override
  State<PromptCreatorScreen> createState() => _PromptCreatorScreenState();
}

class _PromptCreatorScreenState extends State<PromptCreatorScreen> {
  final TextEditingController _promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ప్రాంప్ట్ క్రియేటర్ (మైక్ సపోర్ట్)'), backgroundColor: Colors.amber),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF2e0854), Color(0xFF0f0524)]),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _promptController,
              maxLines: 5,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'మైక్ నొక్కి మాట్లాడండి లేదా టైప్ చేయండి...',
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent, width: 2)),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, minimumSize: const Size(0, 50)),
                    onPressed: () {
                      setState(() {
                        _promptController.text = "బైబిల్ కథనం కోసం యూట్యూబ్ స్టోరీ ప్రాంప్ట్ తయారు చేయి.";
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('వాయిస్ రికార్డ్ చేయబడింది!')),
                      );
                    },
                    icon: const Icon(Icons.mic, color: Colors.white),
                    label: const Text('మాట్లాడండి', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, minimumSize: const Size(0, 50)),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _promptController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('ప్రాంప్ట్ కాపీ చేయబడింది!')),
                      );
                    },
                    icon: const Icon(Icons.copy, color: Colors.black),
                    label: const Text('కాపీ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 4. వాట్సాప్ స్టేటస్ ఇమేజ్ మేకర్
class StatusImageScreen extends StatefulWidget {
  const StatusImageScreen({super.key});

  @override
  State<StatusImageScreen> createState() => _StatusImageScreenState();
}

class _StatusImageScreenState extends State<StatusImageScreen> {
  final TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('వాట్సాప్ స్టేటస్ ఇమేజ్ మేకర్'), backgroundColor: Colors.amber),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF2e0854), Color(0xFF0f0524)]),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _imageController,
              maxLines: 3,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'వాట్సాప్ స్టేటస్ ఇమేజ్ వివరణ ఇవ్వండి...',
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent, width: 2)),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, minimumSize: const Size(double.infinity, 45)),
              onPressed: () {
                setState(() {
                  _imageController.text = "వాక్యం మరియు ప్రకృతి దృశ్యంతో కూడిన స్టేటస్ ఇమేజ్.";
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('వాయిస్ ఇన్‌పుట్ స్వీకరించబడింది!')),
                );
              },
              icon: const Icon(Icons.mic, color: Colors.white),
              label: const Text('వాయిస్ ద్వారా చెప్పండి', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('వాట్సాప్ స్టేటస్ ఇమేజ్ సృష్టించబడింది!')),
                );
              },
              icon: const Icon(Icons.image, color: Colors.black),
              label: const Text('ఇమేజ్‌ని జనరేట్ చేయి', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

// 5. AI అవతార్ & వాయిస్ ఛేంజర్ రికార్డర్
class AiAvatarRecorderScreen extends StatefulWidget {
  const AiAvatarRecorderScreen({super.key});

  @override
  State<AiAvatarRecorderScreen> createState() => _AiAvatarRecorderScreenState();
}

class _AiAvatarRecorderScreenState extends State<AiAvatarRecorderScreen> {
  bool isRecording = false;
  bool enableAiHumanMorph = true; 
  String selectedVoiceStyle = 'బైబిల్ ప్రవచనం (Divine Voice)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI అవతార్ & వాయిస్ ఛేంజర్ రికార్డర్'), backgroundColor: Colors.amber),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF2e0854), Color(0xFF0f0524)]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.amber, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.videocam,
                      size: 50,
                      color: Colors.amber,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isRecording ? 'రికార్డింగ్ జరుగుతోంది (AI మనిషిగా మారుతోంది...)' : 'ఫ్రంట్ కెమెరా రికార్డింగ్ సిద్ధంగా ఉంది',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amberAccent),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('వాక్యం & AI అవతార్ సెట్టింగ్స్:', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            'ఆటోమేటిక్ AI మనిషి రూపంలోకి మార్చు',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                        Switch(
                          value: enableAiHumanMorph,
                          activeColor: Colors.amber,
                          onChanged: (bool val) {
                            setState(() {
                              enableAiHumanMorph = val;
                            });
                          },
                        ),
                      ],
                    ),
                    const Text('రికార్డింగ్ సమయంలో ముఖం స్పష్టమైన AI క్యారెక్టర్‌గా మారుతుంది', style: TextStyle(color: Colors.white54, fontSize: 11)),
                    const Divider(color: Colors.amberAccent, height: 15),
                    const Text('వాయిస్ ఛేంజర్ (వాయిస్ మారడానికి):', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 5),
                    DropdownButton<String>(
                      value: selectedVoiceStyle,
                      dropdownColor: const Color(0xFF2e0854),
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                      isExpanded: true,
                      items: <String>[
                        'బైబిల్ ప్రవచనం (Divine Voice)',
                        'మగ గంభీరమైన వాయిస్ (Deep Male)',
                        'మృదువైన వాయిస్ (Soft & Clear)',
                        'స్టాండర్డ్ వాయిస్ (Original)',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedVoiceStyle = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  minimumSize: const Size(double.infinity, 45),
                ),
                onPressed: () {
                  setState(() {
                    isRecording = !isRecording;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(isRecording ? 'రికార్డింగ్ మొదలైంది! AI మనిషి మరియు $selectedVoiceStyle వర్తించబడుతున్నాయి...' : 'రికార్డింగ్ ఆపబడింది & సేవ్ అయింది!')),
                  );
                },
                icon: Icon(isRecording ? Icons.stop : Icons.play_arrow, color: Colors.black),
                label: Text(
                  isRecording ? 'రికార్డింగ్ ఆపు & ప్రాసెస్ చేయి' : 'వీడియో రికార్డింగ్ ప్రారంభించు',
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const SizedBox(height: 15),
              const Divider(color: Colors.amber, thickness: 1.5),
              const SizedBox(height: 8),
              const Text('డైరెక్ట్ షేరింగ్ ఆప్షన్స్:', style: TextStyle(color: Colors.amber, fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: const Size(double.infinity, 42)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('వీడియో ఫైల్ నేరుగా WhatsApp కి షేర్ చేయబడుతోంది!')),
                  );
                },
                icon: const Icon(Icons.share, color: Colors.white),
                label: const Text('నేరుగా WhatsApp కి షేర్ చేయి', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, minimumSize: const Size(double.infinity, 42)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('వీడియో ఫైల్ నేరుగా YouTube కి అప్‌లోడ్ అవుతోంది!')),
                  );
                },
                icon: const Icon(Icons.video_call, color: Colors.white),
                label: const Text('నేరుగా YouTube కి అప్‌లోడ్ చేయి', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
