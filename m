Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFD9459E4D
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 09:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbhKWIl5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 03:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232342AbhKWIl5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 03:41:57 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D454C061714
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 00:38:49 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id v203so21041575ybe.6
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 00:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QliRewW/xUKx8q8NYHCguahL+AEt3TBjuY3bKvkKbpQ=;
        b=ZQ9b2eHMFQDgK41emqRI6N5O/AFP1lTCasMfaGo+EMYABTKax9QsnRReKiH60dW4bd
         CXeE3QnipC1ApGXrmQhYTGvoR6xzChsXSH8FjV5LWXFCjSgKV/UrFdsfjV8nJyRhUR5y
         ASOJ1KOUZGlPVpUHMtUXtHtj1Zi4Yp6O/Tdiw1yywSivMpt+w1OD5J3HksoqtmFBcjDi
         KHOp/nG+telX+9IX6fah3UIgzGptc7q1aH9RgnnNDAoq7B8COm1PPEGT53gYHV4K18t1
         Rt0MPvuZsOK3CwqtL7R3JYEuPCA/oh0pi6+7b39mwBnYA/mo0IDHBCGyaocaAxbB+6Lt
         gYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QliRewW/xUKx8q8NYHCguahL+AEt3TBjuY3bKvkKbpQ=;
        b=ZtWvkp+PnfG/CuxauQdZvK7xPpO6A4eoMYrNSuHHsSRHavMpRDs4LYSzo9HqPRKSJr
         ffUXp1O47MRPY9xZQPVNhNdfn5c3Xn1jTmvZXStGCUFLkhdZLE2WHRd1IF+Lsr378hfi
         7RQNNnntqcLgvKlVRwp5kzTjDEeiXgh0+SwsTqteg9eOHLUDDqAUSKGTO7JnqveRAyGU
         xcdPXUtaNZ5gvnFPIg5pQtLi3jaPB0BCGKffMYdepSqT57BoSDsOFex8PyxUzpys9Sxf
         IMXAA4MO94I7df8eQOw0V81X2hhXhWky9qi6XRcYLUj3gkxutUQNqoAfUIV3YN0rjFDO
         CYqA==
X-Gm-Message-State: AOAM530jej9WJKVJxCVt8jnVbAUhHEChOgG8DDQVq/F/hFJPZpfnWblL
        EdsKefkCzPWPm0dG09Ev7TdlmM5VFddRdKXb78rundHiDRU=
X-Google-Smtp-Source: ABdhPJyDoBPnD5oQMq6R/ozs0jYp3jVIzvDdjZ/7lohgE6Ze+N42XxAO3/jqChNxtUW33g7rO31fcESAK+QOZxdGRO8=
X-Received: by 2002:a25:6645:: with SMTP id z5mr4411973ybm.127.1637656728598;
 Tue, 23 Nov 2021 00:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20211123162635.29c8bccb@canb.auug.org.au>
In-Reply-To: <20211123162635.29c8bccb@canb.auug.org.au>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 23 Nov 2021 00:38:37 -0800
Message-ID: <CAJuCfpEvDOsNGcN9cqStx3PpoG_pJgQevvc+V6gcRrCUBa0YWA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 22, 2021 at 9:26 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the akpm-current tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/filesystems/proc.rst:429: WARNING: Malformed table.
> No bottom table border found.
>
> =======                    ====================================
> [heap]                     the heap of the program
> [stack]                    the stack of the main process
> [vdso]                     the "virtual dynamic shared object",
>                            the kernel system call handler
> Documentation/filesystems/proc.rst:434: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/filesystems/proc.rst:436: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/filesystems/proc.rst:436: WARNING: Malformed table.
> No bottom table border found.
>
> =======                    ====================================
>
> or if empty, the mapping is anonymous.
>
> Introduced by commit
>
>   2df148be9486 ("mm: add a field to store names for private anonymous memory")

Thank you for reporting! I'll try to fix it first thing in the morning.
Thanks,
Suren.

>
> --
> Cheers,
> Stephen Rothwell
