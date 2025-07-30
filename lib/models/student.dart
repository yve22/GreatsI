
Map<String, dynamic> toFirestore() {
  return {
    'name': name,
    'email': email,
    'photoUrl': photoUrl,
    'createdAt': FieldValue.serverTimestamp(),
  };
}