class StudentListScreen extends StatelessWidget {
  final StudentRepository _repo = StudentRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
      body: StreamBuilder<List<Student>>(
        stream: _repo.getStudents(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          if (!snapshot.hasData) return const CircularProgressIndicator();

          final students = snapshot.data!;
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (ctx, index) => ListTile(
              title: Text(students[index].name),
              subtitle: Text(students[index].email),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StudentDetailScreen(student: students[index]),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _repo.deleteStudent(students[index].id!),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AddStudentScreen()),
        ),
      ),
    );
  }
}