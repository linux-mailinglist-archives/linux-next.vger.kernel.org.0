Return-Path: <linux-next+bounces-7475-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422AB01398
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 08:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E3A01C212CE
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 06:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829321D6DDD;
	Fri, 11 Jul 2025 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="db5ZAic5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9B1D5141;
	Fri, 11 Jul 2025 06:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752215393; cv=none; b=bACaMQ3IEr91tI5DnZV4DkBXwQJrJFVTUB/pyWAtSFiCoyhtHEEqUSEe8wYqi/nxNboCsJLQJFXlso89GBHeMz0cbKJ90k7gckjYpfKNLj/VeGzbRbFMVYXh7h9RGVAO65Qs87wgvvTSdG5gYUoMnE9absv1gU95bQ6k+VOvTzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752215393; c=relaxed/simple;
	bh=9Cfm2sCPR9UyiJjxyRMAdLa15FgAGMyJgBiWvBpl1ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hS2Dmt+8UXfsUqcsR47JB1FnLeX8jroXLw60pFoVwlhcUjwytIeAEWZ1xmbiYrAaOO/t1yUDRQ6ibEPuJQzox3THFBmB9+57QvoPMwOJL2fKWofL8PXg3T58gqFozgkBgmNZ90K9eI6bo0emKx8Tk1KxpsWjCVwMUQ4W4lylBA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=db5ZAic5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752215308;
	bh=VsZhu7e1J79oazpvxSyZlVj7mP0M2c0/U4UKNMOjxIs=;
	h=Date:From:To:Cc:Subject:From;
	b=db5ZAic5AaMN3A/BnfbhzzyzqLCw+eSIqL/ewUlkYwDxNLA/b1TypgZB+8gSHQItP
	 96lRIVCirE0Y3S2wVTWCKzdmeG6jMKS40mXZsuyl2+hgsZsjINvdpYMpwSxJvtMI06
	 Y/BTqQzzRiN0bXLZ/rJLyUNOHhPEYTnBTOmOq153hw1kQjWYrdqYGw0xc4z/RQsKM5
	 pmepdyIuI5inW6L8sl3O1bDDqB5Ua+sQ1qhA7zPYs8agjVS0oDyCYqi5RW2JwRMrS7
	 0Z/o+2uaEFmL8aJGMKn+NRJ6RXCeNYT8GGtmlZLSZyyTZ8lBw7F3je3W9EtTt9QuZB
	 heDfIU2pDlgEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdhcD0XGRz4wbb;
	Fri, 11 Jul 2025 16:28:27 +1000 (AEST)
Date: Fri, 11 Jul 2025 16:29:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the driver-core tree
Message-ID: <20250711162945.078138dc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1MbY3mNuutit0eYPuDi=Zp7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1MbY3mNuutit0eYPuDi=Zp7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the regmap tree as a different commit
(but the same patch):

  8009fb751d2c ("regmap: get rid of redundant debugfs_file_{get,put}()")

This is commit

  9f711c9321cf ("regmap: get rid of redundant debugfs_file_{get,put}()")

in the regmap tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1MbY3mNuutit0eYPuDi=Zp7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwr1kACgkQAVBC80lX
0GwkXQgAn/vez8Os+aCN1a0mb869UYfmD8I7AnVt/YX2Kw/X74lp/TgAxkrvlRrs
9hCe4RiEjpnFi9Lg2qWgEvVwjhNidyBrqpZUJuCk+iyQsssWMSahD5zwn2ckGlo2
TRATJd1AlTjMNn5g1dIpw3lN85ff1BxxDBo663QOFkQ+53Hsd3G5Wi9DG32LKyhx
nO6NOPmwCl9GMHVxGE8fs9i2M5gbW383MLph8PR22YHYuQpkuIzlVoOAp2olDXgg
/JaI1H/594IQ13vcbCS7eats3dur6BIL9zhC0Guv8WmcdOIT719wmVg4P5HTlBln
obTIgUMo2kivlmWoDPYa4jHbjiysFQ==
=vTZB
-----END PGP SIGNATURE-----

--Sig_/1MbY3mNuutit0eYPuDi=Zp7--

