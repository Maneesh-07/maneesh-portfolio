// ═══════════════════════════════════════════════════════════════════════════════
// MODEL — Data classes + Maneesh M's complete portfolio data
// ═══════════════════════════════════════════════════════════════════════════════

class PersonalInfo {
  final String name, title, bio, email, phone, location, github, linkedin;
  final int yearsExp, appsBuilt, companies;
  const PersonalInfo({
    required this.name,
    required this.title,
    required this.bio,
    required this.email,
    required this.phone,
    required this.location,
    required this.github,
    required this.linkedin,
    required this.yearsExp,
    required this.appsBuilt,
    required this.companies,
  });
}

class Skill {
  final String name, category, icon;
  final double level;
  const Skill(
      {required this.name,
      required this.category,
      required this.icon,
      required this.level});
}

class Project {
  final String title, subtitle, description, category, status;
  final String neonStart, neonEnd;
  final List<String> techStack, highlights;
  final bool isFreelance, isFeatured;
  const Project({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.category,
    required this.status,
    required this.neonStart,
    required this.neonEnd,
    required this.techStack,
    required this.highlights,
    this.isFreelance = false,
    this.isFeatured = false,
  });
}

class Experience {
  final String role, company, period, location, description, type;
  final List<String> achievements;
  final bool isCurrent;
  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.description,
    required this.type,
    required this.achievements,
    this.isCurrent = false,
  });
}

class FreelanceService {
  final String title, description, icon;
  final List<String> features;
  final bool isPopular;
  const FreelanceService({
    required this.title,
    required this.description,
    required this.icon,
    required this.features,
    this.isPopular = false,
  });
}

// ─── Real Data ────────────────────────────────────────────────────────────────

const kInfo = PersonalInfo(
  name: 'MANEESH M',
  title: 'FLUTTER DEVELOPER',
  bio: 'Self-taught Flutter developer. I engineer cross-platform mobile apps '
      'for retail, enterprise, and entertainment — POS systems, booking '
      'platforms, children\'s apps. Clean architecture. Ruthless performance. '
      'Shipped to production across 3 companies.',
  email: 'maneeshmanu204@gmail.com',
  phone: '07025650902',
  location: 'Cochin, Kerala, India',
  github: 'https://github.com/Maneesh-07',
  linkedin: 'https://www.linkedin.com/in/maneesh-m-094892249/',
  yearsExp: 3,
  appsBuilt: 10,
  companies: 3,
);

const kSkills = <Skill>[
  Skill(name: 'Flutter', category: 'Mobile', icon: '◈', level: 0.95),
  Skill(name: 'Dart', category: 'Mobile', icon: '◈', level: 0.92),
  Skill(name: 'BLoC', category: 'Mobile', icon: '◈', level: 0.88),
  Skill(name: 'Provider', category: 'Mobile', icon: '◈', level: 0.87),
  Skill(name: 'GetX', category: 'Mobile', icon: '◈', level: 0.85),
  Skill(name: 'Firebase', category: 'Backend', icon: '◈', level: 0.85),
  Skill(name: 'REST API', category: 'Backend', icon: '◈', level: 0.88),
  Skill(name: 'Hive DB', category: 'Backend', icon: '◈', level: 0.90),
  Skill(name: 'WooCommerce', category: 'Backend', icon: '◈', level: 0.78),
  Skill(name: 'Git/GitHub', category: 'Tools', icon: '◈', level: 0.90),
  Skill(name: 'Figma', category: 'Tools', icon: '◈', level: 0.80),
  Skill(name: 'Play Console', category: 'Tools', icon: '◈', level: 0.82),
];

