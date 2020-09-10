Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB45F264298
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 11:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgIJJm2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Sep 2020 05:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgIJJm0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Sep 2020 05:42:26 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34857C061573
        for <linux-next@vger.kernel.org>; Thu, 10 Sep 2020 02:42:26 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id md22so1066257pjb.0
        for <linux-next@vger.kernel.org>; Thu, 10 Sep 2020 02:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tfIByuMMo7C/Clnj6jXryHuR4zdcV5TwuhVI0+9ZXqk=;
        b=uDmpCbFh1psm0nkusAJFY/dcLXBPE4iE9E7slyes1DD5ltL23+HkFPZPaAoW01eEP4
         2vXjPNq2s/exWc+Pgplo/DJpbut9xfgknVSIV2dbNNUD8qcqEBJxPnzKiHw8Jkt/XOHj
         nu4dYmVLRLzHj/bH7I4kO5qUD+ALbAHSdvOaR5Xq4M3FtkIlabCNYWf++M87+AQxYdab
         F3Ewn9WGLULNvFuJleRF/eZbc2StBBn29B4fq/EM8MLDt6iF6ZdrIYHLNo+jwO2yU4jZ
         Z5nNdXfEhORhGLmvyvskJcZvaGsVkmCdBLuntcCnFrN/OaHRQu8F/QG00qCXm6X86QhW
         MnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tfIByuMMo7C/Clnj6jXryHuR4zdcV5TwuhVI0+9ZXqk=;
        b=XOhbLsuoNdRRT2ZAFnBJmQwJBm+/BMSFV5ytOpJBCZor2F4n5MYqzyZbL7R47J3XNb
         4gIFFmWyDCcbgRkk+mO9rN+Q17xckNV98LRvzJAQysYc4UmlPOfIMs3b5VNUKrLfl8Ga
         HEkjpm0mahIie+2upqhJ1JLsRQvsiZYphmFuv5EwaNFoB5r9kmOo+pAgJV5U12rpgtaM
         Wab0FV4TW0yGJdhj7qA6pLs68VpPBP+yuqVfcf8h24xtV2sreF2eHa22UJmDEa1vp3nz
         D/PEz7FwjuWydnEhV/yorV7ljpZt3lW88oSDci5re1MLfVx+9SaB2WcnyRKrowsVgRFB
         0zEA==
X-Gm-Message-State: AOAM531qyYpCIs+r+hSahpOgpUnFKP1v4jOFUe6YJca+pr3HRKDtDw2h
        egE7nqp1Yc17DtbmE0MPKwdVErfSf4k5Z95KLahknA==
X-Google-Smtp-Source: ABdhPJz7PvLSYCqK0ku+A1ysRCQYzogbgA6IYq2pcoIqNsN3XrY5qY/AABceMIzcPX+1vQVAyYI6uTYl64B6AvrCmqI=
X-Received: by 2002:a17:90a:fe07:: with SMTP id ck7mr4517568pjb.20.1599730945276;
 Thu, 10 Sep 2020 02:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200902180950.4bc7c4de@canb.auug.org.au> <3abfa193-a56e-66ba-1080-885906fa0196@infradead.org>
 <fdf322d4-cc01-2c85-67cd-86b2d6f4ebff@infradead.org> <CAFd5g44g6OrL3fxQNRZ1rR0PruAty8tBZr8JDzM-oonZJRDZyw@mail.gmail.com>
 <84531c68-2ac8-924b-5e71-077f9abb2503@infradead.org> <20200909104619.0902238c@canb.auug.org.au>
 <dea1bacd-48c2-067b-1bb2-00a0ee91196d@infradead.org> <90719242-ab0e-7bd9-1cce-5aac8940eb23@linuxfoundation.org>
In-Reply-To: <90719242-ab0e-7bd9-1cce-5aac8940eb23@linuxfoundation.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 10 Sep 2020 02:42:14 -0700
Message-ID: <CAFd5g452HH1Zfo+tqYzZuMVBnz-x=ePkits6uUnVDBXvaU=nzg@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 2 (lib/ubsan.c)
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 8, 2020 at 5:55 PM Shuah Khan <skhan@linuxfoundation.org> wrote=
:
>
> On 9/8/20 6:49 PM, Randy Dunlap wrote:
> > On 9/8/20 5:46 PM, Stephen Rothwell wrote:
> >> Hi Randy,
> >>
> >> On Tue, 8 Sep 2020 07:38:31 -0700 Randy Dunlap <rdunlap@infradead.org>=
 wrote:
> >>>
> >>> On 9/4/20 12:59 AM, Brendan Higgins wrote:
> >>>> On Thu, Sep 3, 2020 at 11:12 PM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
> >>>>>
> >>>>> On 9/2/20 8:44 AM, Randy Dunlap wrote:
> >>>>>> On 9/2/20 1:09 AM, Stephen Rothwell wrote:
> >>>>>>> Hi all,
> >>>>>>>
> >>>>>>> Changes since 20200828:
> >>>>>>>
> >>>>>>
> >>>>>>
> >>>>>> on i386:
> >>>>>>
> >>>>>> ../lib/ubsan.c: In function =E2=80=98ubsan_prologue=E2=80=99:
> >>>>>> ../lib/ubsan.c:141:2: error: implicit declaration of function =E2=
=80=98kunit_fail_current_test=E2=80=99; did you mean =E2=80=98kunit_init_te=
st=E2=80=99? [-Werror=3Dimplicit-function-declaration]
> >>>>>>    kunit_fail_current_test();
> >>>>>>
> >>>>>>
> >>>>>> Full randconfig file is attached.
> >>>>>>
> >>>>>
> >>>>> Hi Brendan,
> >>>>>
> >>>>> Do you know anything about this build error?
> >>>>>
> >>>>> I can't find kunit_fail_current_test() anywhere.
> >>>>
> >>>> Yeah, this got applied for some reason without the prerequisite
> >>>> patches. It is from a two patch series, the other being here:
> >>>>
> >>>> https://lore.kernel.org/linux-kselftest/20200813205722.1384108-1-uri=
elguajardojr@gmail.com/
> >>>>
> >>>> which in turn depends on another patchset which didn't make it into =
5.9.
> >>>>
> >>>> Again, I don't know why this was applied without it's prereqs. Sorry=
 about that.
> >>>>
> >>>
> >>> Well.  Who is responsible for this small mess?
> >>> It is still killing linux-next builds for me (2020-0908).
> >>
> >> It came in via the kunit-next tree (Shuah cc'd).  I will revert commit
> >> abe83f7621ee ("kunit: ubsan integration") today.
> >
> >
>
> Sorry about that. I picked this up for 5.10 since it had the reviewed
> by tags from Brendan.
>
> I will drop this from kselftest kunit

Thanks for taking care of this!
