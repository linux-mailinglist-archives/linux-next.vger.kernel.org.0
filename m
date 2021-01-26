Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC06303D10
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 13:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390454AbhAZMfM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 07:35:12 -0500
Received: from ozlabs.org ([203.11.71.1]:36215 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390950AbhAZK0o (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 05:26:44 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQ2v7298Hz9sS8;
        Tue, 26 Jan 2021 21:25:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611656756;
        bh=/91yfyrqOemmMlKBulcSewECm0KX1uRxUgKcoHeb5l8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Qfn9uUHQGcrvfF5YFy4qJWt8gSVieoZF7OgEiAOq+WVesrjzvvjPZINZdFZVswNBv
         Od+vX5WaZ5fe2BxDEngoTGL8G0X+RcOxh+XK846/nhvbVKm5Hsb6cYSsTsm9xnyNSA
         LZMmfSBK30JqIDAmOQ08ldMydvVq+uG8Li8LYiSdN+lk/PM5tRC3YKjc3oNodVddd9
         QWcqBY09omoXQ5qyZNY22IeZy3JqcUb+uslPllMrVySg7SEGsqd4Loh/BoEWFa9dmG
         ZTWb14KOUeuLL8iIyrKpqmVgtYAxduJZa0RZZVnv413V0YlVZgtM3v7A0WZDAngivm
         7klkRuAlTE2iQ==
Date:   Tue, 26 Jan 2021 21:25:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Sven Schnelle <svens@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] s390: allow reschedule on syscall restart
Message-ID: <20210126212553.5d5a21b8@canb.auug.org.au>
In-Reply-To: <a522c1ac-703a-ba99-c44c-3dd09e4cc4be@de.ibm.com>
References: <20210121143926.21440-1-svens@linux.ibm.com>
        <20210121143926.21440-2-svens@linux.ibm.com>
        <a522c1ac-703a-ba99-c44c-3dd09e4cc4be@de.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sdKj9a.UQ7sEXp8q9xYMQZd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sdKj9a.UQ7sEXp8q9xYMQZd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 26 Jan 2021 07:59:51 +0100 Christian Borntraeger <borntraeger@de.ib=
m.com> wrote:
>
> On 21.01.21 15:39, Sven Schnelle wrote:
> > Commit 845f44e8ef28 ("sched: Report local wake up on resched blind zone
> > within idle loop") from next-20210121 causes a warning because s390
> > doesn't call sched_resched_local_allow() when restarting a syscall.
> >=20
> > Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
> > ---
> >  arch/s390/kernel/syscall.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/s390/kernel/syscall.c b/arch/s390/kernel/syscall.c
> > index bc8e650e377d..2b39ac40f970 100644
> > --- a/arch/s390/kernel/syscall.c
> > +++ b/arch/s390/kernel/syscall.c
> > @@ -162,6 +162,7 @@ void noinstr __do_syscall(struct pt_regs *regs, int=
 per_trap)
> >  		do_syscall(regs);
> >  		if (!test_pt_regs_flag(regs, PIF_SYSCALL_RESTART))
> >  			break;
> > +		sched_resched_local_allow();
> >  		local_irq_enable();
> >  	}
> >  	exit_to_user_mode(); =20
>=20
> Yesterdays next now fails with
>=20
>=20
> arch/s390/kernel/syscall.c: In function '__do_syscall':
> arch/s390/kernel/syscall.c:165:3: error: implicit declaration of function=
 'sched_resched_local_allow' [-Werror=3Dimplicit-function-declaration]
>   165 |   sched_resched_local_allow();
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[2]: *** [scripts/Makefile.build:288: arch/s390/kernel/syscall.o] Err=
or 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [scripts/Makefile.build:530: arch/s390/kernel] Error 2
> make[1]: *** Waiting for unfinished jobs....

I have now removed the merge fix up for tomorrow.  It seems that the
commits that needed it have been removed :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/sdKj9a.UQ7sEXp8q9xYMQZd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAP7jIACgkQAVBC80lX
0GyRGgf+PCxtfLh1njRy4U8bwAbeMOKXBp6UIitoRhYYAqp/6FrCvaF+FF77WnRh
yhMfe8ELKX25euRhBykPccyxpHw0ATKYJIikUPhoRlnEHNAgutJpxwUpIsgZDMnK
aJ6yX7sMAhBp+6xEmhevUpOeexxGNntaWOg8ShQZLL/wdhT3pG3II9Eq9kjOIueg
qMKY2IFL08Og+UxIHMJTgiG+jMJtv5bMsXMl09DWhgSHSYFoxwytyEKmW167nhTX
ED3K08dVuedktFeuLYVlBybXkd4Mlb0b3km08iuGlbrCZhxOmRy7WnA63GZarlTZ
ry2KCkevUGtloo5n1LOUKL/PvMfqYQ==
=HXlh
-----END PGP SIGNATURE-----

--Sig_/sdKj9a.UQ7sEXp8q9xYMQZd--
