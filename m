Return-Path: <linux-next+bounces-6234-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CE6A88EEA
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 00:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15FA2164A3F
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 22:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8544A1EEA43;
	Mon, 14 Apr 2025 22:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oJC+8jyl"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16440E571;
	Mon, 14 Apr 2025 22:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744668714; cv=none; b=W1tqjQzyyJKn+UGc7VQGqK/5m5p0BMEvueC79DSp4kfPVfw3Rh2RQ+RT/mI2GBdlyDoBBWV3RPdEOISmllROHJuvz9uupfwGvPWzkgfb5WcPcNytqYzP2o5c2wsBM2HhOT58fMcUxJD3xMg8Gmny731dqybW4MwaJk9k+wxoW0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744668714; c=relaxed/simple;
	bh=k78aO71VwXV3VhVGkqjnqrWEjDWs3BGPBpcty/vqSYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vep7emfpsb9O/mG8ofmLzXfbT7H6ZpgsD67bF+ymF5JKWhNT95Kgsfrm4ZdBoi9hq0aIvQJF68qCmuuGyYfLCT3GRI//Yel6uVryHwyh74qbxdeLHSf3v0DAG3C/BnC+0kllfobi9AQad6wWLCIaoQVOX7az9KnbkGDF6Rk0FQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oJC+8jyl; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=lFM9jmiQCKyK4Xh/VS5r4oD9hHB5yb9nH71KVJTJ2E8=; b=oJC+8jylmyhZjZGkDjjV4ipph4
	iMfms8hgcBrjAuExcBVp9thFNixDTYO1KfnmLgcDoOxIjaHeg6qc7rzxT9dAk7g4bvwVOOZFnyNlH
	cLczQD/hUzHYpdilzXksomyqIbOTcAc5L2AxiWh2+l4FQsuK7FlIMEiPqVTvbPmkYA4uHizuxBGbT
	8sYaw+XQM1uJIdWkcqchDhAU7XP6L4JDfR3ORs3Ht/7xi3wttmGmM+Apla9V8cEwflDiUNPCzEibc
	RXvBFjZM0U3LI0mJlw9Os6bc7/p6HCwPt8sYPOG161KhNTigPMd5+y9LSWMcNUYdNM9vrYCObWiqQ
	8r2pTrCQ==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4S1k-0000000210Z-3nDA;
	Mon, 14 Apr 2025 22:11:43 +0000
Message-ID: <50641692-3f78-47ef-aceb-042b340f0559@infradead.org>
Date: Mon, 14 Apr 2025 15:11:29 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/chrome: cros_kbd_led_backlight: Fix build
 dependencies
To: Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org,
 sfr@canb.auug.org.au
Cc: chrome-platform@lists.linux.dev, linux-next@vger.kernel.org,
 srosek@chromium.org
References: <20250414132427.204078-1-tzungbi@kernel.org>
 <20250414132427.204078-3-tzungbi@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250414132427.204078-3-tzungbi@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/14/25 6:24 AM, Tzung-Bi Shih wrote:
> ccf395bde6ae ("platform/chrome: cros_ec_proto: Allow to build as module")
> allows CROS_EC_PROTO to be a module.
> 
> The config is possible to be:
> - CONFIG_ACPI=y
> - CONFIG_CROS_EC=m
> - CONFIG_MFD_CROS_EC_DEV=m
> - CONFIG_CROS_EC_PROTO=m
> - CONFIG_CROS_KBD_LED_BACKLIGHT=y
> 
> As a result:
> ld: vmlinux.o: in function `keyboard_led_set_brightness_ec_pwm':
> cros_kbd_led_backlight.c:(.text+0x3554e4c): undefined reference to `cros_ec_cmd_xfer_status'
> ld: vmlinux.o: in function `keyboard_led_get_brightness_ec_pwm':
> cros_kbd_led_backlight.c:(.text+0x3554f41): undefined reference to `cros_ec_cmd_xfer_status'
> 
> The built-in code in CROS_KBD_LED_BACKLIGHT can't find symbols defined in
> the module CROS_EC_PROTO.
> 
> Let A=ACPI (bool), M=MFD_CROS_EC_DEV (tristate), and
> K=CROS_KBD_LED_BACKLIGHT (tristate).  The possible values are:
> 
> | A | M | choice for K |
> ------------------------
> | y | y | y/m/n        |
> | y | m | m/n          |
> | y | n | y/m/n        |
> | n | y | y/m/n        |
> | n | m | m/n          |
> | n | n | n            |
> 
> Fix the dependencies in the Kconfig.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/chrome-platform/ed8adc69-c505-4108-bf63-92911b0395c7@infradead.org/T/#u
> Fixes: ccf395bde6ae ("platform/chrome: cros_ec_proto: Allow to build as module")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>


Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/platform/chrome/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index 1614b9d3c5c2..10941ac37305 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -161,7 +161,8 @@ config CROS_EC_PROTO
>  
>  config CROS_KBD_LED_BACKLIGHT
>  	tristate "Backlight LED support for Chrome OS keyboards"
> -	depends on LEDS_CLASS && (ACPI || MFD_CROS_EC_DEV)
> +	depends on LEDS_CLASS
> +	depends on MFD_CROS_EC_DEV || (MFD_CROS_EC_DEV=n && ACPI)
>  	help
>  	  This option enables support for the keyboard backlight LEDs on
>  	  select Chrome OS systems.

-- 
~Randy

