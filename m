Return-Path: <linux-next+bounces-5218-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48394A12F10
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 00:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2F3B3A5D91
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 23:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587F51DDA32;
	Wed, 15 Jan 2025 23:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PgVGDPUJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F281D0E27;
	Wed, 15 Jan 2025 23:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736983344; cv=none; b=S0qf35b773zUY51nUv5DcGD4gQQMUDUMiVPcMoNYhSBJaW3g3aELlViruZmsqOCePD3CPymzPHa3Jl/9nhakdeo7sqNptfI627BQdlKFgMxEzD75bLY7t1aEdA0qCTj3tSGNrGxgR1oZryvxJZ4xiE3hA6gX+3MoDcdTQ1WwyfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736983344; c=relaxed/simple;
	bh=zmUjAcXXXTaleEwqYUIr7UHqWfJPGtNQO9YvTnWF41w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rMibpSebv0t0XqmL4l+shMBa3S0ujvC3t0Kf3mFkDYWfICS+KHgFZkQSNfSBj+4ulKm/TS3JIJITKz4AXuF6ob1UbPL0BQ6QfBaMQKFmlHhfthAt5suwdgMY8C1xabNU9fqu7qju0zkXHtwp20bxugVEKQ33o2osit0vi8YKmbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PgVGDPUJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736983322;
	bh=PWwbiMBvDkXBwegeV2Eg+Gv/y8zGnbE04ATb5NSR/cE=;
	h=Date:From:To:Cc:Subject:From;
	b=PgVGDPUJkVxIMbBu5k+ZEWpQMo4aAvyFMaV4o2uqeaBOPFAL8WmvI/G4bo5oKCq2a
	 Tq6K+vNRJCAsfjbwr1//ZMYcMZfvenF5oeYytr7Y9qeaM6gdi9eCCPcw7MzScZqtDE
	 Y17JK7oZS6CbepEoQCMFhlUYUm5vW0S4snWCZXEaZQeFs4ix5N2xXvMjsvhze+r85q
	 ROlppy+WJ9gdQVH6Hlu8dtCJWWdW1yFaUUITj9jrvkAjQpVZmS55707+PqKMhf0qed
	 ZC6qecTGrv356Bef5shvu32SOeOr+DLX/Eao32DJlWMDMKNMoks+z+BSKkGlKcFU/u
	 FkcMweQFYnB4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYMTP2PCJz4wcl;
	Thu, 16 Jan 2025 10:22:00 +1100 (AEDT)
Date: Thu, 16 Jan 2025 10:21:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the reset-fixes tree
Message-ID: <20250116102149.0b0feb88@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C.PfM.EaT+k9g/6xtglaZ3B";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C.PfM.EaT+k9g/6xtglaZ3B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  055884c45d5f ("reset: rzg2l-usbphy-ctrl: Assign proper of node to the all=
ocated device")

This is commit

  1f8af9712413 ("reset: rzg2l-usbphy-ctrl: Assign proper of node to the all=
ocated device")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/C.PfM.EaT+k9g/6xtglaZ3B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeIQw0ACgkQAVBC80lX
0GyXSAf9Fq9c622mulz6lj6m3+w028dMOhYiEzY0NG/b0d2Oep7AqZwXgZVy40Ij
9l0y5hsQyLkAmr3gTWrI3g3k8cGfPSPMFmbO+XzVluP+1ySYaSU1OLrt6ErOMmR2
duPp/9VQ53HW/Mh+JElWRrX9hp2RPgaXfHQTTsLXlVgFH+h3Me6/4w1lbtgc4n4U
cH+XU03rqFT/Zgh8Q+sJLEuliHXR/1+52ifRIkH6dirvBTj1K9t2tbHUMN1cbgML
TxkqmAd1GuPLt5b9azUJ5oHFqr+TAIPWkjAOID2Ppo1xTD+YMkaF33/vjm0NE026
6CMNPO/i90cuiC7t2DCBUNeX12d9zA==
=hTkW
-----END PGP SIGNATURE-----

--Sig_/C.PfM.EaT+k9g/6xtglaZ3B--

