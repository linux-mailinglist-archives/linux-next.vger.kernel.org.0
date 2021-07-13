Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DED3C7804
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 22:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234615AbhGMUeM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 16:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234290AbhGMUeM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jul 2021 16:34:12 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551A6C0613DD;
        Tue, 13 Jul 2021 13:31:22 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id v26so818102iom.11;
        Tue, 13 Jul 2021 13:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dthJABq14401wfZu30EsPGHamYnlqbuoV6Iata5cQNw=;
        b=vBq58YTMaFW2PR++f3nK8GvsfSfDBgTtxE4zPaElGZ3Ry46vId22sm9IzsGAbitrwz
         vYpHs5uE7kTu+SGk9KNDgdLb0j4ftaAYAaF170vm4U316oY+vPqJRhlXGU9nPbBLWUyl
         urZxBs/3LmRguxAtIEm9Msm3sARWOgv+8/iTaoCnKXlaS1d6DNbGAUkq6608d+KEyMNb
         Rs7LOAHgHwFv2LGgmNWcv5zdfCZWz9DtJrW7A9uCci+Msj8pi678ZT0yMgQoXtIwJjDs
         O6mayPz1ifaMIP3XUaIilWppx5/St7/76pdppXuxML/oVo5gta0Fb62M1+aAlfSRKJ48
         avhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dthJABq14401wfZu30EsPGHamYnlqbuoV6Iata5cQNw=;
        b=VhR/NnoEStu9yRr8xNLRlITqPuiBF/XNeA5k7cXsNuTqTUx3cj+A+D16J3GFeV1XUP
         X7Pe6OZdotTJTS8mCl8YM0gW8ITlgEA8k/2O2Z+L+lzj8woMJu5+T6cUkrR9G0BxvBnk
         WghPLGNt4918ovgBrwM6OEval7Jr4lHQT89T8G3BlAHmcp80HTNXg5MEfRkD7M3JmyOa
         37rAVo80sl+99qKioUz81f+KADRy4Us4qqEqS3EdN/8e8Fajn2tGKXYeSD6NkJ8Sh3zx
         xyI0LyLNwoIqASL6QGKqnObuJ4p89Q4IPEqmzIUdMrM/x7Rlwa4PlauafMqg3XdGLj4V
         gWdg==
X-Gm-Message-State: AOAM533HBX80c25A0q1/YnT+WZDc8HLdbUSneZPQX3vH9i19UH+pwE9m
        7R/HSXD8W87StmMyyIBxwV/Jq/K3ZlUl9J56izKp+YalSo0=
X-Google-Smtp-Source: ABdhPJzHe8+KdMhwAE18paRRebXD1SvPSBLF/ebCClt93Vtn+mrelOFTX0gn9CAJD27/ZnGx1y2SjE/vPmqOrwlLHXA=
X-Received: by 2002:a5e:d512:: with SMTP id e18mr4555394iom.149.1626208281804;
 Tue, 13 Jul 2021 13:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210712120828.5c480cdc@canb.auug.org.au> <c47a7f0b-4b5a-30c3-ee1e-2973793a9534@infradead.org>
 <20210713111029.77bfb9bb@elm.ozlabs.ibm.com> <56341950-abd6-8a9c-42ca-7eb91c55cc90@infradead.org>
 <8ed74a96-7309-3370-4b8b-376bface7cc6@infradead.org> <47f394e5-c319-3b79-92ad-d33b0d96993e@infradead.org>
 <CANiq72mDL+CA9CnhDG5Sij4ufVzGHrWvZ9eaWSSXQMDYbpL-6w@mail.gmail.com> <c8349e27-4941-e639-9a26-b665b2fa6a68@infradead.org>
In-Reply-To: <c8349e27-4941-e639-9a26-b665b2fa6a68@infradead.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 13 Jul 2021 22:31:10 +0200
Message-ID: <CANiq72kHCwbBU5cebPaj32dOb9DspB_fLhw3tALcw2ssxjkCdA@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 12 (no Rust)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 13, 2021 at 10:20 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> It was either a script bug (but I haven't seen this one before)
> or a user error (more likely).
> My daily linux-next builds are started by a cron job but the don't
> always start when they should (IMO), so I may have started it
> manually... but then the error that I saw would have only happened
> if 2 linux-next builds were started at almost the same time (one
> by cron, one manually by me) - I don't know if that happened or not.
>
> Today's linux-next builds didn't have any similar problem and I doubt
> that I can reconstruct what happened exactly.

I see -- it should be unlikely that someone else sees it then.

Thanks!

Cheers,
Miguel
