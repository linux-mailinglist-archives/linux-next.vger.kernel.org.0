Return-Path: <linux-next+bounces-9027-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 91198C61E72
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 23:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 434A84E4108
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 22:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464E423E23C;
	Sun, 16 Nov 2025 22:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iGD/nhk8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC12629CE1;
	Sun, 16 Nov 2025 22:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763331619; cv=none; b=g8wMkqKc+QAcVYgs7IWle+e8CTO5lrb1XQ9btaatmP061wk7LDNX7vkXoQESMhdU/nbc5Oni7dLK+Ip1TQAw20JppUFQDmT8LTZy/mxq0q4r+xw0DUYBNlvevjgGuvGcNZ/RPO7+15LTDE51T6uJmcfefOXcuPRRrHuwDAtWh20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763331619; c=relaxed/simple;
	bh=QggMBDbBDUAUxWvAMyNE6PyRjsWyzDmP67F6Liylo+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iZwy1KvhWxXj4/T8w1fPxuaPS5P1xiYMFloB7BxmJEwHK6fwTOpUv9fJWFUtOasNWezvWgXvTIdChYhOt+K7uyNHa+FS9Paza4VIjXc5AcAOzzI39lf6mgIEEmjuwO9Z8ndma3Ee0aCahRopAVbJoVSicldwAZ1TUHFqQqOQvwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iGD/nhk8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763331613;
	bh=kdf5BUlfe4VtHELymRs3zxT2rAJTVF5sw9EI6JQhNMg=;
	h=Date:From:To:Cc:Subject:From;
	b=iGD/nhk8olwZvTjM3zQ8KSnyoSdO85RMYuT6RQrTbCGWQ165IzHQXrUPeju0czafY
	 PwzquAXyP/GAzZThBTnB+blnIrbmXQc6x7cIbjMHD4WdV7Tkk8I2zzeC0DO5S5OspY
	 l3uYAbIy/wnBOslbpZOSwc7WW5N1OOrP9Q1fzs7gw2v7YlKvdQbDV4/n8zmZ3V0pB6
	 K4E/qyo+VLHRwgeswn/iLPA6V/mizIqmEhNsugvmP+aR7GyMvwa1FEe1J+wFXa7Xbc
	 cTxicvsjCJHzzUxfT6iLSw2dq9dov7r+mN8bmTNPkbJVa6tK8sWzaqkCrKT/2iZJpj
	 4RrLFckCA+j4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8lgJ2kHYz4w1j;
	Mon, 17 Nov 2025 09:20:12 +1100 (AEDT)
Date: Mon, 17 Nov 2025 09:20:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Colin Cross <ccross@android.com>, Thierry Reding <treding@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>
Subject: linux-next: manual merge of the tegra tree with Linus' tree
Message-ID: <20251117092011.2993febb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i3AJOr=gYJS6ILr3di3c/Sb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i3AJOr=gYJS6ILr3di3c/Sb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got a conflict in:

  arch/arm/configs/tegra_defconfig

between commit:

  c065b6046b34 ("Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS in all of the=
 defconfigs")

from Linus' tree and commit:

  23a29a81b44e ("ARM: tegra: Enable EXT4 for Tegra")

from the tegra tree.

I fixed it up (the latter included the former change) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/i3AJOr=gYJS6ILr3di3c/Sb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaThsACgkQAVBC80lX
0Gx7owf/WmPvdLAmXEqL4daf3XMZUG3QBftuUZOakrjCyC20r3e6gYK6y6vnrlVN
RAkB+cvfMEyZzOe79EGNh5Cvv8oJuNtVN059HPOEY/NsUL7ShqLG7RarA70daDxj
WfqhZVrxtQWeKZ8OgWnpCKAJpXXMGftgRbEYxT2/tUGofd4D6faUhQyVsaZRD884
GoZMI4hCXksAmxUm/24AtKXnFYSoKHlVEZPjTzcGsn7eKqjxgX+E46GTC+hUp6Q+
zJeSYLSYXk73ygejy+8Gg2dt8ktnMREfsYF0dVfpIRPxnIgOJtmYxwUZyO2fOn2+
ChgwxIxJNeZNzmv4nxAOc1OWdjDUpw==
=XI3e
-----END PGP SIGNATURE-----

--Sig_/i3AJOr=gYJS6ILr3di3c/Sb--

