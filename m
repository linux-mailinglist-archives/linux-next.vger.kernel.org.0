Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6A5D48C932
	for <lists+linux-next@lfdr.de>; Wed, 12 Jan 2022 18:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355537AbiALRTy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Jan 2022 12:19:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355538AbiALRTv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Jan 2022 12:19:51 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08A0C061748
        for <linux-next@vger.kernel.org>; Wed, 12 Jan 2022 09:19:48 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id a18so12722541edj.7
        for <linux-next@vger.kernel.org>; Wed, 12 Jan 2022 09:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=65QBkl5auowwKruiCd5ekhebx9aA5QGzBldNP4dKx3o=;
        b=dR9/pPQ3umiUBcOlQtP4NkG7UVl+VgSiD6Gj4ESG3BI5Rd7eU3PraGGHCWjtGvJoJ4
         kWur2vjIEaqWlFGcRkft+wiCc3zVto+ZCKuCJcJVfVrlmU3v1Q8N3QxyRGY0HFiFKokK
         rncMBQNjJs29Bp4qYGukrpNEgf1BoZIYNZVYdThJ2vbve7yQPf5RZXm9G8wXtg83mOqf
         SzED2QYbQYhQowA9le+O2WzhI2joFFcqNVh0VnMuPZTBusvIHA4szTzmuLcTbnnLrYew
         ONN7nPhum87e3WIZ9Jac30F2kq0Lu+/K0Z0qSTHRZGVjyjZzODhzhKRoEeFYOQ0LbAvN
         90zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=65QBkl5auowwKruiCd5ekhebx9aA5QGzBldNP4dKx3o=;
        b=PSPLZH0atH+zFi13Ecep8v6fZjApF0W7Mq7MyGPCGbbD8bvVYgzqwRPLZHepGi4leT
         A91Zw0xXNum2sCR3MrvLCJ5hHpKOinUym410Mafg0K77fjL5laiNkQChjcsFYsmMXYr0
         rZ5QZnltWUrN64csllTts+M0U5mRcZnHrDK1LWaoFwiWiOvb64YnvgP378EtrTSE+lmW
         t7i8Qs+lORrh5OkqdolaTauJwJGc0t6hWYnAOx+JhzwEC3Lg6qEhymm/xYEZBpnZezkV
         3q/XuUYAh7h+GlImNKLdTMRIOnCfHN0uK++SmbCW15CpBlMix21oieTVT7RpMfGqq+Pk
         lc+A==
X-Gm-Message-State: AOAM5314H4CJpqzfZXOlD4AFeqCLJyZOvKO7pbsW8lCwaZsUxHEqNuC2
        Ld6XPvxA2EYKScrjNbRyW6fouZ/eNW6qx+OUTvPU
X-Google-Smtp-Source: ABdhPJwGYiCNrfdiEoAyumDRSQUhGOk5sh0PJ0caxAP6QVabEe2bblxKkriHKYt2iErce9Oc+wD+9RhZ2X3N1F2eWts=
X-Received: by 2002:a17:907:1b0d:: with SMTP id mp13mr552754ejc.29.1642007987184;
 Wed, 12 Jan 2022 09:19:47 -0800 (PST)
MIME-Version: 1.0
References: <20211026133147.35d19e00@canb.auug.org.au> <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
 <87tuh2aepp.fsf@mpe.ellerman.id.au> <2012df5e-62ec-06fb-9f4d-e27dde184a3f@csgroup.eu>
 <CAHC9VhRHs8Lx8+v+LHmJByxO_m330sfLWRsGDsFtQxyQ1860eg@mail.gmail.com>
 <dc5705cf-d47a-57b0-65da-2a2af8d71b19@csgroup.eu> <CAHC9VhQPizVLkr2+sqRCS0gS4+ZSw-AMkJM5V64-ku8AQe+QQg@mail.gmail.com>
 <1a78709f-162e-0d78-0550-4e9ef213f9c6@csgroup.eu> <102e59ba-fcf0-dd85-9338-75b7ce5fbd83@kaod.org>
 <5f83d1fe-4e6e-1d08-b0c2-aec8ee852065@csgroup.eu> <CAHC9VhTcV6jn4z7uGXZb=RZ5k7W4KW1vnoAUMHN6Zhkxsw1Xpg@mail.gmail.com>
 <23e9c126-d167-254f-2f4b-391e9f01396c@csgroup.eu>
In-Reply-To: <23e9c126-d167-254f-2f4b-391e9f01396c@csgroup.eu>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 12 Jan 2022 12:19:36 -0500
Message-ID: <CAHC9VhTHZ-Brr4OrQJ3VLS_zXx1fcAMZ-32sz2=GonmWOgfbDg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Richard Guy Briggs <rgb@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Dec 17, 2021 at 9:11 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 17/12/2021 =C3=A0 00:04, Paul Moore a =C3=A9crit :
> > On Thu, Dec 16, 2021 at 4:08 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >> Thanks C=C3=A9dric, I've now been able to install debian PPC32 port of=
 DEBIAN
> >> 11 on QEMU and run the tests.
> >>
> >> I followed instructions in file README.md provided in the test suite.
> >> I also modified tests/Makefile to force MODE :=3D 32
> >>
> >> I've got a lot of failures, am I missing some options in the kernel or
> >> something ?
> >>
> >> Running as   user    root
> >>           with context root:::
> >>           on   system
> >
> > While SELinux is not required for audit, I don't think I've ever run
> > it on system without SELinux.  In theory the audit-testsuite shouldn't
> > rely on SELinux being present (other than the SELinux specific tests
> > of course), but I'm not confident enough to say that the test suite
> > will run without problem without SELinux.
> >
> > If it isn't too difficult, I would suggest enabling SELinux in your
> > kernel build and ensuring the necessary userspace, policy, etc. is
> > installed.  You don't need to worry about getting it all running
> > correctly; the audit-testsuite should pass with SELinux in permissive
> > mode.
> >
> > If you're still seeing all these failures after trying that let us know=
.
> >
>
> Still the same it seems:
>
> Running as   user    root
>          with context unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c10=
23
>          on   system
>
> # Test 3 got: "256" (backlog_wait_time_actual_reset/test at line 151)
> #   Expected: "0"
> #  backlog_wait_time_actual_reset/test line 151 is: ok( $result, 0 );
>   # Was an event found?

My apologies, this thread was lost in the end-of-year holidays.

At this point, and with that many failures, I think you'll need to
spend some time debugging the test failures to see what is wrong.  I
don't have a PPC32 system/VM and I don't have the time right now to
build up a PPC32 test environment.

--=20
paul moore
www.paul-moore.com
