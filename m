Return-Path: <linux-next+bounces-9382-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9136FCB1336
	for <lists+linux-next@lfdr.de>; Tue, 09 Dec 2025 22:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D25D0312FD08
	for <lists+linux-next@lfdr.de>; Tue,  9 Dec 2025 21:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2121031DD90;
	Tue,  9 Dec 2025 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dZjGbuZn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADF631AABD;
	Tue,  9 Dec 2025 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765315419; cv=none; b=iZ+aCuk3+cSyZJbOfDjdg5vjW+s1VcO1guPGMdyuJO/d1Io0mdew8DO/HP3msmW5dk478csopWmF7Wh95IGgXUkcwA+OBv3A928JmxFvDAOygbsl0sEgXV5Lz/zyjxqhBoig3uO/7vpi1+UxGoFnTcqHCy4I7pMAPywkd67k/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765315419; c=relaxed/simple;
	bh=DopWRulRxEitUUkEobObG3A9HS9ap3Od+TtTXqn5iSw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q0ygRYReoK46P68kQxLqFi/1ywUTv5UJR+z8JXCXxnvTE7PpnNOxz0OoXMkRWB/f/QJxLPqeazWeb+7u6m1LCGUjLDAcD9u2G/1gsp89xwqBo3YuQPWzWXmyWb8reDM8Bjo9f+IXsDYx1Fgry+WPST60Ko/8s4fEbvdc6Z/BOKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dZjGbuZn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765315414;
	bh=jgZTNRHCoC8KUupOLL1nZNCMeBS1AIQGhXJmgRq5eRE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dZjGbuZnhf7m+D7DctIDExHWSdwvqT6wlg/4XT5Ls5aSIan55VP1IGVgDe/2eUuAM
	 IxerrwJ8xAb+jvesAt+egbEBtlj0GNzcShCahtQUprzWTYXPjKN7CJnMgqQLEUrB/H
	 79IRiPgs370i04xob2dD8z2gVo/aGt7tagHzlJgpZKQfYFbiqktrorehu+kjFguPX5
	 P8ohS2PPjVqxuY0mQ0ENbecQVRKRYJ0oECk+QzKt2FkDjvRVxO+tHuOgJVMdnu0YWg
	 pLS1XprW3+Z/GrkISilf08QtlbJvPSU6U3k7xDaQIzEhQFiPkIkPPijbWtICuc8mwm
	 3SSqi0eglbGeg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dQsKL2zY2z4w9j;
	Wed, 10 Dec 2025 08:23:34 +1100 (AEDT)
Date: Wed, 10 Dec 2025 08:23:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the i2c-host-fixes tree
Message-ID: <20251210082333.1b9554b8@canb.auug.org.au>
In-Reply-To: <20251210081243.31ae8740@canb.auug.org.au>
References: <20251210081243.31ae8740@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6IlZNQM7Lij/87gQx.Q2mCs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6IlZNQM7Lij/87gQx.Q2mCs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 10 Dec 2025 08:12:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
>=20
> <elided list of hundreds of commits>
>=20
> You have managed to rebase a large amount of Linus' tree into your tree.
> You need to reset your tree to some tag in Linus' tree (abd then add
> any new commits after that.  Your tree is usuable as it is.

"unusable"

> I will drop your tree for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/6IlZNQM7Lij/87gQx.Q2mCs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk4k1UACgkQAVBC80lX
0GwBRQf/Yi6f0bwNaK4LAO6U/R6Ajh3NRCxXKcLzXepi/Us5E6xZgfPWPhN8RLi7
tLGZqeRC1EFTOrEFZKMr280YlZ+ytobmeoeh5kWvVzYrKvfZLh20asSPaOLrS1jL
JcVY4juI4RsQF5jaYCrnK0L2vixx9rmZKSad5ZH6W2z3FoJbrPMHQuGUrtORua/0
JL5S3fDMMMA4FM/dd8TKm5vh5jRxgVcAwYCqUNMEZu2e1o8zD9aJniqFO5Pw/sC8
V0UuhsE1n0nG+DAfuiErQyckqJn3UV7GdHOl5Jp3HVY+Rt2nztb6q1XcA/S3easF
lEixPxoc7RR+YfzmA+T5BgOtE/undw==
=4zUz
-----END PGP SIGNATURE-----

--Sig_/6IlZNQM7Lij/87gQx.Q2mCs--

