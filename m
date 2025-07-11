Return-Path: <linux-next+bounces-7472-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 253CEB0125F
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 06:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9C0E3BFA2E
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 04:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3A31A5B99;
	Fri, 11 Jul 2025 04:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RvIpb+9D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E262110E;
	Fri, 11 Jul 2025 04:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752208960; cv=none; b=j/GSeyasc+VPaqDECuZpPlITNaL3V+jmqrolLa6ul0BuCGh7FK1CARIyGpE+ZYmvy9aIRgOeOUjD0ZQHINa191qDqRBv8X4aOFuVkveTsWGvygVLfeOJdGNpVROvUge+SG66Sqsy4RPCazOISQbWzFfpGhZ94dYcQIxr5lFSxRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752208960; c=relaxed/simple;
	bh=LNaR3p2JIRTweop+jr3xdSyPokIoQbZkvtWJhXFwRMM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dT3nd6BXJCX3eWX+0Cm1gRLxaIEtx91s/xa9Pox/r9mLCB0NjsdnFhsMdaTrJe/t+naXKSRvvPmkVZ2SVAoPvimRaJoKWvIStdw9JtZ4HhEcStK8X+bEhXAjXs6Voy8P0TYvGTHwtw/iyje71LOfWnWiR1d8sYTgGYQb/OFgn9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RvIpb+9D; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752208875;
	bh=jQymZur1JYrMESNCl7bYfzi+o6CYK0z7OclHypjvAM8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RvIpb+9DBhYNzybuH2Z1wCAveLGvmsw4tL6O2HmZl5HVhyaPwinkNgmZHnepQ3xV6
	 9JyhYoY9O18P+aTjdRyw1NIez5xs7nmc++QOfMwAKXBhisU6/3qZ9/of04RYb6ppxW
	 2NAKze99BrR6LbysKB2CAPEc/IC9hqatuxUdu19ZB81HC8gNwI9jgCVcFBrT+BhucL
	 U+stXZEVwvljeXqiscd+3JZc/gFEeoM09+7GuCukYhUC/uXCK+KLoojktidGPENoK/
	 m2gojvM4QcbM7TUQpaDaJ8egjR5PI57kDpcKfX52W0mfkQdEcz2CdwPvvLpGH2HQcK
	 Y51F2tX9znjjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdfDW1Pmdz4wbx;
	Fri, 11 Jul 2025 14:41:15 +1000 (AEST)
Date: Fri, 11 Jul 2025 14:42:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the libcrypto tree with the
 libcrypto-fixes tree
Message-ID: <20250711144229.0f65529a@canb.auug.org.au>
In-Reply-To: <20250701123036.0d25bbfc@canb.auug.org.au>
References: <20250701123036.0d25bbfc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JZPEp5VBFGkgwFFt.CAcTy0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JZPEp5VBFGkgwFFt.CAcTy0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Jul 2025 12:30:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the libcrypto tree got a conflict in:
>=20
>   arch/s390/crypto/sha512_s390.c
>=20
> between commit:
>=20
>   400bd45ba798 ("crypto: s390/sha - Fix uninitialized variable in SHA-1 a=
nd SHA-2")

The above is now commit

  68279380266a ("crypto: s390/sha - Fix uninitialized variable in SHA-1 and=
 SHA-2")

in Linus' tree.

> from the libcrypto-fixes tree and commit:
>=20
>   b7b366087e0f ("lib/crypto: s390/sha512: Migrate optimized SHA-512 code =
to library")
>=20
> from the libcrypto tree.
>=20
> I fixed it up (I just deleted the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.


--=20
Cheers,
Stephen Rothwell

--Sig_/JZPEp5VBFGkgwFFt.CAcTy0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwljUACgkQAVBC80lX
0GxkTgf7BPN8DhZiuplODW2uP5Hh0V5rO80HdOIQRSvP9nwbN112SZrnhN9GRYZv
9lBncHgaTR0g6qwM2ys4o0CnnMcxf39p0G9EJiN34S8V38IcXqLz9VeOPcnbSKen
IqMBx85H1mWJun7DE8GmkH8KsSoiTTkxk0IyGDeC6qlroWzhTAv1WdAH8VNyorUR
UV2NHfwBChbxNyddmQcf5fV7DtSijqkhphYgDCFJ7hlFt4pfNdy3yjoj9E0NQmwj
2sa0tDds/1pysOPIQTwS2a/EQGgj4Gpvu68dlX3whS0FgDIaPRWl5FgkwjFJQ1rO
gMYbYYYSVWmlWbhqEIXB8LpwAjn7gQ==
=TMNm
-----END PGP SIGNATURE-----

--Sig_/JZPEp5VBFGkgwFFt.CAcTy0--

