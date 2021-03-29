Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F61634D243
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 16:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhC2OSj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 10:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbhC2OSL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 10:18:11 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F73CC061574
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 07:18:11 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id v23so4458625ple.9
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XkWm2uoX5PGUd0zTaPdRUkrT9tpPWJ/vjLUkOrtu204=;
        b=UA30wCfs5nO+qxQceTlHPRwZMSd8MOIfNshtSoUs7cBBtGOsLJtJ662UUZGduUhTUD
         PAr4/XYr2pRzFmO06086UJ+zaQpL/YHNKVQeSscCUpBXPKffbStpwoHxFYtK6/P7DSEZ
         ZSYkfb+/+VYBx6/7WX+uPwWXJBohiyAWsz6iFXUKyjG33X9LDEbQdV+NbdeLl0Q5cD3N
         q710mocMdyU0q3Umyx8CzkC48QhnOpj3lEVxMyePPGLNFZ/EOMwl8VxhQLWCWRuOKwEA
         lqGLf9A2ZWwUrAnjTn965VZ52V6tZ/TnNmJTTep5zRT0nzzS+HlVJjZQ3j8hHC1b3pd8
         7Mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XkWm2uoX5PGUd0zTaPdRUkrT9tpPWJ/vjLUkOrtu204=;
        b=ILCGaJ74/c2IWn7PM70xS4bMzUkVyptCImCS6M3WRtPymLO1ScDvhOxhBNGa8nx1R+
         M3SoUzei6dDCBRkGC1yf1dUucMrraGuanS6dzIM6AGn7P14rrhfI5Q8ipooe8HSkF4k7
         F0FN0/dwk22xlHAi6Kix8EBRe+pqSr3qFOxj03+pWffifhQP8QUglLk48WvKBqtqP/kR
         IEix8+Dk1zADjjf+TpiRlzjCjozmVas9SGHG3sRtXh3hxNhB3jGGdEc15KESC8iSTWRV
         0LrmPgENG6od9SdpdpEz4NMeRlYTY+MSCE0TBYHfbILk5S59fh4EXIagGYFntcWJWh4o
         Fdvw==
X-Gm-Message-State: AOAM530pvOo1z015Nfzn49n6Z3V6DD43GBKr8EQlilQV6QlfflzfROXr
        5BQnlReR9E7PxGBOAfyMN33/YluSocuxo2VdQNuBjQ==
X-Google-Smtp-Source: ABdhPJwRl43yxX2wogTr17ggEWSJRHuhBCv1opItQmAerLNpbYmDuMsp+DH3dlo7xrZ4+tbHg5yIahu6UX1G5IoPJlA=
X-Received: by 2002:a17:902:7404:b029:e4:503b:f83d with SMTP id
 g4-20020a1709027404b02900e4503bf83dmr28417127pll.35.1617027490669; Mon, 29
 Mar 2021 07:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210329082416.40b7f449@canb.auug.org.au>
In-Reply-To: <20210329082416.40b7f449@canb.auug.org.au>
From:   Mark Yacoub <markyacoub@google.com>
Date:   Mon, 29 Mar 2021 10:17:59 -0400
Message-ID: <CAC0gqY5+tcmNOoRrjiNMsffWbrQEF_pwjvne-oP+sGbr+84suA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

oh this sucks. I'll look into my config and fix it. Thanks Stephen for
bringing it to my attention!

On Sun, Mar 28, 2021 at 5:24 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   0ea5088407fa ("drm/amdgpu: Ensure that the modifier requested is supported by plane.")
>
> is missing a Signed-off-by from its author.
>
> The author is "Mark Yacoub <markyacoub@google.com>", but the SOB is
> "default avatarMark Yacoub <markyacoub@chromium.org>" :-(
>
> --
> Cheers,
> Stephen Rothwell
