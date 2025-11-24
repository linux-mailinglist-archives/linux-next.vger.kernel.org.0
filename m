Return-Path: <linux-next+bounces-9161-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB9C7EA9E
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 01:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59E483A4447
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 00:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8EF1B7F4;
	Mon, 24 Nov 2025 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b93OIWjY"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9171A26B;
	Mon, 24 Nov 2025 00:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763942860; cv=none; b=gVxj1u4oXW9BNfZ41dpzLK22fBADBcOGRsja2jlFXK09ZVFE4ng7TVRRMcriOAe+Ia0E5YslL6rKFiTpWFyZR0lZE5MiyXGruAkmo4UR0XCg9n7VWA0AaInmN8DAG6shJXgSslp+ig30r3hI374VJOLTn4XJLsFe70S3INF6xkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763942860; c=relaxed/simple;
	bh=yDwpc4s1JOy96tOUo+4/bNbslpeV0xYVIBTLjadOWLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etjsVAla8Wpx2q2Q0/FJN+cspj0pREzZ1a8MMkbaF15siTjTJIitvUIJXiKPnplM9MArSFoqTi+SsELsGy7Qt59zhPUQaT6bxfoDSmnYQ8uTiVZhGPWikwKeBmWxBCyrI5RiOiIKVrurZayA8eFWhR5lZIExBdSE7aj/ziWHk9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b93OIWjY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ogb52BPTtsEC9/HUb0HzYVu8vs7I4I+qs8zpXc9LSQY=; b=b93OIWjY7kz0nhZnT7mjg2UPeU
	+u9y7jLkPMI7sMjgzpVk2CT7eviFTwdYUiRcpaDKZn8APB8l8X0+bFQAAYpHbC1Ts44EYRPz9Brbs
	otjwz8nlcqQKyCaK1W6QhF7usCcnyTKfl6RC0bBi/vsfFRuyZ60Psfuh+k8THU5XLsD3MNzb9SeQo
	YTzk78gfFwqA+9ykXaCUBjzh2WuWxWEto9pY+8F67shkxKntcmxmAk/6eiv8C/eHn8uBGd+I6B/l5
	H2ZAnt2Hz4CE5rdyV7yz6cSy8NX3txd+nbNpftJZaF1RfVCDFw1bCcCxQZ6j/wxI5X6DRLbDeP+Ni
	T2kpfZ+Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNK79-00000006CcH-37cg;
	Mon, 24 Nov 2025 00:07:31 +0000
Date: Mon, 24 Nov 2025 00:07:31 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Qu Wenruo <wqu@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>,
	David Sterba <dsterba@suse.cz>, David Sterba <dsterba@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs_brauner tree with the btrfs
 tree
Message-ID: <aSOhw8mxgSlJ0xuv@casper.infradead.org>
References: <20251124100508.64a6974a@canb.auug.org.au>
 <6a94eecb-a729-4b39-8cee-72521d12bd70@suse.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a94eecb-a729-4b39-8cee-72521d12bd70@suse.com>

On Mon, Nov 24, 2025 at 09:55:23AM +1030, Qu Wenruo wrote:
> 
> 
> 在 2025/11/24 09:35, Stephen Rothwell 写道:
> > Hi all,
> > 
> > After merging the vfs-brauner tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > In file included from include/linux/bits.h:30,
> >                   from include/linux/gfp_types.h:5,
> >                   from include/linux/gfp.h:5,
> >                   from include/linux/slab.h:16,
> >                   from fs/btrfs/ordered-data.c:6:
> > fs/btrfs/ordered-data.c: In function 'btrfs_mark_ordered_io_truncated':
> > fs/btrfs/ordered-data.c:561:37: error: implicit declaration of function 'folio_end'; did you mean 'folio_nid'? [-Wimplicit-function-declaration]
> >    561 |         ASSERT(file_offset + len <= folio_end(folio));
> >        |                                     ^~~~~~~~~
> > include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
> >     30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
> >        |                                                               ^
> > fs/btrfs/ordered-data.c:561:9: note: in expansion of macro 'ASSERT'
> >    561 |         ASSERT(file_offset + len <= folio_end(folio));
> >        |         ^~~~~~
> > In file included from include/linux/bits.h:30,
> >                   from include/linux/bitops.h:6,
> >                   from fs/btrfs/extent_io.c:3:
> > fs/btrfs/extent_io.c: In function 'submit_range':
> > fs/btrfs/extent_io.c:1621:31: error: implicit declaration of function 'folio_end'; did you mean 'folio_nid'? [-Wimplicit-function-declaration]
> >   1621 |         ASSERT(start + len <= folio_end(folio));
> >        |                               ^~~~~~~~~
> > include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
> >     30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
> >        |                                                               ^
> > fs/btrfs/extent_io.c:1621:9: note: in expansion of macro 'ASSERT'
> >   1621 |         ASSERT(start + len <= folio_end(folio));
> >        |         ^~~~~~
> > 
> > Caused by commit
> > 
> >    48f3784b17d9 ("btrfs: Use folio_next_pos()")
> > 
> > interatcing with commits
> > 
> >    98dad9ca0426 ("btrfs: reduce extent map lookup during writes")
> >    c7459b067d9d ("btrfs: make sure all ordered extents beyond EOF is properly truncated")
> > 
> > from the btrfs tree.
> > 
> > I applied the following merge fix patch.
> 
> Thanks for fixing that.
> 
> Although that two patches from btrfs tree is now retracted for other
> reasons.
> 
> I'll refresh the involved patches in the next cycle when btrfs all migrate
> to folio_next_pos().

You don't need to wait for next cycle, you can merge vfs-6.19.folio
into the btrfs tree:

https://lore.kernel.org/linux-fsdevel/20251031-chaostheorie-lautlos-f2dee81d337b@brauner/

I think that would actually be a good idea; that way your testing
will show up any trouble with those commits.  You should also merge in
https://lore.kernel.org/linux-fsdevel/20251123220518.1447261-1-willy@infradead.org/
which fixes a bug in that series (I'm expecting Christian will merge
that this week).

