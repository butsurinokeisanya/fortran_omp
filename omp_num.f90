program omp_thread_example
   use omp_lib
   implicit none


   ! 宣言
   integer :: num_threads, thread_id

   ! 並列領域
   !$omp parallel private(thread_id)
   ! スレッド番号を取得
   thread_id = omp_get_thread_num()

   ! スレッド数を取得 (マスタースレッドのみ取得)
   !$omp master
   num_threads = omp_get_num_threads()
   print *, 'Total number of threads = ', num_threads
   !$omp end master

   ! 各スレッドの番号を出力
   print *, 'Thread ID = ', thread_id, ' out of ', omp_get_num_threads()
   !$omp end parallel

end program omp_thread_example
