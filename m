Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD6C136EC3
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 14:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727757AbgAJNwn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 08:52:43 -0500
Received: from foss.arm.com ([217.140.110.172]:44904 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727641AbgAJNwn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jan 2020 08:52:43 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E138D328;
        Fri, 10 Jan 2020 05:52:42 -0800 (PST)
Received: from arm.com (e112269-lin.cambridge.arm.com [10.1.194.52])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22C2C3F534;
        Fri, 10 Jan 2020 05:52:42 -0800 (PST)
Date:   Fri, 10 Jan 2020 13:52:38 +0000
From:   Steven Price <steven.price@arm.com>
To:     Anders Roxell <anders.roxell@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jan 10
Message-ID: <20200110135238.GA9315@arm.com>
References: <20200110190737.65d8881b@canb.auug.org.au>
 <CADYN=9+VoYekNzsdrL+bnb3oB9Y4guE3o2okwiBD4J-c_=kAyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADYN=9+VoYekNzsdrL+bnb3oB9Y4guE3o2okwiBD4J-c_=kAyg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 10, 2020 at 10:11:41AM +0000, Anders Roxell wrote:
> On Fri, 10 Jan 2020 at 09:07, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Changes since 20200109:
> 
> I see the following build error on arm64:
> 
> ../arch/arm64/mm/dump.c: In function ‘ptdump_walk’:
> ../arch/arm64/mm/dump.c:326:2: error: too few arguments to function
> ‘ptdump_walk_pgd’
>   ptdump_walk_pgd(&st.ptdump, info->mm);
>   ^~~~~~~~~~~~~~~
> In file included from ../arch/arm64/mm/dump.c:18:
> ../include/linux/ptdump.h:20:6: note: declared here
>  void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm,
> pgd_t *pgd);
>       ^~~~~~~~~~~~~~~
> ../arch/arm64/mm/dump.c: In function ‘ptdump_check_wx’:
> ../arch/arm64/mm/dump.c:364:2: error: too few arguments to function
> ‘ptdump_walk_pgd’
>   ptdump_walk_pgd(&st.ptdump, &init_mm);
>   ^~~~~~~~~~~~~~~
> In file included from ../arch/arm64/mm/dump.c:18:
> ../include/linux/ptdump.h:20:6: note: declared here
>  void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm,
> pgd_t *pgd);
>       ^~~~~~~~~~~~~~~
> make[3]: *** [../scripts/Makefile.build:266: arch/arm64/mm/dump.o] Error 1
> make[3]: Target '__build' not remade because of errors.
> make[2]: *** [../scripts/Makefile.build:503: arch/arm64/mm] Error 2
> make[2]: Target '__build' not remade because of errors.
> make[1]: *** [/srv/jenkins/kernel/randconfig/Makefile:1683: arch/arm64] Error 2
> 
> I think something happened when applying patch [1], the changes in
> arch/arm64/mm/dump.c
> got dropped somehow. What that intended ?
> 

Indeed this chunk appears to be missing in Andrew's version of the
patch[1] too. Clearly the interface change needs to be included in the
arm64 code. Perhaps the "x86" tag in the subject caused confusion?

Steve

[1] https://ozlabs.org/~akpm/mmots/broken-out/x86-mm-avoid-allocating-struct-mm_struct-on-the-stack.patch

> 
> Cheers,
> Anders
> [1] https://lore.kernel.org/lkml/20200108145710.34314-1-steven.price@arm.com/
