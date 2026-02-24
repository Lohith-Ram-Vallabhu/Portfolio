class Experience {
  final String role;
  final String company;
  final String duration;
  final String description;

  const Experience({
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
  });
}

class ExperienceConfig {
  static const List<Experience> experiences = [
    Experience(
      role: 'Full Stack Developer',
      company: 'DMT Soft',
      duration: 'Oct 2023 – Dec 2025',
      description:
          '• Designed and developed end-to-end full-stack applications using Spring Boot for backend services and React / Flutter for frontend and mobile clients.\n'
          '• Built secure REST APIs with JWT-based authentication and role-based authorization for admin, staff, and end users.\n'
          '• Implemented billing modules, appointment booking systems, and order management workflows across multiple production applications.\n'
          '• Developed and maintained multi-role platforms including Admin panels, Teacher apps, Student apps, and HRMS systems.\n'
          '• Worked on real production deployments, bug fixes, and performance improvements.\n'
          '• Collaborated with cross-functional teams using Git-based version control and Agile workflows.',
    ),
    Experience(
      role: 'Freelance Developer',
      company: 'Self-Employed / Available for Hire',
      duration: 'Current',
      description:
          'Currently freelancing on a client project focused on building a local services application, handling end-to-end development and feature implementation. Available for new freelance or full-time opportunities.',
    ),
  ];
}
