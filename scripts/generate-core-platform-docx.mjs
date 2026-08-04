import fs from "node:fs";
import path from "node:path";
import { createRequire } from "node:module";

const require = createRequire(import.meta.url);
const {
  Document,
  HeadingLevel,
  Packer,
  Paragraph,
  TextRun,
  WidthType,
  Table,
  TableRow,
  TableCell,
} = require("docx");

const outPath = path.resolve("SHAMOOS-Core-Data-Platform-v1.0.docx");

const doc = new Document({
  sections: [
    {
      children: [
        new Paragraph({
          text: "SHAMOOS Studio Core Data Platform v1.0",
          heading: HeadingLevel.TITLE,
        }),
        new Paragraph({
          children: [
            new TextRun("Core summary: "),
            new TextRun("Product-first, reusable core, decision-log driven."),
          ],
        }),
        new Paragraph({ text: "1. Scope", heading: HeadingLevel.HEADING_1 }),
        new Paragraph(
          "This platform unifies Organization, Member, Customer, Product, Project, Meeting, Decision Log, Task, Document, Template, and AI Prompt data across SHAMOOS Studio products.",
        ),
        new Paragraph({ text: "2. Core tables", heading: HeadingLevel.HEADING_1 }),
        new Table({
          width: { size: 100, type: WidthType.PERCENTAGE },
          columnWidths: [2500, 8000],
          rows: [
            new TableRow({
              children: [
                new TableCell({ children: [new Paragraph("Table")] }),
                new TableCell({ children: [new Paragraph("Purpose")] }),
              ],
            }),
            new TableRow({
              children: [
                new TableCell({ children: [new Paragraph("organizations")] }),
                new TableCell({ children: [new Paragraph("Workspace boundary and tenancy root")] }),
              ],
            }),
            new TableRow({
              children: [
                new TableCell({ children: [new Paragraph("products")] }),
                new TableCell({ children: [new Paragraph("Product-centric delivery container")] }),
              ],
            }),
            new TableRow({
              children: [
                new TableCell({ children: [new Paragraph("projects")] }),
                new TableCell({ children: [new Paragraph("Customer and product execution unit")] }),
              ],
            }),
            new TableRow({
              children: [
                new TableCell({ children: [new Paragraph("decision_logs")] }),
                new TableCell({ children: [new Paragraph("Governance and rationale record")] }),
              ],
            }),
            new TableRow({
              children: [
                new TableCell({ children: [new Paragraph("documents")] }),
                new TableCell({ children: [new Paragraph("Operational and product documentation")] }),
              ],
            }),
          ],
        }),
        new Paragraph({ text: "3. Implementation order", heading: HeadingLevel.HEADING_1 }),
        new Paragraph("1. Apply SQL schema"),
        new Paragraph("2. Enable RLS and triggers"),
        new Paragraph("3. Load seed data"),
        new Paragraph("4. Connect Prisma and API routes"),
        new Paragraph("5. Mirror operating content in Notion"),
        new Paragraph({ text: "4. Key files", heading: HeadingLevel.HEADING_1 }),
        new Paragraph("docs/shamoos-core-platform-v1.0.md"),
        new Paragraph("docs/notion/notion-templates.md"),
        new Paragraph("docs/supabase-migration-order.md"),
        new Paragraph("docs/supabase-functions-triggers.md"),
        new Paragraph("sql/supabase-initial-schema.sql"),
        new Paragraph("sql/supabase-triggers.sql"),
        new Paragraph("sql/seed-data.sql"),
        new Paragraph("prisma/schema.prisma"),
        new Paragraph("prisma/seed.ts"),
      ],
    },
  ],
});

const run = async () => {
  const buffer = await Packer.toBuffer(doc);
  fs.writeFileSync(outPath, buffer);
  console.log(outPath);
};

run().catch((error) => {
  console.error(error);
  process.exit(1);
});
