Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEB631B25F
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 21:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhBNUNn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 15:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhBNUNn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 15:13:43 -0500
X-Greylist: delayed 1034 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 14 Feb 2021 12:13:03 PST
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD28C061574
        for <linux-next@vger.kernel.org>; Sun, 14 Feb 2021 12:13:03 -0800 (PST)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lBNU0-00DzCn-JC; Sun, 14 Feb 2021 19:55:04 +0000
Date:   Sun, 14 Feb 2021 19:55:04 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        LTP List <ltp@lists.linux.it>, lkft-triage@lists.linaro.org,
        chrubis <chrubis@suse.cz>, Jan Stancek <jstancek@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Christian Brauner <christian@brauner.io>,
        Kees Cook <keescook@chromium.org>,
        Peter Xu <peterx@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Vorel <pvorel@suse.cz>,
        Richard Palethorpe <rpalethorpe@suse.com>,
        Joerg.Vehlow@aox-tech.de
Subject: Re: LTP: madvise08.c:203: TFAIL: No sequence in dump after
 MADV_DODUMP.
Message-ID: <YCmAGNyFAOZs7GCG@zeniv-ca.linux.org.uk>
References: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
 <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
 <CA+G9fYv89bfbixjuudPWkBAucTYg7qhNxcV54RMEkRP5is-bnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYv89bfbixjuudPWkBAucTYg7qhNxcV54RMEkRP5is-bnQ@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 25, 2021 at 10:01:48PM +0530, Naresh Kamboju wrote:
> commit 8a3cc755b13808eba74846dfd1033fcbc21f9a65
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Sun Mar 8 09:16:37 2020 -0400
> 
>     coredump: don't bother with do_truncate()
> 
>     have dump_skip() just remember how much needs to be skipped,
>     leave actual seeks/writing zeroes to the next dump_emit()
>     or the end of coredump output, whichever comes first.
>     And instead of playing with do_truncate() in the end, just
>     write one NUL at the end of the last gap (if any).
> 
>     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> 
>  fs/binfmt_elf.c          |  1 -
>  fs/coredump.c            | 56 +++++++++++++++++++++++++++---------------------
>  include/linux/binfmts.h  |  1 +
>  include/linux/coredump.h |  1 -
> 
> 
> Test case output link,
> https://lkft.validation.linaro.org/scheduler/job/2184975#L1369
> https://lkft.validation.linaro.org/scheduler/job/2184972#L1358

I think I see what's going on.  Could you check if the following
fixes your reproducer?

diff --git a/arch/powerpc/platforms/cell/spufs/coredump.c b/arch/powerpc/platforms/cell/spufs/coredump.c
index 60b5583e9eaf..1a587618015c 100644
--- a/arch/powerpc/platforms/cell/spufs/coredump.c
+++ b/arch/powerpc/platforms/cell/spufs/coredump.c
@@ -149,8 +149,7 @@ static int spufs_arch_write_note(struct spu_context *ctx, int i,
 			return -EIO;
 	}
 
-	if (!dump_skip(cprm, roundup(cprm->pos - ret + sz, 4) - cprm->pos))
-		return -EIO;
+	dump_skip_to(cprm, roundup(cprm->pos - ret + sz, 4));
 	return 0;
 }
 
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 66137d5dca5f..474a3c7dd5ce 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2267,8 +2267,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 		goto end_coredump;
 
 	/* Align to page */
-	if (!dump_skip(cprm, dataoff - cprm->pos))
-		goto end_coredump;
+	dump_skip_to(cprm, dataoff);
 
 	for (i = 0; i < vma_count; i++) {
 		struct core_vma_metadata *meta = vma_meta + i;
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index be4062b8ba75..01f043971644 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1640,8 +1640,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
 				goto end_coredump;
 	}
 
-	if (!dump_skip(cprm, dataoff - cprm->pos))
-		goto end_coredump;
+	dump_skip_to(cprm, dataoff);
 
 	if (!elf_fdpic_dump_segments(cprm, vma_meta, vma_count))
 		goto end_coredump;
diff --git a/fs/coredump.c b/fs/coredump.c
index 27a93f724251..bfac7422cd14 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -894,7 +894,14 @@ int dump_emit(struct coredump_params *cprm, const void *addr, int nr)
 }
 EXPORT_SYMBOL(dump_emit);
 
-int dump_skip(struct coredump_params *cprm, size_t nr)
+void dump_skip_to(struct coredump_params *cprm, unsigned long pos)
+{
+	cprm->to_skip = pos - cprm->pos;
+	return 0;
+}
+EXPORT_SYMBOL(dump_skip_to);
+
+void dump_skip(struct coredump_params *cprm, size_t nr)
 {
 	cprm->to_skip += nr;
 	return 0;
@@ -925,11 +932,11 @@ int dump_user_range(struct coredump_params *cprm, unsigned long start,
 			stop = !dump_emit(cprm, kaddr, PAGE_SIZE);
 			kunmap(page);
 			put_page(page);
+			if (stop)
+				return 0;
 		} else {
-			stop = !dump_skip(cprm, PAGE_SIZE);
+			dump_skip(cprm, PAGE_SIZE);
 		}
-		if (stop)
-			return 0;
 	}
 	return 1;
 }
@@ -940,7 +947,9 @@ int dump_align(struct coredump_params *cprm, int align)
 	unsigned mod = (cprm->pos + cprm->to_skip) & (align - 1);
 	if (align & (align - 1))
 		return 0;
-	return mod ? dump_skip(cprm, align - mod) : 1;
+	if (mod)
+		cprm->to_skip += align - mod;
+	return 1;
 }
 EXPORT_SYMBOL(dump_align);
 
diff --git a/include/linux/coredump.h b/include/linux/coredump.h
index 806d7f87d16a..78fcd776b185 100644
--- a/include/linux/coredump.h
+++ b/include/linux/coredump.h
@@ -23,7 +23,8 @@ extern unsigned int core_pipe_limit;
  * functions to write out all the necessary info.
  */
 struct coredump_params;
-extern int dump_skip(struct coredump_params *cprm, size_t nr);
+extern void dump_skip_to(struct coredump_params *cprm, unsigned long to);
+extern void dump_skip(struct coredump_params *cprm, size_t nr);
 extern int dump_emit(struct coredump_params *cprm, const void *addr, int nr);
 extern int dump_align(struct coredump_params *cprm, int align);
 int dump_user_range(struct coredump_params *cprm, unsigned long start,
