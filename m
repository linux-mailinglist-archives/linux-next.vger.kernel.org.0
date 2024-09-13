Return-Path: <linux-next+bounces-3827-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32019977FC8
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 14:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC3DE285694
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 12:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7D71C32E8;
	Fri, 13 Sep 2024 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqWdF1Pf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9176F1C2BF;
	Fri, 13 Sep 2024 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230356; cv=none; b=cTuQVN3JJBUuNbtWN3re/gVUazFnNkcoEr1EEJCOl7rP8JZDZvGxjaMImRLhVjAUEQCI2KaPZQexZKaqX+XPM1cRzX7hupCgkGuxfJ1Pv5mgR1iV+UbsbsCN86kJm3V6eCZGuAplsoSkbnrb4bSiqGVVzXZB2SoW8nVBNsPkfYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230356; c=relaxed/simple;
	bh=MKhVqQn9naKipl16z0G0brZ2rK+2vxoKridIOshtSSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meh3Etfzp77n781yDxRgjiMmWJTG15R8WrRzNrj45hy3TUb0338nJ6ZnEuz56AoYWBfUJK5Ih9Gv+GobXiFEkR7yJKgDOrqI8q5uffv0ZYSe2/UTddaGCQvrPWOzo81NelZuXqvz+OyA+GcyQgvyV2x9ISKI0TDFILH8BeJxuOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqWdF1Pf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C76C4CEC0;
	Fri, 13 Sep 2024 12:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230356;
	bh=MKhVqQn9naKipl16z0G0brZ2rK+2vxoKridIOshtSSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqWdF1Pf5siAOWSfSX6wxCYylknilZIwZfSBj0ojarzojNtTYhN9scUOWtsgBxQvg
	 y6mNppOfqXLUF9p6uqH4QyHrZgBaN8twMAzdi9p96YcN2sBVqMMv6EStoPSRd38fQ6
	 mxz5QhQy88EnSeC/m1aeIAsC4oW7FR5o5C9K0Sh881d28eeAfF9VERCmBqQwMnB2+d
	 5P3AQr8IWy6xUaHlDfdflR2CPR9mZJJHoX2vc9KWVBELfnuceadJRMVSYHBsNz3sca
	 3kye4WK9q/Sq/LFbtMGidu3zFk2Q96xnhHUAvx+VOKuEkxWzoGP8TuFHgu+I3LwT1M
	 u0iDseFweMjsg==
Date: Fri, 13 Sep 2024 13:25:52 +0100
From: Simon Horman <horms@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>,
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913122552.GZ572255@kernel.org>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
 <20240912200543.2d5ff757@kernel.org>
 <CAHS8izN0uCbZXqcfCRwL6is6tggt=KZCYyheka4CLBskqhAiog@mail.gmail.com>
 <20240912210008.35118a91@kernel.org>
 <20240913141317.3309f1c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913141317.3309f1c6@canb.auug.org.au>

On Fri, Sep 13, 2024 at 02:13:17PM +1000, Stephen Rothwell wrote:
> Hi Jakub,
> 
> On Thu, 12 Sep 2024 21:00:08 -0700 Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Thu, 12 Sep 2024 20:14:06 -0700 Mina Almasry wrote:
> > > > On Fri, 13 Sep 2024 12:53:02 +1000 Stephen Rothwell wrote:    
> > > > > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > > > > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is not a multiple of 4)
> > > > > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229: net/core/page_pool.o] Error 1    
> > > >
> > > > Ugh, bad times for networking, I just "fixed" the HSR one a few hours
> > > > ago. Any idea what line of code this is? I'm dusting off my powerpc
> > > > build but the error is somewhat enigmatic.    
> > > 
> > > FWIW I couldn't reproduce this with these steps on top of
> > > net-next/main (devmem TCP is there):
> > > 
> > > make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- ppc64_defconfig
> > > make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j80
> > > 
> > > (build succeeds)
> > > 
> > > What am I doing wrong?  
> > 
> > I don't see it either, gcc 11.1. Given the burst of powerpc build
> > failures that just hit the list I'm wondering if this is real.
> 
> $ gcc --version
> gcc (Debian 14.2.0-3) 14.2.0
> $ ld --version
> GNU ld (GNU Binutils for Debian) 2.43.1
> $ as --version
> GNU assembler (GNU Binutils for Debian) 2.43.1
> 
> All on a Powerpc 64 LE host.

FIIW, I have been able to reproduce this locally, on x86_64,
using the powerpc64 GCC-14.2.0 cross compiler from
https://mirrors.edge.kernel.org/pub/tools/crosstool/

make ARCH=powerpc CROSS_COMPILE=powerpc64-linux- ppc64_defconfig
make ARCH=powerpc CROSS_COMPILE=powerpc64-linux-

