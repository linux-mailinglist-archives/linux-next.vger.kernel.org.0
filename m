Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A73840B1EB
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 16:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbhINOsf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 10:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233671AbhINOsM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Sep 2021 10:48:12 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B89C06139F;
        Tue, 14 Sep 2021 07:41:50 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id bi4so19289348oib.9;
        Tue, 14 Sep 2021 07:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2hR9QSG6vMupJeiyjLECa1ePl2ArHm63XHcOJPhMkdM=;
        b=lSJiWyVBQ6gSkrPyECkmDuHb0RuAk7OkAA5xchw4GpZwITRhG3KZ52esuCObV3/cb9
         ypweXYWQosgUNFD9p5iJOaulAp4i4ythWZmwJSKhn0xhQbWKAlNyOc27BYfXfPP0gT3/
         TowESchePMs+EmTwUttJY1wgaiYGuU3/jlYUHsLORFUkS+LjqRdQIFdc8tOwWii2+Rq8
         PZFjk4uwEzPuq31JXwaXtFY0zvfhR9EtiKE+4I+MizyGAL1pyUdlDe2TIxkj0VN+JbPl
         t4LJHA6lH5neFiRhbYgX55FBEpWmmdcL5bakigQuE06LR5bg1x2JUEFU0Z79PAZF7ElN
         QuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=2hR9QSG6vMupJeiyjLECa1ePl2ArHm63XHcOJPhMkdM=;
        b=xvZshAYtNfwmTHpxU2LNS18NjOPYrLIGFYM/PjVDENWClGQxml5z6yRl2CsfZjyVEY
         8Lt8IJHEkL5HxAF3AI+Lp4zRWbEJoXVczupWq+8G7R3zg7LxDlSONXuQH+/sw/RssBDQ
         AKy9jGYV4PZu365sHqKuRCk9uQGQBbMONaZqVbPFdpCWmf9bpqBLfqh6YK0txy8csEgQ
         fYXp/CPXFgBRuEsgZ1WTD61bwyq789jusxngN67wcnDu2GgAGNrL9kekJGlNEk06J5Qk
         rB7oAelw5ZVeFeZmKXlv3Qzzk0xYiU/L3LXkTQ9VqNfF3m+YvVdj2LnWyfzPRgPgmoHg
         DIeg==
X-Gm-Message-State: AOAM531yr3HxwEqNGGIyxNxqBwJRahPqN9Rsl9+yCxg37YbgaJwkciYM
        Ycpt3E1uH4C0hRnLNSL/WcU=
X-Google-Smtp-Source: ABdhPJzB7AH50PqJp7mXB/HAsaEUEFu0MCSgjc2aPkPVSfvafh6mZCtSQbzK8fZsUzAfTEQORJp92Q==
X-Received: by 2002:aca:ad55:: with SMTP id w82mr1739107oie.45.1631630509868;
        Tue, 14 Sep 2021 07:41:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c7sm2688040otl.30.2021.09.14.07.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 07:41:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 14 Sep 2021 07:41:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     torvalds@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
        sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] powerpc/boot: Fix build failure since GCC 4.9 removal
Message-ID: <20210914144147.GA3444611@roeck-us.net>
References: <20210914121723.3756817-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914121723.3756817-1-mpe@ellerman.id.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 14, 2021 at 10:17:23PM +1000, Michael Ellerman wrote:
> Stephen reported that the build was broken since commit
> 6d2ef226f2f1 ("compiler_attributes.h: drop __has_attribute() support for
> gcc4"), with errors such as:
> 
>   include/linux/compiler_attributes.h:296:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
>     296 | #if __has_attribute(__warning__)
>         |     ^~~~~~~~~~~~~~~
>   make[2]: *** [arch/powerpc/boot/Makefile:225: arch/powerpc/boot/crt0.o] Error 1
> 
> But we expect __has_attribute() to always be defined now that we've
> stopped using GCC 4.
> 
> Linus debugged it to the point of reading the GCC sources, and noticing
> that the problem is that __has_attribute() is not defined when
> preprocessing assembly files, which is what we're doing here.
> 
> Our assembly files don't include, or need, compiler_attributes.h, but
> they are getting it unconditionally from the -include in BOOT_CFLAGS,
> which is then added in its entirety to BOOT_AFLAGS.
> 
> That -include was added in commit 77433830ed16 ("powerpc: boot: include
> compiler_attributes.h") so that we'd have "fallthrough" and other
> attributes defined for the C files in arch/powerpc/boot. But it's not
> needed for assembly files.
> 
> The minimal fix is to move the addition to BOOT_CFLAGS of -include
> compiler_attributes.h until after we've copied BOOT_CFLAGS into
> BOOT_AFLAGS. That avoids including compiler_attributes.h for asm files,
> but makes no other change to BOOT_CFLAGS or BOOT_AFLAGS.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Debugged-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/powerpc/boot/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> This seemed safer as a minimal fix, rather than doing a more
> comprehensive separation of CFLAGS/AFLAGS. We can do that in a future
> patch.
> 
> It passed my usual build/boot tests, including booting the built zImage
> on some real hardware, so this is good to go from my POV.
> 
> cheers
> 
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 6900d0ac2421..089ee3ea55c8 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -35,7 +35,6 @@ endif
>  BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>  		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
>  		 -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
> -		 -include $(srctree)/include/linux/compiler_attributes.h \
>  		 $(LINUXINCLUDE)
>  
>  ifdef CONFIG_PPC64_BOOT_WRAPPER
> @@ -70,6 +69,7 @@ ifeq ($(call cc-option-yn, -fstack-protector),y)
>  BOOTCFLAGS	+= -fno-stack-protector
>  endif
>  
> +BOOTCFLAGS	+= -include $(srctree)/include/linux/compiler_attributes.h
>  BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)/$(obj)
>  
>  DTC_FLAGS	?= -p 1024
> -- 
> 2.25.1
> 
