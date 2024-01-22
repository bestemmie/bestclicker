#include "main.h"

bool running = true;
bool toggle = false;
int delay = 95;

// Toggle vars

void DLL_EXPORT StartPaint() {
  toggle = true;
}

void DLL_EXPORT StopPaint() {
  toggle = false;
}

void DLL_EXPORT AbortPaint() {
  running = false;
}

void DLL_EXPORT SetDelay(int d) {
  delay = d;
}

// Autoclicker

void DLL_EXPORT *StartDialog(void *args) {
  while (running) {
    if(GetAsyncKeyState(VK_LBUTTON) && toggle){
      HWND Window = GetForegroundWindow();
      try {
          if(FindWindowA(("LWJGL"), NULL) == GetForegroundWindow()) {
            SendMessageW(GetForegroundWindow(), WM_LBUTTONDOWN, MK_LBUTTON, MAKELPARAM(0, 0));
            SendMessageW(GetForegroundWindow(), WM_LBUTTONUP, MK_LBUTTON, MAKELPARAM(0, 0));
            Sleep(delay);
          }
      } catch(...) {}
    }
  }
  pthread_exit(0);
}

extern "C" DLL_EXPORT BOOL APIENTRY DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved) {
    switch (fdwReason)
    {
        case DLL_PROCESS_ATTACH:
            // attach to process
            // return FALSE to fail DLL load
            break;

        case DLL_PROCESS_DETACH:
            // detach from process
            break;

        case DLL_THREAD_ATTACH:
            // attach to thread
            break;

        case DLL_THREAD_DETACH:
            // detach from thread
            break;
    }
    return TRUE; // succesful
}
