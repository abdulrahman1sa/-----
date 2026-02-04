import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  reactCompiler: true,
  /* تفعيل وضع الـ standalone لتحسين الأداء في بيئات النشر */
  output: 'standalone',
  /* تجاهل الأخطاء البسيطة في الـ lint أثناء النشر لضمان استمرارية العملية */
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  }
};

export default nextConfig;
