Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD80422A12
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 16:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235560AbhJEOHg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 10:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235294AbhJEOHd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 10:07:33 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296D7C0A88E8
        for <linux-next@vger.kernel.org>; Tue,  5 Oct 2021 06:59:39 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id dj4so79434866edb.5
        for <linux-next@vger.kernel.org>; Tue, 05 Oct 2021 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ydiiyK+wpbk7UxQ50u+adlLScXLCqDKFy6StZqfKg3U=;
        b=YBfRYfV+QNhAJqBRfZJXha90EPi5gdr/Cd3w/WW1m9BFS68pOek+lMdVj3e8QbcFv+
         fAuLjob2kk4+XHyg/3ueG+ks8TjqyGTGPd/hksSTIevKqaXMNosJxKWxkt54FbnGmuxv
         xAO1LL8chdxlrnVtd0IZghXgpXQueT8R266wT7LnKEginFxtzzRgqyohE4LjMsOP78Mg
         r+lqq231j1XwIrTjv5BvbABovErMOJYQEmRfDag/M+5oltjVB3X07A1c2RE6EEALTyzD
         /93mXwNwrAQIcwhN+BLyz7qMAAiTNDF+/9hb5ocoH9+q2rtREvVbh4jZIjUeUPien3Gx
         x40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ydiiyK+wpbk7UxQ50u+adlLScXLCqDKFy6StZqfKg3U=;
        b=QHF2AYEwdB1OU+/Uvo2VNtaSGIiSk7BU1Nz82F2yfTaT+0vR3TKsgYxQaSaFobE0yi
         ZxdGE3buNE4uCsvvi8fM5wknjyF2fCutvUFvU45UoIVd4+ZFMvsGcqQk6x+g2oXvviIW
         jC939OY9Xp9t78WaQAafKKlJTZV8dYwT92Z/56mg1NWm5/8O3+igYoTDsph7pulZbe/o
         psL/rs0NTBegSE1NNoykmcChKROsvnoweC9p3z0w1ha0djGTe3zd8RrxIhX8Q901ElFL
         eajDudgD3t3JlY1V9OBtLLDAa1Hyvn6ZcO1bNXYJtnog+Vd35qBv+ojZabODXMGdIm1o
         x8kQ==
X-Gm-Message-State: AOAM533QH0jBAvRbpXtkcn9ykMALK68OLGYQIM7qfYk5KUNxLqa2xjgD
        UGxmA3Uvc0fWz6xFnLFmStyYTJKJAAFaZjSBD+u8
X-Google-Smtp-Source: ABdhPJye7l/NC4J8jsBBtlk8/qsWg/kaUBolQP86irPk7sRZSsSK8GzaXihW+sTLjzgiuhc6bZvpvyCUZwst58Gqils=
X-Received: by 2002:a50:9b06:: with SMTP id o6mr26331985edi.284.1633442265649;
 Tue, 05 Oct 2021 06:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211005141012.31e20a26@canb.auug.org.au>
In-Reply-To: <20211005141012.31e20a26@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 5 Oct 2021 09:57:34 -0400
Message-ID: <CAHC9VhRBviwB_AcLASUeXjZtnEKB7RSOuNBFWeVbjcr_JeSCXQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the selinux tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 4, 2021 at 11:10 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the selinux tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> fs/io_uring.c: In function 'io_init_req':
> fs/io_uring.c:7069:3: error: 'ret' undeclared (first use in this function); did you mean 'req'?
>  7069 |   ret = security_uring_override_creds(req->creds);
>       |   ^~~
>       |   req
> fs/io_uring.c:7069:3: note: each undeclared identifier is reported only once for each function it appears in
>
> Caused by commit
>
>   cdc1404a4046 ("lsm,io_uring: add LSM hooks to io_uring")
>
> interacting with commit
>
>   1e1e4658e108 ("io_uring: init opcode in io_init_req()")
>
> from the block tree.

Thanks Stephen, your fix looks sane to me.

> I have applied the following merge fix patch:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 5 Oct 2021 14:01:10 +1100
> Subject: [PATCH] fixup for "io_uring: init opcode in io_init_req()"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/io_uring.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index 9a3c3198ff90..c36ae439e64f 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -7062,6 +7062,8 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
>
>         personality = READ_ONCE(sqe->personality);
>         if (personality) {
> +               int ret;
> +
>                 req->creds = xa_load(&ctx->personalities, personality);
>                 if (!req->creds)
>                         return -EINVAL;

-- 
paul moore
www.paul-moore.com
