Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 129899A60F
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2019 05:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391538AbfHWDZ6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 23:25:58 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33297 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732186AbfHWDZ4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Aug 2019 23:25:56 -0400
Received: by mail-pl1-f194.google.com with SMTP id go14so4715411plb.0
        for <linux-next@vger.kernel.org>; Thu, 22 Aug 2019 20:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vWwHro73B3onPJp0WcmyAb4TGNSwDTbqk+D2wf0X80A=;
        b=ne/u+fPWajnUb/3FwKeDYUCR8AlvInk2kL4vUGdDlD7bePE9LoD7S1qAYiAK09k5EG
         r13WJu3ls3teAKaq4j0HL59pMytYPp0oluiScA9H+IMFxQyx7d2FCmiaO6ZG3borpsyF
         ycYOEoBKjo/xSgXRBJPuIQofX3uXpPT5r0cyQ2Xx7L42yl+8xBfTi4/n+KYlLBgzTDeN
         PgbVGikNK4U93JfhuUZMyVmrr0Ymooil47K1pkI1Lb7RIW/frGwkb9B43mRK6xW0F2PR
         foa4SWBXKc6ucR3ueRCqJ5cIW4o037K1sf4cxZsrtO1UAlbqy/SN1BVnSRqcg+pJM3vI
         shDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vWwHro73B3onPJp0WcmyAb4TGNSwDTbqk+D2wf0X80A=;
        b=uImQDQPTBAJWB/CC6F6SJBLqevN1v+HPw1m1WIfxGWMl7z/0uc71LG5NycxDurZ9LK
         BM+LSCZvFKhN9Kx1asknus/XFiWuFwbOkAON8z3E+wJXR7vpLICaSMYDoeRAQPjK6HOy
         alCS1ws/AxmwzgsGMw2HjycXqtnNJ9Q4cjYNjUMFi5oCFOcqfsIGrt8RkRNw6ABhP6jD
         dRw9xCNuYFhxFtGegpgwWTX1PS9XQuElhX32n+lria+8PS0qHiZJxFaDfSX6HTmGwqIF
         bfEzWfh9e+OE4a44vEFyeGcLYifN1qkns+jtolLQdrUoGTF8Xo9L+ZdQVPSoIYmQeVQi
         zSVg==
X-Gm-Message-State: APjAAAXc16NdUXE3cm+cMekdRp+KSV2fTdE0e3AwRlzryl1KaPkOsA82
        c3g3I/lDXtwZQXW4r8rUsjeeqvu78vhEEGhMG7Y1yQ==
X-Google-Smtp-Source: APXvYqyOcxLYA0uhJH+ZecTlV0RkEgb7QpKsFfgN5NY09q496mZkK8xBNs6iSe+8vwc5N1VY/XpO7+50T6oy7W4GMR4=
X-Received: by 2002:a17:902:8484:: with SMTP id c4mr2233158plo.223.1566530754768;
 Thu, 22 Aug 2019 20:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190823130841.4fdbda61@canb.auug.org.au>
In-Reply-To: <20190823130841.4fdbda61@canb.auug.org.au>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 22 Aug 2019 20:25:42 -0700
Message-ID: <CAKwvOdngP5Afe+W2_WnKvEium-EXZ7Bra3o_7RzJh+C4rKpTpw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the crypto tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

LGTM, sorry for the mid air collision.  Thanks for resolving, Stephen!

On Thu, Aug 22, 2019 at 8:08 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the crypto tree got a conflict in:
>
>   arch/x86/purgatory/Makefile
>
> between commit:
>
>   4ce97317f41d ("x86/purgatory: Do not use __builtin_memcpy and __builtin_memset")
>
> from Linus' tree and commit:
>
>   ad767ee858b3 ("crypto: sha256 - Move lib/sha256.c to lib/crypto")
>
> from the crypto tree.
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
> diff --cc arch/x86/purgatory/Makefile
> index 8901a1f89cf5,ea86982aba27..000000000000
> --- a/arch/x86/purgatory/Makefile
> +++ b/arch/x86/purgatory/Makefile
> @@@ -6,12 -6,11 +6,14 @@@ purgatory-y := purgatory.o stack.o setu
>   targets += $(purgatory-y)
>   PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
>
>  +$(obj)/string.o: $(srctree)/arch/x86/boot/compressed/string.c FORCE
>  +      $(call if_changed_rule,cc_o_c)
>  +
> - $(obj)/sha256.o: $(srctree)/lib/sha256.c FORCE
> + $(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
>         $(call if_changed_rule,cc_o_c)
>
> + CFLAGS_sha256.o := -D__DISABLE_EXPORTS
> +
>   LDFLAGS_purgatory.ro := -e purgatory_start -r --no-undefined -nostdlib -z nodefaultlib
>   targets += purgatory.ro
>


-- 
Thanks,
~Nick Desaulniers
