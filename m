Return-Path: <linux-next+bounces-2809-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6843A924C05
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 01:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07433B21507
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 23:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0887217A588;
	Tue,  2 Jul 2024 23:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIHtGzAN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9611DA336;
	Tue,  2 Jul 2024 23:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719961796; cv=none; b=j9PnT6/MnZG/PnukoTmwVRgLfsfFn1cFOfR10asFzCuFnh+IOQJ47Ey6zdLWZoxqA3rtQs6ynEnJTcz0KYh6bjGh91ht3sjIJ4Dg/VK4+KQE/7ESV/C6gqFIdAu88ImB13qVp6YRio6ZV9D7uZ1VsAne6QiPUSz/Ka6mI0F4ves=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719961796; c=relaxed/simple;
	bh=y9N33F06ZryHfZyNCGspkxZ0ZNsGT6P0cegl8jrhM58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/4E8yHMWmkdlzCQWJYG67X6upBzGBNLy/lIe0uk7P7Adw395nwmDAMeyY0urrnWvXsWn1CY7pAa+XjO8KYUl8LpsgHnwol5TW+8v0XuT41a78/hDiRVVMpcfFGJ796dyTTnjL2rKqVTuNDuusJBIfWqOpRehQKkOfUYt2+49/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIHtGzAN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D61C116B1;
	Tue,  2 Jul 2024 23:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719961796;
	bh=y9N33F06ZryHfZyNCGspkxZ0ZNsGT6P0cegl8jrhM58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kIHtGzANmyAGQjd3gd5BY5TBypu6EbczX0pUawHMD/+Q6oalVLzanDd48B//6FBJV
	 IFOUH6LEmF5UXOSoT4vjqwgrKm3sSbEVRanteFtI1aKLRyfIYTQwCHrX08m7dcqv2D
	 7SURJ4gukQDBxVyV0cohxnHocbzXX7RIMwsYCLw6ba9uRfVj7bdl+LH+WZDqnJeBYX
	 tfsVL1eNkq8XIuSKKhq226IsB75GfYpm2/WCQE3KqWtksSUwBZJxXpsXNjduHDaOWR
	 U0fCVVEkejOguaurUAEfgwzBqGsSfSPfMXAlaLeXYqZRR+21tLX4zIpQzjGnaB2W5u
	 4XcScGsl4a8Rw==
From: SeongJae Park <sj@kernel.org>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	linux-doc@vger.kernel.org
Subject: Re: linux-next: build warnings after merge of the mm tree
Date: Tue,  2 Jul 2024 16:09:51 -0700
Message-Id: <20240702230951.78721-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CACw3F52_obAB742XeDRNun4BHBYtrxtbvp5NkUincXdaob0j1g@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Jiaqi,


On Mon, 1 Jul 2024 23:37:55 -0700 Jiaqi Yan <jiaqiyan@google.com> wrote:

> On Mon, Jul 1, 2024 at 11:18 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Mon, 1 Jul 2024 21:33:20 -0700 Jiaqi Yan <jiaqiyan@google.com> wrote:
> >
> > > > > This seems a reasonable thing to do so there's probably some way in
> > > > > which to do it, but a bit of grepping failed to turn up examples in
> > > > > existing .rst files.  Can someone please suggest?
> > > >
> > > > It seems I need to add some blank lines according to [1], especially
> > > > to add a blank line above the first list item:

According to my understanding and testing on my machine, it seems we need blank
lines only before and after the blocks.

[...]
> 
> Ah, sorry Andrew, I should sent out this diff, as there are more blank
> lines needed:
> 
> diff --git a/Documentation/admin-guide/sysctl/vm.rst
> b/Documentation/admin-guide/sysctl/vm.rst
> index 75e22137d849..f48eaa98d22d 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -274,12 +274,15 @@ Correctable memory errors are very common on
> servers. Soft-offline is kernel's
>  solution for memory pages having (excessive) corrected memory errors.
> 
>  For different types of page, soft-offline has different behaviors / costs.
> +

So, this was needed to make 'make htmldocs' quiet on my machine.

>  - For a raw error page, soft-offline migrates the in-use page's content to
>    a new raw page.
> +
>  - For a page that is part of a transparent hugepage, soft-offline splits the
>    transparent hugepage into raw pages, then migrates only the raw error page.
>    As a result, user is transparently backed by 1 less hugepage, impacting
>    memory access performance.
> +

But above two blank lines were not really needed to make 'make htmldocs' calm,
at least on my setup.  Many other documents also don't have this kind of blank
line.

>  - For a page that is part of a HugeTLB hugepage, soft-offline first migrates
>    the entire HugeTLB hugepage, during which a free hugepage will be consumed
>    as migration target.  Then the original hugepage is dissolved into raw
> @@ -296,8 +299,11 @@ the request to soft offline the pages.  Its
> default value is 1.
> 
>  It is worth mentioning that after setting enable_soft_offline to 0, the
>  following requests to soft offline pages will not be performed:
> +

Interestingly, 'make htmldocs' didn't complain even if I don't put this blank
line.  But for consistency (see the beginning of sysctl/vm.rst), I think having
this would be good.

>  - Request to soft offline pages from RAS Correctable Errors Collector.
> +
>  - On ARM, the request to soft offline pages from GHES driver.
> +

Again, same to the reason above, it seems above two blank lines are not really
needed.

>  - On PARISC, the request to soft offline pages from Page Deallocation Table.
> 
>  extfrag_threshold
> 

I have no strong opinion about these, though.  Having four more blank lines
that might unnecessary is obviously no problem.


Thanks,
SJ

