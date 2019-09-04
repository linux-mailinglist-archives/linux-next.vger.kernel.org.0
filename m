Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28871A77F9
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2019 03:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfIDBBQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 21:01:16 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:65130 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfIDBBQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2019 21:01:16 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x84117Yb015558;
        Wed, 4 Sep 2019 10:01:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x84117Yb015558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567558867;
        bh=AjEufFzVyVLU2AdLo34FLZlaBTX1x5K/b/SnhbXJ+hk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=B4uvS7NLJB3xR6BpqAhfh7z1pYGyymVdo4RP50YZ2dkM7L8KD40tZBYM0NAClKxZ/
         Y1pvINpM/ItKhXAMLAM0sMWmqlay/t3hhF+lb6tM2KGPbeGYJ7FdG+nsjjuCDJyoj4
         mPukkD3zmHux2ARmjSVuGpcPVbN8B8lNTTQcPHWaAhJwnDbTAeQc6Fb1TmN2aWlQbb
         v6SsKmNGe/KgbTOQMFFhjedraDaz/HIK7nPkquhC80snMn7CXlRueQg7NE7pm7OsTg
         qIpfbFEskPu9eh5UETe+A/lCRNK6oElYjTZ7z7IKPAyTmbRV41V8pyFUmj6nmA+4mL
         MVth8LJAUZ+ag==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id r17so9790212vso.1;
        Tue, 03 Sep 2019 18:01:07 -0700 (PDT)
X-Gm-Message-State: APjAAAU3u1QGU9QzJWJ84kyIhTmj7mwRx/yOPqrnwklyCge70/TSKquQ
        jpoVktImC/xbhaWnpnSdMp5V580tezuxFLHqiE0=
X-Google-Smtp-Source: APXvYqyo1po5O9L9Nq5Ia7qmFmp/ATeXGAcAqwEBQcXBG/9eqEjgCQ08JqpAR6C0b8FHMTdDqWVRRmFm/GoJ9LBHUok=
X-Received: by 2002:a67:e9cc:: with SMTP id q12mr11010457vso.181.1567558866354;
 Tue, 03 Sep 2019 18:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190904101259.2687cea4@canb.auug.org.au>
In-Reply-To: <20190904101259.2687cea4@canb.auug.org.au>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 4 Sep 2019 10:00:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT=qUi76cF776GcT=UYce5QBo+_24gLwXH7ra15=1xLvQ@mail.gmail.com>
Message-ID: <CAK7LNAT=qUi76cF776GcT=UYce5QBo+_24gLwXH7ra15=1xLvQ@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, Sep 4, 2019 at 9:13 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the kbuild tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:
>
>
> Presumably introduced by commit
>
>   1267f9d3047d ("kbuild: add $(BASH) to run scripts with bash-extension")
>
> and presumably arch/powerpc/tools/unrel_branch_check.sh (which has no
> #! line) is a bash script.  Yeah, is uses '((' and '))'.

Thanks for catching this.


Could you fix it up as follows?
I will squash it for tomorrow's linux-next.


--- a/arch/powerpc/Makefile.postlink
+++ b/arch/powerpc/Makefile.postlink
@@ -18,7 +18,7 @@ quiet_cmd_relocs_check = CHKREL  $@
 ifdef CONFIG_PPC_BOOK3S_64
       cmd_relocs_check =                                               \
        $(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh
"$(OBJDUMP)" "$@" ; \
-       $(CONFIG_SHELL)
$(srctree)/arch/powerpc/tools/unrel_branch_check.sh "$(OBJDUMP)" "$@"
+       $(BASH) $(srctree)/arch/powerpc/tools/unrel_branch_check.sh
"$(OBJDUMP)" "$@"
 else
       cmd_relocs_check =                                               \
        $(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh
"$(OBJDUMP)" "$@"





> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
