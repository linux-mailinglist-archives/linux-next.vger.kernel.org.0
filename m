Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94AF22F9956
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 06:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730964AbhARFj0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 00:39:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbhARFjY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Jan 2021 00:39:24 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4B4C061573
        for <linux-next@vger.kernel.org>; Sun, 17 Jan 2021 21:38:44 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id q7so10249376pgm.5
        for <linux-next@vger.kernel.org>; Sun, 17 Jan 2021 21:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3peYgY9ExE+vRqA9gIy7g+TwQHccp6K19ADgDHdSPGM=;
        b=SYpIu/9uK1ZF+XOYjTY4gIH31V73RpHloLgRrohHxMh/kZcPAX725IRTd80NAwfz2o
         qaqfn/arm2h4h59Timr+3b1l+BOctZKeU5SrPXA5zyeuWuxXKtIg2gm/aW4tjVCF/s9t
         G5PZH3vLHgtvUNdKwUVWdX0niylFb+6fbBWJwXXEdNGCDGk6nVdMEpX5/szznCjH1JdA
         BdpzMhCv0I8+HrwtNgEds5GDkPDh+ODH1k6UxPe05hE8CzlLvrMyf9fqwHDTyqF/GPZ9
         6z94HIrH79rCwzj/NumSJxz+DtgGtyxb38KrU0d3NX/uifhCEyxS4KN1WoBJtG2kPcUi
         UY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3peYgY9ExE+vRqA9gIy7g+TwQHccp6K19ADgDHdSPGM=;
        b=hANXuZSB9TASFOpl1pi4GRcPtwOdpqf2sOCukUEwWAL7gkgOmZTU143uMfOHeuyExL
         gKtLC0liu/thXhJYj7zEsHcJKlICQtXyQQUSFsnJ0uECSDmhDfHS50bUGtClJRTkKZ9B
         fwxV0YRcUNrhXhaqQRR1j1bKpnmkRGefam+SB3gkNKrjSoUcuUr3gGE0DGYdx89K5F5s
         Wdu06aM5s+kx5b7g6rf7t6xTeDRbifh3sk/KsVA21ttRIsxK9k29284PjYwkiYXiWVW1
         UgjnZ3bumFQcaq0X8xzBLMsmLLqWxO9ru1l96UdUI3KwiKKJyZA463h0FrqTyhbqGmnT
         6eUA==
X-Gm-Message-State: AOAM533Uk6EPSUDmJEv+JD5KgcK7gZdMDBPAeSafSZLlIxW3CSLXweJA
        3m+XIudNg7ish8KSx6Cglq6PlIIeuZjeng==
X-Google-Smtp-Source: ABdhPJw1EYlDllnHHry1kpROUfpNAjhlnK5f/v+IqkymKWr8wMn1msn2cXOKG7MJ+i0Q7b2Qr7PZCA==
X-Received: by 2002:a63:184b:: with SMTP id 11mr25018831pgy.298.1610948324017;
        Sun, 17 Jan 2021 21:38:44 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id d124sm14151552pgc.68.2021.01.17.21.38.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Jan 2021 21:38:43 -0800 (PST)
Date:   Mon, 18 Jan 2021 11:08:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the oprofile-removal
 tree
Message-ID: <20210118053841.tae5t3riew5adtfr@vireshk-i7>
References: <20210118163151.0d46ecc8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118163151.0d46ecc8@canb.auug.org.au>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 18-01-21, 16:31, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the oprofile-removal tree, today's linux-next build
> (powerpc allyesconfig) failed like this:
> 
> make[4]: *** No rule to make target 'arch/powerpc/platforms/cell/spu_notify.o', needed by 'arch/powerpc/platforms/cell/built-in.a'.
> 
> Caused by commit
> 
>   43d297a9e028 ("arch: powerpc: Stop building and using oprofile")
> 
> I have applied the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 18 Jan 2021 16:19:34 +1100
> Subject: [PATCH] arch: powercp: update cell Makefile for the removal of
>  spu_notify.c
> 
> Fixes: 43d297a9e028 ("arch: powerpc: Stop building and using oprofile")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/platforms/cell/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/cell/Makefile b/arch/powerpc/platforms/cell/Makefile
> index 10064a33ca96..7ea6692f67e2 100644
> --- a/arch/powerpc/platforms/cell/Makefile
> +++ b/arch/powerpc/platforms/cell/Makefile
> @@ -19,7 +19,6 @@ spu-priv1-$(CONFIG_PPC_CELL_COMMON)	+= spu_priv1_mmio.o
>  spu-manage-$(CONFIG_PPC_CELL_COMMON)	+= spu_manage.o
>  
>  obj-$(CONFIG_SPU_BASE)			+= spu_callbacks.o spu_base.o \
> -					   spu_notify.o \
>  					   spu_syscalls.o \
>  					   $(spu-priv1-y) \
>  					   $(spu-manage-y) \

Thanks Stephen. I have already fixed this and pushed the change earlier this
morning. The latest tree should already have this fixed.

-- 
viresh
