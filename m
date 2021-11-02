Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B51A442DB1
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 13:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbhKBMWP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 08:22:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36623 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhKBMWO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 08:22:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk8963CQ3z4xbC;
        Tue,  2 Nov 2021 23:19:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635855578;
        bh=6+whIbJLFfSYaBRlLi5F57gIixni6TM88ubJw+uo8bo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=H7ZdXCiQ2iVbuTqJP1e3dZQmY1GCVyxA6MN3ptzpMGHegoOSPpq9Zaz8St20IdIqU
         smKUa3VYZXVSRezMhoA11Hjj1Psxndkjf/odAgWg3tSF+FlsbfiZXcg+xSpnblGgwc
         0Dna90myYhf5/tIR1r68i3NbrpYCM434KITf0oRKMl8UDHsiEWANGjMPw1WkJ88/CR
         w+lWZHfLWyXZ9hz3IhEmMhXgj2OP2xY26syTAMB6leMirrJEE+KzcyjpT9N/CXoRgK
         uPAYyT9/sUS+rGEgnjZuhpt2d15V9oDKqNdj/sqwyQ1jLFsuz75bWHSS34AUNBWMvD
         gJc7zYbntr/Sw==
Date:   Tue, 2 Nov 2021 23:19:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anton Altaparmakov <anton@tuxera.com>,
        Joel Stanley <joel@jms.id.au>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of almost all the trees
Message-ID: <20211102231937.2fe27ba6@canb.auug.org.au>
In-Reply-To: <20211102231307.6ba98df2@canb.auug.org.au>
References: <20211028212651.57beb05b@canb.auug.org.au>
        <20211028233844.292e1319@canb.auug.org.au>
        <20211102174400.1aaee22c@canb.auug.org.au>
        <CAK8P3a3Fx0UmbxP48RnXHcJYf_tU3_NTkMZrFnM42eAb_F4jRQ@mail.gmail.com>
        <20211102231307.6ba98df2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kbJdJKXULdyduJMEaPvd13S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kbJdJKXULdyduJMEaPvd13S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 2 Nov 2021 23:13:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 2 Nov 2021 08:06:10 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Nov 2, 2021 at 7:44 AM Stephen Rothwell <sfr@canb.auug.org.au> =
wrote: =20
> > >
> > > On Thu, 28 Oct 2021 23:38:44 +1100 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:   =20
> > > >
> > > > On Thu, 28 Oct 2021 21:26:51 +1100 Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:   =20
> > > > >
> > > > > Today's linux-next build (powerpc allyesconfig) failed like this:
> > > > >
> > > > > fs/ntfs/aops.c: In function 'ntfs_write_mst_block':
> > > > > fs/ntfs/aops.c:1311:1: error: the frame size of 2304 bytes is lar=
ger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
> > > > >  1311 | }
> > > > >       | ^
> > > > > cc1: all warnings being treated as errors
> > > > >
> > > > > I have no idea what has caused this.   =20
> > > >
> > > > With a nudge from Arnd, it seems the immediate case was commit
> > > >
> > > >   f22969a66041 ("powerpc/64s: Default to 64K pages for 64 bit book3=
s")
> > > >
> > > > from the powerpc tree switching the allyesconfig build from 4k page=
s to
> > > > 64k pages which expanded a few arrays on the stack in that function=
.   =20
> > >
> > > Can we do something about this, please?   =20
> >=20
> > I submitted a workaround a while ago. Anton didn't like it, but has not
> > come up with a proper fix in ntfs either:
> >=20
> > https://lore.kernel.org/lkml/20210927141815.1711736-1-arnd@kernel.org/
> >=20
> > It does need to be changed a bit as I realized it depends on a rework of
> > the Kconfig logic that I had in my randconfig build tree to have a comm=
on
> > page size symbol across architectures. Without my other patch, it also
> > needs to check for PPC_64K_PAGES.
> >=20
> > Should I send an updated version of the patch? =20
>=20
> That would be good, thanks.
>=20
> Even better would be to split up the function some how, but having had
> a bit of a look at it, that may be a much longer job.  I am assuming
> that allocations (or their failure) are out of the question in that
> particular function.

Looking again, we probably just need to disable CONFIG_NTFS_RW ...

--=20
Cheers,
Stephen Rothwell

--Sig_/kbJdJKXULdyduJMEaPvd13S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGBLNkACgkQAVBC80lX
0GxO9Qf/VOaKOsjq9/U0Vb3yYI6T9ESFn1y3OYWcLS2DE0mZNCmocvQvj40Gl91A
71E8ir6whUZbMjRHiNzNrALhwoczAP+9DbkJhqN8DdCcAKGMBnBmBk6wLDxQ6CF4
op1qAggg8HAMT9AM88aB80Ety4rd0dGzyZQiZAnBbaK240tld52uUfyPAGr+kT0u
81XldfR1zcVv7nrUjjf9/OoA9mk6RPTzKS1ZmVmnZf/hN69IKHG+pgNW2pUrBrIb
rRBCejhmoMYZX5vPWUmXdVx7NGVzhhlVC6PQWDiHw0PH3v1Ox5W7o4599ReY1pw9
mjkTHCShQgn/f34LJ+ybIVfmdGwpOg==
=pGjo
-----END PGP SIGNATURE-----

--Sig_/kbJdJKXULdyduJMEaPvd13S--
