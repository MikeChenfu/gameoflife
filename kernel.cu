__global__ void GameofLife(int *GPUgrid,  int select, int width, int height){


     int outRow= blockIdx.x*TILE_SIZE + threadIdx.x;
     int outCol= blockIdx.y*TILE_SIZE + threadIdx.y;
     int count=0;

     __shared__  int GPUgrid_shin[BLOCK_SIZE][BLOCK_SIZE];

     int inRow = outRow-1;
     int inCol = outCol-1;

     if(inRow >= 0 && inRow < width && inCol >= 0 && inCol < height){
        GPUgrid_shin[threadIdx.y][threadIdx.x]=GPUgrid[select*width*height+inCol*width+inRow];
     } else{
        GPUgrid_shin[threadIdx.y][threadIdx.x] = 0;
    }
       __syncthreads();

    int tidx=threadIdx.x+1;
    int tidy=threadIdx.y+1;

    if(threadIdx.x < TILE_SIZE && threadIdx.y < TILE_SIZE && outRow<width && outCol<height) {
        count=GPUgrid_shin[tidy+1][tidx]+GPUgrid_shin[tidy-1][tidx]+GPUgrid_shin[tidy][tidx+1]+GPUgrid_shin[tidy][tidx-1]+GPUgrid_shin[tidy+1][tidx+1]+GPUgrid_shin[tidy-1][tidx-1]+GPUgrid_shin[tidy-1][tidx+1]+GPUgrid_shin[ tidy+1][tidx-1];
        if(GPUgrid_shin[tidy][tidx]==0){
            if(count==3) {
                GPUgrid[(1-select)*height*width+outCol*width+outRow]=1;
            } else {
                GPUgrid[(1-select)*height*width+outCol*width+outRow]=0;
            }
        } else {
            if(count<=1||count>=4) {
                GPUgrid[(1-select)*height*width+outCol*width+outRow]=0;
            } else {
                GPUgrid[(1-select)*height*width+outCol*width+outRow]=1;
            }
        }
    }
}




























