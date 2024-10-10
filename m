Return-Path: <linux-next+bounces-4206-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610DA997CD1
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 08:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D02E281DAB
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 06:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F9E19F41C;
	Thu, 10 Oct 2024 06:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RW9qCTH5"
X-Original-To: linux-next@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113C319D881
	for <linux-next@vger.kernel.org>; Thu, 10 Oct 2024 06:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728540623; cv=none; b=XnCVkDSvfRyjfgkKulCsWJKm6bN6o3MyGOcX1E40M8x1j7/6XouYsfjJkTjxtLuwV4DbU1815lzS/ttSFPIIA9T8wHdZkr6PsZjs6xFWkqi+lA2jOGXjvnspFUh2zUF7Cs8n6Ycmhzl5tI8dscr8F2r2ijsntqw0KFgB5mgN8B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728540623; c=relaxed/simple;
	bh=FyeOtIfK84dC4gN5BtI2RC/rCj7e5P8whO2U7zgvQCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfmeI8mfv8mOh89nGZNfLO3t4vojXt4L5XrDrEhtUrGlIhh9s3N+WZeQvJaRUL6D0NvaqfmnJT1+e9F+nWRvNzW/F6RI9Vej/mE5uTKR1RaZu8ATHyMrAowArDUn4gQ+eCQ2FYnedLIEzg77/F/bPYs7zz00wb1SQPmOtPdP5p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RW9qCTH5; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 10 Oct 2024 02:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728540618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hjRi1+MfGh2zrzqw4B7ngdGxU4YaN7jJCYdJBKIXCHY=;
	b=RW9qCTH5Aq9RTpk5RtadOKvPoGbcHVivLi9Vp+nYB2YRlwmstgggE34OHUpz9fsi0VWO+2
	0G5FIBZmgAjNkP9wioUuGoHzNHY3I1MVgPzv855x1M0NaxqJO42IA8tqe6VhrzGv6Aa2cA
	2LXfRnC0PRcMG5S9DIoUdODyZfKLDZE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Michal Hocko <mhocko@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bcachefs tree
Message-ID: <xwlm6pc32uhs6qzbscwbeiuyvqsuxtqsku2eztkzlvwlgse5qc@2r2vlkksohwj>
References: <20240927104628.2ca6ad07@canb.auug.org.au>
 <20241010165018.47b3fe1d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010165018.47b3fe1d@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Thu, Oct 10, 2024 at 04:50:18PM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 27 Sep 2024 10:46:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the fs-next tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > In file included from fs/bcachefs/str_hash.h:5,
> >                  from fs/bcachefs/xattr.h:5,
> >                  from fs/bcachefs/acl.c:6:
> > fs/bcachefs/acl.c: In function 'bch2_acl_from_disk':
> > fs/bcachefs/btree_iter.h:896:44: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
> >   896 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
> >       |                                            ^~~~~~~~~~~~~~~~~~~~~
> > fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_flags_do'
> >   878 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
> >       |                                                     ^~~~~~
> > fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_locks'
> >   139 |         acl = allocate_dropping_locks(trans, ret,
> >       |               ^~~~~~~~~~~~~~~~~~~~~~~
> > fs/bcachefs/btree_iter.h:896:44: note: each undeclared identifier is reported only once for each function it appears in
> >   896 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
> >       |                                            ^~~~~~~~~~~~~~~~~~~~~
> > fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_flags_do'
> >   878 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
> >       |                                                     ^~~~~~
> > fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_locks'
> >   139 |         acl = allocate_dropping_locks(trans, ret,
> >       |               ^~~~~~~~~~~~~~~~~~~~~~~
> > fs/bcachefs/btree_iter.h:896:66: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
> >   896 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
> >       |                                                                  ^~~~~~~~~~~~~~~~~~
> > fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_flags_do'
> >   878 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
> >       |                                                     ^~~~~~
> > fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_locks'
> >   139 |         acl = allocate_dropping_locks(trans, ret,
> >       |               ^~~~~~~~~~~~~~~~~~~~~~~
> > fs/bcachefs/acl.c: In function 'bch2_acl_chmod':
> > fs/bcachefs/btree_iter.h:886:38: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
> >   886 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
> >       |                                      ^~~~~~~~~~~~~~~~~~~~~
> > fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_flags_do'
> >   878 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
> >       |                                                     ^~~~~~
> > fs/bcachefs/acl.c:430:15: note: in expansion of macro 'allocate_dropping_locks_errcode'
> >   430 |         ret = allocate_dropping_locks_errcode(trans,
> >       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > fs/bcachefs/btree_iter.h:886:60: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
> >   886 |         int _ret = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
> >       |                                                            ^~~~~~~~~~~~~~~~~~
> > fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_flags_do'
> >   878 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
> >       |                                                     ^~~~~~
> > fs/bcachefs/acl.c:430:15: note: in expansion of macro 'allocate_dropping_locks_errcode'
> >   430 |         ret = allocate_dropping_locks_errcode(trans,
> >       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > In file included from fs/bcachefs/btree_locking.h:13,
> >                  from fs/bcachefs/btree_io.h:7,
> >                  from fs/bcachefs/btree_cache.c:7:
> > fs/bcachefs/btree_cache.c: In function 'bch2_btree_node_mem_alloc':
> > fs/bcachefs/btree_cache.c:807:31: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
> >   807 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
> >       |                               ^~~~~~~~~~~~~~~~~~~~~
> > fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_flags_do'
> >   878 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
> >       |                                                     ^~~~~~
> > fs/bcachefs/btree_cache.c:807:31: note: each undeclared identifier is reported only once for each function it appears in
> >   807 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
> >       |                               ^~~~~~~~~~~~~~~~~~~~~
> > fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_flags_do'
> >   878 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
> >       |                                                     ^~~~~~
> > 
> > Caused by commit
> > 
> >   87a3e08121cb ("bcachefs: Switch to memalloc_flags_do() for vmalloc allocations")
> > 
> > from the bcachefs tree interacting with commit
> > 
> >   0df1d8edfe8a ("Revert "mm: introduce PF_MEMALLOC_NORECLAIM, PF_MEMALLOC_NOWARN"")
> > 
> > from the mm-hotfixes-unstable branch of the mm-hotfixes tree.
> > 
> > I have reverted that mm-hotfixes commit for today.
> 
> The mm-hotixes commit is now in Linus' tree so tomorrow I will have to
> revert it from the bcachefs tree merge (in stead of the fs-next tree
> merge) unless someone comes up with something better.

That's been dropped from my tree...

