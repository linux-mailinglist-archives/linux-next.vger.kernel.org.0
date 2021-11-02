Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF3D442D9B
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 13:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhKBMPu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 08:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbhKBMPt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 08:15:49 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51EEC061764;
        Tue,  2 Nov 2021 05:13:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk81d5ZR5z4xbs;
        Tue,  2 Nov 2021 23:13:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635855190;
        bh=NpDEJY5HJpNz4CKwDnMhbilPOiKREP07cOFK93HNPps=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mJAlJJwtHRcO48iRgRhiiGem/2Sx9ZyGzcJ/OIIreJHuNgqLFOda82BSKK1sd97MO
         FCkdixBfjTVzrjozn29qU/9sHET2Ha/iwIW+l53FGt28+ol/ZWf7t9Hspw/7LKo6MS
         /Uh1m9voDuBuKBgIp2vIqZNHIV1/yIz8No8iT/lrEYVm24ShGF9XJ8APBu/NJnKj+Z
         ZN9RAGp/jjBT8Ao0b/OyEW0pOGVfFJKuiHfQZIoe/VQvzG+d2C16vdv0UB5ufpwwrR
         1dJ0E8TSfKVxG3gOlGGdqD9/KfvTsnSV0qMU9F+mFT6Y7/5p2IkybeOEmhu19SjHkT
         zuSS1rkAKbLAg==
Date:   Tue, 2 Nov 2021 23:13:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anton Altaparmakov <anton@tuxera.com>,
        Joel Stanley <joel@jms.id.au>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of almost all the trees
Message-ID: <20211102231307.6ba98df2@canb.auug.org.au>
In-Reply-To: <CAK8P3a3Fx0UmbxP48RnXHcJYf_tU3_NTkMZrFnM42eAb_F4jRQ@mail.gmail.com>
References: <20211028212651.57beb05b@canb.auug.org.au>
        <20211028233844.292e1319@canb.auug.org.au>
        <20211102174400.1aaee22c@canb.auug.org.au>
        <CAK8P3a3Fx0UmbxP48RnXHcJYf_tU3_NTkMZrFnM42eAb_F4jRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ad6Ic7P=fhScIZp04Ev76Ff";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ad6Ic7P=fhScIZp04Ev76Ff
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, 2 Nov 2021 08:06:10 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Nov 2, 2021 at 7:44 AM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > On Thu, 28 Oct 2021 23:38:44 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > On Thu, 28 Oct 2021 21:26:51 +1100 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote: =20
> > > >
> > > > Today's linux-next build (powerpc allyesconfig) failed like this:
> > > >
> > > > fs/ntfs/aops.c: In function 'ntfs_write_mst_block':
> > > > fs/ntfs/aops.c:1311:1: error: the frame size of 2304 bytes is large=
r than 2048 bytes [-Werror=3Dframe-larger-than=3D]
> > > >  1311 | }
> > > >       | ^
> > > > cc1: all warnings being treated as errors
> > > >
> > > > I have no idea what has caused this. =20
> > >
> > > With a nudge from Arnd, it seems the immediate case was commit
> > >
> > >   f22969a66041 ("powerpc/64s: Default to 64K pages for 64 bit book3s")
> > >
> > > from the powerpc tree switching the allyesconfig build from 4k pages =
to
> > > 64k pages which expanded a few arrays on the stack in that function. =
=20
> >
> > Can we do something about this, please? =20
>=20
> I submitted a workaround a while ago. Anton didn't like it, but has not
> come up with a proper fix in ntfs either:
>=20
> https://lore.kernel.org/lkml/20210927141815.1711736-1-arnd@kernel.org/
>=20
> It does need to be changed a bit as I realized it depends on a rework of
> the Kconfig logic that I had in my randconfig build tree to have a common
> page size symbol across architectures. Without my other patch, it also
> needs to check for PPC_64K_PAGES.
>=20
> Should I send an updated version of the patch?

That would be good, thanks.

Even better would be to split up the function some how, but having had
a bit of a look at it, that may be a much longer job.  I am assuming
that allocations (or their failure) are out of the question in that
particular function.

--=20
Cheers,
Stephen Rothwell

--Sig_/ad6Ic7P=fhScIZp04Ev76Ff
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGBK1MACgkQAVBC80lX
0GyH/QgAkAvmgeUUmIMHgVN2m9h4guoICCFaUpOvyw2zyhfDdXEjQ3IslYm3udfz
L6CfZnDtQzOtJzhAlnXQaaZcBthWupxc0EwZKhwgN3E/grpIoJXdv+eFm++3GFad
1xnFl7CNuBMd+TjQNQ6Q42L3/SitGbojx5oZBaFJBdFPoJVofsXmWHptC2kJXpvE
E04k/dznl0GhZisJEv5sVXtXHE6qBDJp4PrzMU+a/9jIjJLX8qG8qzipjLcXhC6c
tKRm8QEHBLVkI634zjWOA6wFgRAUIRjmFIV9r3rvdaqoWjSdJfub/0aXgZzR3sIZ
CVV6MjXXqO7NUo6ZTD6/p7fdR3AluA==
=1Yz5
-----END PGP SIGNATURE-----

--Sig_/ad6Ic7P=fhScIZp04Ev76Ff--
