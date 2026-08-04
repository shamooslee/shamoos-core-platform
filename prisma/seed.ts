import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  const studio = await prisma.organization.upsert({
    where: { slug: "shamoos-studio" },
    update: {},
    create: {
      id: "11111111-1111-1111-1111-111111111111",
      name: "SHAMOOS Studio",
      slug: "shamoos-studio",
      type: "studio",
      description: "Core operating organization",
      status: "active",
    },
  });

  const seum = await prisma.organization.upsert({
    where: { slug: "seum-english" },
    update: {},
    create: {
      id: "33333333-3333-3333-3333-333333333333",
      name: "Seum English",
      slug: "seum-english",
      type: "customer",
      description: "Customer organization",
      status: "active",
    },
  });

  const product = await prisma.product.upsert({
    where: {
      organizationId_slug: {
        organizationId: studio.id,
        slug: "tw-lms",
      },
    },
    update: {},
    create: {
      id: "77777777-7777-7777-7777-777777777777",
      organizationId: studio.id,
      name: "TW-LMS",
      slug: "tw-lms",
      stage: "beta",
      description: "Learning management system",
      status: "active",
    },
  });

  const customer = await prisma.customer.upsert({
    where: {
      organizationId_name: {
        organizationId: studio.id,
        name: "Seum English",
      },
    },
    update: {},
    create: {
      id: "44444444-4444-4444-4444-444444444444",
      organizationId: studio.id,
      name: "Seum English",
      legalName: "Seum English Co., Ltd.",
      slug: "seum-english",
      status: "active",
      contactEmail: "contact@seumenglish.com",
    },
  });

  const project = await prisma.project.create({
    data: {
      id: "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee",
      organizationId: studio.id,
      customerId: customer.id,
      productId: product.id,
      name: "Seum English LMS 구축",
      code: "SEUM-LMS-001",
      status: "active",
      description: "Core LMS implementation",
    },
  });

  await prisma.meeting.create({
    data: {
      id: "11112222-3333-4444-5555-666677778888",
      organizationId: studio.id,
      projectId: project.id,
      title: "Kickoff Meeting",
      meetingAt: new Date("2026-08-04T00:00:00.000Z"),
      meetingType: "client",
      status: "completed",
      notes: "Project kickoff and scope review",
    },
  });

  console.log(`Seeded core platform for ${studio.name} and ${seum.name}`);
}

main()
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
