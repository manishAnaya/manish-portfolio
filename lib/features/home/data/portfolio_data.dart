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
        'Contributed to the development of CubeBot Pro, an AI-powered chatbot platform using Flutter and REST APIs.',
        'Implemented document processing workflows, including document loading, text chunking, and embedding generation.',
        'Integrated vector database operations and retrieval workflows to support document-grounded question answering.',
        'Designed prompts combining retrieved document context with LLM responses.',
        'Worked with Google Gemini, OpenAI, and Groq models for AI-powered application functionality.',
        'Developed Flutter interfaces for project management, document workflows, and AI conversations.',
        'Contributed to the development of fintech applications, including portfolio and risk management workflows.',
      ],
    ),
    Experience(
      company: 'Act T Connect',
      role: 'Flutter Developer',
      duration: 'Jul 2022 – Jan 2024',
      location: 'Jhansi, Uttar Pradesh · On-site',
      isCurrent: false,
      logoEmoji: '📱',
      responsibilities: const [
        'Developed and delivered 8+ production Flutter applications across e-commerce, education, recruitment, and HR domains.',
        'Built a vehicle auto-parts marketplace with make, model, and year-based product search.',
        'Developed a tutor discovery platform with location-based search, ratings, and reviews.',
        'Implemented recruitment features including job discovery, resume uploads, and application tracking.',
        'Developed HR application features for employee management, attendance, and location tracking.',
        'Integrated REST APIs and third-party services into cross-platform mobile applications.',
        'Translated Figma designs into reusable Flutter components for consistent Android and iOS experiences.',
      ],
    ),
  ];
}

@riverpod
List<Project> projects(Ref ref) {
  return [
    // PROFESSIONAL AI PROJECT
    Project(
      title: 'CubeBot Pro – AI Chatbot Platform',
      description:
          'An AI-powered document intelligence platform. Contributed to document loading, text chunking, embedding generation, vector database operations, retrieval workflows, prompt design, and Flutter application interfaces. Integrated LLM functionality using Gemini, OpenAI, and Groq.',
      techStack: [
        'Flutter',
        'Dart',
        'Python',
        'LLMs',
        'RAG',
        'Embeddings',
        'Vector Databases',
        'REST API',
      ],
      emoji: '🤖',
      isFeatured: true,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.finvatech.chatbot',
      appStoreUrl: 'https://apps.apple.com/in/app/cubebot-pro/id6593685926',
    ),

    // PERSONAL AI PROJECT
    Project(
      title: 'Personal Portfolio AI Assistant',
      description:
          'Built and deployed an AI assistant for my portfolio using a Retrieval-Augmented Generation architecture. The application uses document retrieval and LLMs to answer questions about my professional experience, skills, and projects.',
      techStack: [
        'Python',
        'LangChain',
        'FastAPI',
        'ChromaDB',
        'Hugging Face',
        'Groq',
        'Cohere',
        'Render',
      ],
      emoji: '🧠',
      isFeatured: true,
    ),

    // PERSONAL RAG PROJECT
    Project(
      title: 'RAG Chatbot – PDF Question Answering',
      description:
          'Developed a document question-answering application that loads PDF files, splits their content into chunks, generates embeddings, and retrieves relevant context to answer user questions using an LLM.',
      techStack: [
        'Python',
        'LangChain',
        'PyPDFLoader',
        'Hugging Face',
        'FAISS',
        'ChromaDB',
        'Groq',
        'Streamlit',
      ],
      emoji: '📄',
      isFeatured: true,
    ),

    // LANGGRAPH PROJECT
    Project(
      title: 'LangGraph Agent Workflow',
      description:
          'Implemented an agent workflow using LangGraph with graph state management, message handling, conditional routing, and tool-calling patterns.',
      techStack: ['Python', 'LangChain', 'LangGraph', 'LLMs', 'Tool Calling'],
      emoji: '🔗',
      isFeatured: true,
    ),

    // PROFESSIONAL FINTECH PROJECT
    Project(
      title: 'Portfolio & Risk Management System',
      description:
          'Worked on a configurable fintech application for asset managers and investment professionals, contributing to portfolio management, reporting, and risk-related application workflows.',
      techStack: ['Flutter', 'Dart', 'REST API', 'FinTech', 'Riverpod'],
      emoji: '📊',
      isFeatured: true,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.finvatech.cubepms',
    ),

    // FLUTTER PROJECTS
    Project(
      title: 'Recruitment & Career Platform',
      description:
          'A recruitment application for discovering jobs and internships, uploading resumes, and tracking job applications.',
      techStack: ['Flutter', 'Dart', 'REST API', 'Firebase', 'GetX'],
      emoji: '💼',
      isFeatured: true,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.atc.spires_app',
    ),

    Project(
      title: 'HR & Payroll Management App',
      description:
          'An employee management application with attendance tracking, employee workflows, and location-sharing functionality.',
      techStack: ['Flutter', 'Dart', 'REST API', 'GPS', 'Firebase'],
      emoji: '🏢',
      isFeatured: false,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.atc.pinghr',
    ),
  ];
}
