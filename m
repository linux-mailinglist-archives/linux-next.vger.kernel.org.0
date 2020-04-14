Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0539D1A8AAD
	for <lists+linux-next@lfdr.de>; Tue, 14 Apr 2020 21:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504707AbgDNT0t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 15:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504699AbgDNT0m (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 15:26:42 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA23BC061A10
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 12:26:41 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id cl8so4537302pjb.3
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GBjwHY+AL72Y+T8vcTU277/7t2edTwQD/R5p6feAGn0=;
        b=fCX3GwpiQSEiUMKpeDVih8hj+JqhwWfdebHtVs0cADaQ3iHqoQ7ZmrmDaUY53dkJpl
         A5WKCCmkAXrtVjfKFav0oNXvfefO76hr8+DJHnKLwps4R4hNwEneswkOQtrClWDeGDxX
         HI76iHXV7Gq7giZsdnEvhsZlDb4bUvszNzGLGQw8t2wH8D0sLM3Tbaeu5pnLXlC+jJ5G
         lsJhRwjJ7W0ie2NbvW+TqoDhJP9fQ7Np/nbq4Qs+P++do5cNW85OgQOqekBnrGwNG/pZ
         otoSQnqDe1VOiwds65ZqPq0tD1m10m/YueHtixiFsAnRpjMZbrhriDQOU/V+F9gwo8DI
         y0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GBjwHY+AL72Y+T8vcTU277/7t2edTwQD/R5p6feAGn0=;
        b=IY0ykfL6OBDswK+w3TTBEutFhT1VuZUtG8c/5EdxZAsMaidbGoz0SIrLm8xKDKaOyC
         eyPLguevSKHmzLAtF6mkYAeiKqXRytXhrFXSj5omWXvAvXbP+7x78s/pfGqys4P213yq
         dhSZ7HNzZsdHUvVY0POBOsJsyOh9rGJ/b8v1NRe+VnXOwu3zOdT1mQUOE/FNxSTm8N7p
         3Wp3YtRmVe+kQl7Pa55W2ud46CxmHePX4fR2eempONwH9lY4C8euE4O9XtzcSJU3YWO/
         +Lti/fXfClEFnuHZYCWk4VUgRCagkKgfZ/dinYxSfr4A0Qaz/HAxHwZHoFhe95+7LUxF
         ohpQ==
X-Gm-Message-State: AGi0PuaMV+X4WtI9P8bMmD9DThogEBaZBCL3qx33rSPLhVSqAtWE9hoH
        CLovwBWQgUwX7btNmNvnvTjgyZP+7UvgYihEgQQ3iw==
X-Google-Smtp-Source: APiQypKGMp4rdkYV/1cquaVsImLP3ZzjMppuoBalS0ljtPr38FSR8xLUWjRxwP0gMVd5Aii/eLsTsNG+UfBr1nF5MuY=
X-Received: by 2002:a17:902:cb97:: with SMTP id d23mr1445679ply.232.1586892401135;
 Tue, 14 Apr 2020 12:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200410132706.170811b7@canb.auug.org.au> <27c212c4-b522-561d-411c-e74dc0ff0b74@infradead.org>
 <CAHk-=wjhsM-n_NzSh=cSdpThX+62-x3EmyKjhMqGHFYEyG0nPg@mail.gmail.com>
 <2b0f5d2e-3fe5-10c9-2a9a-9a0b341a52d5@infradead.org> <CAHk-=wjXZSPPWzPs=KBDsLZWuq8qO=9qWfiKHw=yV10fFrDv9Q@mail.gmail.com>
 <bfbcaa67-9656-3a80-fc66-c937297c8be0@infradead.org> <CAHk-=whpvCqcCYvy=_v_F6NTtBSeQbXZ0iLr_smV2NJLT+XACw@mail.gmail.com>
 <CA+G9fYu47hpXjYtAr32p9yJ97KZqTry+ioAY1S2TqtiKztCYRg@mail.gmail.com> <f90fc906-395b-79be-8f44-3807586766f7@infradead.org>
In-Reply-To: <f90fc906-395b-79be-8f44-3807586766f7@infradead.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 14 Apr 2020 12:26:29 -0700
Message-ID: <CAFd5g46ZaEVoMb2hO94A41Z=YH6ntTdXstZUhHu67mwOKY+QsA@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 10 (lib/test_printf.ko)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Apr 11, 2020 at 11:22 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 4/11/20 10:36 PM, Naresh Kamboju wrote:
> > FYI,
> >
> > Is this problem related to,
> >
> > Regression reported on Linux next 5.6.0-rc4-next-20200305 on x86_64,
> > i386, arm and arm64. The steps to reproduce is running kselftests lib
> > printf.sh test case.
> > Which is doing modprobe operations.
> >
> > BUG: kernel NULL pointer dereference, address: 00 - ida_free+0x76/0x140
> >
> > https://lore.kernel.org/linux-kselftest/CAFd5g46Bwd8HS9-xjHLh_rB59Nfw8iAnM6aFe0QPcveewDUT6g@mail.gmail.com/T/
> >
>
> Looks similar. Lots of fwnode, software_node, ida stuff there.

Sorry for the late reply, I was out.

Yeah, I am pretty sure it is the same. Heikki proposed a fix that I am
going to try.

Also, I think I am going to send out a new test case for this that can
live with the fwnode, software_node stuff. It would be nice if the
printf test wasn't the only thing testing this stuff.

Thanks!
