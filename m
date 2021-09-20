Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 890A0411179
	for <lists+linux-next@lfdr.de>; Mon, 20 Sep 2021 10:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233540AbhITI7K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 04:59:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45949 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231298AbhITI7G (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Sep 2021 04:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632128258;
        bh=k+XcZYc14KsehjLTqP8CjGytdXHzGgRx1VmpN6BiUc0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=S+1e5ECkXGBJ49qUH5ObqM5EYaC7S2OMYgRoYoo7rA4Wd5wPtea0r9jlcHCURqFeD
         NXrpPxlZj2YbYEvQ+HwEMDVV+Ec9yXvoKVypbUoLNWtfuTxaRN5msIB3Coyu/Ywp4f
         xHtPuAGTkKQCeScX01BbKgMxMWDHdD56U0dF0kHOgt5L1IybTrgoNQj3FotkxGNVNB
         07t1hTChGFuYV11psW0KBqWn/c37HA4g6Q0NRflPHh1YjaTp4Vctn+DOYqmtBc4YjG
         4/eVfy7s8r+WoHf0XV9zTNQB2AFNKVvPQK4SALX+iDtIHHWo9QeqW7mEyilesr3z6F
         8CdXcF3t+cgAw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCdjt37Jcz9sRN;
        Mon, 20 Sep 2021 18:57:38 +1000 (AEST)
Date:   Mon, 20 Sep 2021 18:57:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Yafang Shao <laoar.shao@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20210920185736.40285450@canb.auug.org.au>
In-Reply-To: <20210920183016.3a4778b5@canb.auug.org.au>
References: <20210920113330.29f12b99@canb.auug.org.au>
        <CALOAHbDYExn1uRaHX1jNZrST80if7QjA-MuL0at1C7fHzQgV8g@mail.gmail.com>
        <20210920183016.3a4778b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a5ieGo0ylGpX+QzBMDl3Hs=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a5ieGo0ylGpX+QzBMDl3Hs=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 20 Sep 2021 18:30:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 20 Sep 2021 14:55:29 +0800 Yafang Shao <laoar.shao@gmail.com> wro=
te:
> >
> > On Mon, Sep 20, 2021 at 9:33 AM Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote: =20
> > >
> > > After merging the tip tree, today's linux-next build (powerpc_ppc64
> > > defconfig) produced this warning:
> > >
> > > kernel/sched/debug.c: In function 'print_cfs_group_stats':
> > > kernel/sched/debug.c:460:41: warning: unused variable 'stats' [-Wunus=
ed-variable]
> > >   460 |                struct sched_statistics *stats =3D  __schedsta=
ts_from_se(se);
> > >       |                                         ^~~~~
> > >
> > > Caused by commit
> > >
> > >   cb3e971c435d ("sched: Make struct sched_statistics independent of f=
air sched class")
> > >
> > > # CONFIG_SCHEDSTATS is not set
> > >   =20
> >=20
> > Thanks for the report.
> >=20
> > We have discussed this issue before[1].
> > This warning happens when CONFIG_SCHEDSTATS is not set and
> > schedstat_enabled() is 0, so the whole scope should be not compiled.
> > It seems that we don't need to fix this warning.
> >=20
> > [1]. https://lore.kernel.org/lkml/20210911082505.115758-1-laoar.shao@gm=
ail.com/ =20
>=20
> Clearly it will be compiled if CONFIG_SCHEDSTATS is not set as that is
> exactly what this build has ... even sections of code guarded by "if
> (0)" are compiled, they may just not produce any output in the binary.
>=20
> Also, I do not have W=3D1 for this build.
>=20
> If you turned schedstat_val() into a static inline function, then this
> warning would go away.  That also means that argument types and return
> values will be better checked.

I take it back, that won't work :-(

> So, please fix this.

Still it needs to be fixed to keep unnecessary warnings out of our builds.
--=20
Cheers,
Stephen Rothwell

--Sig_/a5ieGo0ylGpX+QzBMDl3Hs=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFITQAACgkQAVBC80lX
0Gym4Qf+NhTZ/ael2ktYZFyh1dizFiiQd5iFwWEq3nePHw8W7x66RSo/63wXIKCq
KjSZz8juNPmYscnbF26EfZSc56Bxj3aZC+cm879Qpo+dQ/29IFmnMx0CZnCTYQwO
Ar9FNgxuAgitNDYnulzYdNeHJlnPTdNjn6c4pFaRyrtTSU69efJcgShNbEt4VUP/
2ZgPOBZprB4R8hriD18kJE3zN4tI8KE5NZXE4JGmivVgIXN2mkaR0qP08hIJ1z/x
U0Z99YPY7CIa+/yCfoNgzB2HC8yAygpkTQd9aPJQmvhFcNijpDiPk3/3/E7jiMPS
pVLL886yxcKcDClUmZg0LTP/Yz47aQ==
=/LRP
-----END PGP SIGNATURE-----

--Sig_/a5ieGo0ylGpX+QzBMDl3Hs=--
