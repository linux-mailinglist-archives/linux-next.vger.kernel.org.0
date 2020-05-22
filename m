Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0FC1DE19B
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 10:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbgEVIQT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 04:16:19 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:39167 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728152AbgEVIQS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2020 04:16:18 -0400
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MderZ-1j2R7J1HHd-00ZdIm; Fri, 22 May 2020 10:16:16 +0200
Received: by mail-qk1-f171.google.com with SMTP id f83so9864850qke.13;
        Fri, 22 May 2020 01:16:15 -0700 (PDT)
X-Gm-Message-State: AOAM532G+YxSQrv9/XaXBXdcvwNA+cSEofQ3OAnYplKdbCaFc05J3fy0
        Xa473TNrNm8AFrodBoDa0sHStT1p9BZZbkVtQ2I=
X-Google-Smtp-Source: ABdhPJyQdO+xSt1QK4ut6iik4+5LErexuR6SblIdxrGX0BzwgSfUZPUnET2rcXYkZic73JJgjyF5nTuXtMr2sHBcqQM=
X-Received: by 2002:a37:908:: with SMTP id 8mr481342qkj.3.1590135374930; Fri,
 22 May 2020 01:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200507091008.1bd38185@canb.auug.org.au> <CACPK8XfOJqj=E4JwQsZWvAsp7cv=bjqj2twZk0=MR+ZJQP1nqQ@mail.gmail.com>
 <CACPK8XcUydETZvJEkWPvLnLXatAg3D-MfA1yeDzE0epc-hisJQ@mail.gmail.com>
 <CAL_JsqJWXH4JMZgRQa9r_aPLW6Muz6BRtf_NmeqJv21Aefji1A@mail.gmail.com>
 <CACPK8Xd4651vtBTbBoGk0G7daunmF2CCOsDZ-ceto7Yu6A5z5g@mail.gmail.com> <20200522101638.052bd0a2@canb.auug.org.au>
In-Reply-To: <20200522101638.052bd0a2@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 22 May 2020 10:15:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a323rPCDDws+us4UYo7ZO6XvkZ13hBChZ40_DwCxBZj_g@mail.gmail.com>
Message-ID: <CAK8P3a323rPCDDws+us4UYo7ZO6XvkZ13hBChZ40_DwCxBZj_g@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the aspeed tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Vijay Khemka <vkhemka@fb.com>,
        David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PDpMdo+wlgNjIctgkHGS1BqaZstgzaEAa6AzAnRp2b123I+/YUv
 5A6LBU+RUiflOal6VgzBeSec4f5qvKQKBnS/ASN2NOvh/ByFR/T5xUBi56eOLMOMfj+Fepk
 T27JnZ/V8DxxehfexyJFAJz8WQ5V8nNb/Zj31Czyg66/8ahXCX+xbjdjdA890iLahtu6R7H
 3RpWjLHfpI0OujxrjjFNA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o90r7v4lb0w=:rG8Eo6MCqyxveZ4uQAz6tC
 e9gO3J1iwaB0ILuSKuCfq0ogrFXS8FF05PYgXaFIIBPBT8J7fCgZ5mbFc9aUz6D0mKL0BuMfs
 +1buIDiL/OguPWDp0E678AgV8BkeuGU/kShtaEmC7CLFRg+xJoOiUXGSJmQ2gMitFRKPeUbQk
 rafOkZFmRAsZl/G6Recs8SyoubeLCaVL2azUSMV36Bk9uG+8PbpDuvxZdULf4mg+i4KS9dHY7
 0h7HgnQMy6K1BGt8PhLFn9YcqTCQRUB1q5nUZFjgaxIDDKDNQdi0plMzuHT0xWY9RFIVv+YpC
 i/vcLdJKmtpAhQduC3RUSx86BNN7VVnf/ttMypaSoZF53UdXyyvxQBzJ3lbc0rSPiUrmCNICE
 VT4tNx2GduCXua2NY+h1K+KaCyhVwnyNH0vL6TNXwnr6OAfxdT9/KOymt5tjno7q/LdD30jXj
 iuZspqsGVNE6axd4baqQ8LaH6JRnplgxKtGyylqiyW4lMD0gyHCXSb68g63yOO1/5MtBaUb+0
 Ba9V0aFaKRkl+TIhvOja6gMEhLe9u0xw6nQO3jQsmn5f9Wgp/VidqqVqAn9XiXmXjAg58Dcl4
 1BS4h6MOwWwprLHzyDeTRfrKuJuNtKA1mcZWPi0xlsd5T9jMobZ8iwEM83tsVXzhuCT+wCAHG
 Y+zsKJXIfWUZb6H86fY+A+5aVnm/SKdYw/iRd6wQgXf6kovWkXrmx08XZmVv7JeEleU1o/9qS
 saCbjV9WTsVIvtbmiKnCRt5W1N+vy7yzkspMsgG6epiZThq9t+k08oDnuWR64W5MDcu0CiHwL
 V3eVIYK9+Y1EcLNmoa4iDSLflupwqIwqVNUQmeFHQKhscm/Do8=
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 22, 2020 at 2:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Wed, 20 May 2020 07:56:36 +0000 Joel Stanley <joel@jms.id.au> wrote:
> > On Mon, 11 May 2020 at 15:19, Rob Herring <robh+dt@kernel.org> wrote:
> > > On Wed, 6 May 2020 at 23:13, Joel Stanley <joel@jms.id.au> wrote:
> > > > > These are IPMB nodes with the SLAVE_ADDRESS bit set:
> > > > >
> > > > > +&i2c5 {
> > > > > +       //Host3 IPMB bus
> > > > > +       status = "okay";
> > > > > +       multi-master;
> > > > > +       ipmb5@10 {
> > > > > +               compatible = "ipmb-dev";
> > > > > +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> > > > > +               i2c-protocol;
> > > > > +       };
> > > > >
> > > > > This is a correct entry, so dtc should not warn about it.
> > > >
> > > > I sent a patch for dtc here:
> > > > https://lore.kernel.org/lkml/20200508063904.60162-1-joel@jms.id.au/
> > >
> > > Patches for dtc need to be against upstream dtc. There's already a
> > > similar patch posted for it which I commented on and never saw a
> > > respin.
> >
> > Can I suggest some instructions in scsripts/dtc explaining that you
> > don't take patches in the kernel tree for this code?
> >
> > I've sent the patch so it applies to the dtc tree. It would be good to
> > see that change propagate over to -next as others have reported this
> > warning.
>
> These warnings now appear in the arm-soc tree.

Right, I also saw them earlier.

Joel, have you sent your patch to David Gibson for integration into
upstream dtc?
I don't know who sent the other patch, but as long as one of them
gets merged, I'd hope we can pull that into kernel as well.

        Arnd
