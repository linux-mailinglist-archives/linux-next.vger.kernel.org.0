Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66BB429F1A
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 09:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234504AbhJLH7R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 03:59:17 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:43119 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbhJLH7R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2021 03:59:17 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MDN3O-1mQoTU2fN0-00ATlq; Tue, 12 Oct 2021 09:57:14 +0200
Received: by mail-wr1-f52.google.com with SMTP id k7so63966282wrd.13;
        Tue, 12 Oct 2021 00:57:14 -0700 (PDT)
X-Gm-Message-State: AOAM530MB4Sh3F6fS42xG83uXgsMIujmhDy4dwZppDXtXR07q5epu2ca
        he0cxEmgpNJwcCSY5SCVtroQLdHKqG6lTz4o0v0=
X-Google-Smtp-Source: ABdhPJzWrZtND5T+4NGejpva/W8WIuD9h+k1kDLd+VcFgHNzaQqSyGSZf5ek5xhDWcL5GxoX2zXDA9fgG0pHtoPUydE=
X-Received: by 2002:a05:600c:4f42:: with SMTP id m2mr1227990wmq.82.1634025434301;
 Tue, 12 Oct 2021 00:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211012110309.17d51c3e@canb.auug.org.au> <97e578a3-b12e-1975-717d-a0cf663673f0@microchip.com>
In-Reply-To: <97e578a3-b12e-1975-717d-a0cf663673f0@microchip.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 12 Oct 2021 09:56:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0G9VoB71aBWGrtdxe2bNbv7apaAQqQXSf==TGwcKQvaw@mail.gmail.com>
Message-ID: <CAK8P3a0G9VoB71aBWGrtdxe2bNbv7apaAQqQXSf==TGwcKQvaw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
To:     Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YCjqiO5d8rM/ML//nqqgeghr7hhfufNL84KVlvlohxLkuHFH8JP
 psa2SD4+IMonWusynNJKPSIuqBCgpBQK1EApliaZmVZ6PG4Mh5NxdlmikRlTE4no18bolqF
 uyHYLe+CbiGtDtlMfy3A+iKsZsRvOId6/o3Q+cipFeOcCx58Bq4NopOJKqMg6bl9yjvRjgm
 fMH2EFOPoo7f7tohcXV5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B0fYAbf004E=:osQJhuFZv855WWeJkzfbpl
 1XaGwpYsOW4tA8opfTFAHZzDDQmMhf6KkrCUnXqvnKlt/Wj8nt/4G+Tq4XCDUFs/TqPY5Yzf/
 bBM00PyHf6cU3xOZVfsvExpC4+UXDM4HyHcltY+Jb5quzZbXMerKCnCuk5Ti6rTT+dZ3dJ5Ar
 0LA6fCiuLY8WKK9Y23tsRrF0yasXsWnfIUrDCOjNY3sSKZ1qIYDkmXKVndtMnVHJDEh84kQyP
 0aqgtFarXPWyjNiZNBI6lsm7/bT2w3YKwyXv++lBaz+DbuT3Xnt6NszA6fwSGR1hSzsQUArmz
 dE7Rd9ij9qNFbG98oU+hk8AGnjMrKOvrsZv5YWzfWywgPBxnv7prOpdpDx4T5DM8ccMVBVH7Q
 WvS8lqHT98dS9qynBR8Z/h3DOV7IG6uGPqFpB0vBMHt6qOeC7CBfbOoDTEwPIUTD+A2RRkD9v
 1QKtz3dYgmNiQINbgb78Q87B8z4j0dqz40kIs0x2/88+Xa/CYB9GCSqD7xNgb3YO+72s4E+SB
 dpbSC8HJp6hy1xdyKMkLmQf+Hqros2cHZWn5eRoOdag9nhOyjgdh0y4lnoYXLTTuKIMT5/xSq
 X7JK/fXIDFw9ntgIodXHT47lAlPksQn2f9XT7TrF77+Zu2w58ttkZuyrLMnW55yiwOdmYj0lc
 jdWSeVFXVhCqEF8ZWYpIB171W60t5Vr1xdPBfwsBIykcm30P4TWbJ6mePaaadRlfT6eRxD7Fn
 8W4lhGBYJg7aO1clr2HQG1R8rjaPBHK1JTN4KQ==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 12, 2021 at 9:35 AM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
> On 12/10/2021 at 02:03, Stephen Rothwell wrote:
> >
> > After merging the arm-soc tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > Error: arch/arm/boot/dts/sama7g5.dtsi:167.3-7 syntax error
> > FATAL ERROR: Unable to parse input tree
> >
> > Caused by commit
> >
> >    9be4be3ed1ec ("Merge branch 'arm/dt' into for-next")

Thank you for the report!

I had verified the arm/dt branch by itself, but didn't recheck it after I
merged it into the for-next branch. At least that one is easy to fix
up as I don't send the combined branch to Linus, and the arm/dt
branch does not have the problem.

> I had following patch to have the nodes in alphabetical order:
>
...
>
> Sorry for not having mentioned this conflict in the pull-request.

No worries,

I had assumed you had them sorted by unit-address, so I had them
 in the wrong order as well. Fixing up both issues in for-next
now by redoing the merge.

       Arnd
