Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13DAE19D454
	for <lists+linux-next@lfdr.de>; Fri,  3 Apr 2020 11:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgDCJuM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 05:50:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:50134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727882AbgDCJuL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Apr 2020 05:50:11 -0400
Received: from earth.universe (dyndsl-037-138-188-127.ewe-ip-backbone.de [37.138.188.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F9FF20737;
        Fri,  3 Apr 2020 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585907410;
        bh=ky+jQGXhzWTYdPxZD6htegiPMw2jR2FnKbH2bhuv+lg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V/79siigr1vMz9WoqoD+zGh0NuGO6VoCie4Miwm07rqE38VLSTvyldzzG9r931hdw
         Uro/GC4T69DxJXEUZLpxLkMd3tgMLd1dCQ/7e725r4qxxihJKXwCoe3n6bU2UT9zsR
         Zx2QXlFinXZ9TvFD8Al3XoYIjS65t7N35PC79314=
Received: by earth.universe (Postfix, from userid 1000)
        id 2D4E13C0C98; Fri,  3 Apr 2020 11:50:06 +0200 (CEST)
Date:   Fri, 3 Apr 2020 11:50:06 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qais Yousef <qais.yousef@arm.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200403095006.naztbhspp6vcv5hl@earth.universe>
References: <20200326135258.2764f0de@canb.auug.org.au>
 <20200401121431.6a996244@canb.auug.org.au>
 <CADBw62qar4qPJmjZj1+9tb6sgqUcCrjei6G62wPaH=YVf48=zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i5yah2e7albqxil4"
Content-Disposition: inline
In-Reply-To: <CADBw62qar4qPJmjZj1+9tb6sgqUcCrjei6G62wPaH=YVf48=zA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--i5yah2e7albqxil4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Apr 03, 2020 at 04:15:11PM +0800, Baolin Wang wrote:
> On Wed, Apr 1, 2020 at 9:14 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > On Thu, 26 Mar 2020 13:52:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:
> > >
> > > drivers/power/reset/sc27xx-poweroff.c: In function 'sc27xx_poweroff_shutdown':
> > > drivers/power/reset/sc27xx-poweroff.c:38:4: error: implicit declaration of function 'cpu_down' [-Werror=implicit-function-declaration]
> > >    38 |    cpu_down(cpu);
> > >       |    ^~~~~~~~
> > >
> > > Caused by commit
> > >
> > >   33c3736ec888 ("cpu/hotplug: Hide cpu_up/down()")
> > >
> > > interacting with commit
> > >
> > >   274afbc3ad33 ("power: reset: sc27xx: Change to use cpu_down()")
> > >
> > > from the battery tree.
> > >
> > > I have added the following merge fix patch:
> > >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Thu, 26 Mar 2020 13:42:00 +1100
> > > Subject: [PATCH] power: reset: sc27xx: use remove_cpu instead of cpu_down
> > >
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/power/reset/sc27xx-poweroff.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/power/reset/sc27xx-poweroff.c b/drivers/power/reset/sc27xx-poweroff.c
> > > index 69863074daf6..90287c31992c 100644
> > > --- a/drivers/power/reset/sc27xx-poweroff.c
> > > +++ b/drivers/power/reset/sc27xx-poweroff.c
> > > @@ -35,7 +35,7 @@ static void sc27xx_poweroff_shutdown(void)
> > >
> > >       for_each_online_cpu(cpu) {
> > >               if (cpu != smp_processor_id())
> > > -                     cpu_down(cpu);
> > > +                     remove_cpu(cpu);
> > >       }
> > >  #endif
> > >  }
> > > --
> > > 2.25.0
> >
> > This fixup is now needed when the battery tree is merged into Linus' tree.

Thanks for the reminder.

> Thanks Stephen.
>
> Sebastian, could you pick up this patch to avoid the compiling issue? Thanks.

I will point Linus to this patch when I send my pull request.

-- Sebastian

--i5yah2e7albqxil4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl6HBsIACgkQ2O7X88g7
+ppzuA/9EawF4CCezOXd0X6nTWA7BYgnr691iy6p6HssXAqJaryld64vUEDxugeh
cOrQfz8L5VMViTGWpPYsjad2YEAJGzLAUB+2Mrf1cICjC1qUztK8fa6j1zK0T2bu
eT7KQVQ8rSAYfhqh9NTPSTMj9xDowtEyXJBasNbFef3HTcpHlxOz5DY19tEjDGFD
+rJAMBBCNiysAg59JySA9rADGTAE0lEbNRIlM7MN3+Wuywth0N++Vl+CxVYclpR9
y8NzBIyghYPbuViP5rbwDE6erSvc5i8x/dgJ4rSgaTLnFg+z5C1chvZOUisQ9MCr
h7z91rpp7+ikMlU/1R5lg2OwtT88gFShfLc9B603uQl0uNpgqyVg1NpdhiYwDgdy
rELgk6zXPrBHqY/4HCfEAix09j9Oz3cx7ND6f839qHBE8R2ZwLEFBvJ7b5wRV+n8
TzHUloPBC9tNvOUObqDjbSSxvlYt/2ig32kbAMJ2OJGgdAUJBK8NhzxCNmWAcQn0
yEiv+aC438Hhhxx5vYspjmJRAVYu8ViRAgx0Lm3XSMCh5exUM8Sga7fVNmCEESdU
nU3y6Vv7gDDynpLHIf0SPULBjrvnSk0coKfqw+ky6KPCEzUVWZjcY4+ZTr+kb1P7
aaX8TWrzXimdNlBOAqCJFOylO4xMA67axX+D0sTn89Bhgc+PD1Q=
=vUvp
-----END PGP SIGNATURE-----

--i5yah2e7albqxil4--
