import 'package:e_commerece_app/core/cache/shared_prefs_utils.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({Key? key}) : super(key: key);

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {

  Future<Map<String, String>> _getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      'name': prefs.getString('user_name') ?? 'لم يتم تسجيل اسم',
      'email': prefs.getString('user_email') ?? 'لم يتم تسجيل إيميل',
      'password': '***********',
      'phone': prefs.getString('user_phone') ?? 'لم يتم تسجيل رقم هاتف',
      'address': prefs.getString('user_address') ?? '6th October, street 11....',
    };
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF004182);
    const Color textColor = Color(0xFF063970);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
      
        body: FutureBuilder<Map<String, String>>(
          future: _getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            }
      
            // جلب البيانات الحقيقية المسترجعة
            final data = snapshot.data ?? {};
            String name = data['name']!;
            String email = data['email']!;
            String password = data['password']!;
            String phone = data['phone']!;
            String address = data['address']!;
      
            // استخراج الاسم الأول فقط للترحيب
            String firstName = name.split(' ').first;
      
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الترحيب باسمك الحقيقي المخزن
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome, $firstName',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),

                      IconButton(onPressed: (){
                        SharedPrefsUtils.removeData(key: 'token');
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.loginRoute,
                              (route) => false,
                        );
                      },
                          icon: Icon(Icons.logout , color: AppColors.primaryColor,)
                      ),

                    ],
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // عرض الحقول بتصميم Figma المتناسق مع لقطة الشاشة
                  _buildProfileField(
                    label: 'Your full name',
                    value: name,
                  ),
                  _buildProfileField(
                    label: 'Your E-mail',
                    value: email,
                  ),
                  _buildProfileField(
                    label: 'Your password',
                    value: password,
                  ),
                  _buildProfileField(
                    label: 'Your mobile number',
                    value: phone,
                  ),
                  _buildProfileField(
                    label: 'Your Address',
                    value: address,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // الـ Widget المسؤول عن شكل الحقول والـ Border الدائري وأيقونة التعديل
  Widget _buildProfileField({required String label, required String value}) {
    const Color primaryColor = Color(0xFF004182);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: primaryColor.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                    ),
                  ),
                ),
                const Icon(
                  Icons.edit_outlined,
                  color: primaryColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}