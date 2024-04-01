part of 'home_view.dart';

class HomeUserGreeting extends StatelessWidget{
   const HomeUserGreeting({
    super.key,
    required this.username,
  });
 
 final String username;
 
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Hi, $username'),
      const Text('What are you looking for today ?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
     ],),
   );
  }
}