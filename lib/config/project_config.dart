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
      title: 'E-Commerce Dashboard',
      description: 'A comprehensive admin dashboard for managing products, orders, and users with real-time analytics.',
      imageUrl: 'assets/images/project1.png', // Ideally use real assets or network images in real life
      demoUrl: 'https://demo.example.com',
      githubUrl: 'https://github.com/example/repo',
      tags: ['Flutter Web', 'Firebase', 'Provider'],
    ),
    Project(
      title: 'Task Management App',
      description: 'Mobile application to track daily tasks, set priorities, and collaborate with team members.',
      imageUrl: 'assets/images/project2.png',
      demoUrl: '',
      githubUrl: 'https://github.com/example/repo2',
      tags: ['Flutter', 'Node.js', 'MongoDB'],
    ),
    Project(
      title: 'Portfolio Template',
      description: 'A clean, responsive, and completely customizable portfolio template built with Flutter.',
      imageUrl: 'assets/images/project3.png',
      demoUrl: 'https://portfolio.example.com',
      githubUrl: 'https://github.com/example/repo3',
      tags: ['Flutter Web', 'Clean UI', 'Animations'],
    ),
  ];
}
