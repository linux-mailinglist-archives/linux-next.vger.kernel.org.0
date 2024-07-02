Return-Path: <linux-next+bounces-2785-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5B191ED5F
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 05:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3635284365
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 03:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D3F18E0E;
	Tue,  2 Jul 2024 03:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CK/A/iNy"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0F3179AF;
	Tue,  2 Jul 2024 03:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719890095; cv=none; b=tbJ0nJ+Nqx4Wq6WdZyQGcyjAB4+Z03ca7/ChZXndSmf4VK6d51m7wk0cd++vfCr6j7inEvs5i2TWaNrKCYr3jGctsJvnRRv8SPAsHN3KyscTD/VgfFvEWj93J4EiZ6ATdyrep2pEy8nGIQh7cYEv4fNJ1x0Fu6EFKORlWy9QtlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719890095; c=relaxed/simple;
	bh=VynH34JpyMUrFX8rVBXDWM4HW084ZpTphUcMDiCukkk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=c1puqNDP8WUy6IWOECMsqJ6uacw0rc9xlqe31LUTaPUYtfVZvuSk/nOz/G8iCUyWqCh4w87YRuNhea4XfyQJQ7dSLdKAjqX2LQ2xI6M7ZgSWlZXenxvDLLiw1yp2CmmwPpkYwWsRi4uKs3pkkUB4Dl3pyVqIY5B6+F5GhK52Dgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CK/A/iNy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C62C116B1;
	Tue,  2 Jul 2024 03:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1719890094;
	bh=VynH34JpyMUrFX8rVBXDWM4HW084ZpTphUcMDiCukkk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CK/A/iNydY7m8Khg8bq6h3xgb1p7GwrKU/w6tPUTMoDe6uBCqPhuFWVUYZzakhtK0
	 uys8JQ2aCzczHLb0f7ipMWe1uLzGrRBFnk/0UrBcfd2f9uDTAylN8d2pMMPKet8dHi
	 ZU+KUhgyw3pFDNAIe7GeZe3e83dtnXALur+oe+FE=
Date: Mon, 1 Jul 2024 20:14:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiaqi Yan <jiaqiyan@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: Re: linux-next: build warnings after merge of the mm tree
Message-Id: <20240701201448.7878e9b35e1569bfc1f2ddbc@linux-foundation.org>
In-Reply-To: <20240701184912.01f1f9ce@canb.auug.org.au>
References: <20240701184912.01f1f9ce@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Jul 2024 18:49:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> these warnings:
> 
> Documentation/admin-guide/sysctl/vm.rst:278: ERROR: Unexpected indentation.
> Documentation/admin-guide/sysctl/vm.rst:279: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Introduced by commit
> 
>   2cba7831f62c ("docs: mm: add enable_soft_offline sysctl")

Well that's annoying.

@@ -267,6 +268,37 @@ used::
 These are informational only.  They do not mean that anything is wrong
 with your system.  To disable them, echo 4 (bit 2) into drop_caches.
 
+enable_soft_offline
+===================
+Correctable memory errors are very common on servers. Soft-offline is kernel's
+solution for memory pages having (excessive) corrected memory errors.
+
+For different types of page, soft-offline has different behaviors / costs.
+- For a raw error page, soft-offline migrates the in-use page's content to
+  a new raw page.
+- For a page that is part of a transparent hugepage, soft-offline splits the
+  transparent hugepage into raw pages, then migrates only the raw error page.
+  As a result, user is transparently backed by 1 less hugepage, impacting
+  memory access performance.
+- For a page that is part of a HugeTLB hugepage, soft-offline first migrates
+  the entire HugeTLB hugepage, during which a free hugepage will be consumed
+  as migration target.  Then the original hugepage is dissolved into raw
+  pages without compensation, reducing the capacity of the HugeTLB pool by 1.
+
+ ...

This seems a reasonable thing to do so there's probably some way in
which to do it, but a bit of grepping failed to turn up examples in
existing .rst files.  Can someone please suggest?

