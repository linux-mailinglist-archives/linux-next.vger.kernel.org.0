Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA78403197
	for <lists+linux-next@lfdr.de>; Wed,  8 Sep 2021 01:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240383AbhIGXjc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Sep 2021 19:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbhIGXjc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Sep 2021 19:39:32 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7922AC061575;
        Tue,  7 Sep 2021 16:38:25 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id s16so384809ilo.9;
        Tue, 07 Sep 2021 16:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ngg6dzm/xaSlNMXBR3+z69CTc3WtKFGH91DJiUi/mg=;
        b=V9U9j5bPnERCnWdqp8tDoSnG9MIsEGYerL7u8Mth2zCvPKQT5bzYBbofc7llF0Tef4
         CEwxNRV+7wUF+0CcGEyd6CJXVYC5qWkv3LYxRXi7yc6ws3hYPlyoAoo4Xr61MIUC+MEL
         zT0gjy+WhG6qR2tuL095Fc0y6iQ37FLrcDkTC7kpcemyWIpV1tnVozKjY9ADFcai3hmo
         7Q70Cx4amX24woB+IN6MazR88kxNy2w4aaNeA2I1kh8HINhKbknaAFxYbLCw6TNi0AXc
         MJzWjMwEuR/sVkqTu/6mmfP6+6JlXEwP5TpuObShR3FEPZA2fzq7E9BfZudLNCrOBOCH
         bQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ngg6dzm/xaSlNMXBR3+z69CTc3WtKFGH91DJiUi/mg=;
        b=IJR7IX3gGxdL4WUpXetOYNGGHt6pR4OHI48K0GJagAKm17BrX/lh3Rux/1LhQ3BNt3
         ZIBjv3t3BtWcDrd5EfuHqQJ1OIhu9aPidknReHO+WKbMpxiLLd16czkQy0IM7xYmu6vW
         Ug8t1piNaiqTSZBeCH5jyFI7ssIBlbT+FswWBqJivgk5Jd0QrvOB+wNLOYEvxz6wLIi7
         5BpeEwXsZV5OsOqnre1ElXMEVzMsllpUelObbYpZ3ZBxTa0Wu1fk1Zlp2cwOGGEZyiPz
         P9s5Q1e5Adzr/pV44qJMbbszd5dUM4k4Ib+jk+EIR4fo+gN+nqODIfF5dFL6kQBQkpud
         fGGw==
X-Gm-Message-State: AOAM532H7wMBAwaZEwnsbdepE6Pu3p1zEl14B+FfqEvtAQRWCKQu/61f
        WKqlO1IOqR0dkjiY2rYn0eXpyRAdqjsIMvqAoxU=
X-Google-Smtp-Source: ABdhPJyzP1FPyXZNRZOkHDTdc/TF23AZFOuwN1VBBvrxum50utvtnb9jGTIKBGxhn+420io026HJwuX6f3oc1ycB5HU=
X-Received: by 2002:a05:6e02:d0b:: with SMTP id g11mr518489ilj.321.1631057904927;
 Tue, 07 Sep 2021 16:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210908090720.0748b861@canb.auug.org.au> <20210908090907.74edb3a4@canb.auug.org.au>
 <CANpmjNMTUuMuEf_BsCROR6JS5q6GCyG163yaX710uctqvYXz5w@mail.gmail.com>
In-Reply-To: <CANpmjNMTUuMuEf_BsCROR6JS5q6GCyG163yaX710uctqvYXz5w@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 8 Sep 2021 01:38:13 +0200
Message-ID: <CANiq72mNeUcj1F9aPbzfeb5Z4ux7qJ4b+qPGwk1a0wkhGQe02A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To:     Marco Elver <elver@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 8, 2021 at 1:17 AM Marco Elver <elver@google.com> wrote:
>
> I see this in next-20210907: "Compiler Attributes: fix
> __has_attribute(__no_sanitize_coverage__) for GCC 4"
> Which does the same fix.
>
> Not sure what happened to it.
>
> I would have also expected this to be merged as a fix into mainline by
> now? Miguel?

Yes, sorry, I have some things in my queues -- I will send them in a few hours.

Cheers,
Miguel
