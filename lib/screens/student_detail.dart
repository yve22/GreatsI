class StudentDetailScreen extends StatelessWidget {
  final Student student;

  const StudentDetailScreen({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(student.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: student.photoUrl != null 
                    ? NetworkImage(student.photoUrl!) 
                    : null,
              ),
            ),
            Text('Email: ${student.email}', style: TextStyle(fontSize: 18)),
            // Add more fields
          ],
        ),
      ),
    );
  }
}