Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAA337B9A3
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 11:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhELJv1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 05:51:27 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:48869 "EHLO pegase2.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230224AbhELJv0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 May 2021 05:51:26 -0400
X-Greylist: delayed 1838 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 May 2021 05:51:25 EDT
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4Fg8Pk5PPtz9sf9;
        Wed, 12 May 2021 11:19:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id F9wFVANaEwyZ; Wed, 12 May 2021 11:19:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4Fg8Pk4K0Fz9sf8;
        Wed, 12 May 2021 11:19:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A5948B7E4;
        Wed, 12 May 2021 11:19:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id Q_iYyKlXfgNP; Wed, 12 May 2021 11:19:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id E8ED58B7DF;
        Wed, 12 May 2021 11:19:37 +0200 (CEST)
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Nicholas Piggin <npiggin@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210512153348.2ef4d1a9@canb.auug.org.au>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e5b3ab36-3622-72bf-4150-ee07cf83cfdb@csgroup.eu>
Date:   Wed, 12 May 2021 11:19:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210512153348.2ef4d1a9@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Nick,

Le 12/05/2021 à 07:33, Stephen Rothwell a écrit :
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
>                   from arch/powerpc/include/asm/book3s/64/mmu.h:31,
>                   from arch/powerpc/include/asm/mmu.h:402,
>                   from arch/powerpc/include/asm/lppaca.h:46,
>                   from arch/powerpc/include/asm/paca.h:17,
>                   from arch/powerpc/include/asm/current.h:13,
>                   from include/linux/thread_info.h:22,
>                   from include/asm-generic/preempt.h:5,
>                   from ./arch/powerpc/include/generated/asm/preempt.h:1,
>                   from include/linux/preempt.h:78,
>                   from include/linux/spinlock.h:51,
>                   from include/linux/vmalloc.h:5,
>                   from mm/ioremap.c:9:
> arch/powerpc/include/asm/book3s/64/pgtable.h:246:21: error: initializer element is not constant
>    246 | #define PGDIR_SHIFT (PUD_SHIFT + PUD_INDEX_SIZE)
>        |                     ^
> include/asm-generic/pgtable-nop4d.h:11:20: note: in expansion of macro 'PGDIR_SHIFT'
>     11 | #define P4D_SHIFT  PGDIR_SHIFT
>        |                    ^~~~~~~~~~~
> mm/ioremap.c:19:60: note: in expansion of macro 'P4D_SHIFT'
>     19 | static unsigned int __ro_after_init iomap_max_page_shift = P4D_SHIFT;
>        |                                                            ^~~~~~~~~

Argh ....

I'm still not used to CAPITAL_NAMES defines not being constant ....

So we need to initialise this from some init function that runs before parse_early_param()

Nick, any idea ?

> 
> Caused by commit
> 
>    9054fd6cce6c ("mm/ioremap: fix iomap_max_page_shift")
> 
> I have reverted that commit for today.
> 
