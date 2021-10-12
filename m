Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4AC842A774
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 16:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhJLOmQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 10:42:16 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:45495 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237260AbhJLOmQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2021 10:42:16 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MvazO-1mrHKt0xaY-00sg8K; Tue, 12 Oct 2021 16:40:13 +0200
Received: by mail-wr1-f48.google.com with SMTP id e3so34015636wrc.11;
        Tue, 12 Oct 2021 07:40:13 -0700 (PDT)
X-Gm-Message-State: AOAM531dj7yPXOKfrMR+lrifguTg+u8bbz7Qb3YfPrLRItDJoBbuJo9+
        QO+zqvmRcNfQs5qqq42r28sXIuGttZcn0X3gBoE=
X-Google-Smtp-Source: ABdhPJwsX00JvLV147YNI/vITnilDiDSyCMYaOBQxpBe5IV6UNyEVoOL9Nc4pFKmxwenTCCaRUt2Gu+9DapKCFiP6aE=
X-Received: by 2002:a1c:2358:: with SMTP id j85mr5978288wmj.1.1634049612821;
 Tue, 12 Oct 2021 07:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211008164728.30e3d3a3@canb.auug.org.au> <20211011082704.3cff4568@canb.auug.org.au>
 <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 12 Oct 2021 16:39:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
Message-ID: <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
Subject: Re: linux-next: build warnings in Linus' tree
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anatolij Gustschin <agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:tmFm9ObBhI7LEVPCH+fNRyD3HR566ndNt9VAoC376+nLsGFC9M2
 JwkcoMll6ImpR9wr21a40R6+PqucZRONlA9i9yAM+5FmhghxCRyDqWMHK7Meln2ztqaphDP
 EO1A6A37xBKEhuGV9bzr1rpMEKSzlyDkdDElGHaTnw3OniRrc7MwtTk2MYcDq9ubg69PP5e
 QbpjCKRbLkarB1cXpvkeQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:on4rvQwVu1g=:SKNCD0SACllaiYOpEF4ojM
 luo3rsjFqdDHVnrJMrqgEykKWkugyiuBVpwm4lt2yv8zVx9hjYLoOYfl96I7afLRPKeIE3r7d
 87H/pjqTk2v/Nw8V2Z0ExaNp7UPvXY44Z6+19oO70TFErcshlmYWnp26fHe91Lqtfjn/4W96z
 OqULaRg99HTHgD8b2uCkhQtSHddZlCrmOFWJjMebf4fJflvHxy1McgSthLjH4xK6ZINI5FYAs
 Ky2pYPy09tBU3ZixtzUlimJUDZu86aex7CpzNZSEplSbSNQY/BMo/XUnaOZIhNITxRdyGVpx1
 nQjrC9s6lRaVpMW2v12Xk1GS/Bfa+cluQm9NTvZqVt1QW1fwCodndIJi/WSzyVjgdovHk6yXD
 X75VvkX/TZsByhTiVLNK3cCWkTc36zT9C//nbWP/99mTVa3fTKDJCBevSnb7bTp6e4SyjUk77
 NwvZNdE4E1FNOd9bC4s+jyxEHx6kDgB6LBstoxmoO7OfkYxDjWz7TzqMSDkq36ASa8B2gri5M
 zPB4d8MuMjIPoN3XlzkJX3hr3AWwLDtJvraI703SovrrXT5MDrE3+qfJy+RwMUwDV4ehXiq7q
 sJNyZiZLK5VOKIwkKJ22CKYiGiUS7fHPynSzMo4U+3JkVL/R32Tc0OwFN7PlYLSnDMQeGyZjv
 ZxcRGFH6clh5Wuka9StkWmj3r0jmRbUfeBEPzzuzd7C/Um5REggDzRjB11N3u8Le31UDlR/fV
 IDqbth3RI79HtSFahsq4OhZDhurkzpe/3X2Ypg==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 11, 2021 at 10:42 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Sun, Oct 10, 2021 at 4:27 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> FYI, u-boot removed mpc5xxx support in 2017, so maybe there's
> similarly not a need to keep them in the kernel? It does appear NXP
> will still sell you the parts though the last BSP was 2009.

Specifically, MPC5200B has a 15 year lifetime, which ends in
11 months from now. The original bplan/Genesi Efika 5K2 was
quite popular at the time it came out, and there are probably
still some of those hanging around, but they came with Open
Firmware rather than relying on the dts files that ship with the
kernel.

Grant Likely was the original maintainer for MPC52xx until 2011,
Anatolij Gustschin is still listed as maintainer since then but hasn't
been active in it for a while either. Anatolij can probably best judge
which of these boards are still in going to be used with future kernels,
but I suspect once you start removing bits from 52xx, the newer
but less common 512x platform can go away as well.

         Arnd
