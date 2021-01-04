Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7C22EA0CD
	for <lists+linux-next@lfdr.de>; Tue,  5 Jan 2021 00:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbhADX3J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 18:29:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbhADX3I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2021 18:29:08 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04760C061574;
        Mon,  4 Jan 2021 15:28:28 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kwZGy-006txU-Eh; Mon, 04 Jan 2021 23:28:24 +0000
Date:   Mon, 4 Jan 2021 23:28:24 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20210104232824.GQ3579531@ZenIV.linux.org.uk>
References: <20210105093616.5712e36f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105093616.5712e36f@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 05, 2021 at 09:36:16AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from arch/x86/include/asm/elf.h:8,
>                  from include/linux/elf.h:6,
>                  from include/linux/elfcore-compat.h:5,
>                  from fs/compat_binfmt_elf.c:17:
> fs/binfmt_elf.c: In function 'fill_thread_core_info':
> arch/x86/include/asm/elfcore-compat.h:23:20: error: 'TIF_X32' undeclared (first use in this function)
>    23 |  (test_thread_flag(TIF_X32) \
>       |                    ^~~~~~~
> include/linux/thread_info.h:116:45: note: in definition of macro 'test_thread_flag'
>   116 |  test_ti_thread_flag(current_thread_info(), flag)
>       |                                             ^~~~
> fs/binfmt_elf.c:1744:5: note: in expansion of macro 'PRSTATUS_SIZE'
>  1744 |     PRSTATUS_SIZE, &t->prstatus);
>       |     ^~~~~~~~~~~~~
> arch/x86/include/asm/elfcore-compat.h:23:20: note: each undeclared identifier is reported only once for each function it appears in
>    23 |  (test_thread_flag(TIF_X32) \
>       |                    ^~~~~~~
> include/linux/thread_info.h:116:45: note: in definition of macro 'test_thread_flag'
>   116 |  test_ti_thread_flag(current_thread_info(), flag)
>       |                                             ^~~~
> fs/binfmt_elf.c:1744:5: note: in expansion of macro 'PRSTATUS_SIZE'
>  1744 |     PRSTATUS_SIZE, &t->prstatus);
>       |     ^~~~~~~~~~~~~
> 
> Caused by commit
> 
>   5a9b7f382248 ("binfmt_elf: partially sanitize PRSTATUS_SIZE and SET_PR_FPVALID")
> 
> or maybe commit
> 
>   9866fcab1c65 ("[elfcore-compat][amd64] clean PRSTATUS_SIZE/SET_PR_FPVALID up properly")

Arrgh...  It's 8d71d2bf6efe ("x86: Reclaim TIF_IA32 and TIF_X32") in mainline, actually.
Mea culpa ;-/
