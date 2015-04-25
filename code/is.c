/* Because the distribution of the number 
   of keys in the buckets is Gaussian,
   the use of a dynamic schedule should
   improve load balance, thus, performance */
#ifdef SCHED_CYCLIC
|\label{lst:is-cyclic}|#pragma omp for schedule(static,1)
#else
#pragma omp for schedule(dynamic)
#endif
for( i=0; i< NUM_BUCKETS; i++ ) {
  k1 = i * num_bucket_keys;
  k2 = k1 + num_bucket_keys;
  for ( k = k1; k < k2; k++ )
    key_buff1[k] = 0;

  |\label{lst:is-gaus}| m = (i > 0)? bucket_ptrs[i-1] : 0;
  for ( k = m; k < bucket_ptrs[i]; k++ )
    key_buff1[key_buff2[k]]++; |\label{lst:is-gaus-end}|

  key_buff1[k1] += m;
  for ( k = k1+1; k < k2; k++ )
    key_buff1[k] += key_buff1[k-1];
}
