Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD06421D0F1
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 09:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgGMHxQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 03:53:16 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:34990 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgGMHxQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jul 2020 03:53:16 -0400
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 06D7qprL021691;
        Mon, 13 Jul 2020 16:52:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 06D7qprL021691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1594626772;
        bh=QRmgCLz55pGAiYJ6IPSUrsAwdIpDl1h9v5capnjYD6s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RzaEuixqZ4VGYkgY0LqBtba7nieyXeP+KM51Dnu4vjg9EOttoUbJ1NbRZmy5CP/OT
         4AgXqeMG8mlXGn0NWZ7/TBJslwWX0D/oKfZ0qvxxDYR4zoc7PnCyWpuXzXXAOXhpEk
         uckL3Ve2i5lFKHo2Hxjw3m1KOQQeYKiLpgQvSWkHHeHnBd6tN5+FJxLiDTp7WFMHN0
         hd/HSHVm9dNlH4at3hPynk/hFP6caP5xquaZvDfxqV9xzqU65+BQ4XzI9Fd70w9VPg
         aBhBHL3MejLkkSbjCdkUoKfZbI1/LoxDioq/n0FJliGHN/vNYITtg419qb7xyIZUwd
         8yjlvNN9myZlA==
X-Nifty-SrcIP: [209.85.221.182]
Received: by mail-vk1-f182.google.com with SMTP id g22so2578169vke.9;
        Mon, 13 Jul 2020 00:52:51 -0700 (PDT)
X-Gm-Message-State: AOAM531ExoYbhuDxJtQN0X8isVhC98ymp/voz111OH2jt1P9waowaAkP
        IErvuoJiN2ylhWlOksmu72t+gE0YGolENF8Yuro=
X-Google-Smtp-Source: ABdhPJxNFyJ8q8WNzZnAYfoUMz6NpZVD2Cwf3rJ/k4h8+eaFQ7YUe7R9b9rSUc8J692BZ2OVzipzRSlmQIBQotaT270=
X-Received: by 2002:a1f:a616:: with SMTP id p22mr41700565vke.96.1594626770912;
 Mon, 13 Jul 2020 00:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200707170720.55be721f@canb.auug.org.au> <20200713115618.5e07a783@canb.auug.org.au>
In-Reply-To: <20200713115618.5e07a783@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 13 Jul 2020 16:52:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNARoPNi-QbT=4Odap9LtP9dpMUh9TExtD5gOaaktwdY3Aw@mail.gmail.com>
Message-ID: <CAK7LNARoPNi-QbT=4Odap9LtP9dpMUh9TExtD5gOaaktwdY3Aw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Jul 13, 2020 at 10:56 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Tue, 7 Jul 2020 17:07:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the kbuild tree, today's linux-next build (powerpc
> > ppc44x_defconfig) failed like this:
> >
> > cc1: fatal error: opening output file arch/powerpc/boot/dts/.ebony.dtb.dts.tmp: No such file or directory
> >
> > and directory arch/powerpc/boot/dts/ does, indeed, not exist in the
> > separate object directory.
> >
> > Caused by commit
> >
> >   ea4679253288 ("kbuild: always create directories of targets")
> >
> > at least, reverting that commit makes the build work again.
>
> I am still reverting that commit.


Sorry, I missed the previous email.
I will fix it soon.


-- 
Best Regards
Masahiro Yamada
