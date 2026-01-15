Return-Path: <linux-next+bounces-9674-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4E3D23C25
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 10:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA29130504C1
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 09:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C8235FF72;
	Thu, 15 Jan 2026 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VG5PTOq5"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F1935FF68;
	Thu, 15 Jan 2026 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470852; cv=none; b=pNkzYbdxuFoKwpok9RQRHHF2ozIzHpRwGpRCS0JRiBb8OIPEB042oN/P3M08aup8uxhFIqsA5s7qTzWeqmUA0mnQJN6v2jvv4r7lCqekT1mlX9R3Ox24ifdSnK8aiwsCGsI4LhaXza4idw0NKizvEMsDhnV29oUUeqVDaee/CQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470852; c=relaxed/simple;
	bh=/LgYKHKY8Az34IxdBl7z1lyng/cdqCsjUTrf2Se546Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=POah7GWm20SVEl0bFF99j5Oiw76ZwJ8ps+74CxlFD5WHRtjVhJhb0uLfldaOfT0GwL9fJwHxfE85bP3nmyO+7RngMeJsBKOSoAz9ucrrS8bplWgQMEuh/sZDFTa9/LJ6su5veFnEFk71zf9kRvwVNnohLb+9684eAUYuJa9+fTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VG5PTOq5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768470848; x=1800006848;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/LgYKHKY8Az34IxdBl7z1lyng/cdqCsjUTrf2Se546Y=;
  b=VG5PTOq57pM3QcpOsIdCK1BXbF+Vs+umaGlhadC7aJrxJhGc0naIlhWc
   049gkj389fMdVxdHbIl39gIDN+ln9lZ04+xPKSlgWjq1uwBLzWSaJmw2y
   nA+k2KVfmNMrMRt/lTwB8tj6+p76hRyTC+di4VKZ3aQjJxRdJ8glYepoV
   QbqlVuLIw3CThJp4KHRPAmz749npFf6xaL5VIdyUx2GBDeBsKw688OPTt
   3InGuFIPxj8lYzU70iHBvnpLTM5Z8nCcduEG8Y0o1rSXO36LHOOiLg4UV
   v68cf+WwWIFT2DntN0FphX+roiWU5Qib07olJCcxfTyssci8F1QXqLGHa
   A==;
X-CSE-ConnectionGUID: FJ0/MXFySoyiIMU1RAM0xw==
X-CSE-MsgGUID: HqLXYe/uTFiYkSJ0Ng5qtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="95252332"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="95252332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 01:54:05 -0800
X-CSE-ConnectionGUID: MrtKZb2TSuCEYZ5t0MzO1A==
X-CSE-MsgGUID: +rBJCoYeSeau56CQlId2QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="235627561"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 01:54:02 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Jan 2026 11:53:59 +0200 (EET)
To: Stephen Rothwell <sfr@canb.auug.org.au>
cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
    Kees Cook <kees@kernel.org>, Nitin Joshi <nitjoshi@gmail.com>, 
    David Laight <david.laight.linux@gmail.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
In-Reply-To: <20260115145244.3836c369@canb.auug.org.au>
Message-ID: <16bc02e5-edfe-02bb-2455-9d4f76975eaf@linux.intel.com>
References: <20260115145244.3836c369@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Jan 2026, Stephen Rothwell wrote:

> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/platform/x86/lenovo/thinkpad_acpi.c: In function 'display_damage':
> drivers/platform/x86/lenovo/thinkpad_acpi.c:11134:23: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
> 11134 |         port_status = FIELD_GET(PORT_STATUS, dmg_status);
>       |                       ^~~~~~~~~
> 
> Caused by commits
> 
>   f6b6ce566954 ("platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.")
>   520448bb6f09 ("platform/x86: thinkpad_acpi: Add sysfs to display details of damaged device.")
> 
> and probably exposed by commit
> 
>   5523dcfa4f59 ("Fortify: Use C arithmetic not FIELD_xxx() in FORTIFY_REASON defines")
> 
> from the kspp tree which removed the include of bitfield.h from
> fortify-string.h.  I wonder if this will affect any other (more exotic)
> builds?
> 
> I have applied the following patch for today, and this (or something
> like it) should probably be applied to the drivers-x86 tree.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 15 Jan 2026 14:17:35 +1100
> Subject: [PATCH] fix up for "Fortify: Use C arithmetic not FIELD_xxx() in
>  FORTIFY_REASON defines"
> 
> interacting with commits
> 
>   f6b6ce566954 ("platform/x86: thinkpad_acpi: Add support to detect hardware dam
> age detection capability.")
>   520448bb6f09 ("platform/x86: thinkpad_acpi: Add sysfs to display details of da
> maged device.")
> 
> from the drivers-x86 tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 95755fa1e008..a272f27e6227 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -36,6 +36,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/backlight.h>
> +#include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
>  #include <linux/dmi.h>

Thanks Stephen.

I've folded this into the original change.

I do try to pay attention to lack of these headers during review in an 
attempt to avoid problems like this but seem to have missed it in this 
case.


-- 
 i.


