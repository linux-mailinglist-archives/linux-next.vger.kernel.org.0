Return-Path: <linux-next+bounces-6712-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39636AB47A8
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 00:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC0B0189EADE
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 22:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979D929993B;
	Mon, 12 May 2025 22:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rEJ+PcKc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC951DDC37;
	Mon, 12 May 2025 22:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747090339; cv=none; b=oa9H8n0gvC4SklWINUuJ6hMjUaWu1A8gbd9GX29fP21ApHgqM6bWkvT1Ln3Gqh3HfTaLxNaYoF5rd80oWu6C+70yjwh9+Ip5pwxEyHvlEyHdUCMkSXofJYTuKntc9A4dAAgb8oMv/EEPsoyLP+VAj1SHXCzLtZhm7kGgGQkugmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747090339; c=relaxed/simple;
	bh=leu+mlDNMGCNzPxPO4ejrHFNzWhgOm2nQqtCEz+xeAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gb4oO11Y4r2WjTHUOg6uFHHVHEsPaDolQv6IXDkLoAqkslQxHzn6aeLidKGAePRiV8Wuvlwfg8dFsxaqzXwwdY5fNklaJohSqpmYItWqddt1NY9I5K+EWejdTpmZWS5STDfQNwjxkXNknO6YUt1l9Aptxck8QxHttiH4zFqDRk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rEJ+PcKc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747090332;
	bh=0O/oBZQdcRLPmytkS+thWgpeFwwjmvxZ/D8xO+/uH+I=;
	h=Date:From:To:Cc:Subject:From;
	b=rEJ+PcKcQ4ul7Tx2RgZFiRwNECtiv+ps7wzGu+ownA5LHVf62iwtoikglIrbhBvzB
	 9EG7cwJKVR5tN9kauBSHZdGGVjKGcTTWNU1tR49z8Q9Z6v7leLPCBo7vLi6avZXgQB
	 H+lj7RMn0tqzzYxZQIdHPD63TQ0Audtt5ohOMkNazuV9THqkVGurolIzJaTRkL8wPy
	 /CnZ+QkP+1r3+Me7xZSUhFPT8N1sYZnToTfoRtJQVNfLqx0AdOfy6WF+UPveInCLw0
	 Tr0DM52KKdr1cnJV+1QAW4SNtCooTjCppkZwQnTTqj/KBoQ24e9SReOqcTx/lh7QEv
	 f34ujbJXfCszw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxFGz6wtCz4wd0;
	Tue, 13 May 2025 08:52:11 +1000 (AEST)
Date: Tue, 13 May 2025 08:52:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mtd tree
Message-ID: <20250513085211.3921178e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wL/mLe6_fTY_H/t4_V7ZFzn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wL/mLe6_fTY_H/t4_V7ZFzn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  38719f8046b2 ("mtd: core: always create master device")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/wL/mLe6_fTY_H/t4_V7ZFzn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgie5sACgkQAVBC80lX
0GzwkAgAmTfuh2Cfk/0xTIeNuFr/3cS4TE9iQjTcAzdZvnyFj80l1KDN+xwa6BSQ
PJT6Wj4HMsoc63ZS2Cu/0tr3QagoHNs5wNYwXRxGfBCXcQupPgBqUjWnnjZJhi4S
bz4UKCwwKo1mR4Am3tm72Klb38dyakFYrJr19Wu5b79BtVqLZ4Ih21nDj3HPceFj
pRX65fY/8HfhvkBgeik21JadwHw7UgqYUpPGSiN7Rtst3ETFshuPnLl6BddGS2bB
3ueoeXOOtspZQy/tS3ZmlX6VRupjMbRHVFRrRpJDR+47xGcV8JK3e96w9w5L32h4
MV3eyb+t4Zs1Bf70A4sI6JoCRRNgxg==
=nJYx
-----END PGP SIGNATURE-----

--Sig_/wL/mLe6_fTY_H/t4_V7ZFzn--

