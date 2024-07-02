Return-Path: <linux-next+bounces-2790-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79391EED0
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 08:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 323A4283042
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 06:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDCA41E22;
	Tue,  2 Jul 2024 06:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xq9BHxRa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C008BFA;
	Tue,  2 Jul 2024 06:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719901108; cv=none; b=U4ENHhU4u+ju7ihMnuXgM4/eHEuQSlVl2F4ndy6W+LNCfPFoKW/BUsEosZyhUo0xpczJrf87lDNFbIDsHdO1l+S+lN0nqYclAW3MeV6aO85Yz2R+7rWhn9uZbkxnmVLsiki3X3BnzCKpu/xTLSfm+7E960k31310t2B1J0mIzwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719901108; c=relaxed/simple;
	bh=xcbo7H35s62k57wpp5CZn9fiLqU/YmxQeNb6aW/ijbo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ToKDqVS4X/qdS5YCvkmzJUS2qXu8AsZmgx7a7lUrxAX/Y30+ShRskUUp06dY7rD6X1an51L+vKU67QS4yutYFM/wD78m7xV0C4ypAxOSqaHQDtr2htzdKadL4dciY9RdMR+BTosB3gvfV1B402rWdJJxJ9nGdiQNngPgboHawow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xq9BHxRa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5652BC116B1;
	Tue,  2 Jul 2024 06:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1719901107;
	bh=xcbo7H35s62k57wpp5CZn9fiLqU/YmxQeNb6aW/ijbo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xq9BHxRaLm52nTg3V4uSDWdhiU55d5dItWGm5OHO3o4KIVhuoqsvVssq6bDEMMvrb
	 um7p7vo59/H5oQatAtFS2oz2iJvFHgWrKF7uKqXdWuXI5g91dRjjQs6nD+yBMdCV0n
	 cijErqWZNuWe6RxHe81qqlkxaUUY8GJkrQgUYybM=
Date: Mon, 1 Jul 2024 23:18:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: Re: linux-next: build warnings after merge of the mm tree
Message-Id: <20240701231826.fb3044bb52dc97bedc9853ab@linux-foundation.org>
In-Reply-To: <CACw3F52wm=5Rg+QP-E7JDOjBvA2mYv0uDBL+8=KPCfQ8tkHQaA@mail.gmail.com>
References: <20240701184912.01f1f9ce@canb.auug.org.au>
	<20240701201448.7878e9b35e1569bfc1f2ddbc@linux-foundation.org>
	<CACw3F52=GxTCDw-PqFh3-GDM-fo3GbhGdu0hedxYXOTT4TQSTg@mail.gmail.com>
	<CACw3F52wm=5Rg+QP-E7JDOjBvA2mYv0uDBL+8=KPCfQ8tkHQaA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Jul 2024 21:33:20 -0700 Jiaqi Yan <jiaqiyan@google.com> wrote:

> > > This seems a reasonable thing to do so there's probably some way in
> > > which to do it, but a bit of grepping failed to turn up examples in
> > > existing .rst files.  Can someone please suggest?
> >
> > It seems I need to add some blank lines according to [1], especially
> > to add a blank line above the first list item:
> >
> > diff --git a/Documentation/admin-guide/sysctl/vm.rst
> > b/Documentation/admin-guide/sysctl/vm.rst
> > index 75e22137d849..74b4c0f65213 100644
> > --- a/Documentation/admin-guide/sysctl/vm.rst
> > +++ b/Documentation/admin-guide/sysctl/vm.rst
> > @@ -274,12 +274,15 @@ Correctable memory errors are very common on
> > servers. Soft-offline is kernel's
> >  solution for memory pages having (excessive) corrected memory errors.
> >
> >  For different types of page, soft-offline has different behaviors / costs.
> > +
> >  - For a raw error page, soft-offline migrates the in-use page's content to
> >    a new raw page.
> > +
> >  - For a page that is part of a transparent hugepage, soft-offline splits the
> >    transparent hugepage into raw pages, then migrates only the raw error page.
> >    As a result, user is transparently backed by 1 less hugepage, impacting
> >    memory access performance.
> > +
> >  - For a page that is part of a HugeTLB hugepage, soft-offline first migrates
> >    the entire HugeTLB hugepage, during which a free hugepage will be consumed
> >    as migration target.  Then the original hugepage is dissolved into raw
> >
> > But I am having trouble testing the build, so wasn't able to validate
> > the change above:
> >
> > Documentation$ make
> > /tools/net/ynl/ynl-gen-rst.py -o
> > /Documentation/networking/netlink_spec/index.rst -x
> > make: /tools/net/ynl/ynl-gen-rst.py: No such file or directory
> > make: *** [Makefile:113:
> > /Documentation/networking/netlink_spec/index.rst] Error 127

You need to install all sorts of whacky system and python packages. 
The (failed) build process should guide you through this.

> I tried another way: make htmldocs at repo's root directory. Although
> I wasn't able to finish the make process,
> 
> - without the blank lines:
> 
>   Documentation/admin-guide/sysctl/vm.rst:278: ERROR: Unexpected indentation.
>   Documentation/admin-guide/sysctl/vm.rst:279: WARNING: Block quote
> ends without a blank line; unexpected unindent.
> 
> - with the blank lines added, the ERROR and WARNING in vm/rst are gone.
> 
> Andrew and Stephen, what is the best way to post the fix for this?
> Should I send out a v8 of the patch with the blank lines added? or a
> standalone commit for this fix?

I added your fix, thanks.

