import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String email;
  final String name;

  const ProfileScreen({super.key, required this.email, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=3',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.orange,
                    child: const Icon(
                      Icons.camera_alt,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              email,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(name, style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

           
            const SizedBox(height: 24),
            buildSectionTitle('Profile'),
            buildMenuItem(Icons.person, 'Personal Data'),
            buildMenuItem(Icons.settings, 'Settings'),
            buildMenuItem(Icons.credit_card, 'Extra Card'),
            const SizedBox(height: 16),
            buildSectionTitle('Support'),
            buildMenuItem(Icons.help_outline, 'Help Center'),
            buildMenuItem(Icons.delete_outline, 'Request Account Deletion'),
            buildMenuItem(Icons.person_add_alt_1, 'Add another account'),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: OutlinedButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.red),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}


 // Padding(

            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Card(
            //     elevation: 2,
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            //     child: Padding(
            //       padding: const EdgeInsets.all(16),
            //       child: Column(
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               const Text('My Orders', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            //               Row(
            //                 children: [
            //                   TextButton(
            //                     onPressed: () {},
            //                     child: const Text('See All'),
            //                   ),
            //                   Container(
            //                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //                     decoration: BoxDecoration(
            //                       color: Colors.orange,
            //                       borderRadius: BorderRadius.circular(12),
            //                     ),
            //                     child: const Text(
            //                       'In Delivery',
            //                       style: TextStyle(color: Colors.white, fontSize: 12),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //           const SizedBox(height: 12),
            //           Row(
            //             children: [
            //               ClipRRect(
            //                 borderRadius: BorderRadius.circular(8),
            //                 child: Image.network(
            //                   'https://via.placeholder.com/60',
            //                   width: 60,
            //                   height: 60,
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //               const SizedBox(width: 12),
            //               Expanded(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: const [
            //                     Text('Burger With Meat', style: TextStyle(fontWeight: FontWeight.bold)),
            //                     Text('\$12,230', style: TextStyle(color: Colors.orange, fontSize: 16)),
            //                   ],
            //                 ),
            //               ),
            //               const Text('14 items', style: TextStyle(color: Colors.grey)),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),