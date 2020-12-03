Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2CD2CD5EF
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 13:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730465AbgLCMtn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 07:49:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730466AbgLCMtn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 07:49:43 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDCFC061A4E
        for <linux-next@vger.kernel.org>; Thu,  3 Dec 2020 04:49:02 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id t7so1211036pfh.7
        for <linux-next@vger.kernel.org>; Thu, 03 Dec 2020 04:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bPYnhrsvsymVgI4dIOwlvS+ALlvDhFJqcsBpBX3jCVU=;
        b=HTLpbfuxAQHsAyHafUIKQayYnjNANpaMeGVFMD/TI2oS7/FkoQ2Wm6b++lxo2kl06Q
         9fsUEzQBcCHEjVrDh9x7dWTa8zlwimms3T7U60gD1F6gDHCimICp2X+I5gajiJtB7anO
         RrTHh450L6Ozzk13ygR/ygO/lJgeiGsIu4IutqqpoXV4iTAsvyYPWyc0Kvr+Az/oigEb
         14+gUzfA83aNhvJ/doRJvrwp3+DX1gwEOurCHa51Xydd6htX5jmnyzMarkkr7mC7uEmt
         W32hFKEq24KGhgA8hVe1mQvruWpjNe8jcOdWELT1Lc3cYrkiyzsXqoNPWkMeLi8Ju+fs
         w9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bPYnhrsvsymVgI4dIOwlvS+ALlvDhFJqcsBpBX3jCVU=;
        b=coLQ0+C9Wu5KgWxVQYcdCRN/aeX4yfXFSIlrT+LM/+/Nve9sH+/7DbtPIo105+w2YF
         46Bo7PeH7+zihJ1kxm+jX2UeeZSAe1b5H3GA166tdmwWbdBptF/RvhZs6DB+FmqTfyTS
         tZTCsoGyScTLaihe1E/hbeq6IuPZ8LR31qxa4bkwzBzP2Ez9/UEbmpPTHjdtg5k+WPSR
         4BEA3WePNONRJ25D2b+jDR8nqIZe5haxUXvZZKPZnEQ/IRaOm2CSUFLLgqHjagoeP0nq
         3qBxRDyGbmaikg11lur8iQUyGSkxGjXR9Q+eeFhLDGcMhbBm0Ut9/aDjbzIUxdyfd8Cq
         r/hA==
X-Gm-Message-State: AOAM530cHIeihNi8i+0Qyk5SHwovOG9NRE6Pwvd9DXSbW6MnGRjc+Oqj
        K7sa2DrelghNzWhWbRXHtAZclfdSzzwOjReaNvqlH0Y34KY=
X-Google-Smtp-Source: ABdhPJzbQsp200jdS8zI0+yDTBzSIOfZFhwYGDqCR1ZPqyj3n1jak2ybII3aJ4i+vRLqN/cdXLBKuk+wX893vr1HF2E=
X-Received: by 2002:a63:f919:: with SMTP id h25mr2918514pgi.440.1606999742261;
 Thu, 03 Dec 2020 04:49:02 -0800 (PST)
MIME-Version: 1.0
References: <20201203195247.498b7ac1@canb.auug.org.au>
In-Reply-To: <20201203195247.498b7ac1@canb.auug.org.au>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 3 Dec 2020 13:48:51 +0100
Message-ID: <CAAeHK+xborghfQ_TQ3qDFwy+Xr4QXK_x3M=aoeyCjvMSTeg+Ww@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
        Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 3, 2020 at 9:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the akpm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> mm/kasan/quarantine.c: In function 'quarantine_put':
> mm/kasan/quarantine.c:197:15: error: 'info' undeclared (first use in this function)
>   197 |   qlink_free(&info->quarantine_link, cache);
>       |               ^~~~
> mm/kasan/quarantine.c:197:15: note: each undeclared identifier is reported only once for each function it appears in
> mm/kasan/quarantine.c:199:3: error: 'return' with no value, in function returning non-void [-Werror=return-type]
>   199 |   return;
>       |   ^~~~~~
> mm/kasan/quarantine.c:171:6: note: declared here
>   171 | bool quarantine_put(struct kmem_cache *cache, void *object)
>       |      ^~~~~~~~~~~~~~
>
> Caused by patches
>
>   "kasan: rename get_alloc/free_info"
>   "kasan: sanitize objects when metadata doesn't fit"

Yeah, this is conflict with the "kasan: fix object remain in offline
per-cpu quarantine" patch.

> I have applied the following fix patch:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 3 Dec 2020 19:41:49 +1100
> Subject: [PATCH] kasan-rename-get_alloc-free_info-fix
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  mm/kasan/quarantine.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
> index feae26ea5cbb..d98b516f372f 100644
> --- a/mm/kasan/quarantine.c
> +++ b/mm/kasan/quarantine.c
> @@ -194,9 +194,9 @@ bool quarantine_put(struct kmem_cache *cache, void *object)
>
>         q = this_cpu_ptr(&cpu_quarantine);
>         if (q->offline) {
> -               qlink_free(&info->quarantine_link, cache);
> +               qlink_free(&meta->quarantine_link, cache);
>                 local_irq_restore(flags);
> -               return;
> +               return false;
>         }
>         qlist_put(q, &meta->quarantine_link, cache->size);
>         if (unlikely(q->bytes > QUARANTINE_PERCPU_SIZE)) {
> --
> 2.29.2
>
> --
> Cheers,
> Stephen Rothwell

This fixup looks good to me. Thanks!
