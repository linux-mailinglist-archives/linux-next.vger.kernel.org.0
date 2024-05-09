Return-Path: <linux-next+bounces-2246-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C987E8C15CC
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 21:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F4B21F23942
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 19:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854657FBC1;
	Thu,  9 May 2024 19:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Et6KlpKC"
X-Original-To: linux-next@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22E17D088
	for <linux-next@vger.kernel.org>; Thu,  9 May 2024 19:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715284743; cv=none; b=lkMsuNuOXB/YYcbJvvcGDDEBbOdSiRhfYhbR2N+65BRg8LwPeRsTn4pgtd/a1rf6W2FlZ9o1V/A59JkRO80wwP1ED7cSsHRwKfvy3F+Mt6rZm/KJayWnmLiDmiOFHhQ+v88YXWO4yijqzxAvxbUXndkGuGzOPOOFT6MNyLFKtA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715284743; c=relaxed/simple;
	bh=OnbQe+bCqY2rYw1sxfcLYriS5FEuZk4a26vibIkjt1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZ5NnRRxfS8ifDc/43T+8dgKd+kXGne5WMKEwQjhcTjzXpxqMFKfICkfBRdkq2dZjr7UTIfC1i0yyyA63btBiK5l5GuhH+/IwH5IrpoAzbffXaCFz+h5eStcg3B6mUAabb9z/bhWcee5p1ZIvEYIxU1w9C/mhQSAX5x+tpDp5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Et6KlpKC; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 9 May 2024 15:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1715284740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U1xiXJpUfTT+mb4SIUCAoc8Fh3im5TmPn8g7fMC9GdA=;
	b=Et6KlpKC7tLOBT+aJswTbWijbiptHMLJUNCE6RqFW2qwuz5t8GtY1irAH9CE7c4AQWZlk+
	x7pCyfRSZAwg/UCz2L4di+O236Vpx2zjVjmGdMfih5zJ8VTyDlVJfKzifBGZR59xeDHZH/
	dYnYIMiD+LOTZr8qrwwVj0ZYwTU1UJg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Coly Li <colyli@suse.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matthew Mirvish <matthew@mm12.xyz>
Subject: Re: linux-next: manual merge of the refactor-heap tree with the
 block tree
Message-ID: <te64v6zwwor6jkco6uiu2zz7ern6ijhyu5okfvdz3bmj3w5qfp@mx4zdniwymqj>
References: <20240509152745.08af752f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509152745.08af752f@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Thu, May 09, 2024 at 03:27:45PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the refactor-heap tree got conflicts in:
> 
>   drivers/md/bcache/bset.c
>   drivers/md/bcache/bset.h
>   drivers/md/bcache/btree.c
>   drivers/md/bcache/writeback.c
> 
> between commit:
> 
>   3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter")
> 
> from the block tree and commit:
> 
>   afa5721abaaa ("bcache: Remove heap-related macros and switch to generic min_heap")
> 
> from the refactor-heap tree.
> 
> Ok, these conflicts are too extensive, so I am dropping the refactor-heap
> tree for today.  I suggest you all get together and sort something out.

Coli and Kuan, you guys will need to get this sorted out quick if we
want refactor-heap to make the merge window