const kProjects = <Project>[
  Project(
    title: 'POS & INVENTORY',
    subtitle: 'MICROSYS TECHNOLOGY / ENTERPRISE',
    description: 'High-performance cross-platform POS system. Real-time '
        'inventory sync, barcode scanning, payment gateway integration (UPI + '
        'cards). Automated reports. Reduced data-entry errors by 30%.',
    techStack: ['Flutter', 'BLoC', 'Firebase', 'REST API', 'Dart'],
    category: 'Enterprise',
    status: 'DEPLOYED',
    isFeatured: true,
    neonStart: '0xFF00FFFF',
    neonEnd: '0xFF0088FF',
    highlights: [
      'Cross-platform POS for retail order processing & fast checkout',
      'Real-time inventory with barcode scanning & SKU management',
      'Automated low-stock alerts & warehouse sync',
      'UPI + card payment gateway integration',
      'Reduced manual data entry errors by 30%',
      'Dynamic reporting & live sales analytics',
    ],
  ),
  Project(
    title: 'Executive Management Dashboard',
    subtitle: 'MICROSYS TECHNOLOGY / ENTERPRISE',
    description:
        'Enterprise-grade management dashboard designed for internal business operations. '
        'Provides centralized control for customer records, order tracking, and analytics. '
        'Automated validation workflows and reporting pipelines reduced manual data-entry '
        'errors by 30% while improving operational visibility for executives.',
    techStack: ['Flutter', 'BLoC', 'Firebase', 'REST API', 'Dart'],
    category: 'Enterprise',
    status: 'DEPLOYED',
    isFeatured: true,
    neonStart: '0xFF00FFFF',
    neonEnd: '0xFF0088FF',
    highlights: [
      'Internal admin dashboard for customer data management (CRUD)',
      'Centralized order tracking and business analytics',
      'Automated validation workflows reducing manual errors by 30%',
      'Dynamic reporting system for operational insights',
      'Secure enterprise-grade architecture with REST API integration',
      'Scalable Flutter architecture using BLoC state management',
    ],
  ),
  Project(
    title: 'BOOKING APPLICATION',
    subtitle: 'FREELANCE / IN ACTIVE DEVELOPMENT',
    description: 'Full-featured booking & scheduling platform for a service '
        'business client. Real-time availability, Stripe payments, FCM push '
        'notifications, admin dashboard with calendar analytics.',
    techStack: ['Flutter', 'Firebase', 'Provider', 'Stripe', 'FCM'],
    category: 'Freelance',
    status: 'IN PROGRESS',
    isFreelance: true,
    isFeatured: true,
    neonStart: '0xFFFF00FF',
    neonEnd: '0xFF7700FF',
    highlights: [
      'Smart scheduling with real-time availability engine',
      'Stripe payment gateway — secure in-app transactions',
      'FCM push notifications for booking confirmations',
      'Customer profiles & full booking history',
      'Admin dashboard: calendar view + revenue analytics',
      'Informed by Funtura & Temple Ticket Booking experience',
    ],
  ),
  Project(
    title: 'VIDFLIX',
    subtitle: 'LOCAL VIDEO PLAYER / TMDB INTEGRATION',
    description: 'Cinema-grade local video player. Playlists, favourites, '
        'full seek controls. TMDB API for live movie listings. '
        'BLoC state management. Hive offline persistence.',
    techStack: ['Flutter', 'BLoC', 'Hive', 'TMDB API', 'Dart'],
    category: 'Entertainment',
    status: 'DEPLOYED',
    neonStart: '0xFFFF6600',
    neonEnd: '0xFFFF0066',
    highlights: [
      'Play / Pause / Prev / Next / Seek / Search local files',
      'Create & manage playlists, Add to Favourites',
      'TMDB API integration for movie discovery',
      'Hive offline-first persistence',
      'video_player, flick_video_player, file_picker, permission_handler',
    ],
  ),
  Project(
    title: 'FUNTURA CHILDREN\'S APP',
    subtitle: 'LULU GROUP INTERNATIONAL',
    description: 'Children\'s entertainment platform for one of the Middle '
        'East\'s largest retail conglomerates. Ticket booking, card recharge, '
        'secure payments. Designed for younger audiences.',
    techStack: ['Flutter', 'GetX', 'REST API', 'Firebase', 'Dart'],
    category: 'Enterprise',
    status: 'DEPLOYED',
    neonStart: '0xFF00FF88',
    neonEnd: '0xFF00CCFF',
    highlights: [
      'Ticket booking with intuitive UX for children',
      'Card recharge with secure payment flow',
      'GetX reactive state management architecture',
      'PDT inventory app with SAP integration + barcode scanning',
      'Streamlined warehouse operations for LuLu logistics',
    ],
  ),
  Project(
    title: 'TEMPLE TICKET BOOKING',
    subtitle: 'GLOBIFY DIGITAL SOLUTIONS',
    description: 'Cross-platform temple ticketing app. GetX state management, '
        'complete payment flow, YouTube API for engagement, music playback. '
        'First production app — clean architecture from day one.',
    techStack: ['Flutter', 'GetX', 'YouTube API', 'Payment Gateway'],
    category: 'Booking',
    status: 'DEPLOYED',
    neonStart: '0xFFFFFF00',
    neonEnd: '0xFFFF8800',
    highlights: [
      'Ticket selection, booking & payment with GetX architecture',
      'YouTube API for rich video content & engagement',
      'Music playback integration',
      'Smooth UI/UX for non-technical temple visitors',
    ],
  ),
  Project(
    title: 'TRENDY FOOT',
    subtitle: 'MINI E-COMMERCE / SHOE STORE',
    description: 'Shoe collection showcase app. Staggered grid layout, '
        'product search, wishlists and favourites. Provider + Hive. '
        'WooCommerce backend. Pixel-perfect with flutter_screenutil.',
    techStack: ['Flutter', 'Provider', 'Hive', 'WooCommerce', 'Dart'],
    category: 'E-Commerce',
    status: 'DEPLOYED',
    neonStart: '0xFF0066FF',
    neonEnd: '0xFF00FFFF',
    highlights: [
      'Staggered grid with flutter_staggered_grid_view',
      'Favourites & Wishlist with Hive persistence',
      'Provider reactive cart state',
      'flutter_screenutil pixel-perfect responsive layout',
    ],
  ),
];

