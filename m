Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572AA1CF68B
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 16:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730012AbgELOLX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 10:11:23 -0400
Received: from condef-02.nifty.com ([202.248.20.67]:58149 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730210AbgELOLW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2020 10:11:22 -0400
X-Greylist: delayed 329 seconds by postgrey-1.27 at vger.kernel.org; Tue, 12 May 2020 10:11:21 EDT
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-02.nifty.com with ESMTP id 04CE17fS029053
        for <linux-next@vger.kernel.org>; Tue, 12 May 2020 23:01:07 +0900
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 04CE0off022097;
        Tue, 12 May 2020 23:00:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 04CE0off022097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589292051;
        bh=LSYtSnqE2loIysnLi9PlyYmgllRh5Q8uKVWak+A+U5g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jGkAdtHAcADhEIXU4tQ5Jl5cfsDaZTHiYyE8lRmFpGfAhZ1lyxGChMXy3NEp+SUF0
         rolFoBUsYSmMWtV9ckbJpTTziF3c/vhnBKMHvRbovlaT6Rp7LMNArYdqW7hX34B6Iw
         PE22TdTUr33JzD+N2zR0qIE8HA4WXnn5RuWWya54qsVfXraIQVvS5B03dxnUo7oH88
         b0B/dC/gTJ5Id1ul49WWxs9ZFot4vKJuK6z5PCUDzEUktAlYQmYHNJu0a/o8uCjd3h
         0MVkKKDNleca1PKphFnG2NrQPm5ut/523aBUV/ksfF/jV/AUHbzxou60uYuU9u5XAu
         SzPQscQRySXIA==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id x6so7909788vso.1;
        Tue, 12 May 2020 07:00:51 -0700 (PDT)
X-Gm-Message-State: AGi0PuazPbw557PFeaDE78gd1y62p1PoTo3XP3fUmZsr7OgcZxC8t1FE
        3hKXmMzF5GVbooo3xeWMpUU3NE10/bwhVzuTSAI=
X-Google-Smtp-Source: APiQypLlSu7obGufgeyKGM208Jk0P/54bCxkjvodFG+fIfo2MG9URlZjMz3fDLbxNXoVrUj35b/spnQpLfcGDp8jqQI=
X-Received: by 2002:a67:db0d:: with SMTP id z13mr15766817vsj.155.1589292049868;
 Tue, 12 May 2020 07:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200512195712.690f02bb@canb.auug.org.au>
In-Reply-To: <20200512195712.690f02bb@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 12 May 2020 23:00:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ-=A0nDZK0FTzgJ6oJ-VbV33F1rVjvBAWgybSsUXaPVA@mail.gmail.com>
Message-ID: <CAK7LNAQ-=A0nDZK0FTzgJ6oJ-VbV33F1rVjvBAWgybSsUXaPVA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the fsinfo tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Howells <dhowells@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 12, 2020 at 6:57 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the fsinfo tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /usr/lib/gcc-cross/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/bin/ld: cannot find /usr/lib/x86_64-linux-gnu/libm-2.30.a
> /usr/lib/gcc-cross/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/bin/ld: cannot find /usr/lib/x86_64-linux-gnu/libmvec.a
>
> I don't know if this is a quirk of the build system or Debian's cross
> compiler setup.  Both those files exist in /usr/x86_64-linux-gnu/lib/.
>
> Masahiro, any thoughts?
>
> I have disabled the building of test_fsinfo for now:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 12 May 2020 19:49:33 +1000
> Subject: [PATCH] disable building fo test-fsinfo for now
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  samples/vfs/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/samples/vfs/Makefile b/samples/vfs/Makefile
> index f5bc5dfdf045..97e54c8be358 100644
> --- a/samples/vfs/Makefile
> +++ b/samples/vfs/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -userprogs := test-fsinfo test-fsmount test-mntinfo test-statx
> +userprogs := test-fsmount test-mntinfo test-statx
>  always-y := $(userprogs)
>
>  userccflags += -I usr/include
> --
> 2.26.2
>
> --
> Cheers,
> Stephen Rothwell


I also failed to build it, but the error message
was different.



The following worked for me at least.
(Ubuntu 20.04).



diff --git a/samples/vfs/Makefile b/samples/vfs/Makefile
index 97e54c8be358..539fb3a56af3 100644
--- a/samples/vfs/Makefile
+++ b/samples/vfs/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
-userprogs := test-fsmount test-mntinfo test-statx
+userprogs := test-fsinfo test-fsmount test-mntinfo test-statx
 always-y := $(userprogs)

 userccflags += -I usr/include

-test-fsinfo-userldflags += -static -lm
+test-fsinfo-userldflags := -static
+test-fsinfo-userldlibs := -lm




David,

BTW, why is '-static' needed here?




--
Best Regards
Masahiro Yamada
