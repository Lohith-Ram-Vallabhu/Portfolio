class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String demoUrl;
  final String githubUrl;
  final List<String> tags;

  const Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.demoUrl = '',
    this.githubUrl = '',
    required this.tags,
  });
}

class ProjectConfig {
  static const List<Project> projects = [
    Project(
      title: 'Roentzen – Mobile Diagnosis & Healthcare System',
      description:
          'Built a healthcare application with appointment scheduling, diagnosis management, and billing, ensuring secure, role-based access and consistent data handling.',
      imageUrl: 'images/roentgen.png',
      demoUrl: 'https://roentgenhealthcare.com/#/home',
      githubUrl: '',
      tags: ['User Aplication', 'Client Only Admin Application'],
    ),
    Project(
      title: 'VaranousLabs – Pharma Composition Ordering Platform',
      description:
          'Developed a chemical and pharmaceutical ordering platform with customer and admin interfaces, an HRMS module, and backend services for order processing, billing, and employee management.',
      imageUrl: 'images/varanous_labs.png',
      demoUrl: 'https://www.varanouslabs.com/',
      githubUrl: '',
      tags: ['User Application', 'Client Only Admin Application'],
    ),
    Project(
      title: 'School Book ERP',
      description:
          'Developed a full-fledged school ERP system with admin, teacher, and student modules, managing attendance, academics, fees, and role-based dashboards.',
      imageUrl: 'images/school_book.png',
      demoUrl: 'https://www.schoolbookapp.com/',
      githubUrl: '',
      tags: [
        'Student App',
        'Teacher App',
        'HRMS',
        'Admin Application',
        'Microservices',
      ],
    ),
    Project(
      title: 'Portfolio Template',
      description:
          'A clean, responsive, and completely customizable portfolio template built with Flutter.',
      imageUrl: 'images/portfolio.png',
      demoUrl: '',
      githubUrl: 'https://github.com/Lohith-Ram-Vallabhu/Portfolio',
      tags: ['Flutter Web', 'Clean UI', 'Beautification'],
    ),
  ];
}
