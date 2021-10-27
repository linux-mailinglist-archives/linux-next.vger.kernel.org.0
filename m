Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89E443CBDE
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 16:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242482AbhJ0OVt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 10:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242523AbhJ0OVn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 10:21:43 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F693C061227
        for <linux-next@vger.kernel.org>; Wed, 27 Oct 2021 07:19:01 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 5so11141609edw.7
        for <linux-next@vger.kernel.org>; Wed, 27 Oct 2021 07:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A7VSAROM1Lq92tsQzcvA0FV6paOOKRRSG0CkqXmrfHY=;
        b=WO/8J0WHy3bqbZ8bWtK8os21bmAyrg+d4GoI0FdQVNmBnedrhDrQwHoExDY2HYNc56
         wuGhdsWbyO6HMLfe7SEFEzeORWHjKA3PZMg0C1afDFnRQUD4ZqFUyBM5nPwZFehS7m/X
         W/E1Vfn3gFK5Z6fjNK0H27jiZurO+y4SQwZaV5JTnwtZ2OLx5cmApkpw8B1O6X9Xo+om
         726nvMv4VOVc1TVOL4hZMFRAdnEIUsRQn11GxzVLikDaXwVX/sMLg1dKx8sp7Q28O1DL
         OhJN2gwLwq3QBfaJBJecj9D85HBBgpvARrJFIHfm0cmYWs/UjVH5m3m/ip7qm2ysF2c5
         YYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A7VSAROM1Lq92tsQzcvA0FV6paOOKRRSG0CkqXmrfHY=;
        b=NAe+Sus1YITb0GNYVPsfJHO6rJA4TmhfJtoKuv1n3utzbIJCHGRahS3N5A4GxHA958
         S0ft0fwEt/6G1K+fOf5pbbTc7kf34s9pH97LoAAK+Pa1F/AMgyXFCDDwDQeJkfDagwfV
         f3lvib4Dp+u/1utegEW/beMzG24mhrj0IetUpLXeicHBq65jeraITEVBr4XOwZE8ehrE
         rZLgw+WAEeoTZunO1EBJOPzwi8fSSvT9IFO6S+JsS5S5bJ4u2/Kzt4NQ+IJbXW+MkhPL
         2WxYpdBm0gZfxVZmel81B1C/5hkSPV2ENXzxvOo5/FUUZyzcKXY2mKxdtIoBixdKqpK4
         Tg1Q==
X-Gm-Message-State: AOAM533N1Bxr1jbgD4ariYg3Y9U55xCqztwg11fcClEDC4A1y6AJqkol
        83ky9SXDgSGDVRTiIBRSVG2ycYo/ZLb4nPIkL3wR
X-Google-Smtp-Source: ABdhPJx/AVRgyCKdtHofrLmeNbJZOE7jZKTiy9OBTXYs7O2Og+i8eOPvBwKXpaar1l0AT/K2AG1HPgfhyoHnEQ1j4vY=
X-Received: by 2002:a17:906:919:: with SMTP id i25mr38774337ejd.171.1635344330893;
 Wed, 27 Oct 2021 07:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211026133147.35d19e00@canb.auug.org.au> <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
 <87tuh2aepp.fsf@mpe.ellerman.id.au> <2012df5e-62ec-06fb-9f4d-e27dde184a3f@csgroup.eu>
In-Reply-To: <2012df5e-62ec-06fb-9f4d-e27dde184a3f@csgroup.eu>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 27 Oct 2021 10:18:40 -0400
Message-ID: <CAHC9VhRHs8Lx8+v+LHmJByxO_m330sfLWRsGDsFtQxyQ1860eg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Richard Guy Briggs <rgb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 27, 2021 at 7:41 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 27/10/2021 =C3=A0 13:29, Michael Ellerman a =C3=A9crit :
> > Paul Moore <paul@paul-moore.com> writes:
> >> On Tue, Oct 26, 2021 at 6:55 AM Michael Ellerman <mpe@ellerman.id.au> =
wrote:
> >>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> >>>> Hi all,
> >>>>
> >>>> Today's linux-next merge of the audit tree got conflicts in:
> >>>>
> >>>>    arch/powerpc/kernel/audit.c
> >>>>    arch/powerpc/kernel/compat_audit.c
> >>>>
> >>>> between commit:
> >>>>
> >>>>    566af8cda399 ("powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPA=
T_GENERIC")
> >>>>
> >>>> from the powerpc tree and commits:
> >>>>
> >>>>    42f355ef59a2 ("audit: replace magic audit syscall class numbers w=
ith macros")
> >>>>    1c30e3af8a79 ("audit: add support for the openat2 syscall")
> >>>>
> >>>> from the audit tree.
> >>>
> >>> Thanks.
> >>>
> >>> I guess this is OK, unless the audit folks disagree. I could revert t=
he
> >>> powerpc commit and try it again later.
> >>>
> >>> If I don't hear anything I'll leave it as-is.
> >>
> >> Hi Michael,
> >>
> >> Last I recall from the powerpc/audit thread there were still some
> >> issues with audit working properly in your testing, has that been
> >> resolved?
> >
> > No.
> >
> > There's one test failure both before and after the conversion to use th=
e
> > generic code.
> >
> >> If nothing else, -rc7 seems a bit late for this to hit -next for me to
> >> feel comfortable about this.
> >
> > OK. I'll revert the patch in my tree.
>
> But it's been in the pipe since end of August and no one reported any
> issue other issue than the pre-existing one, so what's the new issue
> that prevents us to merge it two monthes later, and how do we walk
> forward then ?

We work to resolve the test failure, it's that simple.  I haven't seen
the failure so I haven't been much help to do any sort of root cause
digging on the problem, it would be helpful if those who are seeing
the problem could dig into the failure and report back on what they
find.  That is what has been missing and why I never ACK'd or merged
the powerpc audit code.

--=20
paul moore
www.paul-moore.com
