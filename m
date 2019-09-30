Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 314E3C2919
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2019 23:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfI3Vrq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Sep 2019 17:47:46 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36865 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbfI3Vrq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Sep 2019 17:47:46 -0400
Received: by mail-pg1-f195.google.com with SMTP id c17so8114808pgg.4
        for <linux-next@vger.kernel.org>; Mon, 30 Sep 2019 14:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=68+QzAIBd78ISkfjCcK6YzmGB31XP49mbh8YKNHvxg8=;
        b=EXNN7X5eQtoBERFXQHkyqOwr8ewtHtvvL1B2g1dLv/EtqrDoj+2g/6gYfw/LMYmjki
         /hV6zcf/ui1IJ4qsPh4FOPYgHnYUZCbxTA3iA1+8hkshdRq3RIetoYSQR7UKdR1njpq1
         zCu2kaKPdehZ1na27ucOSinqmADaVgqOuwcThUsyicBYgB+P0gTIz95rZXyS0TxU080e
         5M1IHPE2OmoXRAUxIhzj86M0NmqMgfvgDJEp9aJ4R6dR2vXAs9mjMKhQp9Cc4EBmnUoM
         wty4WV8QZJQBaU8o0tVRkpJxye7KbhWgpiXN8SNdjgdQWsk4Jdve0vpg46BohS3hnDrc
         +Axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=68+QzAIBd78ISkfjCcK6YzmGB31XP49mbh8YKNHvxg8=;
        b=mTNjJ7YZKXEyOCWMbdcZ6/y0clud3EK6zLZjAe1NLre3pl0z+0sxWt2KdBDy3u/JuW
         oXaDLrAkrmFn5bobj+rQ7pZGSyIFNNgfYdxpORC2Lbm86cXesr0OpP2Vg6T4cWqSRU+5
         p82+DFKe1b95iejyTNCazodh8jVNL7Gpmn6Mw4EIGcpap2Jb79spYVA32G2LmuUB5qo7
         6dHzPFAFECaVzZ6k6pouhSJa91cYbCNmnxP9iupRiVfX7n0vnv5+6h9YKOiQ6HImxmXr
         u3TUB843usR4aW2l2TRRvcy0sKUuRVZUpSVm8J3WqtwcExPDHkHNLDKmkVNQ+CN5Vg+h
         zxvg==
X-Gm-Message-State: APjAAAWdGiD1NAtsxlPzo8fsH/uTHbtegIaZwNSTQMt18FOTuVVU1VUN
        xIyfLtPS1M4AwMahjuy2hkm+mE22CMo/5XCRFWovnw==
X-Google-Smtp-Source: APXvYqxj2EagQJ3S2fUmjqWzgcUmB/oQnDgIE2/rvvXJgV6D2FMlzc+laSW98YOAQB3QLj6JhIDmMGbEWX3vFU1Ix18=
X-Received: by 2002:a62:5847:: with SMTP id m68mr24020574pfb.23.1569880065512;
 Mon, 30 Sep 2019 14:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <8b9795d2-a384-dec8-076c-5b9d5c524eba@linuxfoundation.org>
 <20190926150538.GS2036@sirena.org.uk> <e5af1cd1-be83-cf9e-c6c7-a5258d1b49a9@linuxfoundation.org>
 <CAFd5g44bbh8cd=kfwLR2eFf0FRuO0d5-Mszo7P0JRLbs7e8CQw@mail.gmail.com> <20191001073913.256b5669@canb.auug.org.au>
In-Reply-To: <20191001073913.256b5669@canb.auug.org.au>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 30 Sep 2019 14:47:34 -0700
Message-ID: <CAFd5g47Aq4kWeU2NU2ogSAcf-Z5XNEzk90Fjh8z_s2xv2Vs+Ng@mail.gmail.com>
Subject: Re: Request to add linux-kselftest test branch
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 30, 2019 at 2:39 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Shuah,
>
> On Mon, 30 Sep 2019 10:05:28 -0700 Brendan Higgins <brendanhiggins@google.com> wrote:
> >
> > On Thu, Sep 26, 2019 at 9:53 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
> > >
> > > On 9/26/19 9:05 AM, Mark Brown wrote:
> > > > On Wed, Sep 25, 2019 at 01:30:15PM -0600, Shuah Khan wrote:
> > > >
> > > >> Please add the following linux-kselftest test branch to linux-next.
> > > >
> > > >> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=test
> > > >
> > > >> please let me know if you have questions.
> > > >
> > > > OK, I've added that now - I did actually merge it in by hand
> > > > yesterday too.  It looks like it's for kunit so I guess Brendan
> > > > should be in the CC list for any issues too?  Hopefully Stephen
> > > > will see these mails when he gets back but it's worth checking
> > > > and following up to make sure that he picks it up after he gets
> > > > back on the 30th.
> >
> > Just following up since Mark suggested that it might be a good idea to
> > do so and it doesn't look like the linux-kselftest test branch is
> > currently in next-20190930.
>
> Brendan, thanks for the reminder.
>
> I have added this tree form today and called it kunit, I hope that is
> OK.

Great! Thanks!

> Is this meant to be the updates for the next merge window, or fixes for
> the current releasel?  I ask because I notice that you also have a
> "next" branch that Linus has merged for the current merge window.

Linus had a minor complaint with the KUnit patches, so we had to fix
them and pull them out into a separate branch. We didn't get enough
coverage on the updated patches in time for rc1, so we are hoping we
can get away with sending them in as part of rc2; if that doesn't work
then it will be for the next merge window.

Shuah, does that sum up the situation as you understand it?

Cheers!
