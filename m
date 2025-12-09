Return-Path: <linux-next+bounces-9381-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC7DCB1220
	for <lists+linux-next@lfdr.de>; Tue, 09 Dec 2025 22:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D98F3060188
	for <lists+linux-next@lfdr.de>; Tue,  9 Dec 2025 21:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDE9261B9C;
	Tue,  9 Dec 2025 21:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EBu58wUf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C437B273D6D;
	Tue,  9 Dec 2025 21:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765314771; cv=none; b=UjKX0kimPCBiuJ2juRkGtdGK+x7I5Bz0T8fE6CHb1q4MM+//cGopDlPv2mdgRZRIbLC442ya4w6ScIulUAu8XSr1urePYU7Tg56z0/DoCfuhMQXylRuQEdvkUmCWdj8IsVHbrlV3OLX+UB3pFuiTouyahagPcsy+y7+kQIl2sG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765314771; c=relaxed/simple;
	bh=IbfU1nxVYwzSo69/0usT2ytBJDcecwT+CGIsX8gdJ6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VsQ2dAcxA9Ms+b0IJsX+aP5ml2ShVyGwzCIJh4xVn6qPBMGUxaGKKMzNMsLU3dUFsZuaEMXlGPLQD6Y9amyQZMNQ/xkyA8ZM08TLZ/Dgpy8BDue67zUtAOatECgrWeRKDeJ7FBRYbmgbRce/htOcUbGWlojZ53GO/60p0GkPTK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EBu58wUf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765314764;
	bh=be58LICoTuw27TQtNcJUpqX1/BRZHvWTNJ0fjRbcW6c=;
	h=Date:From:To:Cc:Subject:From;
	b=EBu58wUf7Bo3M8blMkevkuCFzcbOGvlB/50jhglaub76tFubpp4nfA6T+iWmj9pS8
	 +wJNE8DnkqPcYwdXpaIzG2C7gfaQkyyv1/YFro1kv1W24cHTNBxLdvfrl1jzEX5WDG
	 b4OqrGd4lgtocdwp9knvZh1C8q/n4r8f2egRch9WUCecibjn9vWHu98AexZUZkNyiv
	 LB7gCQstVpTQNi/DtrnT+a4jmRhGnxYiE9V8H9rhyw6CqPPyER1ua47TGrmWNzc/KZ
	 YPWotr0ALiVAlkl7S4RfPX2x3Y7h3c+hpD2B+O/NMN7rgM+b2HPQe0AHTOF32EK68X
	 WhWI4hfIN5Rgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dQs4r2JP8z4wHF;
	Wed, 10 Dec 2025 08:12:44 +1100 (AEDT)
Date: Wed, 10 Dec 2025 08:12:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the i2c-host-fixes tree
Message-ID: <20251210081243.31ae8740@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Zk73XTnUhKD=Sg9NBxu7XD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1Zk73XTnUhKD=Sg9NBxu7XD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

<elided list of hundreds of commits>

You have managed to rebase a large amount of Linus' tree into your tree.
You need to reset your tree to some tag in Linus' tree (abd then add
any new commits after that.  Your tree is usuable as it is.

I will drop your tree for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/1Zk73XTnUhKD=Sg9NBxu7XD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk4kMsACgkQAVBC80lX
0GzVqAgAgjpiPxGdoixIPTgqYlVGlXsCumpCRgW1WFJHeMtnaEPovLYgQqXVLW11
J/mUWe5LVjUsCRZ9x1Gq95jV9I6mOp2i47ywZgg6l3VJrdaZPi4A4P294BH7b2xz
b54Orcc6bMC/F/bd50KtRo/Xj17MDKJU7HL+cyaly+rGgmBodKL+xlzY1V0gKhuW
UK0rWa53MFLbhQ+hUk256QWvWiVpzIfM9XidgMIcrKpDmS7/QFzvu9YydlaRddNB
S38T3yi/HR6pnrxooqp7YhcuQ0Akl5UYEu5OVlhcnGWPfKuklc+AArDe6GNucc3l
u/6F7nA+INa1/AknAt3yllTwmRuFGA==
=2YC3
-----END PGP SIGNATURE-----

--Sig_/1Zk73XTnUhKD=Sg9NBxu7XD--

