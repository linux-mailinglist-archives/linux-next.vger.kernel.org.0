Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210462D499E
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 19:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387457AbgLIS46 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 13:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733278AbgLIS45 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 13:56:57 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90134C0613D6
        for <linux-next@vger.kernel.org>; Wed,  9 Dec 2020 10:56:16 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id x12so959038plr.10
        for <linux-next@vger.kernel.org>; Wed, 09 Dec 2020 10:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pDJdJ9jg4hC1Qi0/LCWeL6vCBADxdHWZeYcpiMBLSJc=;
        b=nVp8+U0Qroi2FT7wnDNiFbiJGQRepo6/TYrAIEWpub49d3b1Rf71FHqsD/IV1eDXAA
         vDl526q7G5TlunnyghLgc/5lsVrl47BiOypoqpedCRuFKslDZK9BLsAk2ITcKrcxhfUE
         2N6mg+W4189MzMrHgSOsirbNic+iWTEixACsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pDJdJ9jg4hC1Qi0/LCWeL6vCBADxdHWZeYcpiMBLSJc=;
        b=dNBzYZgkmQiGcNDrFDi0O15V8kDJHCSzUcJcS+E5Nyu2gAe1IJ98q25yUcDytdcjz2
         hdF48uGNfdsfRRE9Dv4RUXGv2WKFMrvwemFiLiA7mRN6+cQmb2Y079+jteNiB6/lnvJl
         PqDX4HrYVTcMaPDgVELDgLZTui0IIxuBMx8had8SM0sRoLEOnZStZaHpyZ/EDDHIRDyw
         QhJqiI9RGOpY/eEOcxiZTyQGe6PhRkF+Hnx9ofapQwxcUr2odBkZQbOtbOjVUXwa5+Lo
         qN7L1fZbIhd3hkmpKcIRROepNrtF1GsxO128oTCvHtouVaAlDOCca5aMQqdN5TvwnV/p
         nttQ==
X-Gm-Message-State: AOAM532Gv1NVB9QvV88VFJtbd2ZsOImpIsoglzmnos3yHWEzL/wN5Bu/
        1ccN37hDx3YdkmWkYit+WyIw++c7p5S/7DMW
X-Google-Smtp-Source: ABdhPJwo9EOLqYY/MKKwWwHzNMGDiczNMJB9r3poznesxukytTaNX7puzjij+8ktvXmFygnKe8zSjg==
X-Received: by 2002:a17:90b:1294:: with SMTP id fw20mr3388768pjb.187.1607540176026;
        Wed, 09 Dec 2020 10:56:16 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g85sm3347584pfb.4.2020.12.09.10.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 10:56:15 -0800 (PST)
Date:   Wed, 9 Dec 2020 10:56:14 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Mathieu Malaterre <malat@debian.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
Message-ID: <202012091055.09D611EF31@keescook>
References: <20201204210000.660293c6@canb.auug.org.au>
 <20201208230157.42c42789@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208230157.42c42789@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 08, 2020 at 11:01:57PM +1100, Stephen Rothwell wrote:
> Hi Stephen,
> 
> On Fri, 4 Dec 2020 21:00:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > After merging the akpm tree, today's linux-next build (powerpc
> > allyesconfig) produced warnings like this:
> > 
> > ld: warning: orphan section `.data..Lubsan_data177' from `arch/powerpc/oprofile/op_model_pa6t.o' being placed in section `.data..Lubsan_data177'
> > 
> > (lots of these latter ones)
> 
> 781584 of them today!
> 
> > I don't know what produced these, but it is in the akpm-current or
> > akpm trees.
> 
> Presumably the result of commit
> 
>   186c3e18dba3 ("ubsan: enable for all*config builds")
> 
> from the akpm-current tree.
> 
> arch/powerpc/kernel/vmlinux.lds.S has:
> 
> #ifdef CONFIG_PPC32
>         .data : AT(ADDR(.data) - LOAD_OFFSET) {
>                 DATA_DATA
> #ifdef CONFIG_UBSAN
>                 *(.data..Lubsan_data*)
>                 *(.data..Lubsan_type*)
> #endif
>                 *(.data.rel*)
>                 *(SDATA_MAIN)
> 
> added by commit
> 
>   beba24ac5913 ("powerpc/32: Add .data..Lubsan_data*/.data..Lubsan_type* sections explicitly")
> 
> in 2018, but no equivalent for 64 bit.
> 
> I will try the following patch tomorrow:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 8 Dec 2020 22:58:24 +1100
> Subject: [PATCH] powerpc: Add .data..Lubsan_data*/.data..Lubsan_type* sections explicitly
> 
> Similarly to commit
> 
>   beba24ac5913 ("powerpc/32: Add .data..Lubsan_data*/.data..Lubsan_type* sections explicitly")
> 
> since CONFIG_UBSAN bits can now be enabled for all*config.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/kernel/vmlinux.lds.S | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 3b4c26e94328..0318ba436f34 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -296,6 +296,10 @@ SECTIONS
>  #else
>  	.data : AT(ADDR(.data) - LOAD_OFFSET) {
>  		DATA_DATA
> +#ifdef CONFIG_UBSAN
> +		*(.data..Lubsan_data*)
> +		*(.data..Lubsan_type*)
> +#endif
>  		*(.data.rel*)
>  		*(.toc1)
>  		*(.branch_lt)
> -- 
> 2.29.2
> 
> -- 
> Cheers,
> Stephen Rothwell

Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks for figuring this one out. :) Andrew, can you add this to your
ubsan patch stack, or do you want me to resend it to you directly?


-- 
Kees Cook
