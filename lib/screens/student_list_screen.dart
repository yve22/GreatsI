class StudentListScreen extends StatelessWidget {
  final List<Student> dummyStudents = [
    Student(id: '1', name: 'yvee noku', email: 'yvee@school.com'),
    Student(id: '2', name: 'Jane rufu', email: 'jane@school.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Students')),
      body: ListView.builder(
        itemCount: dummyStudents.length,
        itemBuilder: (ctx, index) => ListTile(
          leading: CircleAvatar(child: Text('${index + 1}')),
          title: Text(dummyStudents[index].name),
          subtitle: Text(dummyStudents[index].email),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StudentDetailScreen(student: dummyStudents[index]),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AddStudentScreen()),
        ),
      ),
    );
  }
}