Return-Path: <linux-next+bounces-5803-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A62A63D66
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 04:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D32BE7A5881
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 03:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95D7146A60;
	Mon, 17 Mar 2025 03:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uE+lfOJq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4CF76035;
	Mon, 17 Mar 2025 03:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742183114; cv=none; b=QT5uRxzDHWNQ9QHWT4hhE92DlWXVUmoZduyGe/A52fRlLPO+ZF8F7K6MRIrgUhpLsY0FEA93sMoVu+9ucPN+6TKpcTij7zMqnwBG5Czviu7sUIKX/rHywK9eyNxrGZRx0FIddQzWbzt/6sQLNkVVQhM9ALfO5noht9iTwzAnZbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742183114; c=relaxed/simple;
	bh=H4IIC6D1YrRhQLtiIHDQRnTcqKLqaZAnYHv0tpN4wlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ckfxRvw8GJo4tISYzWh379uSxLGwBQyzwyGFIUUrZwYRMmCSwpqlP5JXXIX5onDeM0XxDJZZdCvOc2Sl1k0RUl0zufUE4WJvPaieFPs6e3A27IuxrXt7N1cPIJ7xzLbkVeV3OiPVAfOtRvk+/FmbYD2DpvTfjCyHc+yzz1hwoiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uE+lfOJq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742183108;
	bh=4ox/tp1ipH+2V3jE/Z0kDsy3exxzT4fwkJwdNMCWgCM=;
	h=Date:From:To:Cc:Subject:From;
	b=uE+lfOJqrAFSUgwcfAOnmAMI1BnJzZ5tTrVaH/237FBjksPC4PZnQ7vcrEJk7QJXi
	 M/vYYsaU8oqVAm5VQ3hH+UhSvJG2ePx3vY+DbJi+7iNpjzf5Grr6atjFCY7bPd9j6O
	 PdXWTZJ50rmnRKsrcs21WGCBDvL2nll5VO67vLkTXYJ1oAMTD2k/UqkmO7TvisY39o
	 b3R9n+qUJ3OFNSnhMRALh3OcpbtQLxybg3+0mZEJQ99NScM4FTDuZnrFS/2GWaPV94
	 WF5Ax/tN7GCMBV13C3UWwfu6lEE0i66huJiiIXRX0YDf+VhtgOa/rJgdB+JCtYWyoI
	 l17Z0V6KRdd5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGLTH6lx6z4wcQ;
	Mon, 17 Mar 2025 14:45:07 +1100 (AEDT)
Date: Mon, 17 Mar 2025 14:45:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mfd tree
Message-ID: <20250317144507.0938757b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lSmIl.k1OrI6oHefG15qlkf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lSmIl.k1OrI6oHefG15qlkf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the rockchip tree as a different commit
(but the same patch):

  7f3e3e7228bb ("dt-bindings: mfd: syscon: Add rk3528 QoS register compatib=
le")

This is commit

  19a634195c1a ("dt-bindings: mfd: syscon: Add rk3528 QoS register compatib=
le")

in the rockchip tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/lSmIl.k1OrI6oHefG15qlkf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXmsMACgkQAVBC80lX
0GxFtgf/Z5ASHW0GfDGoIwGRmIGhOBx8eOfr52my1FXPo6PgKr1nGD8IPwhikJNx
BKXMdBNkmrAvrPDVexpwxnAzuei8QZsSiOedr1hGtljRAoe2jONIYDOujZUeQ3G9
ThPT25EiXQQ265ASQ9IQoJl+3PJE/1r+7CpBtyWyNjT37Sgmjoqc7gQmbv0O4prY
7kjL1JRHf9ytAIlupZJjGDwsB+vCfkQyC/MFVXtBucmHBWzckyw9ML4Q67awFNvA
2M2DlALPlIiNFhx167RP1c+ptb3AJsW8AvSUcvfM+TkTnYEpQXf0HNv2DQMDdeyu
Sm64Ftf4a2ajnn6mAToH5BFBjc9V3Q==
=DDZA
-----END PGP SIGNATURE-----

--Sig_/lSmIl.k1OrI6oHefG15qlkf--

