/*
 * Copyright (C) 2011-2012 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdio.h>
#include <string.h>
#include <cutils/properties.h>

/* In libhwrpc.so */
extern void huawei_oem_rapi_streaming_function(int n, int p1, int p2, int p3, int *v1, int *v2, char *v3);

static const char DRIVER_PROP_MODULE_ARG[] = "wlan.module.arg";

void SetWifiMAC(void);

int main()
{
	SetWifiMAC();
	return 0;
}

void SetWifiMAC(void)
{
	char new_wlan_mac_arg[PROPERTY_VALUE_MAX] = "mac_param=22:11:33:44:55:66";
	char old_wlan_mac_arg[PROPERTY_VALUE_MAX];
	char mac_bits[8];
	int y = 0;

	memset(mac_bits, 0, 8);

	/* Set Wi-Fi MAC address by loading it from radio. */
	huawei_oem_rapi_streaming_function(3, 0, 0, 0, 0, &y, mac_bits);

	sprintf(new_wlan_mac_arg, "mac_param=%02X:%02X:%02X:%02X:%02X:%02X",
		mac_bits[5], mac_bits[4], mac_bits[3],
		mac_bits[2], mac_bits[1], mac_bits[0]);
	printf("%s\n", new_wlan_mac_arg);

	/* If user specified a different MAC address, use it. */
	//property_get(DRIVER_PROP_MODULE_ARG, old_wlan_mac_arg, "mac_param=00:00:00:00:00:00");
	//if (old_wlan_mac_arg != new_wlan_mac_arg)
	//	property_set(DRIVER_PROP_MODULE_ARG, old_wlan_mac_arg);
	//else
		property_set(DRIVER_PROP_MODULE_ARG, new_wlan_mac_arg);
}
