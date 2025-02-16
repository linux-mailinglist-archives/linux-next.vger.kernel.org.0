Return-Path: <linux-next+bounces-5457-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E79AA373E9
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 12:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F280E1890C5D
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 11:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F9B18C33B;
	Sun, 16 Feb 2025 11:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pCCqqoWy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F10318A92D;
	Sun, 16 Feb 2025 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739704281; cv=none; b=SVg8xIjDO6gBZSvx8FOVsMhIOheniBcpF/g2IiYYA8yk+9uc2PBN/TSx2A/TtXw5NLX6S0yWvS0mVHhyxqnUKhzODysCg76TCeBQMDumx4dNCtrpE2EfAl0itYTiruoimKWOjb1jyFP/gg5w1O8e/Bf7FUz5NiENu1dfPugzjps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739704281; c=relaxed/simple;
	bh=/A7Ejo3ku2G4EX883baVaHqvCxEoJPVwE25okBJLBYk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nWxfV2z6M0BpxjEUKfW5rWZZPBTyfL7J1TfIgUQYyK1hNimRzEhZA0ceG2F4CqYzjC/3oEM9PNr89H3qnwFhTOp3Yk0ZplUmTpumDeSGHn5kszN31lh2w9PtfRYZ9Y5ckbMqfSiSOHPDx4HBBWLuLImC2EJmRax1cWQyHF9iCrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pCCqqoWy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739704274;
	bh=qfgT8P3ZwJ9nIl9QN+ACGPe3OZlRqNphEhrMuyl+sG4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pCCqqoWyQKtxOfAxWRlFCvTIB7S9fKTwIBcA7DTkWYz/GSdfMNBN0hdwXwAxTkiMR
	 sXZW/geOsRs5TId+q+XgN/HybURsJn9ms8YZYm1y+sLvCUC2rCnaVrJBz6C0eqBUi8
	 c+AD2llmuoXj/VLMwY6/z0FJ02Njg/VcTbKdwh6NR1r9dSnfrv5ysV2lXC/neBjNED
	 Fr+iWvEHKKi8INrdn4z/EFYxQ6PlGPS+gy0rwZiABgKfhU/KiWcYugcIiTQJ0hnfNT
	 mvrplkXHdG76f4Im332joKZifRkCsIz0wr2juLdC9iNhYfSo0CW7xrJO2yEhVTej6P
	 EYO+N3QmVxhMQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YwjlP5CqTz4wby;
	Sun, 16 Feb 2025 22:11:13 +1100 (AEDT)
Date: Sun, 16 Feb 2025 22:11:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Dan Williams
 <dan.j.williams@intel.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jeff Layton <jlayton@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, Joel Stanley
 <joel@jms.id.au>, Kent Overstreet <kent.overstreet@linux.dev>, Linus
 Walleij <linus.walleij@linaro.org>, Nick Terrell <terrelln@fb.com>
Subject: Re: linux-next: trees being removed
Message-ID: <20250216221113.03080b52@canb.auug.org.au>
In-Reply-To: <8e27ccd9-47c4-45f0-ad93-b88d603108b4@kernel.org>
References: <20250212095632.6bdd50d7@canb.auug.org.au>
	<8e27ccd9-47c4-45f0-ad93-b88d603108b4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U0.j7O24kf=40AAp6_kd3qR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U0.j7O24kf=40AAp6_kd3qR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

On Wed, 12 Feb 2025 22:02:09 +0530 Vineet Gupta <vgupta@kernel.org> wrote:
>
> On 2/12/25 04:26, Stephen Rothwell wrote:
> > The following trees are going to be removed from linux-next because they
> > have not been updated in more than a year.  If you want a tree restored,
> > just let me know (and update its branch).
> >
> > Tree			Last commit date
> >   URL
> >   comits (if any)
> > ----			----------------
> > arc			2023-09-10 16:28:41 -0700
> >   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git#for-next=
 =20
>=20
> Ack: We don't need 2 next tending trees for ARC any longer.

This is supposed to be the development tree.  The only other one I have
is arc-current
(git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git#for-curr)
which is for bug fixes.  So do you really not do any development any more?

--=20
Cheers,
Stephen Rothwell

--Sig_/U0.j7O24kf=40AAp6_kd3qR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmexx9EACgkQAVBC80lX
0GxoHAf+PXzeXQky34sNSY4dh9dynHnupGCEIzPd0aSsEL68ru1D5eT5/UrrXVgU
q3zkZ0fKwyZsWBapCY92gVEpwsdEotqZuHdowCXQu6alBe0qQqVrNWgVCOpdrdTu
GaMlB8wsSra4b2MO2UewB5gMo3XysxzUSM/Sb9a0wI1e0gWfLAPe4J7q+lbXOsL2
qOqwg+q+tG3/09/v2RDeqX6skymIOcDLcu+FKFRkQBc1qo0ijrGg8pl00zg7kwSe
uRpGx5d73cJ8LPv/wMFcjPUJ51+I3fR/pQj9XvKDSJdW8IN+joHoyI3wRhdBmz3Q
tlE0DrVQIS5LZW4eGVyuyDDtL+cpYw==
=Ooiv
-----END PGP SIGNATURE-----

--Sig_/U0.j7O24kf=40AAp6_kd3qR--

