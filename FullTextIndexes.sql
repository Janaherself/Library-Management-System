CREATE FULLTEXT INDEX ON [dbo].[Books]
    ([Title] LANGUAGE 1033, [Author] LANGUAGE 1033)
    KEY INDEX [PK__Books__3DE0C22759112627]
    ON [FullTextCatalog];

