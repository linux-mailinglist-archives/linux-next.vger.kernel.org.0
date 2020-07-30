Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A3A232B1E
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 07:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgG3FD2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 01:03:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41561 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728507AbgG3FD2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jul 2020 01:03:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHJG46qmwz9sRK;
        Thu, 30 Jul 2020 15:03:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596085405;
        bh=MXPTeFamV5E1SOQKwuLN9QDQHMA2pul9kkZ7NSF/5aQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aGWbQZI585HpzYyJWZaJ2JnkmVqz95Tinl/uOIxcNh90UrxO4kNGENyaRzVs/u0j7
         NYfqYi1hLCVhQW3uh1MIMgpSr7XsZQkhKQ/Pu230YeOJEYdSVwgMbAH9UCUOtaSMrB
         GzQKxluV8umSHXOa/2AiOtHB5bY/htUV5zzni0Y4zbuvFlv8ulWLOBvnnqMBiRoJka
         MhtV5pYwt/xKpvkaKSXCsyF9ITaLpd5XFhVh26JYXE6myOLClwvmNpS1FSjWGJMMgf
         Hr1bePaFqu9kzlH2ufuI4oSO6o2jM/Uv+l1vJWaCQKNYyAXInrU2BjUJHO0sbpWb4a
         IUSU7zwvmsSwg==
Date:   Thu, 30 Jul 2020 15:03:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the security tree
Message-ID: <20200730150322.5c55ec66@canb.auug.org.au>
In-Reply-To: <20200730125904.4d20b4e6@canb.auug.org.au>
References: <20200708140034.546298ff@canb.auug.org.au>
        <20200713120419.33cf7a87@canb.auug.org.au>
        <20200730093500.334c56cb@canb.auug.org.au>
        <alpine.LRH.2.21.2007301233210.3625@namei.org>
        <20200730125904.4d20b4e6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GEArf1HVWLLdLwZVTyAxQfO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GEArf1HVWLLdLwZVTyAxQfO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, 30 Jul 2020 12:59:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi James,
>=20
> On Thu, 30 Jul 2020 12:35:03 +1000 (AEST) James Morris <jmorris@namei.org=
> wrote:
> >
> > On Thu, 30 Jul 2020, Stephen Rothwell wrote:
> >  =20
> > > > I am still applying the above patch ...   =20
> > >=20
> > > The merge window is coming up fast ... is anything happening about th=
is
> > > failure?   =20
> >=20
> > A new patch is coming, but I'm not sure this code has had enough review=
=20
> > from the core VFS folk.
> >=20
> > Please drop secure_uffd_v5.9 for the time being. =20
>=20
> You just need to remove/revert it from your security tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git=
#next-testing).

In today's linux-next I have reverted the three commits in that branch:

d08ac70b1e0d Wire UFFD up to SELinux
2b72259a271a Teach SELinux about anonymous inodes
2749d3f84a70 Add a new LSM-supporting anonymous inode interface

--=20
Cheers,
Stephen Rothwell

--Sig_/GEArf1HVWLLdLwZVTyAxQfO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8iVJoACgkQAVBC80lX
0GyvYwf6A59dJelw+pnYqFvznHr39l9Bi3mG9DJ4UnkI/zcAKNZwvLYTqCKvk9hM
u22HKuJQ9a1wpRKA/UrXR/YtkFkvSzKa1Mk0WO+moI2sHzOcLOQTajMAn+0uBpt2
T6jKgmsl3IlsO63KQdphWZVkU7USZX+nRPpCnYHlC7RtA+5ChMPLaXYx3paXhLPX
A4EcrlIfRoyDgWVB7MVsEjHGRFggWr8gdRfwal5uqfp65SKoA1zfp5+EXvmirwaD
u1A/qylfUK+M354XCQch5oWuzuk285ygoCcbTawO6g3zh8seGnBlx8PfSLUuiqte
dpcjrNXZB7SYZ+2l8ZzzJr0Vn+W4ww==
=lMCT
-----END PGP SIGNATURE-----

--Sig_/GEArf1HVWLLdLwZVTyAxQfO--
