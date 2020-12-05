Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD1E2CFCC2
	for <lists+linux-next@lfdr.de>; Sat,  5 Dec 2020 19:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbgLESTV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 5 Dec 2020 13:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbgLESDd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 5 Dec 2020 13:03:33 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E52EC09424E
        for <linux-next@vger.kernel.org>; Sat,  5 Dec 2020 09:09:26 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id e7so5990ljg.10
        for <linux-next@vger.kernel.org>; Sat, 05 Dec 2020 09:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/nONXOe+JWtgC2NEmkR8xcycTkJWCy3WRXYAibxk+2U=;
        b=yAzk/g0i/6/Y6AzhoKNkjYDk3qK4szrD6DsIQ4UoHDW1oA3d0TSHuu5PWZvw7Zsmlv
         1dnq22xAK7TqogoAxD6fqNwYqONi097hVb9LoEARvuMt/0Hdoe+Et+w/PaHRsDWLYjyq
         2HFuCynV7L5JahwqLLzju7RNQlxDwk+5z3oRFxN6EBtFtiid9xL2u27p45hrERqs8QJH
         C9NE1OMzdCnWWRlY75T8FanAYscof8A/ico/yDns8su9phtpAPbixulYBvCbbTEEde1q
         exfqh89UjkxEKfyw/cBlueCkcqxz1w1Np9sYMUzD7DNfFRUsHisFsxBQ9otWK3rjZQZk
         UzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/nONXOe+JWtgC2NEmkR8xcycTkJWCy3WRXYAibxk+2U=;
        b=M42XXrVqqL5Gv66JXFX/S4xAc/75QAmACc6oOYE50o4pzH0JE5yNZowbDcfXGIdVl4
         Z7VoS5SqtwqZSdxAFS9L8Lu2zzJciwQW4eb9yKAdg80oXZrwUdxyC/7UwcplTyfv/zS0
         KAZdhzYA40Wcx71v2318l4xIpbCWA5TiGyRZ7ePBvjUCpcTXINTWdB9XcIvRMqX4nJll
         Q1dhYzHAlDzLp/wuOlA+tAEbjI0CLHek0+fgZfz0Y1U+e7zB7VfWP1H013vcPr7FWTIl
         rHJ+v5oPVGJDPuGMCnhBHIPvtTsxF08fdPj7O7IG7m3bKme7u3EXx1xOagJjx7HG2Lwf
         cJWg==
X-Gm-Message-State: AOAM532BTyeqa/+5aWttvr+jRu+0ZIL3zgwKYppqhUtx4kxyHGIbqzje
        UCsAuTSqyrYIKvzG3P6Aj6rwOUiqJwpbtLrsiekN6g==
X-Google-Smtp-Source: ABdhPJxoqecW7LxgD0r1nAG22AfBGr3ZG5mFYrc/nZRyjVvcls3d0uOXjvm1Adw1hkBjXMOIspeSVTJhjTpxwyiPGp8=
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr5724965ljo.388.1607188164947;
 Sat, 05 Dec 2020 09:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20201203152311.5272-1-carver4lio@163.com> <a5bc444ec40a2248009d0894fda61b822d030235.camel@redhat.com>
 <CGME20201204160751eucas1p13cc7aad8c68dd2a495c4bbf422c4228c@eucas1p1.samsung.com>
 <adc36428-05eb-f885-9394-080cc805818f@samsung.com> <3d709122-0364-5bca-9247-3f212096b389@nvidia.com>
In-Reply-To: <3d709122-0364-5bca-9247-3f212096b389@nvidia.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Sat, 5 Dec 2020 18:09:14 +0100
Message-ID: <CADYN=9+nE=n4cXb6gDKmQqfkn97HoFShKGSpqVise=XR-aGtVw@mail.gmail.com>
Subject: Re: [PATCH] mm/memblock:use a more appropriate order calculation when
 free memblock pages
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Qian Cai <qcai@redhat.com>, carver4lio@163.com,
        rppt@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hailong Liu <liu.hailong6@zte.com.cn>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 4 Dec 2020 at 18:44, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 04/12/2020 16:07, Marek Szyprowski wrote:
> > Hi All,
> >
> > On 04.12.2020 14:42, Qian Cai wrote:
> >> On Thu, 2020-12-03 at 23:23 +0800, carver4lio@163.com wrote:
> >>> From: Hailong Liu <liu.hailong6@zte.com.cn>
> >>>
> >>> When system in the booting stage, pages span from [start, end] of a memblock
> >>> are freed to buddy in a order as large as possible (less than MAX_ORDER) at
> >>> first, then decrease gradually to a proper order(less than end) in a loop.
> >>>
> >>> However, *min(MAX_ORDER - 1UL, __ffs(start))* can not get the largest order
> >>> in some cases.
> >>> Instead, *__ffs(end - start)* may be more appropriate and meaningful.
> >>>
> >>> Signed-off-by: Hailong Liu <liu.hailong6@zte.com.cn>
> >> Reverting this commit on the top of today's linux-next fixed boot crashes on
> >> multiple NUMA systems.
> >
> > I confirm. Reverting commit 4df001639c84 ("mm/memblock: use a more
> > appropriate order calculation when free memblock pages") on top of linux
> > next-20201204 fixed booting of my ARM32bit test systems.
>
>
> FWIW, I also confirm that this is causing several 32-bit Tegra platforms
> to crash on boot and reverting this fixes the problem.

I had the same experience on an arm64 system.

Cheers,
Anders
