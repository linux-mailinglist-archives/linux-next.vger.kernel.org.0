Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B22DD4BF9BC
	for <lists+linux-next@lfdr.de>; Tue, 22 Feb 2022 14:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbiBVNrC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Feb 2022 08:47:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbiBVNrB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Feb 2022 08:47:01 -0500
X-Greylist: delayed 306 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Feb 2022 05:46:34 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85751F7D
        for <linux-next@vger.kernel.org>; Tue, 22 Feb 2022 05:46:33 -0800 (PST)
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M26j1-1nOyOS1Iqn-002U9c; Tue, 22 Feb 2022 14:41:25 +0100
Received: by mail-wr1-f51.google.com with SMTP id j17so6647561wrc.0;
        Tue, 22 Feb 2022 05:41:25 -0800 (PST)
X-Gm-Message-State: AOAM53253vlgjUczge5LNVq1b0GVlyTXiEt0v6mUwufIT8DSvpbz8lS2
        G9gR5+4XF7KojTG8bTynHeF8Afa1Rn5RDwGokaE=
X-Google-Smtp-Source: ABdhPJyr+2RhXG63IhBc5XIrliIkimhF56LiOI66mJ7uVY+o3TbaU5WI9zGAVLchk95JIXaawBejBzGFhacNF+x7UJA=
X-Received: by 2002:a5d:59a3:0:b0:1e9:542d:1a35 with SMTP id
 p3-20020a5d59a3000000b001e9542d1a35mr15302491wrr.192.1645537284771; Tue, 22
 Feb 2022 05:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20220222114203.686638-1-broonie@kernel.org>
In-Reply-To: <20220222114203.686638-1-broonie@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 22 Feb 2022 14:41:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0EhPNp6HCJuwJGze1GxdbQpcbYsS9J+tqC1yt2Z13W_w@mail.gmail.com>
Message-ID: <CAK8P3a0EhPNp6HCJuwJGze1GxdbQpcbYsS9J+tqC1yt2Z13W_w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mips tree with the asm-generic tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MxGuVEvjMBhMOPKTUFNMp8hTQ2GOBUY22ewzWMLQtndI6zCrXaS
 mLQRfIuWO/WA/RWvDVa4spH+Yf+oWyJ/MmTzrk7vnBJJbFQPvMYMCTFRuS/GDBFscEfjcCk
 NRR9GeBtGyrdbq71hF3J4tYfeP5OKl4ejsl01k7Hpn5Bo/i8dPJGxqswYGs86hIgVmzgCuY
 XX+hN9Y2DybxYX+YlCrvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CxU+KDj8nc4=:RdUfBAKxW2NJcO5EQ5wYsd
 KcfP2VaDKIFCJ0HsRy6s/80durvWnPHjwjuVf78AqCkgspPVxyQiMXbdLhWjhu0aX+F+7uo9C
 1/M00D52O/0Z5ktVbbQs4QFsIkXoFESptJbeNCv0ZuytOoIqwPyiZq2LpPRrYGehRI6hLdHnO
 P31/giE1y3DvYVIHMNnGD9Ry9ibuSH6m2dxqbyMAaNXjghAvPpPcEotr54RkQm6Ibt7s0BP8/
 pZbj7uziUOAcRxFqLpjo0n7StkEkL+e+hbFLcCljb8MTa+1QvMAHU4jToifiCA9mNKuBVcrfG
 Nlxl46bb05l1UcKAyQKvqgzx77kZlHS4HizxF5moLK8WHYGOXc3Ul3NllbmNAFEBoYn3C2xZm
 ffTytGCO1FrCBx2000OdSV/JoTGUgxF1JIhoMUtTqIiLoc8LbgTxXP6HPAyWw8GUcQTU7k65I
 2z1YxdxuwH597vNnYkvgcuwvo7mDsNjavInzYDnbOUkCcqEPCx+D5d6x+vKS/c8zGr3elrBji
 HRa2Y5Qi7qSyY6W+hRdemM+E2ZvsHO6nOHUtnjx5sDP8jgqhwDmHPuMH1nF5SV80UULG06Ae0
 5CIEQuPyXI6L2iuZi0R6KDHJ3hyxE1zUcSBc4BVK9GBr1BsuYRFPPSjdBbMHRzT4Aq+7MS7+E
 Jtj5tt11cHyJ8E7JyqbU2FffOJmD3mgH0AsKwQj6Rw3Psqw691y2TrkyX5rWv8eQwo68=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 22, 2022 at 12:42 PM <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's linux-next merge of the mips tree got a conflict in:
>
>   arch/mips/sibyte/common/sb_tbprof.c
>
> between commit:
>
>   27e8140d7819b ("uaccess: fix type mismatch warnings from access_ok()")
>
> from the asm-generic tree and commit:
>
>   10242464e506b ("MIPS: sibyte: Add missing __user annotations in sb_tbprof.c")
>
> from the mips tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the report. I needed to rebase my tree anyway, dropped
the duplicate change from my local copy for now, should be part of
my public branch in a few days when I send a new version of the series.

       Arnd
