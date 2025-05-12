Return-Path: <linux-next+bounces-6700-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 218A6AB35C5
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 13:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D952166B4B
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 11:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5616028FA8C;
	Mon, 12 May 2025 11:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="K9JuLQD/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDCB1A317E;
	Mon, 12 May 2025 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747048620; cv=none; b=M70SwCl8deP3MAk/9jLmcPfJ3azOowcTaFVfbXt52li/lhygHT85if3oNV16kJw1Ud1kqEOgdccNavStCchtfKnHb/LCRqnkiC9hj0PR+tWgEv/TQIVfhB8IPHVphk5x+lHtfoZIqNT5wUzhfocndR/mNvBqJpnSsyUouOLQYgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747048620; c=relaxed/simple;
	bh=3wzm5zKhzRwPy1TOo6OuAi+jr29yU5rzaR79WE1JnWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdboyDyRzothMWA0C/D87HJHluXNvh7Re8nk8KWzTB5J+8a1UiKruzdWqithDF96RUticVgjV/jZSNA2SrpkEDmOzop7Suj7oPvywoWwrc0amobf1YtatiAqmj4LRhr/hfHLZ0I1rr37oMxWnLtJrs9VWi9z9yLJYYdZTfq0FxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=K9JuLQD/; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [10.6.0.9] (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 6B2462FC0050;
	Mon, 12 May 2025 13:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1747048614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhoD5nr/dKE9e3kjaWm/04GMga17VvIHcmhWwRDN1QY=;
	b=K9JuLQD/s9do3XL6Hx4d/i1+Dl9wvYp8oYTy5zINmk/rNhAAgb24YMrlL7Sbn1bxlb51uu
	JPkqugoQ82576XLKlrtC/xa0VHSRGoMmz3LB82B8gqsomnKj0GG+a2LWk5EeSQfb1D/lfG
	T1cWKhTiwwy9w2SvSYkI/kXJaleHreo=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <715d3f5f-e138-41c2-a7eb-359b2fe6e6c0@tuxedocomputers.com>
Date: Mon, 12 May 2025 13:16:53 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/tuxedo: Prevent invalid Kconfig state
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 W_Armin@gmx.de, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250512105028.25265-1-wse@tuxedocomputers.com>
 <f9144357-22b1-c1f2-f982-63de8afaef7f@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <f9144357-22b1-c1f2-f982-63de8afaef7f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 12.05.25 um 12:57 schrieb Ilpo Järvinen:
> On Mon, 12 May 2025, Werner Sembach wrote:
>
>> It was possible to create a uncompileable config, because of missing
>> "Depends on" statements in the new Kconfig of the TUXEDO platform driver.
>>
>> For reference:
>> https://lore.kernel.org/all/a1d9134f-0567-4a53-a1e7-a55cd6b189a9@infradead.org/
> Please add a Reported-by tag and you can put that URL into Link: tag.
Ok
>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/tuxedo/nbxx/Kconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/tuxedo/nbxx/Kconfig b/drivers/platform/x86/tuxedo/nbxx/Kconfig
>> index 1701374a039d2..9eecbe8127df7 100644
>> --- a/drivers/platform/x86/tuxedo/nbxx/Kconfig
>> +++ b/drivers/platform/x86/tuxedo/nbxx/Kconfig
> Eh, what's this path? There's only nb04/.
Sorry brainfail was on the wrong branch, just looks almost the same
>
>> @@ -7,6 +7,8 @@
>>   
>>   config TUXEDO_NBXX_ACPI_TUXI
>>   	tristate "TUXEDO NBxx ACPI TUXI Platform Driver"
>> +	depends on ACPI_WMI
>> +	depends on HID
>>   	help
>>   	  This driver implements the ACPI TUXI device found on some TUXEDO
>>   	  notebooks. This enables the control of built-in fans via HWMON.
>>

