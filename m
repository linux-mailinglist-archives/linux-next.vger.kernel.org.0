Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5954D195860
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 14:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgC0NvD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Mar 2020 09:51:03 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:60299 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbgC0NvD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2020 09:51:03 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MeC1p-1jpmpF1Dkt-00bKlk; Fri, 27 Mar 2020 14:51:02 +0100
Received: by mail-qt1-f178.google.com with SMTP id 10so8554157qtp.1;
        Fri, 27 Mar 2020 06:51:02 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3kECpU9S6Wb6XrTxkJMaTZTRurXZGwi74SaaSmHEErdlHsBzVJ
        TAcGaByfyMq9s1HoPX+yYN++QM2VeZlkc3oLlqw=
X-Google-Smtp-Source: ADFU+vshNURS/9HDv+oLa8JQm1ylr9owZmjcnTSkVVaH5iSMiWpwyPAHJ6GKmm1np7lsir9XH7ml3tLULZvcP2HhgCk=
X-Received: by 2002:aed:3b4c:: with SMTP id q12mr13766906qte.18.1585317061089;
 Fri, 27 Mar 2020 06:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200327092741.1dbd3242@canb.auug.org.au> <20200327131831.GC2282366@ulmo>
In-Reply-To: <20200327131831.GC2282366@ulmo>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 27 Mar 2020 14:50:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3At56pHFJNojHFa=CHQxSXT1dtYTr8_t34AOcooE_b+A@mail.gmail.com>
Message-ID: <CAK8P3a3At56pHFJNojHFa=CHQxSXT1dtYTr8_t34AOcooE_b+A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tegra tree with the arm-soc tree
To:     Thierry Reding <treding@nvidia.com>
Cc:     Olof Johansson <olof@lixom.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Colin Cross <ccross@android.com>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, Corentin Labbe <clabbe@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dNQpBz0UGSQQEBoCpfcR/7YzJDGh5st1/sA+hJoMw5gVYg2+9oe
 vrq6gOPxrgK5kdq1EW/ICqxmVdYW8jbAqB5xhSatq1YLqXRubDjzvaaDQkb3HWWWeO0sE2t
 59ILrmzGw17JXE9TRU0hP4dmjLBjtZDT2cKro60jPHpsZEZayx99kQ2oi8Hei823u1dv8DY
 juOs5DYWT1nKKSJ/naB/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cW6VpA138hQ=:SYgv7dpo8BwKhIta+HphPz
 Y5zjuHF5Znw57/lvMM+4eG/ZoKSDDSn1S5CPNKCMSEiEBKQya5Ndd2ECYmZupvXQTrwNICjjK
 HMCoJBdNmakAUDiFfc0P29GAr0fyHxCm3eNVsDr31MQKOYTy+H3e7WRZgG3+ZOg7oAvqCI4Zf
 ePyQYjbtKtOcjRzEiQX42XgYNnw8V6qoxlgVP7YDHLEzuq9PKqS1dr4130xm4iPauKyuA+mfA
 r6Rt3Q7ooK6693ZDOyfKC5Plo5tGMd7w06+WaaN9uShDmXZAv1rjI4FF2EdghZAK5gdb02/wk
 eieABsy7dsKx1RFHR100UfsmObccoen4m8qXotGsck3+XS11l8pcJq2KELnIULgKckaczFtwA
 uHxFuppsDVXAtSbV8kEfBfI4Uu4Q/Pi7fMKlQ+0e5FhdJFU34bsKiOCxcPZZLpKqLQgxyhFx8
 id8InO9+h21QNLtwXyp0yEWveNilZQL7BU3BgwnBGZIOv4RfTCr1I3sILKKcjQStcYebD+qTf
 XzuML9D80pXnskHZ1cVmEcB5g/u369n2Iq5TXIznCZQrhLcKpXnK3JrJeuFsLpUUxIjdF0lXU
 i/uhY3GS0MEgTHyYQ/+Ss+pxV9IoHi5k6FXILImzL6Awbk8GttAi6pewwn3Y5IXWZaMt1L+wU
 BjrVY550r1i88K1/OOZ6vp1VtcxUuksg/uPazKAn3Tk353dAEx+oEiNrFQqCD/a+1sEIt+9AW
 Hk+4/t43in3QCMZPSjtJ7AFS9M4SIcrUU8uZF7/3yyML5ChZzrnswNJq/AEcuNwkB/BjAmBxv
 fG1QpJQGGzYQjPin2eLdvaewrYpNsSyZQLtIJWyyiTrhvKKgcI=
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 27, 2020 at 2:18 PM Thierry Reding <treding@nvidia.com> wrote:
> On Fri, Mar 27, 2020 at 09:27:41AM +1100, Stephen Rothwell wrote:
> > I fixed it up (I just used the version from the tegra tree) and can
> > carry the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
>
> Olof, Arnd,
>
> There was a bit of back and forth on this because there happened to be a
> conflict with the USB tree. I tried to clarify this as replies to the PR
> request:
>
>         http://patchwork.ozlabs.org/patch/1254523/
>
> But I suspect you may have missed those replies. The bottom line is,
> there is a v2 of the pull request that has the patches that are now in
> the Tegra tree. That's already part of a PR that went in through the USB
> tree as a dependency to resolve the conflict.
>
> So as a result there should be no need for ARM SoC to carry that PR. But
> if you still want to merge it, please pull v2, which is here:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-phy-v2
>

It was almost at the top of the branch, so I ended up just taking it out now, it
should be gone from the soc tree by tomorrow.

I think I managed to skip it as you asked on my first pass, but then failed to
reread the message when I went through the remaining entries in patchwork.

Clearly my tooling still needs  a bit of improvement.

      Arnd
