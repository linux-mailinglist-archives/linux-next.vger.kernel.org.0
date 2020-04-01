Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 146E619ABB5
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 14:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732419AbgDAMam (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 08:30:42 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35297 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732352AbgDAMam (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 08:30:42 -0400
Received: by mail-pj1-f66.google.com with SMTP id g9so2650538pjp.0;
        Wed, 01 Apr 2020 05:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zARPi0DbJME0ZlHxq62XWZIwR42M3zqI8MWHownZMTc=;
        b=JdBQbrgm4yhTz/TAL9hOMHC8lDUQddSvIeH7bD7dRvymc/gAUose5TGJ0HHkVBsURu
         uHGy6wvyedinFVKw4wYm+IXEbLNrUTyZLbjC3qw8PmczyVXSVntjCC99AF2Yf/Fr3X4h
         XZtIPmDCjAdInP6teQZmGu/PqKhr1PW4bw3CsfzmtCC6dgaOgIAfODLcNwlgr1pd3loP
         +HBNoZS5c0uEme1CzCp9i9pyzQE3YVmKYTvD9ujQFKeYTh1xUSWlw3zSa6sgzYFnmiSJ
         vfbYuBlak1e1lvWy2hMG816f8xTYjUHnGK2T/x3k3wbWf+ExHFCwD12ccR/BWQlV904z
         RoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zARPi0DbJME0ZlHxq62XWZIwR42M3zqI8MWHownZMTc=;
        b=AjdltjOGP3mzWCVmV8oK6BYRwzpLGfjEklqe0sJZBMZvuy2F5YpdOxVRzkYi6PBmIK
         PprP72lHnhgMZY1WDyk+VJa9JJwLWBIgZoe+MnQokm2LKk7k7zxphVJlQlQiVzAitrQz
         GqnDCyNqDfOk/3a10P2BFWMe+Rrp12LcMflqZtDErS7lGE3Fv+Hl5NNfk+7gKnMG3cKb
         /DHiYCA9IBUAdiLJ0h6RkGXP5aJzfvhRPFopR9pfOF/VbQyOQ0XaGMY23lrBV72gNQN5
         WzF/4aPAqAffxcsiL3kwm7M72s2mll2LudQFzt5FUN1q2TVmg72UZUxjAFe2PQT4IMUc
         LcJQ==
X-Gm-Message-State: AGi0PuYnQAByFfVVi1hsIKus0VEzWOfDznPWkAL18oQmrJSirnVHOPSP
        Hvbxijjvf5CdH7xBXbbq8lJ0C2SFH+QUTQp60Hc/VPgPurzRBg==
X-Google-Smtp-Source: APiQypKDCxaUjrkt7jyanGBYlPxDcW9sA+YFWoysWgixJdCh1CcjOs1yfjdHe1qulMcbXeF/OAA6wZ7MxP+OBNLqKY8=
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr4665546pjn.8.1585744241051;
 Wed, 01 Apr 2020 05:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200401151904.6948af20@canb.auug.org.au> <CAMuHMdXFHWFucxZbChxaM6w4q9Gu5pccMBP46N4Av1E2rNKddA@mail.gmail.com>
 <CACRpkdbP9gMLDnDSR6czN88Hjwu6HXSZ2jyYOo-iuq0W073Hbg@mail.gmail.com>
 <CAMuHMdXPCwdd2-Hn0_N7nLgBatS8smnvLnxZD06Qsk+qGJKc7A@mail.gmail.com> <CAHp75VfOTVHFWw16XXtuWN64Ug8Bt5AqxBTy_p78fQfknh6tnw@mail.gmail.com>
In-Reply-To: <CAHp75VfOTVHFWw16XXtuWN64Ug8Bt5AqxBTy_p78fQfknh6tnw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Apr 2020 15:30:34 +0300
Message-ID: <CAHp75VfnsXZ9YqnU1=9MYwRTQ+gDU_jh4VcNKCQvZDsCgN7AYg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 1, 2020 at 3:29 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Apr 1, 2020 at 11:26 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Apr 1, 2020 at 10:19 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Wed, Apr 1, 2020 at 9:49 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > +EXPORT_SYMBOL_GPL(of_pinctrl_get);
> > > >
> > > > As exporting symbols has its (space) cost, and of_pinctrl_get() is a tiny
> > > > function, what about making it an inline function in
> > > > include/linux/pinctrl/pinctrl.h instead?
> > >
> > > I'm all for it! :)
> >
> > Want me to send a patch?
> > Which base?
>
> Wouldn't we need to export the inside function in that case?
> If so, we need a better name for it.

And wouldn't be cost even more expensive in such case due length of
the function name?


-- 
With Best Regards,
Andy Shevchenko
