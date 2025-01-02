import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wesbeng/helpers/sp_helper.dart';
import 'package:wesbeng/providers/user_provider.dart';
import 'package:wesbeng/screens/auth/login_screen.dart';
import 'package:wesbeng/services/api_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApiService apiService = ApiService();

  Future<void> _logout() async {
    final response = await apiService.post('logout', {});
    print(response.statusCode);
    if (response.statusCode == 200) {
      await SharedPreferencesHelper.clearAccessToken();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (_) => true,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An error occurred"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    if (userProvider.isFetching) {
      return const Center(child: CircularProgressIndicator());
    }

    final user = userProvider.user;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.name ?? 'Uknown',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            user?.email ?? '@emma.phillips',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        HeroiconsSolid.pencil,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      Text(user?.phone ?? '(581)-307-6902'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '\$140.00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Wallet'),
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Text(
                        '12',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Orders'),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    // Settings functionality
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    'Log out',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    _logout();
                  },
                ),
              ],
            ),

            // Logout Button
          ],
        ),
      ),
    );
  }
}
