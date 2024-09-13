Return-Path: <linux-next+bounces-3814-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 193479777A7
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 06:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BA93B2426A
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 04:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30331D3180;
	Fri, 13 Sep 2024 04:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lbm3z5oj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53F74C627;
	Fri, 13 Sep 2024 04:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726200009; cv=none; b=CTTfXGQ/NRvCWob1Ss+I0Ir1TnAmKttD65+ZyRYmqgI4SZssxzsJIz9woo5G0zEDpzhwcr1rjGFHqJjXSawDAHGKFU0nEqh44PUTufDqa8b8uuH477mCh1yXU1V5iLbXbTXV1imFEz7eBeRF0cWHGLtSFyP1JGQ+dTcFE3IMnzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726200009; c=relaxed/simple;
	bh=wCJj0QjizHN7+JE+3jSIfcY/91jPrm4H+frL7X4JJmk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nUdJmn0CHVsPaCCqhspXOp/FSyXfeT8roVQAXyRgeQW+RsENhxrAXn/RuM+e2v1G/v8eRYk7sGRUJCLsojbctKm87Rk3jqICoXjckE9YCfOGqvma/rGldwpJcglwgd8CTSuKtei4/bsb6nhPSAXzbiApxbVBiVIS1xp08rwmm5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lbm3z5oj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CF6C4CEC0;
	Fri, 13 Sep 2024 04:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726200009;
	bh=wCJj0QjizHN7+JE+3jSIfcY/91jPrm4H+frL7X4JJmk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Lbm3z5ojJmlbc9rdAjj8CZd1pciC9uBZe8CDWMK2ejaTxAAo6u1reBWchlHSl8xRE
	 3V6/nqTUAEC3B47bfsW5cNtxVl0cJTGChqrVZnr1Wy3MQA3ul8Wcmug2WMTINO/R3W
	 jdqyOVBUS/KMU0SvCj8MIs8jW4RbKYGTYi9GPhuVVFW9Ji8bwNXkBz4Ujc1hzkLQma
	 tS2dNm412fivMl7NhXHQbvrPuPnA8KmjPqNjkftmSUnRUNhbn/esKAY6xzYNcVZ/9+
	 vI33pBZEw8tG5sJoeV/dxV75IAWKMseIgoT5nGLzXUGvSuXBjB7BtCgZyb6GVZ3jdz
	 V+E3j1p08Go+A==
Date: Thu, 12 Sep 2024 21:00:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240912210008.35118a91@kernel.org>
In-Reply-To: <CAHS8izN0uCbZXqcfCRwL6is6tggt=KZCYyheka4CLBskqhAiog@mail.gmail.com>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
	<20240912200543.2d5ff757@kernel.org>
	<CAHS8izN0uCbZXqcfCRwL6is6tggt=KZCYyheka4CLBskqhAiog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Sep 2024 20:14:06 -0700 Mina Almasry wrote:
> > On Fri, 13 Sep 2024 12:53:02 +1000 Stephen Rothwell wrote:  
> > > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is not a multiple of 4)
> > > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229: net/core/page_pool.o] Error 1  
> >
> > Ugh, bad times for networking, I just "fixed" the HSR one a few hours
> > ago. Any idea what line of code this is? I'm dusting off my powerpc
> > build but the error is somewhat enigmatic.  
> 
> FWIW I couldn't reproduce this with these steps on top of
> net-next/main (devmem TCP is there):
> 
> make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- ppc64_defconfig
> make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j80
> 
> (build succeeds)
> 
> What am I doing wrong?

I don't see it either, gcc 11.1. Given the burst of powerpc build
failures that just hit the list I'm wondering if this is real.

