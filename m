Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD9433FCD2
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 02:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhCRBuE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 21:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhCRBtm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 21:49:42 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3A6C06174A
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 18:49:41 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s17so5564656ljc.5
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 18:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4xHmq2XoV/s1xEpGRgQqZUn6nwBJwQqPjdRmhDS6YEU=;
        b=fnHp91LtiDnoR2885o7D4gbA2sNsp4eRo+TdhccAdypYtx1V4uvKugJDuvuEGWXKtg
         uaiGeCrFH83CkSKSJNOK3ZdvVXaA0JFbNDp/3rLOf+QAFU/Cph3ZbbHfWndOkpqUb3nq
         ebKJ2HhvP8It6GQj5+GdzAIDhSJ3b8EQULEuvhc7XL6oxWdCWPBH5tz38eOsybIZJgX4
         ldJEgqzQ+fefXiZ4Q2gpSTLWtfyq/LkIA4Gf51CSnCqZ5T7EtNCT+ZVBICI+YmXE6VnN
         a8lZvq5sI8wR7KUOV5zG4Hqf+myj0XbTTbPxs+zQEU0fz+9sKU+x1JTOQc6A0tCEJ3sI
         5KBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4xHmq2XoV/s1xEpGRgQqZUn6nwBJwQqPjdRmhDS6YEU=;
        b=tD9W5fU8CNa3SbBFDavd7liwzA0EW9zfavJGNukLV9MsriPo/bxfAxY3EpeZ9wzmfR
         pIPQntLxZShHA/b3M2JYYAhfkP344hsMx/6tUrtwwu6ll5Q4YSAbMTGmnkmhOF3+fbZN
         mmcT3ILamOCNsmayagLmK2R3wepxdzydvsjsTpG40FTJkHntZn2B5Cu5uFo+Pj0fU6ev
         uPIM+vv4DPp9GNTk3Jjxz4J8kI+Aabl8lf4O2BrKhOSmwxBDx/Eyw1fZo3F+kTwD819A
         /G1tWtXl64n8rD6htzYAudYUxTp8NH7tTpyqR2Vt53uG/hu0iz2veRPKOoJQ0waPA3AA
         Mz5w==
X-Gm-Message-State: AOAM532b5SOl5NuvGHXqRVZmkPexImESiMaabR/cPgA7hh9ssMWHtmJz
        hjUfJ0sF8tm1PPNBtnqNnBzLocFvHhpcs4sIHsSghw==
X-Google-Smtp-Source: ABdhPJwtftCCbIbCpnVReoVkpBk43koVkbcrQQuH3ZjchcpdKjpdEulN08SLg/DuzhxBRN1Yct0PmJfv3CfguBFllKI=
X-Received: by 2002:a2e:7d03:: with SMTP id y3mr4025907ljc.0.1616032180098;
 Wed, 17 Mar 2021 18:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <YFEeWD7LMPYngtbA@osiris> <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
 <YFFRcPUtddlIB21l@osiris> <CALvZod5k5wgE-d=U=thhQp5bwQ6t0ugKDtZj75qSSYVB27uCuQ@mail.gmail.com>
 <YFIfjPzLzeJKs3hE@osiris> <CALvZod6GxjppjNuX5BQD+2WwWsdOcDqbKmCy6XGJyBsT_p2SxA@mail.gmail.com>
 <YFJqJeMDc/JCjfSv@osiris> <YFJwZoUalBM/lBBr@osiris> <CALvZod6EEyqyQD_AvcyTfxj+f0M+X1D1b50HWdaqL1qX69iaMQ@mail.gmail.com>
 <CALvZod5QjGy+WDOX=2mLB4ZgaRLk4kSu3y8ge+YqfHDacF2kKQ@mail.gmail.com> <YFKtTWk3eAsyqssD@google.com>
In-Reply-To: <YFKtTWk3eAsyqssD@google.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 17 Mar 2021 18:49:27 -0700
Message-ID: <CALvZod7ggc=98wJauDmB=05+9MnLo0_ppeTHfZrxj5idNsD1iA@mail.gmail.com>
Subject: Re: [BUG -next] "memcg: charge before adding to swapcache on swapin" broken
To:     Minchan Kim <minchan@kernel.org>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Hugh Dickins <hughd@google.com>,
        Juergen Christ <jchrist@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 6:31 PM Minchan Kim <minchan@kernel.org> wrote:
>
[...]
> >
> > The simplest solution I can think of is to do set_page_private(page,
> > entry.val) before swap_readpage(page, true) and set_page_private(page,
> > 0) after.
>
> Since I did't read the bug in detail, I couldn't come up with how the
> missing reset is connected the problem while missing set_page_private
> with entry.val is clear.

This particular bug is about missing set_page_private(page,
entry.val). I was wondering if we should always reset page->private or
just leave it as is? I think it is safer to reset.
