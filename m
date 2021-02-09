Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95B4315280
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 16:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhBIPRI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 10:17:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:46668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231674AbhBIPRG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 10:17:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4F8164EB1;
        Tue,  9 Feb 2021 15:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612883785;
        bh=gLOoCljiYS+637We3rAhCj7YRtsqPvjKsdzaIB7M2Wk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lzRmksQj72FH/f7Fxm152+12w7tSjkJSk26QH0fXbcz5BCwj77/5bE5JMxGN6xjkQ
         Qws9fzr1bfIvmCOUnRujMu4Ke4jUWjo0ENTdBqxC8nyQ7uNGmpkSdnO85w6Q71z7FR
         8AzCe0UVwFamNLSWNg88PLVGHNwHPHgF7jMFAQzLhVB3iYAq537wdMwk0/oarQioxz
         F701L2phy7RSjHpjiS3s+VF8mYJjrNC2TeQGmuxhGwY7xrpPVR3t3SmIZtWCzVFqDz
         pOvC6GkPrk4amV1ZJHDJmKXLgm9sfzYgYhu6D25cKp9F9PbjcD//CpeyIHfP8u24ne
         ksAMub0R1bbmw==
Date:   Tue, 9 Feb 2021 16:16:20 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: linux-next: build failure after merge of the modules tree
Message-ID: <YCKnRPRTDyfGxnBC@gunter>
References: <20210209210843.3af66662@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210209210843.3af66662@canb.auug.org.au>
X-OS:   Linux gunter 5.10.12-1-default x86_64
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+++ Stephen Rothwell [09/02/21 21:08 +1100]:
>Hi all,
>
>After merging the modules tree, today's linux-next build (powerpc
>allyesconfig) failed like this:
>
>In file included from include/linux/export.h:123,
>                 from include/linux/linkage.h:7,
>                 from arch/powerpc/include/asm/unistd.h:18,
>                 from <stdin>:2:
>./include/generated/autoksyms.h:5:9: warning: missing whitespace after the macro name
>    5 | #define __KSYM_.HT_update_self_and_peer_setting 1
>      |         ^~~~~~~
>./include/generated/autoksyms.h:6:9: warning: missing whitespace after the macro name
>    6 | #define __KSYM_.RemovePeerTS 1
>      |         ^~~~~~~
>./include/generated/autoksyms.h:6: warning: "__KSYM_" redefined
>    6 | #define __KSYM_.RemovePeerTS 1
>      |
>./include/generated/autoksyms.h:5: note: this is the location of the previous definition
>
>and on and on :-(
>
>Caused by commit
>
>  367948220fce ("module: remove EXPORT_UNUSED_SYMBOL*")
>
>I have reverted that commit for today.

[ Adding Michael and Masahiro to CC ]

Hi Stephen,

Hmm, these errors don't look like it's related to that particular commit. I was
able to reproduce these weird autoksym errors even without any modules-next
patches applied, and on a clean v5.11-rc7 tree. To reproduce it,
CONFIG_TRIM_UNUSED_KSYMS needs to be enabled. I guess that's why we run into
these errors with allyesconfig. I used a gcc-7 ppc64le cross compiler and got
the same compiler warnings. It seems to not compile on powerpc properly because
it looks like some symbols have an extra dot "." prefix, for example in
kthread.o:

    168: 0000000000000318    24 NOTYPE  GLOBAL DEFAULT    6 kthread_create_worker
    169: 0000000000001d90   104 FUNC    GLOBAL DEFAULT    1 .kthread_create_worker
    170: 0000000000000330    24 NOTYPE  GLOBAL DEFAULT    6 kthread_create_worker_on_cpu
    171: 0000000000001e00    88 FUNC    GLOBAL DEFAULT    1 .kthread_create_worker_on_cpu
    172: 0000000000000348    24 NOTYPE  GLOBAL DEFAULT    6 kthread_queue_work
    173: 0000000000001e60   228 FUNC    GLOBAL DEFAULT    1 .kthread_queue_work

So I suppose this dot prefix is specific to powerpc. From the ppc64 elf abi docs:

     Symbol names with a dot (.) prefix are reserved for holding entry point
     addresses. The value of a symbol named ".FN", if it exists, is the entry point
     of the function "FN".

I guess the presence of the extra dot symbols is confusing
scripts/gen_autoksyms.sh, so we get the dot symbols in autoksyms.h, which the
preprocessor doesn't like. I am wondering how this was never caught until now
and also now curious if this feature was ever functional on powerpc..

Thanks,

Jessica
