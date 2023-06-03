CREATE TABLE profiles (
    id UUID REFERENCES auth.users NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE,
    username TEXT UNIQUE,
    avatar_url TEXT,
    website TEXT,
    PRIMARY KEY (id),
    UNIQUE(username),
    CONSTRAINT username_length CHECK (char_length(username) >= 3)
);

ALTER TABLE
    profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public profiles are viewable by the owner." ON profiles FOR
SELECT
    USING (auth.uid() = id);

CREATE POLICY "Users can insert their own profile." ON profiles FOR
INSERT
    WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can update own profile." ON profiles FOR
UPDATE
    USING (auth.uid() = id);

-- Set up Realtime
BEGIN;

DROP PUBLICATION IF EXISTS supabase_realtime;

CREATE PUBLICATION supabase_realtime;

COMMIT;

ALTER PUBLICATION supabase_realtime
ADD
    TABLE profiles;

-- Set up Storage
INSERT INTO
    storage.buckets (id, name)
VALUES
    ('avatars', 'avatars');

CREATE POLICY "Avatar images are publicly accessible." ON storage.objects FOR
SELECT
    USING (bucket_id = 'avatars');

CREATE POLICY "Anyone can upload an avatar." ON storage.objects FOR
INSERT
    WITH CHECK (bucket_id = 'avatars');

CREATE POLICY "Anyone can update an avatar." ON storage.objects FOR
UPDATE
    WITH CHECK (bucket_id = 'avatars');