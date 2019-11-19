Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D268C102D5C
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 21:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfKSUQp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 15:16:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:48842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726792AbfKSUQo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Nov 2019 15:16:44 -0500
Received: from paulmck-ThinkPad-P72.home (unknown [199.201.64.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 005F622317;
        Tue, 19 Nov 2019 20:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574194604;
        bh=sQ5mn4/bjHd0zxd/0NupgN5c6d/PZOshKXN6NCaR33I=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=DFheVwMwx861VjuH67FyHyyt8wPctToRwbYPyhPND4UwwlCyGsSrx5BLOYfPmPknX
         skFvpPCBfPKdaXjqHndLjq2gfPfIrPDSfTEWsQaclB/pDbKUJb/jZQrZCyyWdxiQyc
         v3IegiSxc0oyWCNZWvkwzp3x+ehRYk9UrzGzN3/Q=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 8F9FC3520FA7; Tue, 19 Nov 2019 12:16:43 -0800 (PST)
Date:   Tue, 19 Nov 2019 12:16:43 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Marco Elver <elver@google.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH -next] kcsan, ubsan: Make KCSAN+UBSAN work together
Message-ID: <20191119201643.GF2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191119194658.39af50d0@canb.auug.org.au>
 <e75be639-110a-c615-3ec7-a107318b7746@infradead.org>
 <CANpmjNMpnY54kDdGwOPOD84UDf=Fzqtu62ifTds2vZn4t4YigQ@mail.gmail.com>
 <fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org>
 <20191119183407.GA68739@google.com>
 <20191119185742.GB68739@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119185742.GB68739@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 19, 2019 at 07:57:42PM +0100, Marco Elver wrote:
> Context:
> http://lkml.kernel.org/r/fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Marco Elver <elver@google.com>

Applied and pushed out on -rcu's "kcsan" branch, thank you both!

							Thanx, Paul

> ---
>  kernel/kcsan/Makefile | 1 +
>  lib/Makefile          | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
> index dd15b62ec0b5..df6b7799e492 100644
> --- a/kernel/kcsan/Makefile
> +++ b/kernel/kcsan/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  KCSAN_SANITIZE := n
>  KCOV_INSTRUMENT := n
> +UBSAN_SANITIZE := n
>  
>  CFLAGS_REMOVE_core.o = $(CC_FLAGS_FTRACE)
>  
> diff --git a/lib/Makefile b/lib/Makefile
> index 778ab704e3ad..9d5bda950f5f 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -279,6 +279,7 @@ obj-$(CONFIG_UBSAN) += ubsan.o
>  
>  UBSAN_SANITIZE_ubsan.o := n
>  KASAN_SANITIZE_ubsan.o := n
> +KCSAN_SANITIZE_ubsan.o := n
>  CFLAGS_ubsan.o := $(call cc-option, -fno-stack-protector) $(DISABLE_STACKLEAK_PLUGIN)
>  
>  obj-$(CONFIG_SBITMAP) += sbitmap.o
> -- 
> 2.24.0.432.g9d3f5f5b63-goog
