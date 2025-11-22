import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB( 21, 56, 21, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with title and notification icons
          
          Row(
            children: [
              // Gradient Patungan text
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFAA2F6A), 
                    Color(0xFFD64E56), 
                    Color(0xFFEEBE4B), 
                  ],
                ).createShader(bounds),
                child: Text(
                  'Patungan',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.white, 
                  ),
                ),
              ),
              Spacer(),
              // Mail icon
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Color(0xFF19395B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.mail_outline, color: Colors.white, size: 24),
              ),
              SizedBox(width: 8),
              // Notification icon
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Color(0xFF19395B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.notifications_outlined, color: Colors.white, size: 24),
              ),
            ],
          ),
          
          SizedBox(height: 16),
          
          // Balance section
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet,
                color: Colors.black87,
                size: 24
              ),
              SizedBox(width: 8),
              Text(
                'Rp18.000',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 12),
          
          // Top Up Button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFAA2F6A), // Pink
                  Color(0xFFD64E56), // Light Pink
                  Color(0xFFEEBE4B), // Purple
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 14,
                ),
                SizedBox(width: 6),
                Text(
                  'Top Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}