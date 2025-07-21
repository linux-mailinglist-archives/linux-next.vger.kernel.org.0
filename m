Return-Path: <linux-next+bounces-7665-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4933FB0CB0F
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 21:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0B51164073
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 19:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1721222D9ED;
	Mon, 21 Jul 2025 19:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ANwZMsvU"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CDE1C84C5;
	Mon, 21 Jul 2025 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753126696; cv=none; b=U1TYBp6w24SSbMsFAiCRt0dKNP0+FE8kai9EkVKXHOBJu0D0pisbMtw+kFsMIZxGwpoSlsd5X2OSKrNxTiRb2BCOBd6lJCimZxvDpGl/CLUviwYBh1ZAMRAeb+nNTx9ZfNBdXY0quvCgLdlCKK0HxryUx7QaRYAaMSTsEonHrjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753126696; c=relaxed/simple;
	bh=eZMKzrPGH7VmZqDxJ4fuFQRPgaXtRW5p9hGLW8QxlgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=os/i2pEgKPoMprGDsBAjH0t/SAUW3PJEw7yx2m7oejHA5xoUvYLF9I5/KdbzONw+ktG4obZur87A/mlN6JJVQkzCYJTAea8V+pny3sdCjhWdhqwxU3jD86iJ+sGOLCkN+WcxOHe4ri+YjyY7aXWNI8WPSvJzasezRrgZFPePcEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ANwZMsvU; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HXMAn5gvJuR4ofxymykCoRB+DXgmgGIEzbKDcKY9nL8=; b=ANwZMsvUWBZVUvyR3s6txvp8cO
	Yg5GyPh71vtU1AG3NBSNpCK9ooKFfhvxEDxQByp8oYHwmx4on4akeJiX1/ZAifOimR2hX7hPZqdvB
	KMG43klyxoVgJLdtEOXnt6h9txRb3NYN6GR9YzQOK9jVYEGqNCNIaE4BrJqCCx8RTXT0+NPUqmv4K
	tvinesgmklhMF3uTJ8DnnUIq07Y5WF8xlWyBBrstOlqTQ9ZW3c7N+hosIa9R42OImi2uWrpwtxXPT
	2Om7FoPbqiazh8t9/d9FBBsR/R67xbzK35uVz4WePj4WIZDGlCp+h2LlCVbS0tZnBZwqqWoTseKUT
	QAsbEa+g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwKv-000000002TW-30r1;
	Mon, 21 Jul 2025 19:38:09 +0000
Date: Mon, 21 Jul 2025 20:38:09 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>
Subject: Re: linux-next: manual merge of the slab tree with the mm-unstable
 tree
Message-ID: <aH6XIUX4xyo2pZfY@casper.infradead.org>
References: <20250721142001.3d1c8777@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721142001.3d1c8777@canb.auug.org.au>

On Mon, Jul 21, 2025 at 02:20:01PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the slab tree got a conflict in:
> 
>   fs/proc/page.c
> 
> between commit:
> 
>   a602ee331e31 ("fs: stable_page_flags(): use snapshot_page()")
> 
> from the mm-unstable tree and commit:
> 
>   d8178294c53e ("proc: Remove mention of PG_slab")
> 
> from the slab tree.
> 
> I fixed it up (I just used the former version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any

I think the snapshot_page commit was incorrect in removing this comment.
It is still valuable information.  I think the comment from d8178294c53e
should remain in the tree after the resolution.



