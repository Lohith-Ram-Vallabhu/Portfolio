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
      imageUrl: 'assets/images/roentgen.webp',
      demoUrl: 'https://roentgenhealthcare.com/#/home',
      githubUrl: '',
      tags: ['User Aplication', 'Client Only Admin Application'],
    ),
    Project(
      title: 'VaranousLabs – Pharma Composition Ordering Platform',
      description:
          'Developed a chemical and pharmaceutical ordering platform with customer and admin interfaces, an HRMS module, and backend services for order processing, billing, and employee management.',
      imageUrl: 'assets/images/varanous_labs.webp',
      demoUrl: 'https://www.varanouslabs.com/',
      githubUrl: '',
      tags: ['User Application', 'Client Only Admin Application'],
    ),
    Project(
      title: 'School Book ERP',
      description:
          'Developed a full-fledged school ERP system with admin, teacher, and student modules, managing attendance, academics, fees, and role-based dashboards.',
      imageUrl: 'assets/images/school_book.webp',
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
      title: 'Society Digital Book',
      description:
          'Society Digital Book is a complete solution for housing societies and gated communities to manage residents, maintenance bills, complaints, events, and communication — all in one secure and user-friendly app.',
      imageUrl: 'assets/images/society_digital_book.webp',
      demoUrl:
          'https://play.google.com/store/apps/details?id=com.dmt.societydigitalbook&hl=en_IN',
      githubUrl: '',
      tags: ['Admin Portal', 'Mobile App'],
    ),
    Project(
      title: 'Aadhi Home Foods',
      description:
          'Aadhi Home Foods is a complete solution for managing home food orders, delivery, and customer feedback in a user-friendly and secure environment.',
      imageUrl: 'assets/images/aadhi_home_foods.webp',
      demoUrl: 'https://aadhihomefoods.com/#/home',
      githubUrl: '',
      tags: ['Admin Portal', 'Customer Application'],
    ),
    Project(
      title: 'Portfolio Template',
      description:
          'A clean, responsive, and fully customizable portfolio template built with Flutter, designed to showcase projects, skills, and experience with a modern UI, smooth interactions, and a structure that’s easy to extend and maintain across web and devices.',
      imageUrl: 'assets/images/portfolio.webp',
      demoUrl: '',
      githubUrl: 'https://github.com/Lohith-Ram-Vallabhu/Portfolio',
      tags: ['Flutter Web', 'Clean UI', 'Beautification'],
    ),
  ];
}
