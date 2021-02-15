Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287B031B5F5
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 09:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhBOImL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 03:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhBOImJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2021 03:42:09 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCD4C061574
        for <linux-next@vger.kernel.org>; Mon, 15 Feb 2021 00:41:29 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id jt13so9887545ejb.0
        for <linux-next@vger.kernel.org>; Mon, 15 Feb 2021 00:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZQ348ps0wv2e4InmeINuZX0d9m8CN4q6775IcZAmEBs=;
        b=WwXoLyKA7iLvagNbuwuWEIhoH6920JGn9vk+p2/qHasRxhmrfaIzyGnwPCzLv/tgkh
         rpEBaJfiqElIc/qidrP2eV6nG2ENJZSxcT/uX+8wxKiH+ItNsJ/v7kEI9cCNUBTEn5Z1
         9YOY1IVi5j9JS7jhXICw/gTeZZyKXeXyssTMg0Zs5n2QzaGEWtD7rwWZV7IapInYr6yw
         vXVZyq6zsmPJ3nPeGpnwJ9NEVMosYb4o5wkEBzYgZyDOd4Q034S5DC0+ieztwHs9VDuH
         roUwq1/8gK2BIgSG/2CsDGYeVSObOclVbn16pXctORSKdgRJ0p+4ZUxXGRbBzho6oRYo
         EoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZQ348ps0wv2e4InmeINuZX0d9m8CN4q6775IcZAmEBs=;
        b=bAnADnFB53b1l5sOloknfXzXk6cmN7j4Pw+jCV6po8EbgkiVcwSrsikVdI9YwzGr+L
         jsVqHNjfSalzRZ3BliYAT1a5dbomELt98nrenWKbITeftof3snazeSxCvQuxikhDWUFk
         9FD4+Ogv6zkZBL3z4bK/e1ID2+MPpTKwBhSDQKs87XdM+xYHgD8yVTXHBbrsnaFLH433
         echQKD6tz4/jcidBq6edlrapRo9aP7Mj2guAFE7h0/tkaOzpIdPIywih2xrhVesDkWg6
         wpZjYin4Caiv9khAh8Tsq9STwUU7FmZ3WmfJNzVKpdZUgBD0hqReF4TQjgOoPuMXSjU+
         vWkg==
X-Gm-Message-State: AOAM533STCVNTOur2JcalGAep063plIYfSSPMd6+H1IDBDTMvJniz4LX
        lf3cVh/N2EeyFb93oo9uc2SQoxfynlzFz7tqf5lTgw==
X-Google-Smtp-Source: ABdhPJwBYIVGzRM8ktSwxPe+1DHpTVEGkJgdoSGdgtG0XVGO6Y4e8KVeROvznUZ6sMQxqT/IsuG/vcnltlKkq2cwtY8=
X-Received: by 2002:a17:906:685a:: with SMTP id a26mr5372182ejs.503.1613378487664;
 Mon, 15 Feb 2021 00:41:27 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
 <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
 <CA+G9fYv89bfbixjuudPWkBAucTYg7qhNxcV54RMEkRP5is-bnQ@mail.gmail.com> <YCmAGNyFAOZs7GCG@zeniv-ca.linux.org.uk>
In-Reply-To: <YCmAGNyFAOZs7GCG@zeniv-ca.linux.org.uk>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 15 Feb 2021 14:11:15 +0530
Message-ID: <CA+G9fYsZnBv4wAEKYb0mgMd-BsgXcPUGBQ=VRKcONqAZry_4XQ@mail.gmail.com>
Subject: Re: LTP: madvise08.c:203: TFAIL: No sequence in dump after MADV_DODUMP.
To:     Al Viro <viro@zeniv.linux.org.uk>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Al Viro,

