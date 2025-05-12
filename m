Return-Path: <linux-next+bounces-6696-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD25AB33F1
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 11:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4A241895F9D
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 09:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF5525D53A;
	Mon, 12 May 2025 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="MhwM3Rsc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD99194AD5;
	Mon, 12 May 2025 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043269; cv=none; b=Met+HKRWMztVLmrvdGbr/JH0aBKqMAOfFHioqzLgOWAroL9R/QkFF+Y44EgorZMBydairNP6jAQqm1Qmdj69qhFExLlf5wRHyb3pbVLdJH94cKmhUs1FBvxGt6mL5QUY/PLQtr/q50Z2UtGM1KpOvWcFKopR0R5Ff+hG/Wvfo1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043269; c=relaxed/simple;
	bh=EmY3EzB/k2sot7wDh1oUDWpw47DKn9Qo5MAZkmotugE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGZ/+quwlhRW1KpU4flXMppFL8OWMBIfy5IicFoPddSBQBWzZPrNSzPAZyqrW2/8tywk3wrFTQpxic15hQs3WLQ7piK4EPoIzjM+ihg/b4KMys6ge6CLd/o+nwDRDlNvNsQvgS2orUb1R6Wkg/lXzekyy4DYL/rsEGZGZ1sGUdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=MhwM3Rsc; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [10.6.0.9] (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 90BA72FC0059;
	Mon, 12 May 2025 11:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1747043258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uYLLkNcgE6xVmY905H5hkWSm0HEuEBbP2soYWOaazoQ=;
	b=MhwM3Rscdli8bCa10KY+3dhBzo5vggrjuYfI9x/TUPmfzZ46+uH2jSN12VS0HhGTF99GVF
	YZoUednRZld7xp9bpBFJc7IhkyhH4l129bwEF7F3U5dBiIrpCt9+FTY1ff7e9FIF43solW
	duXkibsRoD9k5tFyq4f6bYxtJcImLOs=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <353a7bee-6ecc-4ab8-b72e-e33a9195a9af@tuxedocomputers.com>
Date: Mon, 12 May 2025 11:47:36 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 9
 (drivers/platform/x86/tuxedo/nb04/wmi_ab.o)
To: Armin Wolf <W_Armin@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250509195816.7f0a67a3@canb.auug.org.au>
 <a1d9134f-0567-4a53-a1e7-a55cd6b189a9@infradead.org>
 <52a2c1f9-0267-42d0-8e46-31eea58f88a8@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <52a2c1f9-0267-42d0-8e46-31eea58f88a8@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 12.05.25 um 01:00 schrieb Armin Wolf:
> Am 10.05.25 um 03:35 schrieb Randy Dunlap:
>
>>
>> On 5/9/25 2:58 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20250508:
>>>
>> When CONFIG_HID is not set:
>>
>> ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tux_remove':
>> wmi_ab.c:(.text+0x29): undefined reference to `hid_destroy_device'
>> ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tux_probe':
>> wmi_ab.c:(.text+0x6a): undefined reference to `hid_allocate_device'
>> ld: wmi_ab.c:(.text+0xbc): undefined reference to `hid_add_device'
>> ld: wmi_ab.c:(.text+0xf3): undefined reference to `hid_destroy_device'
>> ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tux_ll_parse':
>> wmi_ab.c:(.text+0x46e): undefined reference to `hid_parse_report'
>>
>> When CONFIG_ACPI or CONFIG_ACPI_WMI is not set:
>>
>> ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function 
>> `tuxedo_nb04_wmi_tux_init':
>> wmi_ab.c:(.init.text+0x20): undefined reference to `__wmi_driver_register'
>> ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function 
>> `tuxedo_nb04_wmi_tux_exit':
>> wmi_ab.c:(.exit.text+0x9): undefined reference to `wmi_driver_unregister'
>> ld: drivers/platform/x86/tuxedo/nb04/wmi_util.o: in function 
>> `__wmi_method_buffer_out.constprop.0':
>> wmi_util.c:(.text+0x3a): undefined reference to `wmidev_evaluate_method'
>>
> Hi,
>
> i think this happens because CONFIG_TUXEDO_NB04_WMI_AB does not declare any 
> dependencies at all.
> I would prefer if the original author would send the necessary fix, otherwise 
> i can do it too.
on it
>
> Thanks,
> Armin Wolf
>

