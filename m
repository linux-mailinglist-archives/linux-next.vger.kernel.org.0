Return-Path: <linux-next+bounces-8182-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC66B43025
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 04:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2429D580388
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 02:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D4B240604;
	Thu,  4 Sep 2025 02:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lH2yOM01"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6321DE8A0;
	Thu,  4 Sep 2025 02:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756954789; cv=none; b=piZeVCJXT/fs5geUziSnjfS00JC/SrHEqyICpJbykplv8gHTlEP24REsZFp5QWkGenVCUFmx3qm5o5ljG0D66R9hq1lSrDMbC2mK2nUTdkSMMftduDHsPQOeKm+t0RavTecLUga0paOfChFTErFi6mmCrINrOAQpMGg0eeDQpzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756954789; c=relaxed/simple;
	bh=Ej62/+GuxiPME9ChZGhzhtMyRGdad2dhWYjGlj5om+M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KOwXmwwhjXjEZmpJJ0Li+LZHa07+P/2spHvdKuNdyd8WIWQ9bcvwd4gu1uevasD42k3SN3t2pmyrKaWobkAlubssCPrSOkQpqToqKyUyh7x2yLHRy53pK+4lkBFwYc/x/TfezWlfdp+DFwyFu4Xl7TPh0YUYI0Tg+HYuZcWE5mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lH2yOM01; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C26BC4CEE7;
	Thu,  4 Sep 2025 02:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1756954788;
	bh=Ej62/+GuxiPME9ChZGhzhtMyRGdad2dhWYjGlj5om+M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lH2yOM011khnKp7qpe9/V9un8Bj+4dApESibHpcxkmF3oeXrN1UnE/5AJNvpa5e4/
	 mjpSvbjHVGv0lrjPQ5W7ZixVX9P4m+kkIM0dDk/DXbK25jU06Oocq45y0yBHjp9ldT
	 7hYdI8UHXdYp1UfQKWGXZllnkeBY1QVFyYBEndnE=
Date: Wed, 3 Sep 2025 19:59:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Max Kellermann <max.kellermann@ionos.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
Message-Id: <20250903195947.97af912dc103f8a055e73537@linux-foundation.org>
In-Reply-To: <20250904121438.3d2daab2@canb.auug.org.au>
References: <20250904121438.3d2daab2@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 4 Sep 2025 12:14:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the mm-unstable tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> In file included from include/linux/highmem.h:14,
>                  from include/linux/bvec.h:10,
>                  from include/linux/blk_types.h:10,
>                  from include/linux/writeback.h:13,
>                  from include/linux/memcontrol.h:23,
>                  from include/linux/swap.h:9,
>                  from include/linux/suspend.h:5,
>                  from arch/arm/mach-highbank/pm.c:9:
> include/linux/highmem-internal.h: In function 'kmap_local_folio':
> include/linux/highmem-internal.h:86:46: warning: passing argument 1 of 'folio_page' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>    86 |         const struct page *page = folio_page(folio, offset / PAGE_SIZE);
>       |                                              ^~~~~
> In file included from include/linux/mmzone.h:23,
>                  from include/linux/swap.h:7:
> include/linux/page-flags.h:319:53: note: expected 'struct folio *' but argument is of type 'const struct folio *'
>   319 | static inline struct page *folio_page(struct folio *folio, unsigned long n)


Yeah, thanks, folio_page() is a problem.  I'll do the below nasty for
now, but nasty.

--- a/include/linux/page-flags.h~mm-constify-highmem-related-functions-for-improved-const-correctness-fix
+++ a/include/linux/page-flags.h
@@ -316,9 +316,9 @@ static __always_inline unsigned long _co
  * check that the page number lies within @folio; the caller is presumed
  * to have a reference to the page.
  */
-static inline struct page *folio_page(struct folio *folio, unsigned long n)
+static inline struct page *folio_page(const struct folio *folio, unsigned long n)
 {
-	return &folio->page + n;
+	return (struct page *)(&folio->page + n);
 }
 
 static __always_inline int PageTail(const struct page *page)
_


