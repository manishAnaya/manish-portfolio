import 'package:manish_flutter_portfolio/shared/models/experience_model.dart';
import 'package:manish_flutter_portfolio/shared/models/project_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'portfolio_data.g.dart';

@riverpod
List<Experience> experiences(Ref ref) {
  return [
    Experience(
      company: 'Finva Tech Pvt Ltd',
      role: 'Software Engineer',
      duration: 'Mar 2024 – Present',
      location: 'Bengaluru, Karnataka · On-site',
      isCurrent: true,
      logoEmoji: '🤖',
      responsibilities: const [
        'Built and shipped an AI-powered chatbot platform (Flutter + REST) with workspace management, custom prompt configuration, and citation fetching — enabling teams to deploy intelligent assistants without code.',
        'Delivered a fully configurable portfolio & risk management system for asset managers and hedge funds, supporting MiFID, FINMA, and UCITS compliance workflows with real-time reporting.',
        'Translated complex UI/UX wireframes into pixel-perfect, responsive Flutter interfaces that work seamlessly across Android and iOS.',
        'Integrated token-based auth, secure API layers, and dark mode with smooth animations — reducing user-reported UI issues by improving perceived performance.',
        'Collaborated directly with backend and AI engineers to wire frontend components to evolving APIs and AI services.',
        'Contributed to architectural decisions on the platform to ensure scalability, security, and long-term maintainability.',
        'Mentored junior developers and provided technical guidance on Flutter best practices and clean architecture.',
      ],
    ),
    Experience(
      company: 'Act T Connect',
      role: 'Flutter Developer',
      duration: 'Jul 2022 – Mar 2024',
      location: 'Jhansi, Uttar Pradesh · On-site',
      isCurrent: false,
      logoEmoji: '📱',
      responsibilities: const [
        'Designed and launched 8+ production apps on Google Play Store across e-commerce, edtech, recruitment, and HR domains.',
        'Built a vehicle auto-parts marketplace with make/model/year-based search, detailed specs, and seamless in-app checkout.',
        'Delivered a geo-based tutor discovery platform connecting students with nearby educators — with ratings, reviews, and smart filtering.',
        'Shipped a recruitment app with job/internship discovery, resume upload, application tracking, and career analytics dashboard.',
        'Developed a jewelry e-commerce app with product collections, secure payments, and a clean shopping experience.',
        'Built an HR & payroll management app with attendance tracking, employee management, and real-time location sharing.',
        'Maintained consistent UI/UX standards across all apps by translating Figma designs into reusable Flutter component systems.',
      ],
    ),
  ];
}

@riverpod
List<Project> projects(Ref ref) {
  return [
    Project(
      title: 'AI Chatbot Platform',
      description:
          'An enterprise-grade AI chatbot app with multi-workspace support, customizable prompts, conversation history, and source citation fetching. Built with Flutter, integrated with AI APIs, token-based auth, and full dark mode support.',
      techStack: [
        'Flutter',
        'Dart',
        'REST API',
        'AI Integration',
        'Riverpod',
        'Token Auth',
      ],
      emoji: '🤖',
      isFeatured: true,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.finvatech.chatbot',
      appStoreUrl: 'https://apps.apple.com/in/app/cubebot-pro/id6593685926',
    ),
    Project(
      title: 'Portfolio & Risk Management System',
      description:
          'A configurable fintech app for asset managers, hedge funds, and family offices. Features real-time portfolio tracking, order management, risk analytics',
      techStack: [
        'Flutter',
        'Dart',
        'Fintech',
        'REST API',
        'Riverpod',
        'Data Viz',
      ],
      emoji: '📊',
      isFeatured: true,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.finvatech.cubepms',
    ),
    Project(
      title: 'Recruitment & Career Platform',
      description:
          'A job and internship discovery app with intelligent search, resume upload, one-tap applications, interview tracker, and personalized career analytics. Rated 4.8★ with 100+ downloads.',
      techStack: ['Flutter', 'Dart', 'REST API', 'Firebase', 'GetX'],
      emoji: '💼',
      isFeatured: true,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.atc.spires_app',
    ),
    Project(
      title: 'HR & Payroll Management App',
      description:
          'An employee management platform with real-time attendance tracking, location sharing, payroll processing, and day-to-day HR workflows — helping organisations eliminate manual processes.',
      techStack: ['Flutter', 'Dart', 'REST API', 'GPS', 'Firebase'],
      emoji: '🏢',
      isFeatured: false,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.atc.pinghr',
    ),
    Project(
      title: 'EdTech Tutor Discovery Platform',
      description:
          'A geo-based platform bridging students and local educators. Students discover tutors by subject and location, evaluate via ratings and reviews, and connect instantly — fostering affordable, accessible education.',
      techStack: ['Flutter', 'Dart', 'REST API', 'Google Maps', 'Firebase'],
      emoji: '🎓',
      isFeatured: false,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.atc.edunear',
    ),
    Project(
      title: 'Auto Parts E-Commerce App',
      description:
          'A shopping app for automotive enthusiasts and professionals. Supports vehicle-specific part search by make, model, and year — with detailed specs, compatibility info, and secure in-app checkout.',
      techStack: ['Flutter', 'Dart', 'REST API', 'Razorpay', 'Firebase'],
      emoji: '🔧',
      isFeatured: false,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.atc.newkaka',
    ),
  ];
}
