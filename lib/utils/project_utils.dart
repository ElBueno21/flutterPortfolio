class ProjectUtils {
  final List<String> images;
  final String title;
  final String subtitle;
  final String? moreInfo;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.images,
    required this.title,
    required this.subtitle,
    this.moreInfo,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

// ###############
// HOBBY PROJECTS
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    images: [
      'assets/projects/orangePiFiveMain.png',
      'assets/projects/orangePiFive2.png',
      'assets/projects/orangePiFive3.png',
      'assets/projects/orangePiFive4.png',
    ],
    title: 'Orange Pi 5 (8GB)',
    subtitle:
        'This is a ARM linux device similar to the Raspberry Pi where I run a NAS, WebServer, NFTY (Reminder Server), Scripts, and use Cloud Flare Zero Trust to communicate with my server on the internet.',
    moreInfo:
        "Before getting the Orange Pi 5, I was using a Raspberry Pi 3B+ for most of my tasks, like running a NAS, automated scripts (like sending text messages, via Textbelt, to remind me to take out the trash), and managing my Docker containers. However, I noticed the Raspberry Pi's performance was a bit sluggish, so I considered upgrading to the Raspberry Pi 4. However, due to the chip shortage, it was tough to get one, so I looked for alternatives and found the Orange Pi 5. I've been using it for over two years now and haven't had a single complaint. It was a very welcome upgrade, and I continue to use it weekly.",
    webLink:
        'http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-5.html',
  ),
  ProjectUtils(
    images: ['assets/projects/HomeLab.png'],
    title: 'HomeLab',
    subtitle:
        'This is HomeLab I have at home where I use a Synology NAS, Proxmox Server, and a Ubiquiti Dream Machine Special Edition. ',
    moreInfo:
        'This is HomeLab I have at home where I use a Synology NAS for the families personal files, Proxmox Server for all my Linux test environments, and I use a Ubiquit Dream Machine Special Edition for managing my network here at home.',
  ),
];

// ###############
// WORK PROJECTS
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    images: ['assets/projects/m8systems.png'],
    title: 'M8 Systems FieldM8 App',
    subtitle:
        'This is an IoT Irrigation, fertigation and fluid flow management System for Ag.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.m8systems.fieldm8&hl=en_US',
    iosLink: "https://apps.apple.com/us/app/m8-systems-fieldm8/id1604691850",
    webLink: "https://www.m8systems.com/",
  ),
  ProjectUtils(
    images: ['assets/projects/goldenboysdetailing.png'],
    title: 'Golden Boys Detailing Website',
    subtitle: 'This is a responsive online website for car detailing.',
    moreInfo:
        "I created this website for my cousin's detailing business. Right now, it's a simple static site, but as his business grows, we plan to upgrade to a dynamic booking website where customers can schedule appointments directly instead of contacting him through Instagram. So if you're in the Bakersfield, CA area and need a car detailing, reach out to him on Instagram.",
    webLink: 'https://goldenboysdetailing.net/',
  ),
  ProjectUtils(
    images: ['assets/projects/pacificagsolutions.png'],
    title: 'Pacific Ag Solutions Website',
    subtitle:
        'This is a responsive online website for a farm labor contractor.',
    moreInfo:
        "I created this website for a client who is a farm labor contractor. The website serves as an online presence for his business, providing information about the services offered and how to contact him. It's a multi-language site that helps him reach potential clients in the agricultural sector.",
    webLink: 'https://pacificagsolutions.com/',
  ),
];
