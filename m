Return-Path: <linux-next+bounces-3613-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA52F96D262
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 10:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2C991C23101
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 08:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D93D1898E4;
	Thu,  5 Sep 2024 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DtuqXX7V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31DB15531A;
	Thu,  5 Sep 2024 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725525666; cv=none; b=oRG+b1AHI7UEsqRNx/U+Y//W01wTasixsGHSX+vp5RW6kSK9ZtDz2xLPH2DY3sMWRMWq27//FueAkWru/GR5wma1mvvXJasB9M51epV3c+cBMaw3EO01XeHgd+f+PmtReRm96i1H4ZY5QN06KnbjDNDLr+GAeoE/Iv/3Zvl937E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725525666; c=relaxed/simple;
	bh=MIk5eecgLKUNxL92w9oDsmlIObv2Z9r0Gms8hTPiyRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XVPSdDoWbGj/2FHMtLJtKp7kAy4j2GpJYjlOdRK7RaUWPnyjqPk4TOskb4tZ3RcJytFKJ/XygI9pF8YNOTlO3iQ0Zr0U2IiAHkgqdwhPDf+6CTze3URDxJBsZZQQpYLm5DfFlREEaLUwHxqD+6wq2DtBdlJNTbfvvDAC8CpjS9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DtuqXX7V; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725525660;
	bh=0WPOe0euIe4Z3oUWtlbjRF4sGihEkgeMr9W7mK/Cc6s=;
	h=Date:From:To:Cc:Subject:From;
	b=DtuqXX7VmbRB4+yjZ70d26hz011Hesegi9nC1GBCokG9IZoCGoXB1r4djLf+B0PTC
	 TAOcVpEO9Ig3WhaA8Tc31zN5HNZ09oIzDhx5F3C1HZTzFDlKnNdOso2AezS/JDiG1e
	 qjQisZgJAVHLNYYsr2/ULNp7iGMLJuS+nSaxSj/51MsbW1PDtEJGk4CsuUnRDh2MXC
	 Sorvxy9i3qSzf1W3q1s16TUc5lWCIW4i+ahzezsHnuRuL0KKOsFqZIPevMxi/UBOMU
	 0djBrI04QwhYv8ga53lo+3tiyay9xUO5S9TxwfWmnGqEBXVIVn41AXq60AyWJ5dxsS
	 FXAabgcMmRUMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wzt9m1mvxz4w2N;
	Thu,  5 Sep 2024 18:41:00 +1000 (AEST)
Date: Thu, 5 Sep 2024 18:40:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Luebbe
 <jlu@pengutronix.de>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20240905184059.0f30ff9a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BdtE3n5eEXMNymSV.rfJq=t";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BdtE3n5eEXMNymSV.rfJq=t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/filesystems/9p.rst:99: ERROR: Unexpected indentation.

Introduced by commit

  673f0c3ffc75 ("tools: usb: p9_fwd: add usb gadget packet forwarder script=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/BdtE3n5eEXMNymSV.rfJq=t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbZbpsACgkQAVBC80lX
0Gx2CAgApVs5TxGDii2RmFmjGgVDBBinVWpEITVa42IQNMSRLhtrFFaXNf3T4cPJ
CfYhkzFzA1+b4o91FynuNG/FLPFE9AGTKL2s5HdeeYSBqnZ8mWaJxFryXaLtJLPS
xdu4G9FHF/y2dFaQ431YVli4o1RajMoRooch/lmBdE6ikv4gx+xJMjm4cBiYCnIu
971rFTdzFsN5GMrl+Pn3DM5cVt39bTBxzPGJHBgFZ52mBQDVoo8CK84H8sjhozie
tpS5qI7xMQaPDAXachYip14CXXr3cyONZrWrCtal+XzVhSYwW0xubJoO7D62jRep
d0KepiWqIGUr5Vl6K0afXDsIidPnKw==
=76Hj
-----END PGP SIGNATURE-----

--Sig_/BdtE3n5eEXMNymSV.rfJq=t--

