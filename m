Return-Path: <linux-next+bounces-3581-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AD996B08A
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 07:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A42391C21E4A
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 05:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34F7824AD;
	Wed,  4 Sep 2024 05:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VDyR/DlF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7EA5B1E0;
	Wed,  4 Sep 2024 05:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725428239; cv=none; b=CT6+GxekoadtW+0HX8RPtk2sQQnsHsYijx3PEfR7yrGmIQcSTLPIh6bvU0G9YDWK5pXG2aLLT3qrIrxUAxw5kkGJvDNLwdX0okgt5DqlhyGstxqtEoyWxbXPJ+t0xlatCOHpyXnlJWtHsP45qoZ18Og6dCdQnTAXjfhv3HDgFeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725428239; c=relaxed/simple;
	bh=bLi1Pu72cpayQFI026IqpOSsCKCLiUuAN0Sa0tHcUWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Te7XZg4qTWY482AFWy7YPMCsAU86FMt8zIRSoCREYEjOUUAKCsLHfMSJmTE7FVoldf+LQlgAAfAHjKClAZSAPErgBvH4IVI3p6BnFYOQ91cnan+oEGqjrsAPhTy38beufjYzNoIhJkppKGHGI6bZvuD9anWgr6QUiI9vuoIfsGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VDyR/DlF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725428234;
	bh=h3imukzKigdtkLdxVeVYZBYEjR/OlTE2nGsws7rySuk=;
	h=Date:From:To:Cc:Subject:From;
	b=VDyR/DlF1n/2tsoY/SgCRiRb8cl5Gc3mXovYYPgN2lB4Mc+b5OqPGLmH4zmX5vGgi
	 lwvevRc9n5oL4SunW1jD0D6fIDHjMRdy19p3gnoZPv0rlvCRIvlq/wQjvEvedd0F4V
	 /Yn3uvZzxRWNr3RCXGmHu+fhHAFRHi+35J8lFYbYOmCyBAaghL/tPiFV2pGvhapsdj
	 HIvGkHLETtSiJlT4KoLT6NqFZ9FVbh1k6JrZ606HzmA1BpBlXeWHx7Bf+5Mj015tSh
	 +fva+sbCIoZ4A7ZM+VjwUl20nGHjgu6cAdXAhYaFaHo12wT4w5AjEPZjx32plSR2lE
	 hee9wfPFR+M8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzB8B0p6vz4wp0;
	Wed,  4 Sep 2024 15:37:13 +1000 (AEST)
Date: Wed, 4 Sep 2024 15:37:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srini Kandagatla <srinivas.kandagatla@linaro.org>, Greg KH
 <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the fastrpc tree
Message-ID: <20240904153713.4dc28982@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xU67MqDPFf=h15cBR/o91OO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xU67MqDPFf=h15cBR/o91OO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc.current tree as a different
commit (but the same patch):

  b056e4e23acb ("misc: fastrpc: Fix double free of 'buf' in error path")

This is commit

  e8c276d4dc0e ("misc: fastrpc: Fix double free of 'buf' in error path")

in the char-misc.current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/xU67MqDPFf=h15cBR/o91OO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbX8gkACgkQAVBC80lX
0Gw3AQf9F8GbPYDbnRyneZMZS6Ny8qxtv5fM88BVucjmNfynbSk6RcM9PauppHd5
gbD0YQi/0dJ468sYlDy2cc3iGe/pSXwLHVUWiwaAeY3uSujN5sj/xevWKeorV912
5sOdY6JVaYEhuCQJMq9dRW4k1rkq3FHisWx2niyq4gPxzOLGLLP/h2Kp//4WcnTH
d9Vo0QHSgo0VLrPPCboDElPkxMK4yjeDBQYRrbTcoBvLIPAMrO2BGmpcTdCv6Opw
9DnQisLCmmVF904p0vIaqivnuTyNJjQfjaWp5wmubxRhS6TroETAiBfKssaprzHV
zkdcbpa1FU7fOGU6OykwwvkhqEiazg==
=ZK+K
-----END PGP SIGNATURE-----

--Sig_/xU67MqDPFf=h15cBR/o91OO--

