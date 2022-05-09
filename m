Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C09520830
	for <lists+linux-next@lfdr.de>; Tue, 10 May 2022 01:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbiEIXQB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 May 2022 19:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbiEIXQB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 May 2022 19:16:01 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024B32A3770
        for <linux-next@vger.kernel.org>; Mon,  9 May 2022 16:12:06 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id x18so15244051plg.6
        for <linux-next@vger.kernel.org>; Mon, 09 May 2022 16:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jl/IO2JYaCenGTUlnHCrErzGX9H2mywbW7FyzIzxnlA=;
        b=mpGLIrSgUUHCZhrrS8bCYLmRSBewv2pPHkK2Is3lmEMdaDvhPnbICG4w4yERYtXpeY
         IQh5Aqgy2haTXPREu6ZvCtWM/RMPg5ktQuW2axpG0DLmHjTZndjsc/oh543SQa+i1VP9
         A28KEQWjIUod6+XGRkXi7CeLDicbR/u7M+6Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jl/IO2JYaCenGTUlnHCrErzGX9H2mywbW7FyzIzxnlA=;
        b=7iABQNzqH+32bwLB549CtzH85SJHlkSbQTBAgCus4sM8cyMKh1vRyNUXb8VG3Pa6xy
         BY6GzPC1ePU3vkV4ge2AwtJ05HPyXnMBvmL+rM3vkvAU2WAN/dLSmz5Mey72ZoHNe9nN
         654+khFdmEgw8A/ETZuQ6hPEmLhoC39iljGP70u44wIQx3pCqfnptqfvGGyqTtWPOXRw
         VNqtPvkkRX3pPanYx7QwHqwq7NotfIwUhYNEI/NcEGDz9GUy5g7jjWaHgXnl7rG6UPud
         Dyl/JD9WekSPtZSvEXSNhtxt4bEVSsSndjCqtBtccL4IT8UQ3emKxwcNsIPu6nP+GRes
         rKxQ==
X-Gm-Message-State: AOAM532kBTeHLNf6gFy56sqIsifJeY1zWRUn2NSKHJPaodgshVUJdruK
        OyRvg0BuM3427NGppDhXRv7B/g==
X-Google-Smtp-Source: ABdhPJzQflCgz5JK4e0KFiWfgtyKFTqiXWIgqy9QNfmPKftpKt1cUAKAoW4AzypZFYpaCQYB74EzPA==
X-Received: by 2002:a17:902:da91:b0:15e:b782:c60f with SMTP id j17-20020a170902da9100b0015eb782c60fmr17775455plx.39.1652137925526;
        Mon, 09 May 2022 16:12:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x3-20020a17090a9dc300b001da3920d985sm266241pjv.12.2022.05.09.16.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 16:12:05 -0700 (PDT)
Date:   Mon, 9 May 2022 16:12:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: linux-next: manual merge of the kspp tree with the char-misc tree
Message-ID: <202205091610.4375DD0A@keescook>
References: <20220509185344.3fe1a354@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509185344.3fe1a354@canb.auug.org.au>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 09, 2022 at 06:53:44PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kspp tree got a conflict in:
> 
>   drivers/misc/lkdtm/stackleak.c
> 
> between commit:
> 
>   73f62e60d80c ("lkdtm: Move crashtype definitions into each category")
> 
> from the char-misc tree and commits:
> 
>   c393c0b98d75 ("lkdtm/stackleak: prevent unexpected stack usage")
>   932c12ae7963 ("lkdtm/stackleak: fix CONFIG_GCC_PLUGIN_STACKLEAK=n")
> 
> from the kspp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/misc/lkdtm/stackleak.c
> index 210c84dfe1d2,82369c6f889e..000000000000
> --- a/drivers/misc/lkdtm/stackleak.c
> +++ b/drivers/misc/lkdtm/stackleak.c
> @@@ -81,11 -115,21 +115,29 @@@ out
>   	}
>   }
>   
>  -void lkdtm_STACKLEAK_ERASING(void)
> ++static void lkdtm_STACKLEAK_ERASING(void)
> + {
> + 	unsigned long flags;
> + 
> + 	local_irq_save(flags);
> + 	check_stackleak_irqoff();
> + 	local_irq_restore(flags);
> + }
> + #else /* defined(CONFIG_GCC_PLUGIN_STACKLEAK) */
>  -void lkdtm_STACKLEAK_ERASING(void)
> ++static void lkdtm_STACKLEAK_ERASING(void)
> + {
> + 	if (IS_ENABLED(CONFIG_HAVE_ARCH_STACKLEAK)) {
> + 		pr_err("XFAIL: stackleak is not enabled (CONFIG_GCC_PLUGIN_STACKLEAK=n)\n");
> + 	} else {
> + 		pr_err("XFAIL: stackleak is not supported on this arch (HAVE_ARCH_STACKLEAK=n)\n");
> + 	}
> + }
> + #endif /* defined(CONFIG_GCC_PLUGIN_STACKLEAK) */
>  +static struct crashtype crashtypes[] = {
>  +	CRASHTYPE(STACKLEAK_ERASING),
>  +};
>  +
>  +struct crashtype_category stackleak_crashtypes = {
>  +	.crashtypes = crashtypes,
>  +	.len	    = ARRAY_SIZE(crashtypes),
>  +};

Thanks! Yes, this looks correct. The "tricky" bit here is making sure
both lkdtm_STACKLEAK_ERASING instances are static, which you did. :)

-Kees

-- 
Kees Cook