const kExperiences = <Experience>[
  Experience(
    role: 'FLUTTER DEVELOPER',
    company: 'MICROSYS TECHNOLOGY',
    period: 'JAN 2025 — PRESENT',
    location: 'India',
    type: 'FULL-TIME',
    isCurrent: true,
    description: 'Building enterprise-grade Flutter applications — POS system '
        'and executive admin dashboard. Architecture, state management, production delivery.',
    achievements: [
      'Engineered cross-platform POS for retail order processing & checkout',
      'Real-time transaction sync across devices with BLoC state management',
      'Architected secure executive dashboard: CRUD, order tracking & analytics',
      'Reduced manual data entry errors 30% via automated form validation',
      'Built inventory tracking with barcode scanning & low-stock alerts',
    ],
  ),
  Experience(
    role: 'FLUTTER DEVELOPER',
    company: 'LULU GROUP INTERNATIONAL',
    period: 'JUN 2024 — DEC 2024',
    location: 'India',
    type: 'FULL-TIME',
    description:
        'Mobile applications for one of the largest retail conglomerates '
        'in the Middle East. Funtura children\'s entertainment + PDT SAP inventory system.',
    achievements: [
      'Built Funtura — ticket booking & card recharge for children',
      'UX focused on security and ease of use for younger audiences',
      'PDT inventory app with SAP integration & barcode scanning',
      'Streamlined warehouse data retrieval and operations',
    ],
  ),
  Experience(
    role: 'FLUTTER DEVELOPER',
    company: 'GLOBIFY DIGITAL SOLUTIONS',
    period: 'JUL 2023 — MAR 2024',
    location: 'Trivandrum',
    type: 'FULL-TIME',
    description: 'Cross-platform mobile apps for ticketing and entertainment '
        'clients. GetX state management. First professional Flutter role.',
    achievements: [
      'Built Temple Ticket Booking app with Flutter & GetX',
      'Ticket selection, booking & payment processing from scratch',
      'YouTube API integration for video content & engagement',
      'Music playback integration & polished UI/UX design',
    ],
  ),
  Experience(
    role: 'FREELANCE DEVELOPER',
    company: 'SELF-EMPLOYED',
    period: '2023 — PRESENT',
    location: 'Remote',
    type: 'FREELANCE',
    isCurrent: true,
    description:
        'Select freelance projects for businesses needing quality mobile '
        'solutions. Currently building a booking application.',
    achievements: [
      'Currently building full Booking Application (Stripe + FCM)',
      'VIDFLIX — local video player with TMDB + Hive',
      'TRENDY FOOT — e-commerce app with staggered UI & wishlist',
      '100% client satisfaction across all delivered projects',
    ],
  ),
];

const kServices = <FreelanceService>[
  FreelanceService(
    title: 'MOBILE APP DEV',
    description:
        'End-to-end Flutter for iOS & Android. Architecture, UI, APIs, Play Store.',
    icon: '▣',
    isPopular: true,
    features: [
      'Cross-platform iOS & Android',
      'BLoC / GetX / Provider',
      'Firebase & REST API',
      'Play Store release'
    ],
  ),
  FreelanceService(
    title: 'POS & BUSINESS',
    description:
        'Custom POS, inventory & management systems. Barcode, offline, reports.',
    icon: '▣',
    features: [
      'Inventory & stock management',
      'Sales analytics',
      'Barcode scanner',
      'Payment gateway'
    ],
  ),
  FreelanceService(
    title: 'BOOKING & SCHEDULING',
    description:
        'Full booking apps — availability, notifications, Stripe payments.',
    icon: '▣',
    features: [
      'Scheduling engine',
      'Stripe payments',
      'FCM notifications',
      'Admin dashboard'
    ],
  ),
  FreelanceService(
    title: 'APP FIX & OPTIMISE',
    description:
        'Performance audits, bug fixing, UI modernisation. Fast turnaround.',
    icon: '▣',
    features: [
      'Performance profiling',
      'Bug fixing',
      'UI/UX improvements',
      'Refactoring'
    ],
  ),
];
