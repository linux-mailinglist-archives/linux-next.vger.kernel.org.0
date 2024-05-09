Return-Path: <linux-next+bounces-2248-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4458C19D7
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 01:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98B4F1C22A52
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 23:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAB012D758;
	Thu,  9 May 2024 23:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PVZktpqa"
X-Original-To: linux-next@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0B86245
	for <linux-next@vger.kernel.org>; Thu,  9 May 2024 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715296600; cv=none; b=kSt9FrYDad298BtyypQCAeJCMmbcngZ1h0uxCtzD20WEJlpVPzHI9Yq8cf+Y4Gh8luKJgFT9OTMpEWsyTchOfAU2ZCnY+Z2BlMYXSAHFlezF3I9hOD041rGKt2KUznxOMV+z8VAsq+ejfuu8n8pmRG7SSyW9mreGPjlXc16ZQSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715296600; c=relaxed/simple;
	bh=EeYIzLBvQx4IKziEV7PvM+S0Fz+Q37VPJh9CDGswnNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7lvADbdcGD31sOpMqYt9dKTdJSG3shMTZ7JJWIvmrI6R1Hzg8uKS6r3os6HDbH+XVc92a4zm0latXM8pSC5NwrG0zDV/VsoAYJHQn9m6THq/AyupVpTZeOrPA8+IIyh+6DrsvZsRphi+2xE+aNvDBVvwiV10notuh3Ws3pIWZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PVZktpqa; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 9 May 2024 19:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1715296596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kmpq4qsm9xW2KmIJo1KKqXkICsV8ykT2VohgeRvZUpE=;
	b=PVZktpqaWPH59fBEmkwmQwAHIESxbhgQZ2sI9DcZUUDPorK+mT98KD5bPX8VOyvfz8cjR5
	RrX5xQFwQQOIsC1VbXIDtFPaqdYUsI0nkfhBrjuwBU0FNEfNW9B3g54vTpTBeylot8HHx4
	6qtS6SoeFGA+jBnCbShkBhUHdw+LF2s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Coly Li <colyli@suse.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Matthew Mirvish <matthew@mm12.xyz>
Subject: Re: linux-next: manual merge of the refactor-heap tree with the
 block tree
Message-ID: <buehluxvo234sj7onzl6wwjmuslmnkh7g6vnpru23kpti6qmpp@7nqak2ser7mw>
References: <20240509152745.08af752f@canb.auug.org.au>
 <te64v6zwwor6jkco6uiu2zz7ern6ijhyu5okfvdz3bmj3w5qfp@mx4zdniwymqj>
 <Zj1RzZdtfL7UQax1@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zj1RzZdtfL7UQax1@visitorckw-System-Product-Name>
X-Migadu-Flow: FLOW_OUT

On Fri, May 10, 2024 at 06:44:29AM +0800, Kuan-Wei Chiu wrote:
> On Thu, May 09, 2024 at 03:58:57PM -0400, Kent Overstreet wrote:
> > On Thu, May 09, 2024 at 03:27:45PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the refactor-heap tree got conflicts in:
> > > 
> > >   drivers/md/bcache/bset.c
> > >   drivers/md/bcache/bset.h
> > >   drivers/md/bcache/btree.c
> > >   drivers/md/bcache/writeback.c
> > > 
> > > between commit:
> > > 
> > >   3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter")
> > > 
> > > from the block tree and commit:
> > > 
> > >   afa5721abaaa ("bcache: Remove heap-related macros and switch to generic min_heap")
> > > 
> > > from the refactor-heap tree.
> > > 
> > > Ok, these conflicts are too extensive, so I am dropping the refactor-heap
> > > tree for today.  I suggest you all get together and sort something out.
> > 
> > Coli and Kuan, you guys will need to get this sorted out quick if we
> > want refactor-heap to make the merge window
> 
> Hi Coli and Kent,
> 
> If I understand correctly, the reported bug is because we attempted to
> point (heap)->data to a dynamically allocated memory , but at that time
> (heap)->data was not a regular pointer but a fixed size array with a
> length of MAX_BSETS.
> 
> In my refactor heap patch series, I introduced a preallocated array and
> decided in min_heap_init() whether the data pointer should point to an
> incoming pointer or to the preallocated array. Therefore, I am
> wondering if my patch might have unintentionally fixed this bug?
> 
> I am unsure how to reproduce the reported issue. Could you assist me in
> verifying whether my assumption is correct?

This is a merge conflict, not a runtime. Can you rebase onto Coli's
tree? We'll have to retest.

