Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1C83F4291
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 02:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbhHWA1O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Aug 2021 20:27:14 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25271 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbhHWA1O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 Aug 2021 20:27:14 -0400
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 17N0QIfT014048;
        Mon, 23 Aug 2021 09:26:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17N0QIfT014048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629678378;
        bh=kD/hh9H5i475+vNQOw2q7d4U+ruJtXyu/WdPhffFiIQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ERC7DH0c3u0T9rlC6EVa8JEEFPy7GgBAADuYG908j63d9ukiAZeEvDqKph3N7PvUx
         Yz8W46umRaiBfohrhvhHLiEgw8eTrvgqsOmwc/QGfphNyBNP1ZJzQ8S8aQx09u6ZTy
         cHY5asce0Ki+XWqFmvb8DExqZxtR6XEJF5RyHNG+fCGHqhBov3/dN2/4InP7vkzte8
         y3d55ty7AFOsx9wpa5/tN1m7heG2vHNR5InJoknq0yECVq5ySCvoqNaqcf1CalFuXi
         +1zrWFGlBx/JhTMI3GdW8gceTxAdmauZdC+fKB0tUJ/szEVI1uDwpzn0JeDIGhv/hm
         LXRwNQAihrdfw==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id x4so15047383pgh.1;
        Sun, 22 Aug 2021 17:26:18 -0700 (PDT)
X-Gm-Message-State: AOAM530QgHH6e0dwHZXR5x7dkLZm7ZBdjuSWQKMJUvUXS5Ux6Okc8Lts
        gGl8Jr/T2lLzDIeyK52NUv72FSHUrVXQn716ia4=
X-Google-Smtp-Source: ABdhPJz9fdEOOqgxK/uG/yR0iY62D3VpAQPiB0vaUeGb2ebMdEye9FmADojzm4kUBwC+k54pQLSZkyHuoz7BBa1e1O8=
X-Received: by 2002:a63:dd51:: with SMTP id g17mr29573641pgj.47.1629678377713;
 Sun, 22 Aug 2021 17:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210820092816.2858fac8@canb.auug.org.au>
In-Reply-To: <20210820092816.2858fac8@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 23 Aug 2021 09:25:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT5iYa5NqJF=fmzmfG2HNA-w9Gc=8LCtXr+30Sx=NJisA@mail.gmail.com>
Message-ID: <CAK7LNAT5iYa5NqJF=fmzmfG2HNA-w9Gc=8LCtXr+30Sx=NJisA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 20, 2021 at 8:28 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the kbuild tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> arch/x86/entry/vdso/Makefile:135: FORCE prerequisite is missing
> arch/x86/entry/vdso/Makefile:135: FORCE prerequisite is missing
> arch/x86/entry/vdso/Makefile:135: FORCE prerequisite is missing
>
> Exposed by commit
>
>   0fc7db58e2a6 ("kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and filechk")
>
> Not sure why we need 3 of these :-(


This is a pattern rule, which generates
vdso64.so, vdso32.so, and vdsox32.so

The warning is produced as a side-effect
of the recipe. That is why 3 warnings.
Otherwise, I do not know how to implement it.


BTW, a fix for x86 Makefile exists in the patchwork.

https://lore.kernel.org/patchwork/patch/1478798/


-- 
Best Regards
Masahiro Yamada
