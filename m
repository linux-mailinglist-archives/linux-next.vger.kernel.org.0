Return-Path: <linux-next+bounces-2221-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C58168BF68C
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 08:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81292282AC3
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 06:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFFF208D1;
	Wed,  8 May 2024 06:51:08 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DBE17C72;
	Wed,  8 May 2024 06:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715151068; cv=none; b=fwWrOTV1/ORI7L2Fw0W/lKow3v0kWMLczAeANzOO18p2Ie2me5uDqZFHE6T6h7K5wyFtsJjCmHwmZB9Ze9fEcfDDaSA0AkdvROh6a0oi+Pmws8nS4/VVx+yJO7EGajrUv9JAwXnb50W75Sj6xP0nXUZVAo6w5lDS6vbwxqp3PvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715151068; c=relaxed/simple;
	bh=mH6Ta67pzIKfr9LQlHdbLh2ohB48rnPzvsQeQ9X0ej0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=By1hzqY/0lm7uqdLJWspAWLlhmMPW2r8WKIhXeqajXZxDS7BDY2r6W0/5DunT4D/al5Ml69H0RhH5RBiXJ2znEfO/IHP5nbJpGz8sYSZssn6ox+rfitAcsze+nFz7wSEQDrsrLwj7FMyBNG0hVcPn4cVLIHLL+5CvuepMrXPbnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id ED20568AFE; Wed,  8 May 2024 08:51:02 +0200 (CEST)
Date: Wed, 8 May 2024 08:51:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the dma-mapping tree
Message-ID: <20240508065102.GC10736@lst.de>
References: <20240508091631.1ec34a25@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508091631.1ec34a25@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, May 08, 2024 at 09:16:31AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the dma-mapping tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Thanks.  I'll fold in the patch below to drop two consts for now.
Alexander, if you want to pass the consts through we'll also need to
modify page_pool_get_dma_addr, which looks doable.  If you want that,
please send an incremental patch.

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 8836aaaf23855f..4f9d1bd7f4d187 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -399,7 +399,7 @@ static struct page *__page_pool_get_cached(struct page_pool *pool)
 }
 
 static void __page_pool_dma_sync_for_device(const struct page_pool *pool,
-					    const struct page *page,
+					    struct page *page,
 					    u32 dma_sync_size)
 {
 #if defined(CONFIG_HAS_DMA) && defined(CONFIG_DMA_NEED_SYNC)
@@ -413,7 +413,7 @@ static void __page_pool_dma_sync_for_device(const struct page_pool *pool,
 
 static __always_inline void
 page_pool_dma_sync_for_device(const struct page_pool *pool,
-			      const struct page *page,
+			      struct page *page,
 			      u32 dma_sync_size)
 {
 	if (pool->dma_sync && dma_dev_need_sync(pool->p.dev))

