Return-Path: <linux-next+bounces-9591-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BEAD06915
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 00:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01923301D0FC
	for <lists+linux-next@lfdr.de>; Thu,  8 Jan 2026 23:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1FD333451;
	Thu,  8 Jan 2026 23:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GCJF4s4/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790D1A76DE;
	Thu,  8 Jan 2026 23:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767915884; cv=none; b=PvSiouXl4qT/xm6Qb1pq+RPz/+yIVmFLXapmTYzr1Kmp32VRKkIHho9G3KcSR4nF8kZwI+R8n+z3GHOixGyL2/lt5px9GDSyH8Eo1SdeGU67YTz611bPFab3l6/L5CGu7tY5EKgmXplMK40yScqTdBX8in/oGPQ0EFHlw8n3TWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767915884; c=relaxed/simple;
	bh=TN4Mqxxoyu3Lfpokb9Ogt0Bessa3LFlHzw1VJtYDHBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ep+b29Sp96pawRJjAOmUAsLK6PCx5rnJZWQNbh+1g49KNfwCZB51I4b2ofThkxhDgLw1VH6z9PI2hXWt4WUltZf8vrc1HIg6VH52ed+l9k+DEltmhCegQEDSu6zMnpEVJ7BBeGst4XmeL28adsL7DGRuKgLAjBzmQVE4+55AIDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GCJF4s4/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767915879;
	bh=RyYtSDC6RHkSyrak2oPVwMQVLbFEJmjm7vSuUv3gaDA=;
	h=Date:From:To:Cc:Subject:From;
	b=GCJF4s4/RkTeG6fWZl6ud/g5CXq6fFP3Lu8PyZ8gjp/7zPBTWTnEp/jTfae8ddfMt
	 VHmy09zoQTqSXl+HZC0GupuZgcpQeblqm3eoDhfkQywkaLTZPoRqCY7DRu7F3ldYia
	 zNbx6V6NbCVUeWkUEDzfwHdSE+VsLT75aIrjGPmqDUxXfP9bFmDb4qqk8WjxVXj1C6
	 AAcwbwKLudHQNV8gOrrGhv98kJbzw0gYb1v6YbpJ6FxUytdRbeC3XjR5JTtj0AG3IX
	 JUxxrdFI9QZoSL45Txa/d1Q95xt4E0wWBjU5NRg41kturfjzbVWOQE4sgao1/u/P4r
	 KrQiow+5ew8aQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dnM2F75Yfz4w2R;
	Fri, 09 Jan 2026 10:44:37 +1100 (AEDT)
Date: Fri, 9 Jan 2026 10:44:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the broadcom tree
Message-ID: <20260109104437.4ca61ef7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iAsqL4cd.EGiWYUT2.Evpuc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iAsqL4cd.EGiWYUT2.Evpuc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  87a6c3c03d46 ("arm64: dts: broadcom: bcm2712: Add watchdog DT node")
  05f790b3d235 ("arm64: dts: broadcom: bcm2712: Enable RNG")

These are commits

  37c3a91e9730 ("arm64: dts: broadcom: bcm2712: Add watchdog DT node")
  dff552ac9cda ("arm64: dts: broadcom: bcm2712: Enable RNG")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/iAsqL4cd.EGiWYUT2.Evpuc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlgQWUACgkQAVBC80lX
0GwjZAf+LApzNAszgrYoGqMAqrxKbF+1tCHS4kniFFya2JX3FapheMrkzBJdAmQ5
eFLnmI3Qv2Wu2O924JCiM1oWxQ0a2G9F7oEzJewWItkPNleNV6ilB6L4GCMxqSEI
QGa1GuSXijPOg5mMueDrhW7KSk+MCJnNWcP45SncUGMeWICZ3LvTp7MT1KnQ7bU6
n8YeMR6mTQKil/HZvL3UX/y2w5/XfYrOc2XtZBBOqVURb+Mu1JxwVHrc3gKiJeHL
eSJ0NSuDdKrpfe2tTpEUY4pgbur06qqhDVYXqC4dpyDSHIzWJBSAsCsBfB35l/Fz
dewoVKYegNDogILAcjkIywF+pnxSHQ==
=uGm/
-----END PGP SIGNATURE-----

--Sig_/iAsqL4cd.EGiWYUT2.Evpuc--

