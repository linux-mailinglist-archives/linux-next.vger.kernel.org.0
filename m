Return-Path: <linux-next+bounces-6233-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69689A88EE9
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 00:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22EBF3AB7B5
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 22:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654101EEA59;
	Mon, 14 Apr 2025 22:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hMA4HNAs"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1091EEA4A;
	Mon, 14 Apr 2025 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744668688; cv=none; b=gQYy0nI08T38fA5gYknEcJIEWVZrpoQtW4AQMzBpWoMsdFaLWqIfSdfU8UHNQeB5m/FSR5Dke5tfJMG9i0j3i6c5YKUEg6LlQljR9RbQbj5dfDMH4jdIWR72cOkXMsqZvj9KssURdBSUmyj3kpPB7Qf22kodsWOmQ8shjkvujFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744668688; c=relaxed/simple;
	bh=cUE0zAXa5hPMBecTRoOdIjynzPgDmGWYiPP0wgNUr9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrkcXK8cE8pWu6GzXUvh0t6Kb+ygSxzfKtUhVtok9LDGTW6c9MQQ9zv5YgH4Y78WyYK3A84kxqq4qW4DK7Pc5931dHHgW2xL7R6PAOK67Yvyx7g8IsJP8m0waYS2hc/reB9qZKAAgJMS4O0KbkN0EOYI/dWYF1thZ1gQ/PL0GpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hMA4HNAs; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Qxgdw+lYOjcGfLOYm1309qvR8kFdtfIB0s1YyPFtgnM=; b=hMA4HNAsuszo2WRXcLtSnJXKU1
	SGGC1s1g9cSVVyZZLGgcm6lqSzDbNp53UngYqzDjgDMxa/+I2svgE9kdPtSTNg/Q120ieO4lny3bb
	9vNnTrQcQPYE6RZkcQMQ8F5reca/g9375EPLVBiqdDjqC8MGVIkl4KL6RH+5ImFJh3GFeUcJdCZS3
	6WMI5PwaSig7NEH4dShgd7yegjTeT8nBZBvTTu5KWYLxapiQReDG2A5m+PJxbVOBH3jaS5nW7M4VM
	0qUEpwLG4CId17a0lgM8awIQZCQwEuMzCYhpOHOd1eEuX68zjceKZ+y80OYbv13Y0X7WoOgarZUWz
	1YnCNsgA==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4S1B-00000001zOI-2v8T;
	Mon, 14 Apr 2025 22:11:06 +0000
Message-ID: <8c011b58-b9da-417f-80db-440f21a94fec@infradead.org>
Date: Mon, 14 Apr 2025 15:10:44 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/chrome: cros_kbd_led_backlight: Remove
 CROS_EC dependency
To: Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org,
 sfr@canb.auug.org.au
Cc: chrome-platform@lists.linux.dev, linux-next@vger.kernel.org,
 srosek@chromium.org
References: <20250414132427.204078-1-tzungbi@kernel.org>
 <20250414132427.204078-2-tzungbi@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250414132427.204078-2-tzungbi@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/14/25 6:24 AM, Tzung-Bi Shih wrote:
> After applying 3a1d61dc3202 ("platform/chrome: cros_kbd_led_backlight:
> Remove OF match"), cros_kbd_led_backlight no longer depends on CROS_EC
> directly.
> 
> Remove the redundant dependency.
> 
> Fixes: 3a1d61dc3202 ("platform/chrome: cros_kbd_led_backlight: Remove OF match")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/platform/chrome/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index f523ae3d3be0..1614b9d3c5c2 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -161,7 +161,7 @@ config CROS_EC_PROTO
>  
>  config CROS_KBD_LED_BACKLIGHT
>  	tristate "Backlight LED support for Chrome OS keyboards"
> -	depends on LEDS_CLASS && (ACPI || CROS_EC || MFD_CROS_EC_DEV)
> +	depends on LEDS_CLASS && (ACPI || MFD_CROS_EC_DEV)
>  	help
>  	  This option enables support for the keyboard backlight LEDs on
>  	  select Chrome OS systems.

-- 
~Randy

