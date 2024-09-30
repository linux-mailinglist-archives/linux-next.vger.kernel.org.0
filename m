Return-Path: <linux-next+bounces-4013-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D7C989FC9
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 12:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C2D1B25C51
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 10:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A141318CBF9;
	Mon, 30 Sep 2024 10:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qht2KMnW"
X-Original-To: linux-next@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F6818DF7C
	for <linux-next@vger.kernel.org>; Mon, 30 Sep 2024 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693421; cv=none; b=gT+Vn/HdeDFZAqFeF7r9y2prBLDNFsJ7637oYxhEKkWaH7rAyCGZyt/G8vrhkwf9BQvA8876FxFy4xRlfMFVcYFAxIjTjpjWZVvyiX/BzOVSegiFHNHbFnBy7uClr8kjMSR327KUMYV5YeASkxNRoaKma1sKenIEJrEuOKSQEs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693421; c=relaxed/simple;
	bh=m5uyAE9D0xk5Q0BCfIzcuNhXg1MqO837M6NONfVuyNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br7vd7Inu9e7ZfBmpDSggIEScrTeIyIge+3f5M1A6R7DI8MqV/69x7W+O2iVQtP91nGEOjeukCUyCCTB0x1fXe1GsEWsVIqe5gcUcfGNw67fkJShROKsTP91VVKgeyivM+2CgC55+DskrQeGn8Dqr2EdMXDEYEKsAs6BdMy4QmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qht2KMnW; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 30 Sep 2024 06:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727693416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o7A8oyOJWOEzOSulD7HoDZhEkn6XV54xNkYVH/7cuxc=;
	b=qht2KMnWXhObhwGZ+oNeNqrWp6qifXA8fZgVMKtPCgRTVWHfuvMk2EXPZqWS29pufy8rCm
	AZSFWHHdZZDBUs6zpNcZR7QXZ0/qbHfBg2JOZcBL0Ei7IxTesMXma57STB+um+9NeE1VZ3
	LKASJIA5ujQ2BHQxgv6cs3zWl+sWkdQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <i75zg7tnd4jvelfx6qb2pc72h45kki4vfku7qwghauztgcoywe@htrp3xhyz4u2>
References: <20240930133813.3c8157df@canb.auug.org.au>
 <2064ea03-a396-418c-a6c3-1c0f1b12d2f3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2064ea03-a396-418c-a6c3-1c0f1b12d2f3@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon, Sep 30, 2024 at 12:28:40PM GMT, Krzysztof Kozlowski wrote:
> On 30/09/2024 05:38, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the origin tree, today's linux-next build (s390 defconfig)
> > failed like this:
> > 
> > In file included from fs/bcachefs/bset.h:9,
> >                  from fs/bcachefs/btree_iter.h:5,
> >                  from fs/bcachefs/str_hash.h:5,
> >                  from fs/bcachefs/xattr.h:5,
> >                  from fs/bcachefs/acl.c:6:
> > fs/bcachefs/bkey.h: In function 'bch2_bkey_format_add_key':
> > fs/bcachefs/bkey.h:557:41: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
> >   557 |         x(BKEY_FIELD_VERSION_HI,        bversion.hi)                    \
> >       |                                         ^~~~~~~~
> 
> 
> Also reported earlier here:
> https://lore.kernel.org/all/202409272048.MZvBm569-lkp@intel.com/
> https://lore.kernel.org/all/202409271712.EZRpO2Z1-lkp@intel.com/
> 
> But the true problem is here:
> 
> commit cf49f8a8c277f9f2b78e2a56189a741a508a9820
> Author:     Kent Overstreet <kent.overstreet@linux.dev>
> AuthorDate: Thu Sep 26 15:49:17 2024 -0400
>                     ^^^^^^^^^^^
> Commit:     Kent Overstreet <kent.overstreet@linux.dev>
> CommitDate: Fri Sep 27 21:46:35 2024 -0400
>                     ^^^^^^^^^^^ one day difference!
> 
> Last minute commits usually won't receive wide build coverage, at least
> not instantaneously.
> 
> And if you go through the history, I see around 40 commits with authored
> date ~20-26 September and committed on Sep 27. Plus another ~40 authored
> earlier but committed on September 21, which is middle of merge window.
> 
> Why such commits for RC1 are sent at the end of merge window or
> committed during merge window?

the rename was something I did to track down a bug in the disk accounting rewrite:
https://lore.kernel.org/linux-bcachefs/pvga5sgp4vejnnr5ojgiuwte6qeve4x7ld4dhdmzb625l367fq@q4td2cutlfvu/T/

I do need to get multi-arch build testing going on my CI, but right now
I'm busy working on corner cases in the repair code...

