Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB7B42728C
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 22:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243261AbhJHUu2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 16:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243258AbhJHUu2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 16:50:28 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB50C061570
        for <linux-next@vger.kernel.org>; Fri,  8 Oct 2021 13:48:32 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id g2so10144735ild.1
        for <linux-next@vger.kernel.org>; Fri, 08 Oct 2021 13:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iaFaYIXZwVD0yRZ/mCXCYmqaGexrEn8W5uhU7fneeVk=;
        b=QbiScSuEuo1bfeAl0LdzPw3vaAmMP83C0WIakyzzJKiiko8EiCxmZ42y7KiJRy95NW
         j9gWJ4hM2eOcSKl9HdzIRhMuHMFzidDHV3sT1sIbFgYRm23OA8e17FwELn8kcHlHkp7q
         UPJh3N9J+1xDB1LjN9gm5G7tNsvqiP7OaAB30dSyyv0YWFXM+GVsu1hap3JLrJscqucT
         XVgVl+p8upHWoa0NwcyFPRK+M2ZFQQTNl3fKCgIWtP2OWueP+pqa84bUHd6EzjVqMyNW
         QA1/Bi8n0yI9TY+D+oOVvyTOyg5VEkjDYOOgUtD2RlDu/C9VqpOfu/XmIaFlzjrMGtXa
         M52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iaFaYIXZwVD0yRZ/mCXCYmqaGexrEn8W5uhU7fneeVk=;
        b=ZivtxYgzXIzqfdpC5QqvakiKrcpWcqvN4pbXEwj24Okmli7CO9dHGy5TnfNzHvedrj
         2TCng+O0qUPJhUq9CvbC1D1pHXGr/5k7Ac6OQX9ipzn32a4BTCiICO5MYNgWU8kJauzp
         GOpS/cGgzKvkJQuAd+Zx//LCt1QagQtSvbo5b5J/wU5J7brXinxw2GK5C7/xW90cWrGX
         xRtSaVZO0LmCEf2Djos9uSWLcHnYJTfpo9ByDXgydF/3PxpqxTs14fSgdeozG8R+sdky
         fozN5GTh7c02swR2qBGNAukuo+IrLbGxuRysKqiUWk4JBzH8SeMSLNMMYT0UgVrtQmM1
         ycRA==
X-Gm-Message-State: AOAM531RdfYoY+T04Q+BjjxWOCyAXMmmUZrMJZdPcZsJAolG7+u13FUy
        OsGJVVaI1D6C3qjsInwiqVJ+RgVLtHfDjOrqVu1fwg==
X-Google-Smtp-Source: ABdhPJyzQI+ydTQHhLGpW7tyL8HzlARvMHpg2upjXRqbpsb7EXsx9zXOsNSUT6gDYnP20RcY4v71JqBb3Ii9IgxkCxM=
X-Received: by 2002:a05:6e02:1b07:: with SMTP id i7mr9842231ilv.63.1633726112024;
 Fri, 08 Oct 2021 13:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211008152930.03787395@canb.auug.org.au> <ba01fb13-e1a1-299e-9a7b-ccdeaeef267a@linuxfoundation.org>
 <CAFd5g45g91ZadTJrU3oE+VHxZ_2kgDnZm0uyTiaxR+bP=qg9fA@mail.gmail.com>
In-Reply-To: <CAFd5g45g91ZadTJrU3oE+VHxZ_2kgDnZm0uyTiaxR+bP=qg9fA@mail.gmail.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Fri, 8 Oct 2021 13:48:20 -0700
Message-ID: <CAGS_qxpfx_OS8t1NGVojkkgbR-Dof6VfJxag1OXDyrjcjxVZYQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kunit-next tree with the
 kunit-fixes tree
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 8, 2021 at 1:03 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Fri, Oct 8, 2021 at 9:31 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
> >
> > On 10/7/21 10:29 PM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Today's linux-next merge of the kunit-next tree got a conflict in:
> > >
> > >    tools/testing/kunit/kunit.py
> > >
> > > between commit:
> > >
> > >    d8c23ead708b ("kunit: tool: better handling of quasi-bool args (--json, --raw_output)")
> > >
> > > from the kunit-fixes tree and commit:
> > >
> > >    6710951ee039 ("kunit: tool: support running each suite/test separately")
> > >
> > > from the kunit-next tree.
> > >
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > >
> >
> > Thank you for the fixing it up. I will fix this up in the kunit-next once
> > the kunit-fixes pull request goes out.
>
> Thanks for taking care of this everyone.
>
> Daniel, can you double check the merge conflict to make sure it is
> done correctly?

Looks good to me.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/tools/testing/kunit/kunit.py

Not sure if I'm parsing the 3-way diff properly, but it looks like
it's just the typing import and the fact we added some code right
below run_tests(), which got changed.
So yeah, the combined Typing import and telling git it's being
paranoid about run_tests and massage_argv seems fine.
