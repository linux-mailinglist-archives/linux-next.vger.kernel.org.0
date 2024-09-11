Return-Path: <linux-next+bounces-3739-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD30974967
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 06:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F1A71C249A5
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 04:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B684D8D0;
	Wed, 11 Sep 2024 04:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gertZTuU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF2B4AEF7;
	Wed, 11 Sep 2024 04:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726030553; cv=none; b=Nu23dQyApb7lJgi2Xs8Zpx45uEADJ7hnhXy+oKxArD+9zZJuFov76dCi8eqkn6I1YnvgARfbvVPFhcMSBUo/f6+nMU6l92520BucVvmU1mVZKUQbfolBBRaqUGHE85FFR18vTQtO1qQSBmwTKUcOMhM4L5Inu5trjaRGpYppYg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726030553; c=relaxed/simple;
	bh=7ssd+heB53eV3U2jR3uH+TI5DqbL9I08y4VnLr76RSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m8P9kOGN7wrhYoN6q0LSqXnWlN1+F1LbgiElG1uOr8CfuUxCY4CEkQqjI9fNBiiAtWHGtja6fGeHQM2YJ/Xv0J7uK59P2tmrMpZoJvSaXnM1kEI/tZCCfSF6XgE+uedYuCgXZn/t1Y/n44RMaUGxIJurpZGheUNnuXqNZMVBpOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gertZTuU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726030546;
	bh=fwJwGBoAy/UOX2rjM2+nxYDSuBzlEZQ1RwjND199PXE=;
	h=Date:From:To:Cc:Subject:From;
	b=gertZTuUb8NGuICmatPHqFQLSaAjwq5O7AnCRgwQTtduLPcWBiBKzKnJt8tWEVmOj
	 sorJdQ1Eh1bb6n9CQ9YbQXgXOac6UL9UsKJT/fyoK43NpYb9HnZVpdIb6cSebGdb0R
	 diotoQcI1lB/Eyv7bDYmH36a7a6N8LUiWY2wQfsVwSpvGSTmTTY5k90q5TrBI7T6u3
	 TlM/9JH/svOMyZgr7l9qLhuPA6Lcse89fpduAtDkqDQrqAKGFAkd4ZMHAnkbtCXbKe
	 KF0ShAhL0Qn9ph2Qen1N9+2vXPrNC12u7rvbT2IMjfF4IaztMwdQYyyVRzY8rApnvn
	 rhsDAR9bQmg/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3Sv43HZfz4x4c;
	Wed, 11 Sep 2024 14:55:43 +1000 (AEST)
Date: Wed, 11 Sep 2024 14:55:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Guenter Roeck <linux@roeck-us.net>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the watchdog tree
Message-ID: <20240911145543.270c9c9c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3DhwmMw3t6zJUM1bq/euPiN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3DhwmMw3t6zJUM1bq/euPiN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the watchdog tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in drivers/watchdog/rzv2h_wdt.o

Caused by commit

  f6febd0a30b6 ("watchdog: Add Watchdog Timer driver for RZ/V2H(P)")

I have used the watchdog tree from next-20240910 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3DhwmMw3t6zJUM1bq/euPiN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhIs8ACgkQAVBC80lX
0Gxisgf+M2necKSviQOAZ8mOjS/qW0KEMOlwIRWFli4Vt/Jxf3cH22gjo1pXRkbm
+OjDcBq1A23YiZW3yhHu6g8DXgG0a5Le3TwR8a6nFwmJspfAkLmMAn289JrQfqm5
CgoWYMdnYeTyy4pdcyHdymZMUcjIaTHfA/7C3fBnSqD910stIBzuISPhgwaPig66
3csRngPHgRLBJJSbfErQ341GrDXrzIRMbt+F/n0kjpNQlColNYpnmFPLUWJTzL2g
KAOMUT16Pj9X5Q+WwF1ePk34PAnMgr6AZkXuIce8+VfUPwdknULMAJY+ukPte0Lx
xNA/rvn2t8Q2tet/CE4F4ZIVZDxl7w==
=cBCx
-----END PGP SIGNATURE-----

--Sig_/3DhwmMw3t6zJUM1bq/euPiN--

