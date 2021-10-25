Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C751438F0D
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 07:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhJYGBL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 02:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhJYGBL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 02:01:11 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B0DC061745;
        Sun, 24 Oct 2021 22:58:49 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id v17so9376478qtp.1;
        Sun, 24 Oct 2021 22:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=phz2ShPYJOTTRkBu8WpGV2HU9X5zCxuIcyKps/Mt5nE=;
        b=TKyXcphaOJ9oZO8Znx2ZdIlkgGjytUp7N1N1NS8fGMck/vZtOTddQMFcvKLGijqCg5
         APdASY/diuFz9hl+WaBIaVmTvB+M4hD8mUzuWRBtOKwAAzZPE4Zx+1E3PDZsWoGjELkw
         5hV/6mb8gmi12xtwdjhpBv+UJAPPvxYm/+DQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=phz2ShPYJOTTRkBu8WpGV2HU9X5zCxuIcyKps/Mt5nE=;
        b=aO+cBRb32kwWCZRZOTUJQAxkFk1IdGrjiCjOSrNnHDt73DdHzLlrPXpeUI6ZEmrw1N
         7buLL05I85B/2eRrm51wDVsVvDTTLEzWE9J9Bv1qhdbTVKwpgYGtZdDKskNtZN7IoGS1
         Bn0OiK9UXzsLJXY1lo7fPyY3uDYEUbIjHC4ydxidFx8So0VycA3D5wxl/7+HNLglRUf9
         vASc7zw58iLqic7pdE1Y6jzKplsb1aLP8ICKmC9JvJ+kQLW7t/QL/BhEywycyra7W6fQ
         HzqyooZT6EPmmjC1MWafJX5S4QyDjJaIoGqNlNVf9C7boKVtpfcBECnoiWeFyDtc6zyK
         wkQA==
X-Gm-Message-State: AOAM531AUjBWBOzvWLmr52o4VodK5Gi/mIXLDYmALREspz4wfo3gH1Ma
        ZD+ZOt5bVTIA7e5hS6AnuPB47TVh1Pr3iOwLlBIbv6Cm
X-Google-Smtp-Source: ABdhPJw+9olsgOQMLLhshv8Kh1yA5kiVKyBo8XO6qFacdWiAM18lG8QMBz3jZrPhQS/KwpivNjJJpMDtcGEiWrV6BP0=
X-Received: by 2002:ac8:5bcc:: with SMTP id b12mr15462614qtb.392.1635141528969;
 Sun, 24 Oct 2021 22:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211022193853.296c4ee9@canb.auug.org.au>
In-Reply-To: <20211022193853.296c4ee9@canb.auug.org.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 25 Oct 2021 05:58:37 +0000
Message-ID: <CACPK8XcWyJYj94q+Jp+KgTnM_f4vyY_gSyjUXN8ZPOtnbpJjfg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Eddie James <eajames@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 22 Oct 2021 at 08:39, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/hwmon/occ/p9_sbe.c: In function 'p9_sbe_occ_save_ffdc':
> drivers/hwmon/occ/p9_sbe.c:58:5: error: implicit declaration of function 'kvfree' [-Werror=implicit-function-declaration]
>    58 |     kvfree(ctx->ffdc);
>       |     ^~~~~~
> drivers/hwmon/occ/p9_sbe.c:59:16: error: implicit declaration of function 'kvmalloc'; did you mean 'key_alloc'? [-Werror=implicit-function-declaration]
>    59 |    ctx->ffdc = kvmalloc(resp_len, GFP_KERNEL);
>       |                ^~~~~~~~
>       |                key_alloc
> drivers/hwmon/occ/p9_sbe.c:59:14: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
>    59 |    ctx->ffdc = kvmalloc(resp_len, GFP_KERNEL);
>       |              ^
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   5027a34a575e ("hwmon: (occ) Provide the SBEFIFO FFDC in binary sysfs")
>
> from the fsi tree interacting with commit
>
>   9192e3be4cc2 ("mm: move kvmalloc-related functions to slab.h")
>
> from the akpm-current tree.

If I apply this patch then the build fails in a tree that doesn't have
Willy's patch.

Unless someone has a better suggestion I'll send a patch that includes
both headers for now, and make a note to remove the mm.h include down
the track.

Cheers,

Joel

>
> I have applied the following merge fix patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 22 Oct 2021 19:32:54 +1100
> Subject: [PATCH] kvmalloc etc moved to slab.h
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/hwmon/occ/p9_sbe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index e50243580269..bb082eb52243 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -4,10 +4,10 @@
>  #include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/fsi-occ.h>
> -#include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/sysfs.h>
>
> --
> 2.33.0
>
> --
> Cheers,
> Stephen Rothwell
