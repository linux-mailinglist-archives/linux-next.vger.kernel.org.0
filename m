Return-Path: <linux-next+bounces-6426-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D54CFA9FDA0
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 01:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57CBC1A87E98
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 23:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9AF1F4720;
	Mon, 28 Apr 2025 23:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AKaE5cfu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBC88F6C;
	Mon, 28 Apr 2025 23:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745882080; cv=none; b=jr5l1knX4HGp/1mtejJXz13H4mLsgmUNjQ48QSJLNlRsigvN7mxWN5qQRHMjHsObUVpPsUCTFjB9EdhZZgYrAeujzQ5UbNDj8VbqCnLpnxIWwhifMuIwsEw7/U1bFCGyUM6M1O7mKE1KlfuIO4+DOKb/gbHN22Y25kqAH7UlkdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745882080; c=relaxed/simple;
	bh=SXcmkAUWKUFrMwdZpJHL1BdwMNMzuRh9nAdrBZzzvLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WAsDCM4hal/0VimlNGc6sV5Gm2Yr50SyPScARCo8RBOWy5QPjL/0lS7SzZXj053FngXGO8viOzKtAYgeCMPBvE8s2r73z4EPnTn9eKxnbnqsNs1xxwrwqJveg45KYPzgSXlDT2jnB3TsweUvepFrfGC5BX52T9I/f9Aa8B5vHHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AKaE5cfu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745882072;
	bh=99A6Fxife3hY7RgFVHWUrtXFA6ZaEBevx64/fimsX0w=;
	h=Date:From:To:Cc:Subject:From;
	b=AKaE5cfuqijJLRQdYosQrSROswjhn6SSIsYi1YWZXCxDqQYASIU27zRnMkrcYK+LY
	 Ix/HuoQVe7OOoBRnKWgKU3yibnkB0KKPkpxbX9EtpcoXRKNfoK1YLiJXU4f0nuYhht
	 GusTUb/hrdvPbIKGvQB6MwRjJ0U6iHb6EXrY9+avBbIv3LgC3107NOMunlnp5dG0GJ
	 HVMeTIDUX1pexjKETMFtAI6CAuNNDRNkmA7i79fJT3aMBRXNO9bbYsCBgZh2tP7CIk
	 f1XkoRAB70gRPeksDxKvRDeEV9+Bdaz+Lhfy3sQS/eIfE5j+dm1Ra+RGCqO1P5hR4b
	 T82WvJtnH79FQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmfRD4PLpz4x5k;
	Tue, 29 Apr 2025 09:14:32 +1000 (AEST)
Date: Tue, 29 Apr 2025 09:14:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the input-current tree with Linus' tree
Message-ID: <20250429091432.4d8181a9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H=+VRrNqq94JmuVrm3nYNWS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H=+VRrNqq94JmuVrm3nYNWS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the input-current tree got a conflict in:

  drivers/input/joystick/magellan.c

between commit:

  05e8d261a34e ("gcc-15: add '__nonstring' markers to byte arrays")

from Linus' tree and commit:

  936a25ef11f5 ("input/joystick: magellan: Mark __nonstring look-up table")

from the input-current tree.

I fixed it up (I just osed the latter - as it also marked the look-up
table as const) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted
for merging. You may also want to consider cooperating with the
maintainer of the conflicting tree to minimise any particularly complex
conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/H=+VRrNqq94JmuVrm3nYNWS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQC9gACgkQAVBC80lX
0GyUzAgAgYZcIZSTGRW6evYuX532S56AoiY7TFL8wlb60pZtDCt8t8Znl9DByo7Z
5qrSAOd3obarwiLERwDsavUWi7Ka4DmJUbG8LLVhD2jkW+bbAPdhxaQV07V03MIW
EIeD86zrptHYA7zRtBipBnDYhNsxbY0391Zc8hK9PPRcj/A+EWmTefw96mlJgPuy
lIsT/RJsDPQIjDKyFimjS8r7MfIcPmCq8AnVwk8kts4uWxYVreeHrokcGEk13iFn
ox3LLsFTExF53lMXlbcAMoNEszVBXNG7OgZORS1cMmEWZzyeSNEEIjoweu9+BxIP
B8uS6DCBBPj5y3Ed+7sn0GLYS9xjkA==
=aRdQ
-----END PGP SIGNATURE-----

--Sig_/H=+VRrNqq94JmuVrm3nYNWS--

