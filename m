Return-Path: <linux-next+bounces-6653-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD58BAB1E64
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 22:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B50381889294
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 20:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065D725EFA0;
	Fri,  9 May 2025 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HU8nDiSg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873F425E477;
	Fri,  9 May 2025 20:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822687; cv=none; b=FZLT/aAtIsvl0Ei9xYmXeeh3cgJiActOmwvK3tfIK3yQIWgJ0I4GIHobAY5FgEEjQ1MIcp7P6HNyRUPAQYTEwAccDUiCVYLddZzG/dyKjdqtY1ocCafgC4mltb3G4BIVtWhZSljmT7m9RWPXm4KVCJDD1lT+UKIPw9Z5e/hat5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822687; c=relaxed/simple;
	bh=SoFlmO7Jj0/G4IWxkuc4o9mywnX6JIgpx7RMvcDitWI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DDxMXLAZP4Endc2UM+x5o8mXJxTnn4f2BaDETr+9zYbCi5cEWZrMOf8USIxAZ/20RsWLMnjB5Y4dOmntAGX8OK8YR7s4a78QYBx5PYWEOPXJJpRhkmeYrxfBCF7TZHJ/wz+DL/MYQ+EUwWyk/1tCvqzoOz/m4ZsMDD/mn7/dJ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HU8nDiSg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68EEC4CEE4;
	Fri,  9 May 2025 20:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746822686;
	bh=SoFlmO7Jj0/G4IWxkuc4o9mywnX6JIgpx7RMvcDitWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HU8nDiSgP+teIzyBe2aZfFGy2yDOomfPG2Bcr97GNhvtouWuDAw5ZKekihRkPtKwe
	 Bp4p+FlIGM1zw7LWBFoMUXnUlCs+syf9sxhBMox/dG2vNDfKoIbGZeF03Ng9qUB8b/
	 6O6FEU58DdY1lEVwzKtoC6KHqh4TtcJPVE18QVGc=
Date: Fri, 9 May 2025 13:31:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Juan Yescas <jyescas@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
Message-Id: <20250509133126.7ceafbcc662a7fde291b6f60@linux-foundation.org>
In-Reply-To: <20250509194336.3c1baa34@canb.auug.org.au>
References: <20250509194336.3c1baa34@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 May 2025 19:43:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm-unstable tree, today's linux-next build (powerpc64
> allnoconfig) produced this warning:
> 
> In file included from include/vdso/const.h:5,
>                  from include/linux/const.h:4,
>                  from include/linux/bits.h:5,
>                  from include/linux/ratelimit_types.h:5,
>                  from include/linux/printk.h:9,
>                  from include/asm-generic/bug.h:22,
>                  from arch/powerpc/include/asm/bug.h:116,
>                  from include/linux/bug.h:5,
>                  from include/linux/mmdebug.h:5,
>                  from include/linux/mm.h:6,
>                  from mm/sparse.c:5:
> mm/sparse.c: In function 'usemap_size':
> include/linux/mmzone.h:1815:15: warning: left shift count is negative [-Wshift-count-negative]
>  1815 |         ((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
>       |               ^~
> include/uapi/linux/const.h:51:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
>    51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>       |                                        ^
> mm/sparse.c:301:16: note: in expansion of macro 'BITS_TO_LONGS'
>   301 |         return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(unsigned long);
>       |                ^~~~~~~~~~~~~
> mm/sparse.c:301:30: note: in expansion of macro 'SECTION_BLOCKFLAGS_BITS'
>   301 |         return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(unsigned long);
>       |                              ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Probably introduced by commit
> 
>  ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
> 

Yes, thanks, I'll drop this version of the patch.

