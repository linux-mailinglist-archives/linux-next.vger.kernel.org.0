Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2A5102DF1
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 22:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfKSVHs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 16:07:48 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:49350 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfKSVHs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 16:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=8LgZnqLUmOR88cQIUBGW/lJ1t/5IfAC+QU0QnjEpM/o=; b=eGaYs1XF4z+vyIZ1I9ie3H04c
        IQAYip3jN3jNs6hrVFTEu9Kplzb6gSo+sCy2r2E7sz7Ab2X3YduvRbouJ05T32K49IipbzrEKTJJg
        waI3qY7IKLzVvAbbJMfR/t3A1sUs0at50y+Y4EHHI5GE0M5mFrTAFnnQPxhnyrCOtuV01x+nrplB1
        Y1FP7Vef86nE0mY0Od7gLC1JzFuHz3IsdkOpleEhCfCkGzjGVpouEiL0NxGcSAwkbaI1IBRph3Y2W
        txKO4WkFdVb3n4NVkd77D88fQfFBFtvu21h8lWafBMowK7sQHWPVjNUvhBnF8bWIqrabMByaCX7jS
        dvwFwhbWw==;
Received: from [2601:1c0:6280:3f0::5a22]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iXAiv-0004uV-7V; Tue, 19 Nov 2019 21:07:46 +0000
Subject: Re: [PATCH -next] kcsan, ubsan: Make KCSAN+UBSAN work together
To:     Marco Elver <elver@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
References: <20191119194658.39af50d0@canb.auug.org.au>
 <e75be639-110a-c615-3ec7-a107318b7746@infradead.org>
 <CANpmjNMpnY54kDdGwOPOD84UDf=Fzqtu62ifTds2vZn4t4YigQ@mail.gmail.com>
 <fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org>
 <20191119183407.GA68739@google.com> <20191119185742.GB68739@google.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3b8e1707-4e46-560d-a1ea-22e336655ba6@infradead.org>
Date:   Tue, 19 Nov 2019 13:07:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119185742.GB68739@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/19/19 10:57 AM, Marco Elver wrote:
> Context:
> http://lkml.kernel.org/r/fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Marco Elver <elver@google.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

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
> 


-- 
~Randy
