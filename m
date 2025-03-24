Return-Path: <linux-next+bounces-5952-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EACA6D710
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 10:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6E58189342F
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 09:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A15525DAE1;
	Mon, 24 Mar 2025 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZjLjKw4v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A045925DAE3;
	Mon, 24 Mar 2025 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742807479; cv=none; b=HwANiFY17QdJ2AE6o/lq2aTQLY4cVcKmIq0RtYCOymh5+INqEEgorRsnxOxdLrk3KiC/1b0+kVUC2QthOx7MKlvrN6p10lxYyVoiPy9rtTTLuPsIwETgybHqmX6ZPzxgEorHBfmPn4CiRwVIK6fNVpUCZZWFnzs8g8XHusyS2SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742807479; c=relaxed/simple;
	bh=c2V/foXd8Y8I5J00tmEhAj3HFvHDCfANAXL7yHux4KI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pGUbLHjEmbsm8qOg5+GVYIrmuzDy4xY7oIOKKV83zGEroA2LzJoV3LoszHmT3wl0Akl8ZrtSu3TVOyGsfuUPVxX8UlwpWGCLFB9v01DheW7AlMFh9aUiVDzm24qk1NxPPYG1J5g0pmx3Atf2J9I3Cf5cWEgTMQWtCKoFXFu/O+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZjLjKw4v; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742807473;
	bh=8I2Rfki8ck3LGviF8y8uyCWEm9lyS/MFHmJWniVmVYM=;
	h=Date:From:To:Cc:Subject:From;
	b=ZjLjKw4vDlBGnMcUXzVQVb5bCDkKisRY/fH9yOZfqZXGcde+xGCGea5f2O7vVB0Nu
	 +Lwtc40LX1s/C1nvrDjwbe744XENvYdebr8deiI05I5dHOxRtH4MpGaNp6T65a44yf
	 /hZjsj0PiBIA++XtNPTNKcyEax8RZe/Mv/odwYKxHu6LB3snSKgi03pjXalGcfg+W0
	 V8KBDjJR0f+wnqs6ud6tIBQigPrd+fve1V18o52IYbfdlLTmRJWLMid258Bvn8rCEc
	 dgrWhmmwoEUEnvNUt/sN2o30uK25rOAdcbBDxKlFfhOpK64Y1941q4QkAl3xL7QMDj
	 mMFBiwf5OY8TQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLnNJ2CfJz4wcd;
	Mon, 24 Mar 2025 20:11:12 +1100 (AEDT)
Date: Mon, 24 Mar 2025 20:11:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nick Terrell <terrelln@fb.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nick Terrell <terrelln@meta.com>
Subject: linux-next: manual merge of the zstd tree with the tip tree
Message-ID: <20250324201111.26dd80db@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/44KvIFXA.0GcdzM/r.fNVg_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/44KvIFXA.0GcdzM/r.fNVg_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the zstd tree got a conflict in:

  lib/zstd/common/portability_macros.h

between commit:

  1400c87e6cac ("zstd: Increase DYNAMIC_BMI2 GCC version cutoff from 4.8 to=
 11.0 to work around compiler segfault")

from the tip tree and commit:

  091697666ab0 ("zstd: Work around gcc segfault on versions older than 11.4=
")

from the zstd tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/44KvIFXA.0GcdzM/r.fNVg_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfhIa8ACgkQAVBC80lX
0Gw6JggApjtsJnnBx4OH8S0ogv0rgHCZKQ05b88O9BfKPmPsl08Mm+k88N0qBSsk
pE+LDX2CBICMIB3ykyfxogVHm58Q8zXQF8rIJ6Tp16ob6xC84zYYbcRsWHMU+01V
NUxFY4UG54vHWWKjlGYXgTQEG1t1P9dDeTBq4BQt9CWMc/+3PSJrKZUB78n1MVh6
huUxcN2eB6Ol7bpI0WsfT/xXvqseomk61+IvoepR8Ur9p+fz0tciTK0vCALPbQ60
/F5CxHY2i02N6vymvYFeeORj3D1UqJml1L+/Bfw1lktpNvFZkHr3XNCmZ7xEjehL
N/RuRhU7R8B6Ldq+ezuV6+HoFdqLpw==
=fBGW
-----END PGP SIGNATURE-----

--Sig_/44KvIFXA.0GcdzM/r.fNVg_--

