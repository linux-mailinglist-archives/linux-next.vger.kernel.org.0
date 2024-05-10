Return-Path: <linux-next+bounces-2254-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E80A8C1D37
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 05:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 882D2283B98
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 03:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055F1149C56;
	Fri, 10 May 2024 03:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mm12.xyz header.i=@mm12.xyz header.b="ihVippyL"
X-Original-To: linux-next@vger.kernel.org
Received: from elcheapo.mm12.xyz (elcheapo.mm12.xyz [148.135.104.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA23171A7;
	Fri, 10 May 2024 03:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.135.104.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715313226; cv=none; b=qzGWwzkQuq3yDjUQWqhhND2pRWoy4OAmouOgsy1R81YMuZNoJ/VKNJPkgMXLT9sPouVtFIg0rMPblu+GbPXNY/v7nqQHF0R33fhtzzpJmA8LQq6EV8a8P5TtgtRe+/NNcRr9xHHzMZ0Zc1u22kZnxz7r4PRsMnTNbAzY31Pkdq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715313226; c=relaxed/simple;
	bh=y7BXUOx/dAVhQLguT838TRDZl0y8vZ5eIRRG8rxR2/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBt8Lk6/3i3foqKlYccKTtYO3RVLjJocr0GezF8u08RnZ4jDFb4BmZkSR6NUg75pXnwdwh3zWyn15G7Lc9Z2ufwFWxgBSTPy/gDLRmkEMzG0WZdvmqsy7Bedh+mAV0LC0RY6p4Bh+D6pBHUiGxQ/jPU6thTdzga72IneP49jSCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mm12.xyz; spf=pass smtp.mailfrom=mm12.xyz; dkim=pass (2048-bit key) header.d=mm12.xyz header.i=@mm12.xyz header.b=ihVippyL; arc=none smtp.client-ip=148.135.104.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mm12.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mm12.xyz
Received: from scala.mm12.xyz by elcheapo.mm12.xyz (Postfix) with ESMTPSA id 672C31F46E;
	Thu,  9 May 2024 23:46:20 -0400 (EDT)
Received: by scala.mm12.xyz (Postfix, from userid 1000)
	id 61AD4180437; Thu,  9 May 2024 23:46:18 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mm12.xyz; s=mail;
	t=1715312778; bh=y7BXUOx/dAVhQLguT838TRDZl0y8vZ5eIRRG8rxR2/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihVippyLA5SdmGURV5AfqHgDxPYz0rsg1xW6miwecMyyZwh11gmKB3LFS0jKIn6kF
	 3pYD+g3uAtWJCIgxpl4eOLDcyNHgp8TlFVVLXyBzAyPkTucgRk5sjV6H4JldRHV0Yl
	 tYD7Lc9RJeb5NTdHQ9sBzdLEwgwz6tQIkRf8OU6c+LdRDdqJOD2zIfC1f22AW861po
	 wsFERbhND+1dJmyPjy7q/iRqH/dOtacE/vog8+kM2m4VNwxmOLqc40h4ZRQyU7JJF9
	 ctzvbW0ze5eXkLYORxKlBcLdhDxReLQl7dDa+OqNmhYvSv1flbblSGZ0UiTYMutTir
	 MkKEs62uT3xLQ==
Date: Thu, 9 May 2024 23:46:18 -0400
From: Matthew Mirvish <matthew@mm12.xyz>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Coly Li <colyli@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the refactor-heap tree with the
 block tree
Message-ID: <20240510034618.GA3161190@mm12.xyz>
References: <20240509152745.08af752f@canb.auug.org.au>
 <te64v6zwwor6jkco6uiu2zz7ern6ijhyu5okfvdz3bmj3w5qfp@mx4zdniwymqj>
 <Zj1RzZdtfL7UQax1@visitorckw-System-Product-Name>
 <buehluxvo234sj7onzl6wwjmuslmnkh7g6vnpru23kpti6qmpp@7nqak2ser7mw>
 <Zj2PX6Fy3BEnQc50@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zj2PX6Fy3BEnQc50@visitorckw-System-Product-Name>

On Fri, May 10, 2024 at 11:07:11AM +0800, Kuan-Wei Chiu wrote:
> On Thu, May 09, 2024 at 07:16:31PM -0400, Kent Overstreet wrote:
> > On Fri, May 10, 2024 at 06:44:29AM +0800, Kuan-Wei Chiu wrote:
> > > On Thu, May 09, 2024 at 03:58:57PM -0400, Kent Overstreet wrote:
> > > > On Thu, May 09, 2024 at 03:27:45PM +1000, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > > 
> > > > > Today's linux-next merge of the refactor-heap tree got conflicts in:
> > > > > 
> > > > >   drivers/md/bcache/bset.c
> > > > >   drivers/md/bcache/bset.h
> > > > >   drivers/md/bcache/btree.c
> > > > >   drivers/md/bcache/writeback.c
> > > > > 
> > > > > between commit:
> > > > > 
> > > > >   3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter")
> > > > > 
> > > > > from the block tree and commit:
> > > > > 
> > > > >   afa5721abaaa ("bcache: Remove heap-related macros and switch to generic min_heap")
> > > > > 
> > > > > from the refactor-heap tree.
> > > > > 
> > > > > Ok, these conflicts are too extensive, so I am dropping the refactor-heap
> > > > > tree for today.  I suggest you all get together and sort something out.
> > > > 
> > > > Coli and Kuan, you guys will need to get this sorted out quick if we
> > > > want refactor-heap to make the merge window
> > > 
> > > Hi Coli and Kent,
> > > 
> > > If I understand correctly, the reported bug is because we attempted to
> > > point (heap)->data to a dynamically allocated memory , but at that time
> > > (heap)->data was not a regular pointer but a fixed size array with a
> > > length of MAX_BSETS.
> > > 
> > > In my refactor heap patch series, I introduced a preallocated array and
> > > decided in min_heap_init() whether the data pointer should point to an
> > > incoming pointer or to the preallocated array. Therefore, I am
> > > wondering if my patch might have unintentionally fixed this bug?
> > > 
> > > I am unsure how to reproduce the reported issue. Could you assist me in
> > > verifying whether my assumption is correct?
> > 
> > This is a merge conflict, not a runtime. Can you rebase onto Coli's
> > tree? We'll have to retest.
> 
> Oh, sorry for the misunderstanding I caused. When I mentioned "bug" [1]
> earlier, I was referring to the bug addressed in
> 3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter"),
> not a merge conflict.
> 
> Here are the results after the rebase:
> https://github.com/visitorckw/linux.git refactor-heap
> 
> [1]: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2039368

The ubuntu kernels build with UBSAN now, and the bug reported is just a
UBSAN warning. The original implementation's iterator has a fixed size
sets array that is indexed out of bounds when the iterator is allocated
on the heap with more space -- the patch restructures it a bit to have a
single iterator type with a flexible array and then a larger "stack"
type which embeds the iterator along with the preallocated region.

I took a brief look at the refactor-heap branch but I'm not entirely
sure what's going on with the new min heaps: in the one place where the
larger iterators are used (in bch_btree_node_read_done) it doesn't look
like the heap is ever initialized (perhaps since the old iter_init
wasn't used here because of the special case it got missed in the
refactor?) With the new heaps it should be fairly easy to fix though;
just change the fill_iter mempool to be allocating only the minheap data
arrays and setup iter->heap.data properly with that instead.

Hope that helps,
Matthew Mirvish

> 
> Regards,
> Kuan-Wei

