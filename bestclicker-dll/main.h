#ifndef __MAIN_H__
#define __MAIN_H__

#include <windows.h>
#include <pthread.h>

#ifdef BUILD_DLL
    #define DLL_EXPORT __declspec(dllexport)
#else
    #define DLL_EXPORT __declspec(dllimport)
#endif


#ifdef __cplusplus
extern "C" {
  #endif

  void DLL_EXPORT StartPaint();
  void DLL_EXPORT StopPaint();
  void DLL_EXPORT AbortPaint();
  void DLL_EXPORT SetDelay(int d);

  void DLL_EXPORT *StartDialog(void *args);

  #ifdef __cplusplus
}
#endif

#endif
