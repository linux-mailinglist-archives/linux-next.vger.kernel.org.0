Return-Path: <linux-next+bounces-9022-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5965DC61C01
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 20:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 043F435ABD2
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 19:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47ED4257435;
	Sun, 16 Nov 2025 19:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cIVonxb/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E40A23F422;
	Sun, 16 Nov 2025 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763322921; cv=none; b=RgdhE54EOxA3e4zxlxs2BFL/iVn1DTKcKWtX5tQMqozcI2uZ/ugpke2tHWjHO428iNX4DpJFX43ev4cysWABCg00SZTTIK9Q6bovjrhrCQWhZ4I37VuGK5D2Jc0tD3KLfFgEgnRJGGOuVyJZWCYTI0TO+Ih0d+YnQ+Ag0RHtXOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763322921; c=relaxed/simple;
	bh=eSDYGVu+5itbiVHcRcHTVot0IWmSquYbf7jzOP3Xi9U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sMhlmUpiEqh+F4JuOE9VS5AqFui4gJA0aKXdJu9uR5ZexsgArAA6Gv98e4yObIN7wIaxPiVnGS72m5EX+pj68ohxELxxDUP4AcuQ1usXtiJH1WaRGq9e/Hp1t3dAMB/O++8FbXgueZWEPQjp66gRRpM0SvSFNLh993TOdv/WziY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cIVonxb/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763322916;
	bh=eSDYGVu+5itbiVHcRcHTVot0IWmSquYbf7jzOP3Xi9U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cIVonxb/plrdUCDUylmmV8q9s307h2InvEze295etsHv51TCD2pP504zaAZ87Ck7M
	 VqPsj9q2anIy+8x+ISloiABJzWowA7Q04sCvL/5PcJYjnM7rcDisSxrqSrvn9hkxon
	 jz+jvRIgiHVgRSQUHo5bVY/314k0+/TDcXUXT9TGs8fKnpn0CIDBCmsZzyoMiEGP6K
	 KecCS1hugauQhxJjas0eTJjW5aOQ1Ls01D/CrSh4iTqGo8m3gwwQqqon2J0H80Z4Ik
	 jpZ1pzW20dSRuzrLSp3L35v6iPRqV6xn0sz3dkkboSaMEaFz0pPYQHgRJlX8I60ZTh
	 LYtJ4UA15PXNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8hS374sCz4wBD;
	Mon, 17 Nov 2025 06:55:15 +1100 (AEDT)
Date: Mon, 17 Nov 2025 06:55:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20251117065515.3d5ab225@canb.auug.org.au>
In-Reply-To: <ijbweytd5eadwi6misldllxfagav5sfggfu3qylehjbhv7npbs@brqvjtzzo52j>
References: <20251114131300.21a5c6da@canb.auug.org.au>
	<ijbweytd5eadwi6misldllxfagav5sfggfu3qylehjbhv7npbs@brqvjtzzo52j>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+l_EujfuwN_94R=bG7ZA=5d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+l_EujfuwN_94R=bG7ZA=5d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Fri, 14 Nov 2025 08:24:07 -0600 Lucas De Marchi <lucas.demarchi@intel.co=
m> wrote:
>
>=20
> https://lore.kernel.org/all/3ts3e2fwom7inbu2kzrvljo5mm7wz5ruaf6daib6cf5tk=
3v4al@njzufk22tcsy
>=20
> the more correct fix here would be to drop the call and the entire
> function since the functionality inside pci made this redundant.

I have done that from today.

--=20
Cheers,
Stephen Rothwell

--Sig_/+l_EujfuwN_94R=bG7ZA=5d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaLCMACgkQAVBC80lX
0GxU4Af+OzwXmwgoPwLPHr20GlZBSI8e3eNTS8UjHdqE0tFZk5Eq+VYejGJ7gCHD
tQx7y2Ab2RJz1xGXfd/+8Tug8cPRr8sDNJi8HVIM1w4OhqGrTArDvYCi+9EgWPAg
uZuoA9xXJNoOw9QApxNsAQr84WCmCdJ8IczxapYQwmL06s6c2dCv+kCj2qJVxGBs
9igje3pvhwJi7qMPvcGxk1Yjxj2X8Q0CZrvkZa6B+sCC65LyjXV2WWRJkzm/48J8
6zmhPY2bRDY80orDe3SQ15oTwbEk+QFofuKJG8xTE8UFXvC5swaTbOyw4hiVgC8A
Nh7Ian9DPAFGS2uyb9slynyBEiPWOA==
=X4jp
-----END PGP SIGNATURE-----

--Sig_/+l_EujfuwN_94R=bG7ZA=5d--

