Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26CC43AAB7
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 05:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhJZDWa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 23:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbhJZDW3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 23:22:29 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0097DC061745;
        Mon, 25 Oct 2021 20:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=jAPA2L/R+i/IgedRAop6/upAuHcwMUUqczAkGrwyOr8=; b=Q78gdiQ1qmD1wV1buvfDzjgyRH
        EU0bsSspjh6VAjRhxA1AAxJtd8uVyZrkiLhtNSX53nRuyr+S7kvF7q4klbrn30Acf+Q5+8sGe4kt+
        Lf+4bNm/ku9UXhLB8sa2XfYWupA73LFX+uVG37rknvtSymU6hjHUCPN/Zc1yPwXpEZjaE9Fs3HrQh
        eVyYIGu5FkzSCy6CwhLnJzAD0vfQvUd7cWi60dxkyP4yRUzdOt0xs+omlBh6T4Yq5tdtko/nW7Yjm
        fO1b1qXQ6BwaP3rkWLIK662Ni9U+pqMQaz1R6S6OHe5F1I5PXyzl78zKzUqbKLAuWywM9Wf/SBPAv
        21nS1jew==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mfD0O-000X0H-9D; Tue, 26 Oct 2021 03:20:04 +0000
Subject: Re: linux-next: Tree for Oct 25 (bootconfig: xbc_alloc_mem())
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
References: <20211025204921.73cb3011@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fe148532-a26d-103a-bcb5-4a749763d71a@infradead.org>
Date:   Mon, 25 Oct 2021 20:20:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025204921.73cb3011@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/25/21 2:49 AM, Stephen Rothwell wrote:
> Hi all,
> 
> There seems to be something amiss with cnosole output in today's release
> (at least on my ppc qemu boot tests).
> 
> Changes since 20211022:
> 
> The nds32 tree gained a conflict against the kbuild tree.
> 
> The qcom tree gained a build failure so I used the version from
> next-20211022.
> 
> The nfsd tree gained a conflict against the nfs tree.
> 
> The sound-asoc tree gained a build failure so I used the version from
> next-20211022.
> 
> The block tree gained a conflict against Linus' tree.
> 
> The regulator tree lost its build failure.
> 
> The tip tree lost its build failure but gained another for which I
> applied a patch.
> 
> The ftrace tree gained a conflict against the parisc-hd tree.
> 
> The kvm tree gained a conflict against the tip tree.
> 
> The kspp-gustavo tree still had one of its build failures for which I
> reverted a commit.  It also gained a conflict against the ftrace tree.
> 
> The akpm-current tree gained a conflict against the ftrace tree.
> 
> Non-merge commits (relative to Linus' tree): 10130
>   9510 files changed, 594184 insertions(+), 218643 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> multi_v7_defconfig for arm and a native build of tools/perf. After
> the final fixups (if any), I do an x86_64 modules_install followed by
> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig and htmldocs. And finally, a simple boot test
> of the powerpc pseries_le_defconfig kernel in qemu (with and without
> kvm enabled).
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 340 trees (counting Linus' and 92 trees of bug
> fix patches pending for the current merge release).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.
> 
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
> 

on i386:

WARNING: modpost: vmlinux.o(.text.unlikely+0x29b16): Section mismatch in reference from the function xbc_alloc_mem() to the function .init.text:memblock_alloc_try_nid()
The function xbc_alloc_mem() references
the function __init memblock_alloc_try_nid().
This is often because xbc_alloc_mem lacks a __init
annotation or the annotation of memblock_alloc_try_nid is wrong.


Looks like lib/bootconfig.c::xbc_alloc_mem() should be marked
as __init (when it's built for KERNEL).


-- 
~Randy
