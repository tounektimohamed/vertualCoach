import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mohamed/components/language_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key});

  @override
  State<Emergency> createState() => _Emergency();
}

class _Emergency extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translation(context).emgcall,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 5.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'lib/assets/icons/emergency-call.gif',
                color: const Color.fromARGB(255, 241, 250, 251),
                colorBlendMode: BlendMode.darken,
                height: 80.0,
              ),
            ),
            const SizedBox(height: 40),
            _EmergencyButton(
              onPressed: () => _makeEmergencyCall("197"),
              icon: FontAwesomeIcons.truckMedical,
              label: translation(context).ssa,
              number: '197',
            ),
            _EmergencyButton(
              onPressed: () => _makeEmergencyCall("190"),
              icon: FontAwesomeIcons.personFallingBurst,
              label: translation(context).as,
              number: '190',
            ),
            _EmergencyButton(
              onPressed: () => _makeEmergencyCall("197"),
              icon: Icons.local_police_outlined,
              label: translation(context).pi,
              number: '197',
            ),
            _EmergencyButton(
              onPressed: () => _makeEmergencyCall("198"),
              icon: Icons.fire_truck_outlined,
              label: translation(context).fi,
              number: '198',
            ),
            _EmergencyButton(
              onPressed: () => _makeEmergencyCall("193"),
              icon: Icons.info_outline,
              label: translation(context).gv,
              number: '193',
            ),
            _EmergencyButton(
              onPressed: () => _makeEmergencyCall("190"),
              icon: Icons.emergency_outlined,
              label: translation(context).eps,
              number: '190',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makeEmergencyCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      print(translation(context).ctL);
    }
  }
}

class _EmergencyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final String number;

  const _EmergencyButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color.fromARGB(221, 38, 38, 38),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  color: Color.fromARGB(221, 38, 38, 38),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                number,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const Spacer(), // Pushes the content to the left
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.call_outlined,
              color: Color.fromARGB(221, 38, 38, 38),
            ),
          ),
        ],
      ),
    );
  }
}
