Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADF23A0510
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 22:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbhFHUXl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 16:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234258AbhFHUXl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 16:23:41 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362D7C061574
        for <linux-next@vger.kernel.org>; Tue,  8 Jun 2021 13:21:37 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p17so33342835lfc.6
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 13:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6jo+aCIjSu7u3lZZIsn3iC0ko564gcP93FON4pXF6yw=;
        b=Yxp99M5WSxEcPP6Cqyw0L75LS742TGIcraH+EB8Yq7pNdf8VpbnPgkn1lQ1jd3FUtd
         DBMFn1f/0VyaFky0Whe97hcKUAf0yiv4S/lm42HfxwoIP7nBcF6C1M94G+kH5++YRsPZ
         BBeNQ27QQyXjy2Q+k8TG8pt8ZhkZ1if0+SYawXFxAN77rK65PvnMTBaM3KskOqxcmnfi
         EVfK3AvWcqFLOauIVGFm1zFVjD1Ck/27lxiIquXJNVptsQV+Iz1yrhWK20PKxUu05oPw
         5Z1WkcFvTAelWpXVvZFMJMJQwcFQnjYvw8wlecUXHwlJ4SaqyKto0KDLcIoNYwUS1zJe
         cPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6jo+aCIjSu7u3lZZIsn3iC0ko564gcP93FON4pXF6yw=;
        b=MfsZ04yjRE0BYQaDS0hxVNFgU4N9F+sKSNMx33/ami/fVlrFSf5WuToLs12x0z7zIo
         rI+tFcGLPsIGnIfqDipktjN0qDDZE4CyzzRxpzvLYCAkbQtgNvQgWbQ61AXLK9LEYBcU
         xKw0NGnPRBovd7rjU3MWf22oTtenRWYAmHZ2hzf2shvG5WNanRN/BQFR2qghXloozyxn
         6XxLsrxo24az6FquQNKKEqRhKeTJSbDZXBfkN/y1gwETckOkWCezWfoyMwUCeNyGDyxX
         3aZM6lMK4mgODUAvWVTSgCmFawexs0npnaxLHFiYqczkUK2509dpvYj3Ws+V5aEfq7jg
         cOUA==
X-Gm-Message-State: AOAM533c7Mll85NiT/nhqf1JDztJO9/hFy8mCn4EJvGLG9yA3ZPcgklQ
        oUhTI4UaWsP9NbaCC/0NsToYEcLeJlRD7gqB1z+uZg==
X-Google-Smtp-Source: ABdhPJy/R6tU9N1/O8KMipmneeaZmp3jiuDE6mmSnfb4g12tJGQENrJGAxSdaWLyxgC+QJ23E+CFoiAwBq5SJSgiDEY=
X-Received: by 2002:a19:da12:: with SMTP id r18mr16451775lfg.549.1623183695251;
 Tue, 08 Jun 2021 13:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <202106081105.B3E3DAE44@keescook> <CAHk-=wihqdYzXc4kd8CZAD2Kaf5Wy_q3Bz7fVsskG=MFBtw69A@mail.gmail.com>
In-Reply-To: <CAHk-=wihqdYzXc4kd8CZAD2Kaf5Wy_q3Bz7fVsskG=MFBtw69A@mail.gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 8 Jun 2021 13:21:24 -0700
Message-ID: <CALvZod45N2mxfPM1-_T3FCLwRWCbvpt6JGSTNG9TceMZGBkm7w@mail.gmail.com>
Subject: Re: Coverity: do_migrate_range(): Error handling issues
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Yang Shi <shy828301@gmail.com>, Hugh Dickins <hughd@google.com>
Cc:     coverity-bot <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 8, 2021 at 12:35 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
[...]
>
> Anyway, this is a false positive. You don't have to check the return
> value.  The main example of doing so is the page-out code in
> mm/vmscan.c, and it does so just to keep track of success/fail
> statistics.

BTW there is an in-fly patch to make the try_to_umap() void function.

https://lore.kernel.org/lkml/alpine.LSU.2.11.2106031527070.11704@eggly.anvils/
