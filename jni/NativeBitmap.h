/*
 * Copyright 2013, Rory Hool
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <android/log.h>
#include <GraphicsJNI.h>

class NativeBitmap {
public:
   NativeBitmap( JNIEnv* env, jobject jbitmap ) {
   	
      // This class, SkBitmap is declared in /external/skia/include/core/SkBitmap.h
      //                      and defined in /external/skia/src/core/SkBitmap.cpp
      SkBitmap* bm = GraphicsJNI::getNativeBitmap( env, jbitmap );

      __android_log_print(ANDROID_LOG_DEBUG, "NativeBitmap", "Loaded bitmap has width = %d, height = %d", bm->width(), bm->height() );

      delete bm;
   }
};
