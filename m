Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 308F034D407
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 17:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhC2PgR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 11:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbhC2Pf5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 11:35:57 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B81C061756
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 08:35:57 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so6120948pjb.0
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 08:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fx+rvtB644CNXiO/TUepH6reSL0YwAJ6JLaNdbj/zqw=;
        b=cStsAmX+CX7QfYY/KS6OnFxrlo2nfPeUwg6CbUvhQohZQgsy1+uSmf9N0jRadpK1yc
         MbR5i2te9cFq5CevUInBlFqTmpqOiNiqBJz3G518yt6dHUO/EBxEJa+umll5oZvu2ty5
         dD+I0S8qknryLb8iN8nnURLOFlgi7b4bddooPIRAX2WiaCKmva3J2DuTSgmwOYkPjpP/
         gjcaa2Mzve5BVOXj1HIbTvNB82qsOkht69ii+pat0V8ZzgxHiKwVjzbeK9TmmU/NUvvI
         z5LKeS39lgkcFMBl7BWKtHcNIexVnEdh5t4Bid3rbNQ5qPkVBgqS0j3SQTG9kbL0MnJw
         C7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fx+rvtB644CNXiO/TUepH6reSL0YwAJ6JLaNdbj/zqw=;
        b=kSOzxez4sT8hAG5mPcNE7jXvY9FXigKkEj0pJQVyrgB2vskLLPjdvcyA7PwbyuoW8s
         tbvXaWRwsfxzmk/9TvQN5MVdFq4ah1mU7JwRdFNlBweNi7MaWJN1pAK1M/FrfTbSN+/J
         0+uUyZ7m1KS/j/HpvM/2XF7xWZhIDvMcN0XSBXWS9O4ncStVe29sQ4LTeWngjMbL/YAN
         Kc2wFpdAAX9LCrmdAg0H/hTDhyNmTDp+hqyFTQBV5YXSwd5awMeVAJQUBqBJ9vZcwoUC
         tvR6B+Td/5AqKnqhu4Zs0jlqck8oh9ITlxcQm0eHT7vp4Y4V6q2uxYiDDyCsImhdzAFs
         xiZA==
X-Gm-Message-State: AOAM5301TLwtamYc/EjitkKCRcWVbXXmKmYpwFkX+UTBkY6X1v4CaCL9
        EyvtgDc0SGU+eS1VOcZTOfFN0M3+1h+Jnyh4zKjv5A==
X-Google-Smtp-Source: ABdhPJwq/8+p3NQEz0kNU6ag4EEvC72RBQlT9kJNJWT4uT6gkgdj12pJdnQw3k9i2ztRvrsw0wCmM1en+r6DHFZBvLw=
X-Received: by 2002:a17:902:bb83:b029:e5:dacc:9035 with SMTP id
 m3-20020a170902bb83b02900e5dacc9035mr28859471pls.80.1617032156468; Mon, 29
 Mar 2021 08:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210329082416.40b7f449@canb.auug.org.au> <CAC0gqY5+tcmNOoRrjiNMsffWbrQEF_pwjvne-oP+sGbr+84suA@mail.gmail.com>
 <CADnq5_PXCSDmU7YKQVawZSk10RjCBT-XoxPYNGt78x1ShbiXOA@mail.gmail.com>
In-Reply-To: <CADnq5_PXCSDmU7YKQVawZSk10RjCBT-XoxPYNGt78x1ShbiXOA@mail.gmail.com>
From:   Mark Yacoub <markyacoub@google.com>
Date:   Mon, 29 Mar 2021 11:35:42 -0400
Message-ID: <CAC0gqY6r1dXtWtftfWWn3L3vdSHs2P67pWc9epRhr_K-6FqMLg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the amdgpu tree
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Awesome, thank you so much Alex!

On Mon, Mar 29, 2021 at 11:35 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi Mark.  I've fixed this up in my tree.
>
> Alex
>
> On Mon, Mar 29, 2021 at 10:18 AM Mark Yacoub <markyacoub@google.com> wrote:
> >
> > oh this sucks. I'll look into my config and fix it. Thanks Stephen for
> > bringing it to my attention!
> >
> > On Sun, Mar 28, 2021 at 5:24 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > Commit
> > >
> > >   0ea5088407fa ("drm/amdgpu: Ensure that the modifier requested is supported by plane.")
> > >
> > > is missing a Signed-off-by from its author.
> > >
> > > The author is "Mark Yacoub <markyacoub@google.com>", but the SOB is
> > > "default avatarMark Yacoub <markyacoub@chromium.org>" :-(
> > >
> > > --
> > > Cheers,
> > > Stephen Rothwell
