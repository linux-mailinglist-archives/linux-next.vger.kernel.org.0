Return-Path: <linux-next+bounces-6786-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA69AB80E4
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 10:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FCB74E2FDC
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 08:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63D12882D5;
	Thu, 15 May 2025 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHSfYGtH"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CE42882A8;
	Thu, 15 May 2025 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297982; cv=none; b=T+/Srkxn5SJVK/TdL+RGb4eO6F3b9+hGpd/7T4jde8wbadO4RAgCdqRSdXDauXQd1220Vhv7mKt+2KZUMYyT66Wd6Vf+VhluxBP9el3azGKnwrycvWc4LNguL+b4SiaTI/514vwfRxhJ4QJKAAWZ8RiW6Y2Hni5rJ6dJPYzgWAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297982; c=relaxed/simple;
	bh=6NRsKlPEJLGQR0EIbLTd7Yy+oRiBQo/LcI5cvx1skd0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=buy3jA/lIuelDsrFftfaVwUihR8yLvJ0119Hs4iw8VVsR/Qu+dN++PanLiWnxg+RbpwtH9UF4JeA/YMUjvPP+lK9hl2mr7pVj0UcR9BF0bjF9CoIhmzNtCi0i2t8EKXu2i9tjJ3SAEYm5g1M11nKgVSu01tKZczPX80hqRhL6jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHSfYGtH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747297981; x=1778833981;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6NRsKlPEJLGQR0EIbLTd7Yy+oRiBQo/LcI5cvx1skd0=;
  b=EHSfYGtHBXPifjq19vwQYO/TUY3CqwZvYSTOOT7SB9papwQsYpUp2ebO
   zpud6ueyrkBaGeEKg3mhqdxM017BFkNOJQs7dXNyK/x9N35rljq6shTL/
   jQ2t1PggUqHTu+RhaSwSozzRREcj1MjT3rNtedRnN7zqCr8j5gC9GzTNz
   VYdFfePoWwKQsnWTi9vO3aE0wfMHpvDhaLhSspo19cWuZCR+0UPAJwpNZ
   kMYlr+YMiYa5hUh53q2H5c3NkCw0Jr4XGaSJxtH9FnZ7Ju/tP+uBWDH+s
   PrxLVBrNI2oLDGLA3+EbtoPIQCjGWIybvUh70m3qN+w9BRfP/cC3hNZ/U
   A==;
X-CSE-ConnectionGUID: SrMLDp4sRTK3HEpxJmaeWw==
X-CSE-MsgGUID: 8XR+jLiSRl6ZPAhQFnNuQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49157528"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="49157528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:33:00 -0700
X-CSE-ConnectionGUID: 1Oyy/5PVTe+K7w51lFPXcA==
X-CSE-MsgGUID: DjREWa3HTga7QfxE+EMplA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="139298073"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:32:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 May 2025 11:32:53 +0300 (EEST)
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@kernel.org>, 
    PDx86 ML <platform-driver-x86@vger.kernel.org>, 
    Suma Hegde <suma.hegde@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>, x86@kernel.org, 
    Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
    Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
In-Reply-To: <20250515164620.071d70e3@canb.auug.org.au>
Message-ID: <bce51c8f-56c2-3a44-b590-149627398b7a@linux.intel.com>
References: <20250515164620.071d70e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 May 2025, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/platform/x86/amd/hsmp/hwmon.c: In function 'hsmp_hwmon_write':
> drivers/platform/x86/amd/hsmp/hwmon.c:38:16: error: implicit declaration of function 'hsmp_send_message' [-Wimplicit-function-declaration]
>    38 |         return hsmp_send_message(&msg);
>       |                ^~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   92c025db52bb ("platform/x86/amd/hsmp: Report power via hwmon sensors")
> 
> I have used the drivers-x86 tree from next-20250514 for today.

Hi Stephen,

This is a direct result of moving a pdx86 related header behind my back:

https://lore.kernel.org/all/20250413084144.3746608-5-mingo@kernel.org/

That change wasn't sent to the relevant MAINTAINERS entries (and obviously 
then does not contain my ack either).

Ingo, any suggestion how to deal with this breakage? Do you have e.g. an 
IB which I could pull into pdx86 tree which has only these header moves?

-- 
 i.


