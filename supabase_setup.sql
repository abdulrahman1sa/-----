-- Create the submissions table
CREATE TABLE submissions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  platform TEXT NOT NULL,
  college TEXT NOT NULL,
  subject TEXT NOT NULL,
  section_number TEXT NOT NULL,
  group_link TEXT NOT NULL,
  group_name TEXT NOT NULL,
  submitter_name TEXT DEFAULT 'مجهول',
  status TEXT DEFAULT 'pending',
  reports INTEGER DEFAULT 0,
  votes INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  approved_at TIMESTAMPTZ,
  rejected_at TIMESTAMPTZ,
  rejection_reason TEXT
);

-- Enable Row Level Security (RLS)
ALTER TABLE submissions ENABLE ROW LEVEL SECURITY;

-- Create policy to allow public to read approved groups
CREATE POLICY "Allow public read approved groups" 
ON submissions FOR SELECT 
USING (status = 'approved');

-- Create policy to allow public to submit groups
CREATE POLICY "Allow public insert" 
ON submissions FOR INSERT 
WITH CHECK (true);

-- Create policy for admin (using a simple rule for now, or just allow all for the anon key if needed)
-- NOTE: In a real app, you would use service_role key for admin actions or better policies.
-- For this setup with the anon key, we'll allow standard operations if you want full control.
CREATE POLICY "Allow all for admin" 
ON submissions FOR ALL 
USING (true);
