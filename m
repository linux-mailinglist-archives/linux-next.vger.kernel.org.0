Return-Path: <linux-next+bounces-9522-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F28A0CF1613
	for <lists+linux-next@lfdr.de>; Sun, 04 Jan 2026 22:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67F393001837
	for <lists+linux-next@lfdr.de>; Sun,  4 Jan 2026 21:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCA83191D7;
	Sun,  4 Jan 2026 21:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M1kpHQaV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7601518C2C;
	Sun,  4 Jan 2026 21:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767563316; cv=none; b=nYzBEMU08wLepO2FCNdt51M/ZckI1ECTY9tcJyfKoaaJx1h+hM9RI+BrIy2FQDw3SKFI7MbwOFop4pcbpNPysAS1llC1sbY+LRGdW6CB5xGluVhhQ8W+fFF53hoTXy10xK8wMf4ZpcoH9EplBJ3qzLOuGcvVVYb251CINjRml0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767563316; c=relaxed/simple;
	bh=2aKUvLFi9f//FGBosOdPTejqYObXsjKENhs/7pNU9zY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hj1GdrF5Q6+FTOhD/7gpqj79IBDwpTCN7kqeYPQzxiFFCAfrcX8h8LbdAsyyHATWpxBAkInEauYCTBwFwYNyMAbQmZWeR2DGy0m85W/KyIsgwT9DaeC7bewW0HgAr/G1Dw4RT4Un5ORTsIhA0w1yPwzr3MIY3LrUHuzoXWSp9tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M1kpHQaV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767563310;
	bh=XCw7TXNV6piBI8i4H056ITM94bwOd+uABvWkeWW6ozw=;
	h=Date:From:To:Cc:Subject:From;
	b=M1kpHQaV+/bv/zqSj9BOeOlatem/Bu1lUWP5F6DZ/RDttiXcKSTeu+IpCIH0jnj/2
	 Wjhm1N52aRNZ3KfuO/tvfHXIrEQgmygdVh2abRM7ix/iRaZXE/HQpjHcILjycv3euO
	 6KjXz+SEBMHk+07yDECwn5OFusjMpCLJx6pChBFbZW+OG2Idun24IZgvmibyJnk+Qc
	 g5vIdM9aKcD4RfKhwOSJgSWBoHm3Ap9rebPK7FwJCWqxbyG/PCcOb4SrpNy9n/pJlm
	 8noZ9JW10mF+D22OzOMnyBhCepjTgxE/G3WYvZi2YHPCHcq+6C7M5HUGs6w0Ns07lE
	 SVuCqW3abzGQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dkrf64F93z4wCZ;
	Mon, 05 Jan 2026 08:48:30 +1100 (AEDT)
Date: Mon, 5 Jan 2026 08:48:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20260105084829.71c72eb8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uD/Tu4oOQynil5fe369FEi5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uD/Tu4oOQynil5fe369FEi5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different commits
(but the same patch):

  3a7cf69ce3cf ("Bluetooth: btusb: revert use of devm_kzalloc in btusb")
  3d55304c6e43 ("Bluetooth: MGMT: report BIS capability flags in supported =
settings")

These are commits

  252714f1e8bd ("Bluetooth: btusb: revert use of devm_kzalloc in btusb")
  348240e5fa90 ("Bluetooth: MGMT: report BIS capability flags in supported =
settings")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/uD/Tu4oOQynil5fe369FEi5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmla4C0ACgkQAVBC80lX
0GxzXwf+Pi2Imrt3XKCs+3f+lsnlKTNj+LXDN6IW6gBgL5+AC8Q1B+RreE5kC1CA
QhiW9vtNMXEcsL1W6pW6Lh9JIYMNao1jPADfgDNvugx/AvMVFiBY7ZMOr9pD9amR
mcv1TOqmyImFx1LaqC8aSnI0EmZXCUENE0L65CG8qNGqiiPAZpZKiXu1Y4wGHfYb
SWfYKZgEY74w3NjvAdmlBBmUCj3JqnHGvuW+anWYADFssqf3Sys2qh2h+Dmtc14i
tgGJacxcA9JpjyJhiv6bpKoYAcBHHE2Wwd3d0+yRL3xgtbopYmSvuN6+FS78Bp2U
JrcM3LUipWvir4lZxUu838FyCMjFUg==
=/p8k
-----END PGP SIGNATURE-----

--Sig_/uD/Tu4oOQynil5fe369FEi5--

