Return-Path: <linux-next+bounces-8633-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C10BEEC76
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 22:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E05C0189982A
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 20:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCA52253F2;
	Sun, 19 Oct 2025 20:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ITpuq3MS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71853148832;
	Sun, 19 Oct 2025 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760907463; cv=none; b=WqijwxF2M6V/32+lykGY7RCBp2YMPdTPCWRrArH4Az/RGLqu9Dyh76qLc9SGJJ7/Wq3PaOSfnsZovKR4Qq618ftIRReWwrX60FFzewHaRV3i5v+dedL7BMjqEepLQlhpNkl0Gq/CQTGZOhcIfArw+pSSEuPc+Sk1uuDzv/GcuoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760907463; c=relaxed/simple;
	bh=I+N0k31FfV2RRJUGcE30M3Bnzvpzh2014i9crKXd2QE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VPZjKJHVoUIhAMfa8qw1TzNq4EBVzJG9XtovlUadzVLOhSu/51fbMTJCVkRmBIiP+FALvfnjCoSet1WZI7ZaNzJPg7xVKeQNZbfNThYVPwqQ0eJMyMqNxP9TVaDrxbvM8M4L56AiOM1xgKGt5RY1SFZ9Axi953p/WkE3/eBID58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ITpuq3MS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760907459;
	bh=I+N0k31FfV2RRJUGcE30M3Bnzvpzh2014i9crKXd2QE=;
	h=Date:From:To:Cc:Subject:From;
	b=ITpuq3MSyANkm41DqZxTsVrnb9WWr6MDOynmDH06XfVKXGvVQJzgAyN2RTy/GE7Y+
	 O78PSLI6vOQ8YP28XVWKXC/MZGvk6HVzxJeg0fNUo2qL0Kq87WUfjc7kL6jSOmt5Sg
	 3D0ulu1NA0TaFn0tzLhw/uUyxzPHBOsoHBWc19Q6QMZhOPEJvIagRCO7EeUErt1BCk
	 gSIqPdh0qudNMR+imko3E9bkA2LzlvYXQhdLJwaToIBtEBjs/vqKsqBg/o9jIclWph
	 hw4E/stQP85Z/IR01libDjz0OBkbC6qJWxgCKynRJuZfsPqQv3gNMTPIijwvJl2Iv9
	 RK7K1csrGjymA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqW8z3w4pz4wB8;
	Mon, 20 Oct 2025 07:57:39 +1100 (AEDT)
Date: Mon, 20 Oct 2025 07:57:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Serge Hallyn <sergeh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: failed to fetch the capabilities-next tree
Message-ID: <20251020075738.2de7288c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FJ3ewj_ZyEF12Dqy1CNZ+9k";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FJ3ewj_ZyEF12Dqy1CNZ+9k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the capabilities-next tree
(https://git.kernel.org/pub/scm/linux/kernel/git/sergeh/linux.git#caps-next)
produces this error:

fetch_git: Could not fetch capabilities-next branch caps-next

--=20
Cheers,
Stephen Rothwell

--Sig_/FJ3ewj_ZyEF12Dqy1CNZ+9k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1UMMACgkQAVBC80lX
0GwPAwf+JtXpjztb7DTxV/hVDzxb2rlQMcYG+HgsRAWerGuFpeGoT9/mND5Eiwoh
tBirOd50uHokok8l0nJ/YH1I5t7WuvQYX5ehHOjMMhd2WG1HWrNivrK4XxeFD4vJ
fWsSM85fesAEudG7Bd44i2vZ3WUjq51FpP3CGegX40k017IT1AWRrOM7v6bOpNjt
Ixc1dqmU+Oels6GcuYpKO2GR38pFhJ9ht8i1k+QU1Ru4AjyhwGnzTa1MOY6mKPob
25a6zw62cWaXOWB0lGZavAzsYOgwHnTMVLWweFaKkt8HcxxMj2BWXOcagfkgM+RO
iG3aRHWtHH+/7YwUwGBpPBx/oja9Zg==
=Ztfj
-----END PGP SIGNATURE-----

--Sig_/FJ3ewj_ZyEF12Dqy1CNZ+9k--