On Mon, 15 Feb 2021 at 01:25, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Jan 25, 2021 at 10:01:48PM +0530, Naresh Kamboju wrote:
> > commit 8a3cc755b13808eba74846dfd1033fcbc21f9a65
> > Author: Al Viro <viro@zeniv.linux.org.uk>
> > Date:   Sun Mar 8 09:16:37 2020 -0400
> >
> >     coredump: don't bother with do_truncate()
> >
> >     have dump_skip() just remember how much needs to be skipped,
> >     leave actual seeks/writing zeroes to the next dump_emit()
> >     or the end of coredump output, whichever comes first.
> >     And instead of playing with do_truncate() in the end, just
> >     write one NUL at the end of the last gap (if any).
> >
> >     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> >
> >  fs/binfmt_elf.c          |  1 -
> >  fs/coredump.c            | 56 +++++++++++++++++++++++++++---------------------
> >  include/linux/binfmts.h  |  1 +
> >  include/linux/coredump.h |  1 -
> >
> >
> > Test case output link,
> > https://lkft.validation.linaro.org/scheduler/job/2184975#L1369
> > https://lkft.validation.linaro.org/scheduler/job/2184972#L1358
>
> I think I see what's going on.  Could you check if the following
> fixes your reproducer?
>
> diff --git a/arch/powerpc/platforms/cell/spufs/coredump.c b/arch/powerpc/platforms/cell/spufs/coredump.c
> index 60b5583e9eaf..1a587618015c 100644
> --- a/arch/powerpc/platforms/cell/spufs/coredump.c
> +++ b/arch/powerpc/platforms/cell/spufs/coredump.c
> @@ -149,8 +149,7 @@ static int spufs_arch_write_note(struct spu_context *ctx, int i,
>                         return -EIO;
>         }
>
> -       if (!dump_skip(cprm, roundup(cprm->pos - ret + sz, 4) - cprm->pos))
> -               return -EIO;
> +       dump_skip_to(cprm, roundup(cprm->pos - ret + sz, 4));
>         return 0;
>  }
>
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index 66137d5dca5f..474a3c7dd5ce 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -2267,8 +2267,7 @@ static int elf_core_dump(struct coredump_params *cprm)
>                 goto end_coredump;
>
>         /* Align to page */
> -       if (!dump_skip(cprm, dataoff - cprm->pos))
> -               goto end_coredump;
> +       dump_skip_to(cprm, dataoff);
>
>         for (i = 0; i < vma_count; i++) {
>                 struct core_vma_metadata *meta = vma_meta + i;
> diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
> index be4062b8ba75..01f043971644 100644
> --- a/fs/binfmt_elf_fdpic.c
> +++ b/fs/binfmt_elf_fdpic.c
> @@ -1640,8 +1640,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
>                                 goto end_coredump;
>         }
>
> -       if (!dump_skip(cprm, dataoff - cprm->pos))
> -               goto end_coredump;
> +       dump_skip_to(cprm, dataoff);
>
>         if (!elf_fdpic_dump_segments(cprm, vma_meta, vma_count))
>                 goto end_coredump;
> diff --git a/fs/coredump.c b/fs/coredump.c
> index 27a93f724251..bfac7422cd14 100644
> --- a/fs/coredump.c
> +++ b/fs/coredump.c
> @@ -894,7 +894,14 @@ int dump_emit(struct coredump_params *cprm, const void *addr, int nr)
>  }
>  EXPORT_SYMBOL(dump_emit);
>
> -int dump_skip(struct coredump_params *cprm, size_t nr)
> +void dump_skip_to(struct coredump_params *cprm, unsigned long pos)
> +{
> +       cprm->to_skip = pos - cprm->pos;
> +       return 0;


fs/coredump.c:903:9: error: 'return' with a value, in function
returning void [-Werror=return-type]
 903 | return 0;
        | ^

Build failed due to above error.

build log link,
https://gitlab.com/Linaro/lkft/users/naresh.kamboju/linux/-/jobs/1029838856#L383

- Naresh
