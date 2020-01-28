Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10C3B14B1A3
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 10:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgA1JRY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jan 2020 04:17:24 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45722 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgA1JRX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jan 2020 04:17:23 -0500
Received: by mail-wr1-f65.google.com with SMTP id a6so494541wrx.12
        for <linux-next@vger.kernel.org>; Tue, 28 Jan 2020 01:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/eguvHwOu0sO1sY9Y2sGUaUw1z+hAiiwi7HS5TszeM0=;
        b=dv17cOT0ZvLsFiZ0yr19WQNg2zQBv0lDkp9UA7o/+y3XapJI+0ZYTgo1dbErZaZkI+
         VrtRoHSf7fPZX9AWCfQzGVqgL9EAuEBlB6i7HvsuqsCnHRWJuNNVzZyRxwgyp2FmPVho
         iFppSCBqiKHitwA6onSMY3z5RpDrNdMnxU15dXUTYM8xvoWUhhwKbjywt+TkbGN0YeMD
         M91dazJWXfRdPk/Q/Gn9y31TrOaoJhmzBFpY/fdbKC9GQCG4ON5AJ7lEP4+lM87TSTnK
         wuL8JxVTOoq0uDzlXO4dfd3FwW07HCMcNZnOdzlJZVYuUb67qj6Ho/HPEiR8FrAWjPkT
         iHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/eguvHwOu0sO1sY9Y2sGUaUw1z+hAiiwi7HS5TszeM0=;
        b=Hck7A7V8QQ0JVBPqWStjzJqaQnsA343Xbk7rmBDMWcJiUcI8blMb13v0iQKaFxlzBy
         9YU9sIMBUWlbMgDgfzNNiqFnl0k3J0R7vk1baGXuqo4A8pSTVD4fLOo1419CeRdEit/o
         t9uOABGfHUFJYpVZGDjtJArNb5Wwq9rYNjruvdMYpXg0K18Kxl3JL6whPt4gcRGCJTcV
         MkxHn4wKCJ3QfhNGVbrkd6MDuOwNVeAaVnWjgJoMyMp4PKXbJ+Jp6xJl4PNDAtI3yL0I
         S+T6P2rZrvz9MR6l31K68c8oPMTgLwlIfUMzoDxVrPhlrKOeGK/VWpzM8KbbW82KwCCi
         4inA==
X-Gm-Message-State: APjAAAXf76e7tD0N2CzDbUaCh1m3wcPV+h3kuYKi3fLjvAVTZYoj4bh1
        nkSfzf6S+apVr/XQHEwgz8qBtwIZfkFwyIC+upCFRQ==
X-Google-Smtp-Source: APXvYqyZYgpjDLF5ghzGbSKFBjB5YpA2p+s3dNc4AhugXoRohektUWFPHnw5CjmXnUhh7MD4cnmybDhoxJETks+GwMU=
X-Received: by 2002:a5d:50cb:: with SMTP id f11mr1884084wrt.252.1580203042186;
 Tue, 28 Jan 2020 01:17:22 -0800 (PST)
MIME-Version: 1.0
References: <CAKv+Gu8ZcO3jRMuMJL_eTmWtuzJ+=qEA9muuN5DpdpikFLwamg@mail.gmail.com>
 <E600649B-A8CA-48D3-AD86-A2BAAE0BCA25@lca.pw> <CACT4Y+a5q1dWrm+PhWH3uQRfLWZ0HOyHA6Er4V3bn9tk85TKYA@mail.gmail.com>
 <CAKv+Gu8ZRjqvQvOJ5JXpAQXyApMQNAFz7cRO9NSjq9u=WnjkTA@mail.gmail.com> <CACT4Y+Z+vYF=6h0+ioMXGX6OHVnAXyHqOQLNFmngT9TqNwAgKA@mail.gmail.com>
In-Reply-To: <CACT4Y+Z+vYF=6h0+ioMXGX6OHVnAXyHqOQLNFmngT9TqNwAgKA@mail.gmail.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Tue, 28 Jan 2020 10:17:11 +0100
Message-ID: <CAKv+Gu8-LxoYNCtwG76UkUkNC_7XrRSfwfRm9=6WdZy=C_buJw@mail.gmail.com>
Subject: Re: mmotm 2020-01-23-21-12 uploaded (efi)
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Qian Cai <cai@lca.pw>, Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Brown <broonie@kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Michal Hocko <mhocko@suse.cz>, mm-commits@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 28 Jan 2020 at 10:08, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Tue, Jan 28, 2020 at 8:33 AM Ard Biesheuvel
> <ard.biesheuvel@linaro.org> wrote:
> > > > > Should be fixed by
> > > > >
> > > > > https://lore.kernel.org/linux-efi/20200121093912.5246-1-ardb@kernel.org/
> > > >
> > > > Cc kasan-devel@
> > > >
> > > > If everyone has to disable KASAN for the whole subdirectories like this, I am worried about we are losing testing coverage fairly quickly. Is there a bug in compiler?
> > >
> > > My understanding is that this is invalid C code in the first place,
> > > no? It just happened to compile with some compilers, some options and
> > > probably only with high optimization level.
> >
> > No, this is not true. The whole point of favoring IS_ENABLED(...) over
> > #ifdef ... has always been that the code remains visible to the
> > compiler, regardless of whether the option is selected or not, but
> > that it gets optimized away entirely. The linker errors prove that
> > there is dead code remaining in the object files, which means we can
> > no longer rely on IS_ENABLED() to work as intended.
>
> I agree that exposing more code to compiler is good, I prefer to do it
> as well. But I don't see how this proves anything wrt this particular
> code being invalid C. Called functions still need to be defined. There
> is no notion of dead code in C. Yes, this highly depends on compiler,
> options, optimization level, etc. Some combinations may work, some
> won't. E.g. my compiler compiles it just fine (clang 10) without
> disabling instrumentation... what does it prove? I don't know.
>
> To clarify: I completely don't object to patching this case in gcc
> with -O2, it just may be hard to find anybody willing to do this work
> if we are talking about fixing compilation of invalid code.
>

I don't mind simply disabling KASAN altogether for this code if nobody
can be bothered to fix the compiler.
