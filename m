Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 331434110F5
	for <lists+linux-next@lfdr.de>; Mon, 20 Sep 2021 10:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbhITIcC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 04:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235812AbhITIbu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Sep 2021 04:31:50 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD90C061574;
        Mon, 20 Sep 2021 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632126620;
        bh=5eQURRoDRABro2TOkaUezat98SAJTdaIwcERp9k+uwE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=q0ZuLVGSnIawm9F6X92cEDyIBtNadvpIBisflTkwrh8wXWrlbsxpXJr2uyqYhegIx
         hwAMrTUo+oM8H1sl4IxS9f7Xx30MnsAXkJAcYc5gKUK22dTJ44sH2edLiKIvAUrlZw
         TC20fclkI45wCCSoeANo9P6ZFxM2AFBRkG5DyDDwPcM69qkTUbshRuTgI9QEcIoV1w
         CjLfe6H5XfBPPaXlV8gtzfoFZkYWhNgvzsW2SxAqO2tw8q8yawBr042akm23cQPaqc
         Bp2yn9Z9BcYQXbevQfs1qt4P18BQpPuad6QRPX+73Wwp1DOKcJI70A9wbjvo8SE5qs
         /ycxd+yuyxbxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCd6K5WCxz9sPT;
        Mon, 20 Sep 2021 18:30:17 +1000 (AEST)
Date:   Mon, 20 Sep 2021 18:30:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Yafang Shao <laoar.shao@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20210920183016.3a4778b5@canb.auug.org.au>
In-Reply-To: <CALOAHbDYExn1uRaHX1jNZrST80if7QjA-MuL0at1C7fHzQgV8g@mail.gmail.com>
References: <20210920113330.29f12b99@canb.auug.org.au>
        <CALOAHbDYExn1uRaHX1jNZrST80if7QjA-MuL0at1C7fHzQgV8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0cMlg/2xDouH=vlIzL4F=zS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0cMlg/2xDouH=vlIzL4F=zS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Yafang,

On Mon, 20 Sep 2021 14:55:29 +0800 Yafang Shao <laoar.shao@gmail.com> wrote:
>
> On Mon, Sep 20, 2021 at 9:33 AM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > Hi all,
> >
> > After merging the tip tree, today's linux-next build (powerpc_ppc64
> > defconfig) produced this warning:
> >
> > kernel/sched/debug.c: In function 'print_cfs_group_stats':
> > kernel/sched/debug.c:460:41: warning: unused variable 'stats' [-Wunused=
-variable]
> >   460 |                struct sched_statistics *stats =3D  __schedstats=
_from_se(se);
> >       |                                         ^~~~~
> >
> > Caused by commit
> >
> >   cb3e971c435d ("sched: Make struct sched_statistics independent of fai=
r sched class")
> >
> > # CONFIG_SCHEDSTATS is not set
> > =20
>=20
> Thanks for the report.
>=20
> We have discussed this issue before[1].
> This warning happens when CONFIG_SCHEDSTATS is not set and
> schedstat_enabled() is 0, so the whole scope should be not compiled.
> It seems that we don't need to fix this warning.
>=20
> [1]. https://lore.kernel.org/lkml/20210911082505.115758-1-laoar.shao@gmai=
l.com/

Clearly it will be compiled if CONFIG_SCHEDSTATS is not set as that is
exactly what this build has ... even sections of code guarded by "if
(0)" are compiled, they may just not produce any output in the binary.

Also, I do not have W=3D1 for this build.

If you turned schedstat_val() into a static inline function, then this
warning would go away.  That also means that argument types and return
values will be better checked.

So, please fix this.
--=20
Cheers,
Stephen Rothwell

--Sig_/0cMlg/2xDouH=vlIzL4F=zS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFIRpkACgkQAVBC80lX
0GydMwf+JEFic2nt1mzqF0mBC64IlIHRKT1Eth0OJ4FT/Uv6VCVPhv4BRcEwwH/O
BE8DJkFyhvAQUzQx5EkKcFTeili9w4oHu5og14Oae3Lp3xltGTkldOkbMohiy/UN
GB3JwM1+FHu3/fL1BcSfuBejKmGoSfyY5Py4jz+S3lH1zw4eJ6VaVOojC8FeIvV/
HX7md9PzRbDj9Ic5jXScJK/cRh/uwEWxINzXZaTX/z3qRBwxXu8dXlGkh+TLAnqk
oKQ56T8qitDk4F0wwDMEFay6qNSQL91KUM5fTO2MC+TISL8mBYK1Q6zybKnAlh/t
8iZHbQkEeKINOSV7Z/jB5NxP0luPHw==
=x15c
-----END PGP SIGNATURE-----

--Sig_/0cMlg/2xDouH=vlIzL4F=zS--
