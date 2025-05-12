Return-Path: <linux-next+bounces-6699-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5EFAB3574
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 13:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B07DA861B78
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 10:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A86267B92;
	Mon, 12 May 2025 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3puF7hC"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74A267B85;
	Mon, 12 May 2025 10:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747047428; cv=none; b=KhP8QXtqUoSFmrpq5+Zlgd38F7ZFtpq08KVDsVM5L+utjDsPXUpjKS9TMbNOvWmY3ZwrmmszroGSzcAa6Lyug4/dGYHjKzK+6yZkmDU1S4ig3DmQG0QJkKzukElif4L/5K5DWIEPi84ek1ZG4Z1Wom8/4yyO0+MKWbN8MCyb/+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747047428; c=relaxed/simple;
	bh=BRbPhQkLWkKu3/AtsGssJ8XaeTuIhwkKxmYYT8rMgCw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uOp5vFaSzjbIlFW6aspMl0fgpuob5TIlEATtC7O9W8JbH/jH8Zzfj5nWpmBQOQHV6uhmDxxk/vWN58JvxbQ6TTNHVe6tEcNSYfEAey8Iyb2oJ5UdJx21mwWPEMYVd7wlW72WEM7WpBdkiiSJyeLAqsRinNWr03JIsexyCIHl1PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3puF7hC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747047427; x=1778583427;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BRbPhQkLWkKu3/AtsGssJ8XaeTuIhwkKxmYYT8rMgCw=;
  b=j3puF7hC1Ph+AWewMJ1qkwvzT5QYKCsnTbw6ko+QkEXzFd7Yx6lwJZU2
   eMiFCHzhfjsWhBnoB1PB5gQ2BPmsm3ATg3TjkxS/o68nzBowYO8jWtdHq
   RcBfcwJe3JFHFlgLDGQ73Gk6T1WJ10oMfZy89yHL0dIvX7YB++NnS0Gwb
   MJyNQo2JxHJZ4BRqBkl1OqtGDYnOk/Z7iue9QMqXzLjI0QGqBHjs2nObc
   AKXtUrmpYm2nG006RVn3MuWg/FlnkUNEKA4lmD/boV78VaOMXrdqosqp3
   SeokCLeGPz+WPH6OzK/lu0yI5hVly8QUn2ADECZVdo2WcJcmStlUnPFiQ
   A==;
X-CSE-ConnectionGUID: khQ/Td3OQE6vMWZS5VprNg==
X-CSE-MsgGUID: a4SWyXCiRiyN3FfsWiBtGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="59501965"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="59501965"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 03:57:06 -0700
X-CSE-ConnectionGUID: OxBPLWglT8amiCTcT6PwGw==
X-CSE-MsgGUID: BgJ94THHR9iEVol07LlObQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="141378652"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 03:57:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 May 2025 13:57:00 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: rdunlap@infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, 
    W_Armin@gmx.de, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/tuxedo: Prevent invalid Kconfig state
In-Reply-To: <20250512105028.25265-1-wse@tuxedocomputers.com>
Message-ID: <f9144357-22b1-c1f2-f982-63de8afaef7f@linux.intel.com>
References: <20250512105028.25265-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 May 2025, Werner Sembach wrote:

> It was possible to create a uncompileable config, because of missing
> "Depends on" statements in the new Kconfig of the TUXEDO platform driver.
> 
> For reference:
> https://lore.kernel.org/all/a1d9134f-0567-4a53-a1e7-a55cd6b189a9@infradead.org/

Please add a Reported-by tag and you can put that URL into Link: tag.

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/platform/x86/tuxedo/nbxx/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/tuxedo/nbxx/Kconfig b/drivers/platform/x86/tuxedo/nbxx/Kconfig
> index 1701374a039d2..9eecbe8127df7 100644
> --- a/drivers/platform/x86/tuxedo/nbxx/Kconfig
> +++ b/drivers/platform/x86/tuxedo/nbxx/Kconfig

Eh, what's this path? There's only nb04/.

> @@ -7,6 +7,8 @@
>  
>  config TUXEDO_NBXX_ACPI_TUXI
>  	tristate "TUXEDO NBxx ACPI TUXI Platform Driver"
> +	depends on ACPI_WMI
> +	depends on HID
>  	help
>  	  This driver implements the ACPI TUXI device found on some TUXEDO
>  	  notebooks. This enables the control of built-in fans via HWMON.
> 

-- 
 i.


