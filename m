Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E997D40B27E
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 17:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbhINPHy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 11:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbhINPHy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Sep 2021 11:07:54 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D30C061762
        for <linux-next@vger.kernel.org>; Tue, 14 Sep 2021 08:06:36 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id p29so2604747lfa.11
        for <linux-next@vger.kernel.org>; Tue, 14 Sep 2021 08:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EzJJglIKGC48QdUN7q/bO92tR/bPSNOmcPTOelyHSLI=;
        b=QyiBaTXqJT3tfSj4FPnn3N5NJbOe8F+Cu+G+6IjAqi1mR6mzzmZRvnorZfNh67EhgA
         E0kmmFugaVyuhHWBDxX1l7I+O8WXBOV2L4Z+uUWbE6+aB3Aglp62OhtimUbqhHFm7JEG
         OFKxbo3qvCrdOzHN6gHAlI/xSVf+/qxXpALTbxz9eU9/8C6R0mH80f4oTEibxIdtjGJX
         SuAtDKyMruCYj438VU1jDvmCVcoomgJSNJEuCINoVMe5TJNmefdcbBT02IEPDGYSQPjC
         7mUJMxirCuXltF2UDOy3ZJMzjVcmfCpiIE/AJAmNQKpi5iQLyoGI9yHg4VL5Gz974KeL
         WAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EzJJglIKGC48QdUN7q/bO92tR/bPSNOmcPTOelyHSLI=;
        b=ZXc/V558usMqDb43TeFHxht7lidQ9jJwUoXi0gxghCkU4qmnQNGxMVS+yDYqWCKxYZ
         0D17YfYiHPEKMfWs/ozkdFFhGEIhvaemOq129nbtBiwLw4TIngyMow+CjOsH2k1dqhZR
         +LVvb4CB5vKPNrLT/17LliMdiHqRmm0it46jAXJLZpmYpsQkaOqREQbDmCZ7ZJhSx8Qp
         EKdyyfYDtYUrgtxjsLjMEoIf8Dpd6tVljU7xhDRr4I/b+hOUVP2r64Mm2X2+cb9DYQs9
         3YGPxWOL9L4L4GwLcSr4zgX6zrkEDEXvUzKZRPh0k/P36W6R7oS4XOasdUDMUFxrvRXS
         GX+w==
X-Gm-Message-State: AOAM533iR/4k/2PsCldkko/O63KWW/7rl084+N1UbBOODU5+zoUl7aeE
        Kv6lPl9u8YZSrdEt0B7gYU1mOMpWiyAmJRR39RT8Iw==
X-Google-Smtp-Source: ABdhPJyfzYJNUVcid0Mv8SrxwCc8R0D2eUc9I9Ak+tqlBDDyuc1xrf0IHGsLNaiPxPe8a7FMvUdpMXF8J8LcpwRWLp4=
X-Received: by 2002:a05:6512:14f:: with SMTP id m15mr8378352lfo.82.1631631994438;
 Tue, 14 Sep 2021 08:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <50a91600-173f-ae8f-e194-4649a9f8176b@linux.vnet.ibm.com> <20210914162223.363dd7c2@canb.auug.org.au>
In-Reply-To: <20210914162223.363dd7c2@canb.auug.org.au>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 14 Sep 2021 08:06:22 -0700
Message-ID: <CAKwvOdmHH-tOkCPGX-Si7gSujKj-CV3O5UjZD7BNtsTKwMmkeA@mail.gmail.com>
Subject: Re: [5.15-rc1][PPC][bisected 6d2ef226] mainline build breaks at
 ./include/linux/compiler_attributes.h:62:5: warning: "__has_attribute"
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-next <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        sachinp <sachinp@linux.vnet.ibm.com>, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 13, 2021 at 11:22 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Abdul,
>
> On Tue, 14 Sep 2021 11:39:44 +0530 Abdul Haleem <abdhalee@linux.vnet.ibm.com> wrote:
> >
> > Today's mainline kernel fails to compile on my powerpc box with below errors
> >
> > ././include/linux/compiler_attributes.h:62:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
> >   #if __has_attribute(__assume_aligned__)
> >       ^~~~~~~~~~~~~~~
> > ././include/linux/compiler_attributes.h:62:20: error: missing binary operator before token "("
> >   #if __has_attribute(__assume_aligned__)
> >                      ^
> > ././include/linux/compiler_attributes.h:88:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
> >   #if __has_attribute(__copy__)
> >       ^~~~~~~~~~~~~~~
> > ././include/linux/compiler_attributes.h:88:20: error: missing binary operator before token "("
> >   #if __has_attribute(__copy__)
> >
> > Kernel builds fine when below patch is reverted
> >
> > commit 6d2ef22 : compiler_attributes.h: drop __has_attribute() support for gcc4
>
> Thanks for your report.
>
> This is known and being addressed.

Thanks for the report. Support for GCC 4.X has been dropped.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=76ae847497bc5207c479de5e2ac487270008b19b
-- 
Thanks,
~Nick Desaulniers
