Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A86229BC8
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 17:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732699AbgGVPuU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 11:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730870AbgGVPuU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 11:50:20 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C92C0619DF
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 08:50:20 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id l23so2449773qkk.0
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FbZpQKjkyVWA5idi3w+btcCrZiLttKv+UA9Wn+yjyV0=;
        b=OBleOo+TpJlNHgO3Hupf36nyBJkcwDDKREwPcTAtj6Sp2D5PjGq5CvkBZSLh7t0ptU
         TYUv4+DllNHf7bn3Rh1p34Ffb8mU63zP0IIi9Ai2qGwBI3Qrv07OVzkOkL05OQ1rbeFR
         9oBCEv+aVCb98tGVAtAEHt5/ZY8dADMil0LVidWEPfbhtXdHA965EUvmMKGsuXdontIb
         plNtHfvt1rTUVyFJRXM/R++7bl/E3CKm13FQ4u8VO8jOMskk/G1ilzLFdZp225CLN0B8
         +XbqihxsVQqSYOFAuzVAqzg25leFXoVIL9Zu2oV1pzHbi08PdZv63INm2RU2vKOOhiIz
         VzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FbZpQKjkyVWA5idi3w+btcCrZiLttKv+UA9Wn+yjyV0=;
        b=XcYiBPawEnE1GCZz7kqehFeYXOl/2kdk8Ya6m6hYcTHpNR8cpIrglY57vdCug3eVez
         t+SM+LBTl7sQ6TNio7W66c0V1Xug/TqcrsmX51CMHI04+alOPnte24pVJWt+DW0ucW9B
         n8JjBy/rfOK/MSzP8aL9RL9ocAU/b3dJVeLTOLU6GJZMLoE5jBCuucFkL8Y8CR3pAlDf
         UIX5c+HTuv6AyBMglwd7HYTQwYxRty5mnfClvmmXaeug3Od3jPVdWvTgvcyfvzFbKgwk
         m280VPKCGBIYERqZwZJLWYAeg8wlAW62IURXePn0C3nleYxb7sKGn8FiDsGghFuEkGHe
         ie4Q==
X-Gm-Message-State: AOAM533FfAbkkNEqpP279Pcd6luZPPsyz22beMWHrPUn5vKgjWtgsB8r
        5917xQAX+x1mfizz3eRJzFsaZeXw
X-Google-Smtp-Source: ABdhPJx03XQmpz/EVTTdjTNpJbGotstLRukGSvw3Rebkl3ZXJOxZIC+eqdBTv63CzHxdhw4Diukl0Q==
X-Received: by 2002:a37:a292:: with SMTP id l140mr540468qke.79.1595433018908;
        Wed, 22 Jul 2020 08:50:18 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 62sm60691qte.19.2020.07.22.08.50.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 08:50:17 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id l19so1258417ybl.1
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 08:50:17 -0700 (PDT)
X-Received: by 2002:a25:cc4e:: with SMTP id l75mr52192685ybf.165.1595433016973;
 Wed, 22 Jul 2020 08:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <87wo2vwxq6.fsf@cloudflare.com> <20200722144212.27106-1-kuniyu@amazon.co.jp>
 <87v9ifwq2p.fsf@cloudflare.com> <CA+FuTScto+Z_qgFxJBzhPUNEruAvKLSTL7-0AnyP-M6Gon_e5Q@mail.gmail.com>
 <87tuxzwp0v.fsf@cloudflare.com>
In-Reply-To: <87tuxzwp0v.fsf@cloudflare.com>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Wed, 22 Jul 2020 11:49:40 -0400
X-Gmail-Original-Message-ID: <CA+FuTSdQWKFam0KwCg_REZdhNB6+BOwAHL00eRgrJ2FwPDRjcA@mail.gmail.com>
Message-ID: <CA+FuTSdQWKFam0KwCg_REZdhNB6+BOwAHL00eRgrJ2FwPDRjcA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the net tree
To:     Jakub Sitnicki <jakub@cloudflare.com>
Cc:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        David Miller <davem@davemloft.net>,
        kernel-team <kernel-team@cloudflare.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 22, 2020 at 11:25 AM Jakub Sitnicki <jakub@cloudflare.com> wrote:
>
> On Wed, Jul 22, 2020 at 05:05 PM CEST, Willem de Bruijn wrote:
> > On Wed, Jul 22, 2020 at 11:02 AM Jakub Sitnicki <jakub@cloudflare.com> wrote:
> >>
> >> On Wed, Jul 22, 2020 at 04:42 PM CEST, Kuniyuki Iwashima wrote:
> >> > Can I submit a patch to net tree that rewrites udp[46]_lib_lookup2() to
> >> > use only 'result' ?
> >>
> >> Feel free. That should make the conflict resolution even easier later
> >> on.
> >
> > Thanks for the detailed analysis, Jakub.
> >
> > Would it be easier to fix this wholly in bpf-next, by introducing
> > reuseport_result there?
>
> Did you mean replicating the Kuniyuki fix in bpf-next, or just
> introducing the intermediate 'reuseport_result' var?
>
> I'm assuming the former, so that the conflict resolving later on will
> reduce to selecting everything from bpf-next side.

Indeed. Since you are already adding a patch to bpf-next to move the
reuseport_has_conns check back. At the same time, it can introduce
reuseport_result:

                if (score > badness) {
                        reuseport_result = lookup_reuseport(net, sk,
skb, saddr, sport, daddr, hnum);
                        if (reuseport_result && !reuseport_has_conns(sk, false))
                                return reuseport_result;

                        result = reuseport_result ? : sk;
                        badness = score;
                }

> TBH, I don't what is the preferred way to handle it. Perhaps DaveM or
> Alexei/Daniel can say what would make their life easiest?

Good point.

With the above, there still remains a merge conflict, of course. But
then we can take bpf-next as is, so I think it would save a separate
patch to net. But not sure whether that helps anything. It does add an
unnecessary variable.
