Return-Path: <linux-next+bounces-2166-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB258BC463
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 00:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C29CA1F21D36
	for <lists+linux-next@lfdr.de>; Sun,  5 May 2024 22:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C50136E1D;
	Sun,  5 May 2024 22:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ihum5M0n"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD69B6BB33;
	Sun,  5 May 2024 22:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714946508; cv=none; b=N/dD/p+B4WTGTmPcwHJBP9Ybw9WEC+yUBkHuKPYKEhAq0wNmEWAwBgHrzEY+ewEli1ual4fXESDFAs4ObCpIxBO0xvmSRxWyVSC4eZkz9pa7NvyLO4i7yC+4pk5oWqk5e3nFXvaAnTgDqMuH8b35JsxXc2JgFZv6fIet5rWhsF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714946508; c=relaxed/simple;
	bh=FrwPl+JWqc+HPObcFdxwqBrCB7UTUyGF3FS1XidQnag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jHTXehWm70YxffxE3wwbEkVX2JqLBIit0vw+ExxDNLKpMB+IBmM4CqFxngVkxuleP73qK1VMLDqcqh3tbuW3o56GpVMZrKLpjcvGDqatowhf6oneMRoEyhvgX7dRA86VAhOxGDRNKTIRp+VJEFI/7Fg8oSg1IYXq7YgwYwi5UKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ihum5M0n; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714946502;
	bh=NpfiwcEN18GBXSxmdSKE4DjdgpjBIfIS84mKPHakvGk=;
	h=Date:From:To:Cc:Subject:From;
	b=Ihum5M0nqXhNqvrVloo6x50mBttQ22x4fMW5lePjDrJeZ1QduCenqJ56QFy7kBeI5
	 63ApjCW5B/Gf+IfScqsohwA8VxIhZYbKVig0nETX/do6H+eRxbCM249vvcFqgk+KmP
	 NCOe9V9s7XUttymWjMkee9baSGcPwRSNHO2tY1/J4FvmgUDnlPvn3tFyHTaEuux78i
	 gybwsID1exxXBYaKZNe//1/gXtP2ucaNA0XUF3DrDc98+KdGD9ak4uOYLV/N0wWPzl
	 RdryW8VV9Knaet1aaPV9V/JIjbnVPK7Clr/C1xzrv6zGgPDNrvLGas3PQ5GqMS7DUq
	 DRJjj2xX+tIUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXdmQ2HfMz4wcR;
	Mon,  6 May 2024 08:01:40 +1000 (AEST)
Date: Mon, 6 May 2024 08:01:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Luiz Augusto von Dentz
 <luiz.von.dentz@intel.com>, Networking <netdev@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the net tree
Message-ID: <20240506080138.2f57d906@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c4uXEfQ9DHFdKnfEi_ApBE7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/c4uXEfQ9DHFdKnfEi_ApBE7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  40d442f969fb ("Bluetooth: qca: fix firmware check error path")

Fixes tag

  Fixes: f905ae0be4b7 ("Bluetooth: qca: add missing firmware sanity checks")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 2e4edfa1e2bd ("Bluetooth: qca: add missing firmware sanity checks")

--=20
Cheers,
Stephen Rothwell

--Sig_/c4uXEfQ9DHFdKnfEi_ApBE7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4AcIACgkQAVBC80lX
0Gw6Pwf/WotSkD5+J0QhhD5gLGgdPxGXRdJpBk80+UN2QBDqR6cSdEH8hT6QhWJG
kbatPK7fWnWkzgHhQIepKxywUGuGYRd8cM/4TXhIRxJvdd5zRjwxTA/9NOXywLtR
YJkvrlB62DRu5+p6piwMX2aggVqCfFSRHXm1jBKoJ0mHnaKqCuOKKlP7bt8G/nUH
5oFCFFpciiqwFS7KFkak+3zDd3fUJSkptYcx/8HDK7297uzSa5Q78r3ExYOTwEn2
hXunlN2IKGi+pWItygtTKt9XfRxspR6p1tYe63v3XZ/tds+be/SCkS+6l6BATq8N
ZDphy5FHnvjsygeg14w+/UxeRZEzSg==
=OoAo
-----END PGP SIGNATURE-----

--Sig_/c4uXEfQ9DHFdKnfEi_ApBE7--

