Return-Path: <linux-next+bounces-9414-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4304CC06A0
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DAB230115E7
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9591A16A956;
	Tue, 16 Dec 2025 01:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aIvaEKR4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BA92E413;
	Tue, 16 Dec 2025 01:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765847133; cv=none; b=C/fnrOLQYfJJd3x67mMQx0CT5YJc9HgoMq84E42eXjZjOWqufk2lf/qdDUuIKC5JeHKhXflhm5jnq2hhGmtqCPowzIlexNKB1IPOj2OqYIdaGQjuhruRp9bBdHJGZyNFCeKpXpp8vKos+DfVITwYuNFV9FxBdALxQmNt2T/YijI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765847133; c=relaxed/simple;
	bh=4bx4yX0qSJhEYCeUyk4c916Vh3a1dwIo6Z60jQiODHA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HrrlrMlOyV+9w9HkaIomBPHnXeIh+lpIC0l+DeWBjmgQ/N4EPjmUnS8cl18CVdqSlFPuDulnXpGZ1WhiV5y8DUa7W5zgiGsirOXvbj+SRJ4qsnlkN0WUfXp2xvx6gMqYEOxKUaggcoLqXEem5aKe+Tq5vCBDeojpADQ6ynYe4QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aIvaEKR4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765847129;
	bh=r7hOjIuTPBvfWKN3qAbJG8tomwZHKXkpL4hcWLjFK1M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aIvaEKR4qEbL654E+LCroSCnHZqR+oBOqb0cLhaTPgIEd6nwNHmVpmIndTKAF9LpE
	 jbmo6/DuDfdGlfbBYTQIOx5QIqxQq+piz94+xWf3rqKMgEFGMEz2Atb7ClH1zWL95R
	 cjCruDTJOXlMMeLb9s6olEVbOgTcuiVwBRMhhkAGLj+Gn24Rqz1yudgRqv6ELM15/F
	 hzxqn8uE1YePVjZwjG7KKCVfERGDWL/h6mDiqfYGRUTVYrLj6Re4A25yyllwkbfr+H
	 wNFY8ukEvyoGTuwifCz2roWBa9zfDc2SLEN6g82npkY2EqEz9t1lypAsJBka3SwGnb
	 mByDw9mNavymg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVdyd4PXPz4wGs;
	Tue, 16 Dec 2025 12:05:29 +1100 (AEDT)
Date: Tue, 16 Dec 2025 12:05:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matthew Auld <matthew.auld@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings in Linus' tree
Message-ID: <20251216120528.35df8abf@canb.auug.org.au>
In-Reply-To: <20251106151606.0b5487ca@canb.auug.org.au>
References: <20251106151606.0b5487ca@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z=v_SY=/vHDDfX8zX9pNJug";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Z=v_SY=/vHDDfX8zX9pNJug
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 6 Nov 2025 15:16:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next build (htmldocs) produced these warnings:
>=20
> WARNING: drivers/gpu/drm/drm_gpusvm.c:1229 expecting prototype for drm_gp=
usvm_range_pages_valid_unlocked(). Prototype was for drm_gpusvm_pages_valid=
_unlocked() instead
> WARNING: drivers/gpu/drm/drm_gpusvm.c:1229 function parameter 'svm_pages'=
 not described in 'drm_gpusvm_pages_valid_unlocked'
>=20
> Introduced by commit
>=20
>   6364afd532bc ("drm/gpusvm: refactor core API to use pages struct")
>=20
> "make htmldocs" was not reporting all warnings for some time.  This has
> now been fixed and these appeared today.

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z=v_SY=/vHDDfX8zX9pNJug
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAsFgACgkQAVBC80lX
0GzWIAf/aimqdA1lS39TLzEBTXB6unIqgAYmXKvSBRS+btRh4HGjPackWJ6B2Os6
+i1mxC2w6zmn0+tt3/9OAzabTDudDW8hv9m4MS+x9tk3/olmdlKCDdogaL7MH0jM
CTT1QigAAO/Te5EUYHQ6+M6r+jb7PrmPFowdo/7L+FIHphRT4Cm37hRATvBkvo2P
BiCmeyS0G8M66qwQGgMuWTqr6MpKTO2CaBz2UX612p/Rsk8r3TviQH1mXJ4bH3rY
/I7ib7a5qZTP9i+Q6MxkE1LfdpbDNCTRndftbKnmjX3Ixt6wwLFXn9ViI21e32HW
F39m7bOq8w8nGfnZWAqBwX1+IHsQCg==
=moIq
-----END PGP SIGNATURE-----

--Sig_/Z=v_SY=/vHDDfX8zX9pNJug--

