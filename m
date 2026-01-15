Return-Path: <linux-next+bounces-9668-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F6BD22558
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 04:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C997B300BBAF
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 03:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C537F2BD587;
	Thu, 15 Jan 2026 03:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlfBE53s"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A250BB67E;
	Thu, 15 Jan 2026 03:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768449280; cv=none; b=GOwDKmtlkQUvIxXIptJHAj81tOdD2qfMalvEkGeGgx93G3MauzCJoBdnfErxuaab5cZfojIStAfeXjHxJG9+R9kr+zh4JWBrvdfw7DY3DmNih9f6suhgxKG0QrjpE/lNkAsKsAQ67cIIDUGyaSkY4D9DfUTrQcc4lgPTQzIuscw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768449280; c=relaxed/simple;
	bh=wnlHE7xL01gtrGZCTJH2oxfWbxUrxOHLsOV+okPaGao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elNfYvW0kN6/R0/FodvpXV2vQU3h6bkpEWA9Q9QLLIVqBVDHhJngk/pQBChufjhT/Fuqoay+vbopBtWUYSnANZDvr+N5kRmIjr9shRCnhBDtnaSekoFMjvqAX7+2wqA0njy9VK55z8noVHE9y5g8a3zu9CUy9EqSAbUiViqxOA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlfBE53s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74480C116D0;
	Thu, 15 Jan 2026 03:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768449280;
	bh=wnlHE7xL01gtrGZCTJH2oxfWbxUrxOHLsOV+okPaGao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OlfBE53sLhQGF+gdMaaKJiS7kkjCgx3VIZd4lf16pmxaVbOOpZCQvo4388p49NRrH
	 fM7d86613SUnwNMr3TrfO1bIGozp6qHvEwpe5V+u3Rehqcqm8xLJakDQF61us/9U53
	 S8ww3sstZJRrlhjCGqJkd3Ycpe+FM/pqe1+temqhGI410i8ewIxN/u+ubbihXy/Qx0
	 EDpUKMOJERlBCLKfj6/9F1NJ+qwqstguy7+vePxpX4ZMoatEr3QkJPZM7lpWxSiksz
	 tuhUQvFQLWMvkEmPUu7HbhAoQ+lhCu57C4Bf+RKArrn6t3TtWdFPoFBYXfA4yBNIsx
	 iaArrA9EWDHdw==
Date: Wed, 14 Jan 2026 19:54:40 -0800
From: Kees Cook <kees@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nitin Joshi <nitjoshi@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <202601141953.B414D27D@keescook>
References: <20260115145244.3836c369@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115145244.3836c369@canb.auug.org.au>

On Thu, Jan 15, 2026 at 02:52:44PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
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

Ah! Thanks -- this looks correct to me.

I will run some randconfigs to see if anything pops out.

-- 
Kees Cook

