Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EE93A048F
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 21:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235795AbhFHTkC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 15:40:02 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:35579 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235189AbhFHTjB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 15:39:01 -0400
Received: by mail-lf1-f47.google.com with SMTP id i10so33933436lfj.2
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 12:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QVlrY2mhKxC/NqS9/Jgj+peIC+wltZhAx3jVIe1qbeo=;
        b=VFdbAHFakOja0A8oAbgaofdHIS79B14OXRjhv6md5YsCbxA251/ucSv5gkkrszRaHS
         Us+i/eQH+JVQKgXQ973PiLzLQFqcT8pyKKpimuHdzLSMOafJyTRTR6aNfo9zwaRDPhXF
         lxjZHmS8NWyy87bY8RXtcfQMagMwyz1Gjrtws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QVlrY2mhKxC/NqS9/Jgj+peIC+wltZhAx3jVIe1qbeo=;
        b=JwdsMScIZ5EXUFpvzUKYKZbBR3Mdgm8UyjWe/wDO55gkvD9dabYzKeUIdY8Eh4kDQO
         uQ7nKodCp09iHJlvmr/c8TGuM53ExN/EnIPwcHJ/FmveJPFQ+dGWLT/Yt38w7s8g4gFd
         QAoC6e1/Zn5ugLcN86cgmTi1mjUDv2CRTs7wC8tlOAY98jJcbMmB9lTWY3r2HyiRfjLe
         Qwb8qlQe/jyn2evTvcR4JKtcB5BndlzGR4JZESGRF+2XYiDnN7eMkLqj3iYTzaDmRy5S
         CnCEWSXoQ34ZAGtsa+ldcC0fBiP3dLVBSow2At+qU8wxHO7j78Np2cLtcDZ1APq3XWMI
         yv1A==
X-Gm-Message-State: AOAM533dZEG3ax2/U76DwQH+ew7PeFdYdI/wCh1vHbwIuxLGpva1U7f1
        30IM4R+Bl/ndinI9VIuPyVqDT4ALtM2Umwrm54U=
X-Google-Smtp-Source: ABdhPJzHFGC8SyAN2XdCqdKd11j5M70BnYHVK04gTAUKqYoFe9u391YnSbAZOpHOO4DJsu3ySZXNoA==
X-Received: by 2002:ac2:4542:: with SMTP id j2mr16194547lfm.435.1623180955592;
        Tue, 08 Jun 2021 12:35:55 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id r195sm67794lff.69.2021.06.08.12.35.54
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 12:35:55 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id f11so33776191lfq.4
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 12:35:54 -0700 (PDT)
X-Received: by 2002:ac2:43b9:: with SMTP id t25mr16536970lfl.253.1623180950443;
 Tue, 08 Jun 2021 12:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <202106081105.B3E3DAE44@keescook>
In-Reply-To: <202106081105.B3E3DAE44@keescook>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 8 Jun 2021 12:35:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wihqdYzXc4kd8CZAD2Kaf5Wy_q3Bz7fVsskG=MFBtw69A@mail.gmail.com>
Message-ID: <CAHk-=wihqdYzXc4kd8CZAD2Kaf5Wy_q3Bz7fVsskG=MFBtw69A@mail.gmail.com>
Subject: Re: Coverity: do_migrate_range(): Error handling issues
To:     coverity-bot <keescook@chromium.org>
Cc:     Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 8, 2021 at 11:05 AM coverity-bot <keescook@chromium.org> wrote:
>
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>
>   Tue Dec 15 12:13:39 2020 -0800
>     013339df116c ("mm/rmap: always do TTU_IGNORE_ACCESS")

Heh. Entirely independent change, but whatever..

That does mean that the suggested

> Fixes: 013339df116c ("mm/rmap: always do TTU_IGNORE_ACCESS")

tag would have been entirely bogus. That commit didn't actually change
the coverity issue in question anyway, it just happened to change that
line in other ways.

Maybe the coverity-bot logic could actually try to see if a coverity
report changes, which it wouldn't have done here.

The report itself is:

> 1421                            if (page_mapped(page))
> vvv     CID 1505146:  Error handling issues  (CHECKED_RETURN)
> vvv     Calling "try_to_unmap" without checking return value (as is done elsewhere 4 out of 5 times).
> 1422                                    try_to_unmap(page, TTU_IGNORE_MLOCK);

Hmm. That "4 out of 5 times" seems misleading. It implies that 80% of
callers check the return value.

But when I actually grep for it, I see 4 call-sites that don't check
the return value, and 5 that do. So it's more like 55% of callers that
do check.

Anyway, this is a false positive. You don't have to check the return
value.  The main example of doing so is the page-out code in
mm/vmscan.c, and it does so just to keep track of success/fail
statistics.

             Linus
