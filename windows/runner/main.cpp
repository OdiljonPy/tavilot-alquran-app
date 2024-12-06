#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <windows.h>
#include "flutter_window.h"
#include "utils.h"

// Forward declaration for sending deep link to a running instance.
bool SendAppLinkToInstance(const std::wstring& title);
void SendAppLink(HWND hwnd);

// Function to send the deep link to the already running instance of the app.
bool SendAppLinkToInstance(const std::wstring& title) {
    // Locate the main window of the running instance.
    HWND hwnd = ::FindWindow(L"FLUTTER_RUNNER_WIN32_WINDOW", title.c_str());
    if (hwnd) {
        SendAppLink(hwnd);

        // Restore or bring the window to the foreground.
        WINDOWPLACEMENT place = { sizeof(WINDOWPLACEMENT) };
        GetWindowPlacement(hwnd, &place);

        switch (place.showCmd) {
            case SW_SHOWMAXIMIZED:
                ShowWindow(hwnd, SW_SHOWMAXIMIZED);
                break;
            case SW_SHOWMINIMIZED:
                ShowWindow(hwnd, SW_RESTORE);
                break;
            default:
                ShowWindow(hwnd, SW_NORMAL);
                break;
        }

        SetWindowPos(hwnd, HWND_TOP, 0, 0, 0, 0, SWP_SHOWWINDOW | SWP_NOSIZE | SWP_NOMOVE);
        SetForegroundWindow(hwnd);

        return true;
    }

    return false;
}

// Main entry point of the application.
int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
        _In_ wchar_t* command_line, _In_ int show_command) {
// Check if there is already a running instance and send the deep link.
if (SendAppLinkToInstance(L"al_quran")) {
return EXIT_SUCCESS;
}

// Attach a console for debugging if no console is attached and a debugger is present.
if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
CreateAndAttachConsole();
}

// Initialize COM for Windows.
::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

// Configure the Flutter Dart project.
flutter::DartProject project(L"data");

// Retrieve and pass command-line arguments to the Flutter app.
std::vector<std::string> command_line_arguments = GetCommandLineArguments();
project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

// Create the Flutter window.
FlutterWindow window(project);
Win32Window::Point origin(10, 10);
Win32Window::Size size(1280, 720);
if (!window.Create(L"al_quran", origin, size)) {
return EXIT_FAILURE;
}
window.SetQuitOnClose(true);

// Main message loop.
::MSG msg;
while (::GetMessage(&msg, nullptr, 0, 0)) {
::TranslateMessage(&msg);
::DispatchMessage(&msg);
}

// Clean up COM.
::CoUninitialize();
return EXIT_SUCCESS;
}

// Function to send the deep link to the Flutter app instance.
void SendAppLink(HWND hwnd) {
    COPYDATASTRUCT cds;
    std::wstring deep_link = L"al_quran://example"; // Example deep link, replace as needed.
    cds.dwData = 1; // Custom data identifier (can be used to specify deep link type).
    cds.cbData = static_cast<DWORD>((deep_link.size() + 1) * sizeof(wchar_t));
    cds.lpData = const_cast<wchar_t*>(deep_link.c_str());

    // Send the deep link data to the running app instance.
    SendMessage(hwnd, WM_COPYDATA, 0, reinterpret_cast<LPARAM>(&cds));
}
