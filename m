Return-Path: <linux-next+bounces-4908-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADC89E898B
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 04:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9483164F16
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 03:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB596147C71;
	Mon,  9 Dec 2024 03:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bsHmPQU/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E120D74068;
	Mon,  9 Dec 2024 03:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733715234; cv=none; b=YK+SsX8tm0JeOFokIBq0J+aKXqcu9xgWyb9mTZ0+pXrTKLuBHZagJ4jw6bpPb7BJwVFfC5Qz+pltKcp2owKo65a08fn+ywif3Sn9tDscNBM+fO8YYtaZIwHvhXzn2HS8JxKVsPRe17A6w1BJSj+0wicIqlVyOGZgbKoT/imR7zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733715234; c=relaxed/simple;
	bh=MPcXc41KtalXlKzmD2p2Rhv6HwXqmx/6pW9KQDknxII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gP58MARxRyN/JehxMJ8EX59BoQrgGLYtYtxl6kjq6bjgczP4IZYLbcB5Y6L/J8vZlTap+Lzi0Hahc9Dvhzv5rA4E7XUNjh7yUcHStp29f0b1PuhRZLMkWUfdND3bibi6W/XgtgCpioxLh1YZW2Abf/VfhFvA/Gc5RnjMQFQrjys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bsHmPQU/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733715222;
	bh=RM/Nr+SqJ2er5tM7nLCWg5zgTscDrKkC/EksxsWHCzs=;
	h=Date:From:To:Cc:Subject:From;
	b=bsHmPQU/o56KAS+vNfDW4sY/1VJo8E3iRbHaeRnqn7Nwmk8KXB5FmXqEm958+RJiq
	 P/wqqHxOZAxtIvpjI3XSz7lYaT4bYqr52GkG4cdFNYWGfQ3T/VthiSccNLvMB0b1yE
	 zHbYhBsnMVwwKzE9D/50EGJg3elgna9b9nqsRDHMb5besnY9LN8Poyf51DibRBkFqz
	 wiBFewubLtIaFHLDhbs+Yb0WE7gOFnaJLRRWjfQ7UApdBz0MskSkywcy/JHYFXNFtc
	 mNNMdMt4QL22Wbhs/kGIcOeGyxjSCClREEX3shPnYj381wbBvG1F52iczjG5C78b2A
	 sOJNe2r+GXiLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y66sK4Z5Hz4w2R;
	Mon,  9 Dec 2024 14:33:41 +1100 (AEDT)
Date: Mon, 9 Dec 2024 14:33:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the phy-next tree
Message-ID: <20241209143345.14341034@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oT1X4HBLshKNZqur8/EPFGS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oT1X4HBLshKNZqur8/EPFGS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the usb.current tree as a different commit
(but the same patch):

  2318ca599459 ("dt-bindings: phy: imx8mq-usb: correct reference to usb-swi=
tch.yaml")

This is commit

  282615d13344 ("dt-bindings: phy: imx8mq-usb: correct reference to usb-swi=
tch.yaml")

in the usb.current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/oT1X4HBLshKNZqur8/EPFGS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWZRkACgkQAVBC80lX
0Gzo3Af/RZmzFD4dSPGGADUQvFhCnbNcmMfu8DE+ElPOIpzbAoJdjeNvE/3f2j8z
RY0E+nNZ/HYrKLEJo/xoQ4dCVCEz1UDYWVyqXA574XZEKErew8czmNgHIHOfZBMC
1VTk1OllWCmHs3I24HdMXjOvtsYUhQ1cm0tzrpBkjSesHyuclr7LBgc4s6TpBpfZ
c9PMlsKlPLERDZ0vhZaWiAsIHy6YM+7JdqZxxv7gAxAFkcBRFG34e8yI9GvadX1e
nDsaXkEzUCK0foMWI13Ng11KFroRAYgs6a79OwAFhC4MZu7IfjUOoTehE+Jf3mgV
HMp2jcDGYtGwhi5ikhpaT2bzIRhbqQ==
=uRjJ
-----END PGP SIGNATURE-----

--Sig_/oT1X4HBLshKNZqur8/EPFGS--

