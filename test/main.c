#include <windows.h>

#define ID_DOWNLOAD 1001

void DownloadFile(HWND hwnd)
{
    STARTUPINFO si;
    PROCESS_INFORMATION pi;

    ZeroMemory(&si, sizeof(si));
    ZeroMemory(&pi, sizeof(pi));

    si.cb = sizeof(si);
    si.dwFlags = STARTF_USESHOWWINDOW;
    si.wShowWindow = SW_HIDE;

    char cmd[] =
        "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass "
        "-Command \"Invoke-WebRequest "
        "-Uri 'https://github.com/DivanshLpu/gaba/releases/download/1.3.7/gaba-v1.3.7-windows.zip' "
        "-OutFile 'gaba-v1.3.7-windows.zip'\"";

    if (CreateProcess(
            NULL,
            cmd,
            NULL,
            NULL,
            FALSE,
            CREATE_NO_WINDOW,
            NULL,
            NULL,
            &si,
            &pi))
    {
        WaitForSingleObject(pi.hProcess, INFINITE);

        CloseHandle(pi.hProcess);
        CloseHandle(pi.hThread);

        MessageBox(hwnd,
                   "Download completed successfully!",
                   "Success",
                   MB_OK | MB_ICONINFORMATION);
    }
    else
    {
        MessageBox(hwnd,
                   "Failed to start PowerShell.",
                   "Error",
                   MB_OK | MB_ICONERROR);
    }
}

LRESULT CALLBACK WindowProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    switch (msg)
    {
    case WM_CREATE:
        CreateWindow(
            "BUTTON",
            "Download",
            WS_VISIBLE | WS_CHILD | BS_PUSHBUTTON,
            80, 60,
            120, 35,
            hwnd,
            (HMENU)ID_DOWNLOAD,
            GetModuleHandle(NULL),
            NULL);
        return 0;

    case WM_COMMAND:
        if (LOWORD(wParam) == ID_DOWNLOAD)
        {
            DownloadFile(hwnd);
        }
        return 0;

    case WM_DESTROY:
        PostQuitMessage(0);
        return 0;
    }

    return DefWindowProc(hwnd, msg, wParam, lParam);
}

int WINAPI WinMain(HINSTANCE hInstance,
                   HINSTANCE hPrevInstance,
                   LPSTR lpCmdLine,
                   int nCmdShow)
{
    WNDCLASS wc;

    ZeroMemory(&wc, sizeof(wc));

    wc.lpfnWndProc = WindowProc;
    wc.hInstance = hInstance;
    wc.lpszClassName = "DownloaderWindow";
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);

    RegisterClass(&wc);

    HWND hwnd = CreateWindow(
        "DownloaderWindow",
        "GitHub Downloader",
        WS_OVERLAPPEDWINDOW,
        CW_USEDEFAULT,
        CW_USEDEFAULT,
        320,
        180,
        NULL,
        NULL,
        hInstance,
        NULL);

    ShowWindow(hwnd, nCmdShow);
    UpdateWindow(hwnd);

    MSG msg;

    while (GetMessage(&msg, NULL, 0, 0))
    {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }

    return msg.wParam;
}
