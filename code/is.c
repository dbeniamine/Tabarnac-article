|\label{lst:is-sched}|#pragma omp for schedule(dynamic)
for( i=0; i< NUM_BUCKETS; i++ ) {
  ...
  for ( k = m; k < bucket_ptrs[i]; k++ )
    key_buff1[key_buff2[k]]++; |\label{lst:is-gaus-end}|
  ...
}
