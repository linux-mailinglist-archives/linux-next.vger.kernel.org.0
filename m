Return-Path: <linux-next+bounces-9416-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D18FCC06B5
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28D5E300C34D
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A2A213254;
	Tue, 16 Dec 2025 01:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jgssjJ3e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2973A2E413;
	Tue, 16 Dec 2025 01:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765847340; cv=none; b=bNe4wY9jxtkc5VhOaR7UDZZwx1DRZIRKMqNnSwBk8FEtgj/WvxhNt4zfj3T7+6peemzbpljAewpnL+59O+o0llurP+ttMgxFQ0ZkwiJIOqizpnCvtFQdZAqrWWjZEiPGRLrBhGGzjR3KO1zCjFDJUvPgrc3MmS1ePYbv0krnu4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765847340; c=relaxed/simple;
	bh=CAyETSgjv/+zv3hmEBHIPRgSt5hF0654ViZGmaVIj3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kmqfwBJ5Hlp6Gdi+JklTnpCu0gayAmVvSOQz8MDzow6AzVeNOtAnVx6yelhKdYtCVcU1C5KKkv8tPzfj/9Va+p/7cWVlG6fh8ataGrs9w+3W9sMowb4+/EobxKy2u2JHXSHHZp7SRmOsqf7MWmMK/QsSWFfC5v2Xy81jlwAERZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jgssjJ3e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765847335;
	bh=IcKxE9vaG88Vj/0+itm78pOBxPefGAka6uumo7b7SCA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jgssjJ3ex6ElI0nshP1AdDieXffAQ0H8HFttxasa7JyMkyD8J+zIQgCHhs17WnvRW
	 sFcmBY8bnFfpnksAUSztdX7TcT5nVfYghW9RKBqPTtQchNAK9jdwQeQeRi3VJaxVr5
	 PwhO4bdaSMFW0qMe7cT010lC90u4F4Pvp5CcN+p/t5uHxcpCOkmmzUk8n7VokL8TDb
	 FhrL5XJYc9c13ARYNKU787M/KhbqgjVASEE5JsDZAOwkVhHGCm/MDFDR5HVjkoFEEO
	 gKX6K86bT4Kk0a1jl1NKqVfu+FcoFPzZbQDD+iaVfNXiIqgzDtihiJK+jwSD4PSoEN
	 mUfEt4Q2Rn5HQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVf2b2Cwxz4wGK;
	Tue, 16 Dec 2025 12:08:55 +1100 (AEDT)
Date: Tue, 16 Dec 2025 12:08:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of Linus' tree
Message-ID: <20251216120854.3c23a566@canb.auug.org.au>
In-Reply-To: <20251127131050.1592d2f7@canb.auug.org.au>
References: <20251127131050.1592d2f7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ciXU25KSxPfK/.Qp17HQtjR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ciXU25KSxPfK/.Qp17HQtjR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 27 Nov 2025 13:10:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging Linus' tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> WARNING: include/linux/sched/mm.h:332 function parameter 'flags' not desc=
ribed in 'memalloc_flags_save'
>=20
> Introduced by commit
>=20
>   3f6d5e6a468d ("mm: introduce memalloc_flags_{save,restore}")
>=20
> This has been exposed recently after a bug was fixed that caused some
> warnings to not be reported.

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/ciXU25KSxPfK/.Qp17HQtjR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAsSYACgkQAVBC80lX
0Gwq+ggAlhrZuAnEByiV64xI7F9i+T+2TKft6J4KLjKY7+F6WLM3kei7+Ms2Ewgd
myMxHUdfDsPF78rlYvXy2nqO7XV46Tj8oGNGOu2Ht3ZKKaVQCtHZWHmiCayAxwkc
bqsBCi2Twz3+TtU7hHDlCe6d4N2VaeC1T4GkxIHVT5liJch31M7KvZ78gFQT6bz8
yLoeiQK0z7sIfUaX4pP8TV5pwP3hblvj+F8gLPRqEbqJmN8ks5IhR8af9SE4WkMn
VgiF/B49SPo/chkfV7Ij/yDZEEPBjoH/bOuHmgsSp/DbgT82nbJ9St/3u5QJGBL+
FYNQNEgxbsSNgbzN0xcJ9Kzq6fpe/A==
=hQ3q
-----END PGP SIGNATURE-----

--Sig_/ciXU25KSxPfK/.Qp17HQtjR--

