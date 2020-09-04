Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08A7C25D319
	for <lists+linux-next@lfdr.de>; Fri,  4 Sep 2020 09:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgIDH7p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Sep 2020 03:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729677AbgIDH7m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Sep 2020 03:59:42 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50131C061244
        for <linux-next@vger.kernel.org>; Fri,  4 Sep 2020 00:59:42 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id j11so775323plk.9
        for <linux-next@vger.kernel.org>; Fri, 04 Sep 2020 00:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4sO3K9KUt0lx1jX3LT5Qymn7SNSmjZ7mgkYLWSMNBaA=;
        b=IIT8ojs3Nphf5jUQlNRD+WdyJ7QgPdCDWGeS+Cf9dHwvTtzymqZ5CJfN6cYwvNnzfL
         RZt4TKNYjzspKAP86CMfbqvRCqZyvIsCXJX59+jz8vKOnvZuyYZK2sYmgORS55b/zH6w
         jCut7AyX94mREgkX9hgMWHU3ZArX7DJhi2Br/oDphVk49Dx3j+bwrAikNhvv5XLJ6ZfZ
         pIa5063N+161yywi96AGx/Z8XvbHjbDp40eiLIBm0H7avjGvFjkaLi3EsSMVBVa83XHC
         SOhhVrMZUG0A1cD23H4oS+HIKCrJgv7D0BT2KYJV74W8cB+FA7Xw7dAQqIzBM8TG0IU7
         8/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4sO3K9KUt0lx1jX3LT5Qymn7SNSmjZ7mgkYLWSMNBaA=;
        b=NGglmykwPzjeBXuxyChUCELcvNzQiFvr73RrieVqZ9ChnzWnP2SUNHbPudvGfYnmj3
         G3TH7lLjBDda1thlnq03KLDB0J8sbn33Xz341+bo9aK7ScC3nDGFVH/zGn+Msl6WYZ50
         4glT3gzjP4WZkg8sP40vSgxJutGlRftZgn/ReIKK5wzxUsJFd//6CauDNUMfdvm2vHsb
         64yLL7g9YkhbdfXK/vrRe5oj10EWkTdJijevR4zeOVTE2KVkoHmznwTEO3MrpuEUthnT
         80A0MnPbpwUmC0WdLfKLVGFn+p3CasESyd+hYSXY3sxDx+ivkyQk14QHUOxz0xSGQ3DH
         tN4A==
X-Gm-Message-State: AOAM531UqVaHD4NZ2MLT5vInztuO1+pC6hvSniOTSddwitM8HjFJ3eo2
        mqEpU0MMiY6Sug+9Art6ZUrGAKfIfa/83TPZ29Hlsg==
X-Google-Smtp-Source: ABdhPJwcr9ntIJAx1uVoOxLFhbawv85XiwvUMkctNVJ4VlDH49I6YFh6OAIpfBe+5b5h6pqAcSyv6KOQPu/P1CqMTME=
X-Received: by 2002:a17:90a:fe07:: with SMTP id ck7mr7022389pjb.20.1599206381503;
 Fri, 04 Sep 2020 00:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200902180950.4bc7c4de@canb.auug.org.au> <3abfa193-a56e-66ba-1080-885906fa0196@infradead.org>
 <fdf322d4-cc01-2c85-67cd-86b2d6f4ebff@infradead.org>
In-Reply-To: <fdf322d4-cc01-2c85-67cd-86b2d6f4ebff@infradead.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 4 Sep 2020 00:59:30 -0700
Message-ID: <CAFd5g44g6OrL3fxQNRZ1rR0PruAty8tBZr8JDzM-oonZJRDZyw@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 2 (lib/ubsan.c)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 3, 2020 at 11:12 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 9/2/20 8:44 AM, Randy Dunlap wrote:
> > On 9/2/20 1:09 AM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20200828:
> >>
> >
> >
> > on i386:
> >
> > ../lib/ubsan.c: In function =E2=80=98ubsan_prologue=E2=80=99:
> > ../lib/ubsan.c:141:2: error: implicit declaration of function =E2=80=98=
kunit_fail_current_test=E2=80=99; did you mean =E2=80=98kunit_init_test=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
> >   kunit_fail_current_test();
> >
> >
> > Full randconfig file is attached.
> >
>
> Hi Brendan,
>
> Do you know anything about this build error?
>
> I can't find kunit_fail_current_test() anywhere.

Yeah, this got applied for some reason without the prerequisite
patches. It is from a two patch series, the other being here:

https://lore.kernel.org/linux-kselftest/20200813205722.1384108-1-urielguaja=
rdojr@gmail.com/

which in turn depends on another patchset which didn't make it into 5.9.

Again, I don't know why this was applied without it's prereqs. Sorry about =
that.
