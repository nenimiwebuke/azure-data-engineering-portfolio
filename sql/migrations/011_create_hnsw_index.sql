CREATE INDEX idx_reconciliation_notes_embedding_hnsw
    ON reconciliation_exceptions
    USING hnsw (notes_embedding vector_l2_ops);

COMMENT ON INDEX idx_reconciliation_notes_embedding_hnsw IS 'HNSW approximate-nearest-neighbor index for semantic similarity search on resolution_notes embeddings, using L2 (Euclidean) distance to match the <-> operator';
