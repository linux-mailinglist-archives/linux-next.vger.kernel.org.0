Return-Path: <linux-next+bounces-4066-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5863298E636
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 00:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0427A1F2444A
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 22:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C2E1AAD7;
	Wed,  2 Oct 2024 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iZaW5ydl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CA1198A0E;
	Wed,  2 Oct 2024 22:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727909112; cv=none; b=Od2x08ej6HHBrjxxZl3VIaN/FPY7OuLB2dLd4Rb+tsOrSRuIMkNzWVUtPX/vzRGmhw9kfA50HxP7SX4bkLSd97CHGO/8HIGQCH9pzGvFLWp8Lr+JfYVM7l6i3Q6HwQoGxirZNdi2yqrqlyM8ZLD5Ob/lTMvRr2WrWdPjdF4IyqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727909112; c=relaxed/simple;
	bh=ZHZ8vrz20n25shKFsdn8lWME/QlXbRoNkTm/lF1O5D0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MiXrVPw4EGmmQJT4CSpIs5Hmq28Y0ieIkOb5Iw5th86r44/lsTLr4Zm6US7IJXgwWwQ49HlpB/6Td7iFCXfgc9/UwQgu2qpQkZZAtaojYL3jku5zmXRD7EnspohCJk7fUVqb7gZ8rJEwqCCt2T/Q63qw7ahXxrqzxMyHqUYDG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iZaW5ydl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727909104;
	bh=gW3eMhAhFO3rKTas6A7Vn6WaKy9SbLupIddnqOddxgo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iZaW5ydl7qppnSO11F0vFSRLA7um6lbpz2oTp6u+usRDOU3OO6Ss6t4ZoRnCyizYS
	 clB51McWSyRns2nquOfeTx6uqeYnQ16APtiBp5v+eXUpqfgWlwFXwuk8hvGFlbgtYr
	 n3/m6QxTfPBS5vWMAJ+CeQkWKz85vPS/p7CESgx7gyfPJPivuhg1IIAmfmHllNEYCE
	 wXE+99tFtwWAuvzTOxzxyPqURZN6hg8QDp9zcxHWqJASDsRWe4qpMyY0N2kHhZ8iJW
	 lYJszxYW3Zl8RjDadN7b71EEUk48cdRg2FzkZJ9/NoPD0lWY9WgbWtXJrIGKBx6JVq
	 Ay1WZZU8UOUGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJqdD1647z4w2F;
	Thu,  3 Oct 2024 08:45:04 +1000 (AEST)
Date: Thu, 3 Oct 2024 08:45:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20241003084503.47f857c4@canb.auug.org.au>
In-Reply-To: <20240918152425.3105d1d1@canb.auug.org.au>
References: <20240906182906.54527fbf@canb.auug.org.au>
	<20240918152425.3105d1d1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C=WIbnWdI8LqCkyyrOR9mds";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C=WIbnWdI8LqCkyyrOR9mds
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 18 Sep 2024 15:24:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 6 Sep 2024 18:29:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > Error: Cannot open file /home/sfr/next/next/fs/netfs/io.c
> >=20
> > Introduced by commit
> >=20
> >   550bc501ff91 ("netfs: Remove fs/netfs/io.c")
> >=20
> > $ git grep -w fs/netfs/io.c
> > Documentation/filesystems/netfs_library.rst:.. kernel-doc:: fs/netfs/io=
.c =20
>=20
> That commit is now in Linus' tree, but I am still getting this warning.

I am still seeing that warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/C=WIbnWdI8LqCkyyrOR9mds
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb9zO8ACgkQAVBC80lX
0Gz/5wf7BuKjpaB9aIxV04t/c+i3F9kho/TTu85c2q3x5dqrfoabkppKJ4cT/rvE
ryh23FkjKuLhG55SCqsnDO17iqSnRjtoJ3bp2KyLT9R/zYbqMGDlVzUoy4w1d8Us
srN0bZVl6OcqPJoWBXq/UbmXzsKXELBQ75H23kRrvAxyUsymjjs3F9e8nrABfnjZ
YkBvPjndRQ3Dr76HChwob+66BqlQABqNeJ/bmg7rIhy9xs2lERPRNtcRkRdrm9AN
P60+J+8xo8DklJHc3igjTXDP1vmQ/HIEmNVMDMQgCM/5sPmNPw/2r+l45Ih9f3Lh
SE3Cu894cYm/43B9KvU5WLXJcxYJgQ==
=g7XT
-----END PGP SIGNATURE-----

--Sig_/C=WIbnWdI8LqCkyyrOR9mds--

