Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3696F125ED8
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 11:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfLSKZX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 05:25:23 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34851 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbfLSKZX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Dec 2019 05:25:23 -0500
Received: by mail-ot1-f68.google.com with SMTP id k16so2064351otb.2;
        Thu, 19 Dec 2019 02:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qXY/bekMxM74rBpabc0IortWdwZ5JIbPWlc66tqqZzg=;
        b=FIAqo9lY19UD6opTdjw4fQ0qX+bhIhny2agEy6XvVcN7jWMG9AYO1U2hZcQMNQuriv
         8n72zFSozAJPVnVUuAXLMbKEbiAXS3z22RcOAar37wU2VtUnaW6HiRF/2uhon9Ye54Ue
         vI7vC2YJcNsLykdA38iWjGxgYoLGMRTociTfqxiHa1otuRWLcCyZJORiaj/mxHdUTp2G
         +94HQywKG+FTW+49QnrMzTZQjy2Plw9sPAjcT7G2KOQ2U9zTQ8GgfytQIiBx9ZgPlWex
         wvbBnkvTxiiwfpUKWrK8r586+BpDZj64teYyPNKoBeV68JZMGYpsXJV+Gj/WhPBz2yIT
         wdnw==
X-Gm-Message-State: APjAAAVqrHsLVd/UX7B4OyiIeli9gpuAzbsgSq1aKGKI4KWKnQuEaV6x
        TTy2vt2W45r6VgBPEHfyHsYOUYpFyVQAIDFJFwg=
X-Google-Smtp-Source: APXvYqyYLv7usVsn93H5qh2dCkD0JPqTwk1wDn60NmEe2dX2BaCHIZn8ydrShg0SGD5KCWpvEC03FH33JtVmWwwkDh0=
X-Received: by 2002:a05:6830:2141:: with SMTP id r1mr7956333otd.39.1576751122361;
 Thu, 19 Dec 2019 02:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20191216062806.112361-1-yuchao0@huawei.com>
In-Reply-To: <20191216062806.112361-1-yuchao0@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Dec 2019 11:25:11 +0100
Message-ID: <CAMuHMdUDURUQJjJU+2QQgY1hXN8ndJ6dwc-PF1CWc-HAio0sKA@mail.gmail.com>
Subject: Re: [RFC PATCH v5] f2fs: support data compression
To:     Chao Yu <yuchao0@huawei.com>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chao Yu <chao@kernel.org>,
        Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Mon, Dec 16, 2019 at 7:29 AM Chao Yu <yuchao0@huawei.com> wrote:
>
> This patch tries to support compression in f2fs.



> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c

> @@ -667,6 +719,24 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
>         return err;
>  }
>
> +int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
> +{
> +       u64 free_from = from;
> +
> +       /*
> +        * for compressed file, only support cluster size
> +        * aligned truncation.
> +        */
> +       if (f2fs_compressed_file(inode)) {
> +               size_t cluster_size = PAGE_SIZE <<
> +                                       F2FS_I(inode)->i_log_cluster_size;
> +
> +               free_from = roundup(from, cluster_size);

This is a 64-by-32 or 64-by-64 division, causing a link failure on
32-bit platforms:

    fs/f2fs/file.o: In function `f2fs_truncate_blocks':
    file.c:(.text+0x1db4): undefined reference to `__udivdi3'

Please use DIV_ROUND_UP_ULL() instead.

Reported-by: <noreply@ellerman.id.au>

> +       }
> +
> +       return do_truncate_blocks(inode, free_from, lock);
> +}


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
