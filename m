Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97BEB5F58A6
	for <lists+linux-next@lfdr.de>; Wed,  5 Oct 2022 18:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbiJEQzW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Oct 2022 12:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiJEQzV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Oct 2022 12:55:21 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3911B2CDDF
        for <linux-next@vger.kernel.org>; Wed,  5 Oct 2022 09:55:16 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id n74so6908350yba.11
        for <linux-next@vger.kernel.org>; Wed, 05 Oct 2022 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=rsZ76Ip2EvmQeYsUzg+ffG1r7wWmuHmhZ9WxYfrqRII=;
        b=ivkwIvYrCqQ6IpY0CnK+yUCDC/soMVnN3kz81qoGxIR67aP3W1K9R4LO56cmZWfM5X
         nm+yNBv2HCngwSDnlrrugt9tvA3k5rfL8gDDGe0w89NiJVDwIlALnZs914MiCosanslK
         VsERA6wG+lGhxfUoJ8gWuKZ/hZ4SzTA9wGNlbbctZht02b2gAKvF8mTa6qNFBXRVcLO3
         xNKlWXR02h5IB78APzkYIOhEoy8oxI9+Hm9gJ/mSMzna0Cewu69YgjxMg9h01/RffvC9
         /gOMJ2PsNnxUC9tuC+Uqf6wlwd6eedpMwE4inFUV+m4/DXkCidTrqJyidc7zdsQXeJcH
         TP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rsZ76Ip2EvmQeYsUzg+ffG1r7wWmuHmhZ9WxYfrqRII=;
        b=HhJZG5W5iG00E9S6LKDE2kyWZjGB1cXAsLq6D7RlfAQ3jvS1VveJ0qiFBLoULrleK8
         +GOz5y+wv6E+n5Kv3PKsYhFx12xBTZb2eNYHMqeffXZBYQq4kjHWKmws05TLGo3J9p20
         wCKp2W6jXCPlssp5YNGlFgFWc3UyyghNBETx8KQYd+bvG8FDQjQWLfMmt+tAGfI6aKL8
         xyUs7mM6bTdbFftdCYZ3lq0vbHesHZ9yq6Ma4h7bU+awCKPKx/NrxgOGBJN+McJ94vcM
         8t8Kc6/MIpnMex6huMetBCmZnm96+rT86cidE6c7TNPPnqokQ8IOSf8C4UVc9RSigoTQ
         O5yw==
X-Gm-Message-State: ACrzQf3CF0yx43MHT3JgpmMlBIok9Vt4PR/sbRnASccjHI+3ghUlWsZ8
        6lCNZY3Ev+sZigPS1j1g2j9QLrqJJ0bbOu6fFLHsMQ==
X-Google-Smtp-Source: AMsMyM75HtQVeRjDaKSiYMMGpBjbmPAuX7oFi4ZgfMA8jt6iEVe0L/SjLn9c4aMcLA7OFxmXeyYplZXvKfxYTHqgTY4=
X-Received: by 2002:a5b:a44:0:b0:6b0:13b:c93b with SMTP id z4-20020a5b0a44000000b006b0013bc93bmr822944ybq.398.1664988915253;
 Wed, 05 Oct 2022 09:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221004204025.7be8a3be@canb.auug.org.au> <20221005173904.12540ffe@canb.auug.org.au>
In-Reply-To: <20221005173904.12540ffe@canb.auug.org.au>
From:   Alexander Potapenko <glider@google.com>
Date:   Wed, 5 Oct 2022 18:54:38 +0200
Message-ID: <CAG_fn=VLGmRn85V-yG-6Dtq71_f-7wpYiG2RyjBDgKj0NAe7-Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm-stable tree with the kspp tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 5, 2022 at 8:39 AM Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:
>
> Hi all,
>
> On Tue, 4 Oct 2022 20:40:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the mm-stable tree got a conflict in:
> >
> >   include/linux/fortify-string.h
> >
> > between commit:
> >
> >   9f7d69c5cd23 ("fortify: Convert to struct vs member helpers")
> >
> > from the kspp tree and commit:
> >
> >   ff901d80fff6 ("x86: kmsan: use __msan_ string functions where possibl=
e.")
> >
> > from the mm-stable tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.

Looks good, thanks for handling this!

> >
> > diff --cc include/linux/fortify-string.h
> > index b62c90cfafaf,6c8a1a29d0b6..000000000000
> > --- a/include/linux/fortify-string.h
> > +++ b/include/linux/fortify-string.h
> > @@@ -325,11 -282,13 +325,13 @@@ __FORTIFY_INLINE void fortify_memset_ch
> >   })
> >
> >   /*
> >  - * __builtin_object_size() must be captured here to avoid evaluating =
argument
> >  - * side-effects further into the macro layers.
> >  + * __struct_size() vs __member_size() must be captured here to avoid
> >  + * evaluating argument side-effects further into the macro layers.
> >    */
> > + #ifndef CONFIG_KMSAN
> >   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                =
       \
> >  -            __builtin_object_size(p, 0), __builtin_object_size(p, 1))
> >  +            __struct_size(p), __member_size(p))
> > + #endif
> >
> >   /*
> >    * To make sure the compiler can enforce protection against buffer ov=
erflows,
>
> This is now a conflict between the mm-stable tree and Linus' tree.

Anything else we need to do specifically for Linus' tree?

> --
> Cheers,
> Stephen Rothwell



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
