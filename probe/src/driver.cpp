#include <ntddk.h>

extern "C" NTSTATUS DriverEntry(PDRIVER_OBJECT DriverObject, PUNICODE_STRING RegistryPath) {
    UNREFERENCED_PARAMETER(RegistryPath);
    DriverObject->DriverUnload = nullptr;
    DbgPrint("[probedrv] loaded WDK CI probe\n");
    return STATUS_SUCCESS;
}
