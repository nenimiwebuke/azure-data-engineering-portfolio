ALTER TABLE reconciliation_exceptions
    ADD COLUMN notes_embedding vector(5);

COMMENT ON COLUMN reconciliation_exceptions.notes_embedding IS 'Embedding vector for resolution_notes, used for semantic similarity search; dimension 5 used for portfolio demonstration purposes (real embedding models typically use 384-1536+ dimensions)';
