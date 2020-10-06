Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB10A284490
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 06:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgJFESl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 00:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgJFESi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 00:18:38 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05708C0613CE
        for <linux-next@vger.kernel.org>; Mon,  5 Oct 2020 21:18:36 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t18so585051plo.1
        for <linux-next@vger.kernel.org>; Mon, 05 Oct 2020 21:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WcoaRr39n3pJ3sesrCDq8ky5x8Qln0X+2e7YbCVQ4pU=;
        b=nsRLTz7VjwM0NuyZMyQDjOnbBBVnYbZxMdoaHHlw7HG2FTwnokTccs4Rf1Grupmb0z
         owX3wtIxJCXzY768ohg5XAd5M3WTYk2buQ3sZ6PcJO+A9xrDNJU5ybmZS9gQR6r+yJ5C
         9PxumrNW1jmPqNCXL8rz62k0Wiyrf0I7pHQBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WcoaRr39n3pJ3sesrCDq8ky5x8Qln0X+2e7YbCVQ4pU=;
        b=bCb23IG2x19DEfZZBBnwRWvXrdscrfilYkm2RXBU1UhSWuKJEBijSTo9FyhevNDguh
         opQa2ffb4Fm3bo3ZvgGDnjX0rCgeYlM2vvIh2yiqvwNtxaKfknoNjrvHiLx2BdDj/U/r
         IMSF0bfHRPB9l4J+HEZhh+nnlUs4fuc+toQ/eygsQth35iLbaPV304GBcM4JMSyNxofH
         /kGSl9sklyqWuwKF/Qzh6hqmVTaBuUDljVD5n5r9d+L4zaM7BxC9TExeiX+icSXJfuOQ
         zLo0SvQdEMR2Us/gfyHOdBKR1Dv2PFm2i47rg9Jxu93Ypp2PBqJZUVHUM7d/J5BVlyE0
         yQzA==
X-Gm-Message-State: AOAM532vsDR3Yo0lElR4b0qX5AclqWZA+CjwYaBA57iiMUvBW+/QLBpi
        jgVMbVcXjy/IS00mxsISkPhEiFRlbbw1yJr7gb/yYg==
X-Google-Smtp-Source: ABdhPJxicw6MQR7cluHUrvRs30Bprxs3MLmOY9NsL7Zxm8PzCKU233r0WZtTzaxg2zkmtvGZylOAlsYCzhxqviSx93E=
X-Received: by 2002:a17:902:8693:b029:d3:9c6b:ca5f with SMTP id
 g19-20020a1709028693b02900d39c6bca5fmr1551836plo.67.1601957916321; Mon, 05
 Oct 2020 21:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201005225004.0d3b59a1@canb.auug.org.au> <CAATdQgB6aN8-BXwTG7=u8c+Q7mPmU+A9=O=_7u_wbPkuVNhjvA@mail.gmail.com>
In-Reply-To: <CAATdQgB6aN8-BXwTG7=u8c+Q7mPmU+A9=O=_7u_wbPkuVNhjvA@mail.gmail.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 6 Oct 2020 12:18:25 +0800
Message-ID: <CAATdQgAjk2fjtk+yprpeftihwJpKrNUWpQaB00R9vzFLc_30Tg@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the battery tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 6, 2020 at 11:57 AM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> On Mon, Oct 5, 2020 at 7:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > In commit
> >
> >   f9d293364b45 ("power: supply: sbs-battery: keep error code when get_property() fails")
> >
> > Fixes tag
> >
> >   Fixes: c4f382930145 (power: supply: sbs-battery: don't assume i2c errors as battery disconnect)
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Maybe you meant
> >
> > Fixes: 395a7251dc2b ("power: supply: sbs-battery: don't assume i2c errors as battery disconnect")
> >
>
> Yes, you're right. I guess I made a mistake here.
> I'll send a v2 patch.

Oh I'm sorry, it's from linux-next!

I found d6e24aa0bf15 ("power: supply: sbs-battery: keep error code
when get_property() fails") on sre/for-next branch
with a valid Fixes tag:

    power: supply: sbs-battery: keep error code when get_property() fails

    Commit c4f382930145 (power: supply: sbs-battery: don't assume
    i2c errors as battery disconnect) overwrites the original error code
    returned from internal functions. On such a sporadic i2c error,
    a user will get a wrong value without errors.

    Fixes: 395a7251dc2b (power: supply: sbs-battery: don't assume i2c
errors as battery disconnect)

    Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
    Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

but there is still a wrong sha-1 hash in the commit message,
Sebastian, can you please amend the commit message before merge?


>
> Thank you!
>
> > --
> > Cheers,
> > Stephen Rothwell
