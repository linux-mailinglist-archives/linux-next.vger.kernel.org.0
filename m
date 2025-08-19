Return-Path: <linux-next+bounces-7996-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC2EB2B71A
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 04:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FA3F525738
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 02:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68C725B663;
	Tue, 19 Aug 2025 02:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SljUAVdx"
X-Original-To: linux-next@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEDC25A35F
	for <linux-next@vger.kernel.org>; Tue, 19 Aug 2025 02:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755571033; cv=none; b=gZ8PEHBEyTrC7BVkIbjvQuVEsUKoI+rDeBJXGhglm6q5n1d9PVjnfVnNgVWaGFm04pZgSv192QrzGixm0z4HworWfQoKU+4npTy1bhS+g/zSBFxDUmwZWJXRlgpVHMRRetdxyJbvIQFfuQUyFJ5+/BUtGplOklC0u9xt3jlhmyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755571033; c=relaxed/simple;
	bh=TXqGIarQXNUnuGrQGb4YSxS5D9GUGrQ4zkPKFPWSo6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJI4J4Vk456SVxWK/KXbKwiIPW5yoPl8+teaavhTV7MAKYmAim20eWI5iuEWn5f7PVi0G7ARJN/onWXfOfy8agZEerdF1zTL26xItqvQVB+aK5ei4X8kcFof2vcbjTKXGOUE0UW9gaAMV7T3Ap/F6Cvi/EsQeBpoO/QuyOxrgvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SljUAVdx; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 18 Aug 2025 22:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755571017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JRlBiCr1iTc5ztXhB852cJsAo/XIDecyi9d1t8UhtyQ=;
	b=SljUAVdx50jdOeV8RDfCk3rlljwGF5FHFEjkLqO0hMhSgNd8KOT057hHiYG3DZTA5QDNbS
	DLsmNSZA6OGEutNTVuMt9zguBo8bVkJmabkzlwSyjNkZTyyn0mbC3D+G9wZGJBcsaMH7kt
	4kTk+suzI1FyyvQBg5XNbYz/rUU91l4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: Re: linux-next: manual merge of the bcachefs tree with the
 mm-unstable tree
Message-ID: <bdksoo6vcwik4sdgj2lo5tkzo2ybdhvskyba7aad2bnyispqad@hrpx56mpy3ag>
References: <20250819111228.6c6209eb@canb.auug.org.au>
 <20250818192941.94fa175267dd4e334ca529ad@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818192941.94fa175267dd4e334ca529ad@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT

On Mon, Aug 18, 2025 at 07:29:41PM -0700, Andrew Morton wrote:
> On Tue, 19 Aug 2025 11:12:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Today's linux-next merge of the bcachefs tree got a conflict in:
> > 
> >   fs/bcachefs/darray.c
> > 
> > between commit:
> > 
> >   97b75b7e275a ("mm/slub: allow to set node and align in k[v]realloc")
> > 
> > from the mm-unstable tree and commit:
> > 
> >   808708fe9da0 ("bcachefs: darray_make_room_rcu()")
> > 
> > from the bcachefs tree.
> > 
> > ...
> >
> > --- a/fs/bcachefs/darray.c
> > +++ b/fs/bcachefs/darray.c
> > @@@ -20,10 -22,11 +22,11 @@@ int __bch2_darray_resize_noprof(darray_
> >   		if (unlikely(check_mul_overflow(new_size, element_size, &bytes)))
> >   			return -ENOMEM;
> >   
> > - 		void *data = likely(bytes < INT_MAX)
> > + 		void *old = d->data;
> > + 		void *new = likely(bytes < INT_MAX)
> >  -			? kvmalloc_noprof(bytes, gfp)
> >  +			? kvmalloc_node_align_noprof(bytes, 1, gfp, NUMA_NO_NODE)
> >   			: vmalloc_noprof(bytes);
> > - 		if (!data)
> > + 		if (!new)
> >   			return -ENOMEM;
> 
> uh, OK, I guess a 2GB allocation is reasonable on a 16TB machine.

yeah, already had that argument with Linus :) journals get big these
days...

> But why does bcachefs find it necessary to bypass allocation profiling?

Not bypassing, darray is a generic container that's used all over the
place, I have it wrapped so that allocations are tagged to the proper
callsite. Been doing that with various random containers, makes it dead
easy to chase down leaks and I don't have to ask users to compile custom
kernels.

