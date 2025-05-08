Return-Path: <linux-next+bounces-6618-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9998AAB0579
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 23:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19085523793
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 21:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297A72222C5;
	Thu,  8 May 2025 21:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GHYtCMHH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A852A2236EB;
	Thu,  8 May 2025 21:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746740669; cv=none; b=EQB1oQ3Ayqrri+A5V5jG0fARwxOZOk8oc9jg//WIdAFiTDkucniLLaZWYjrKt6s14D88iJ0DdD+L4QfocUQuz0HphPacEZRCqfqfSyifPcfMIgpiM31jVz+7cL/eXRfiewWwbugMPuq1fZGAjSMnJA5US5mmLdSxtnOL0KAsC+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746740669; c=relaxed/simple;
	bh=r60Q6oOHc13fi6kMuHzPHXQmB8KxMckKssS5xTywd4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B6JBiCDW07dKnYArc3t5l1zpMfzHnolRl3ktNrVt7izaaW7nDrdtLrAFKWbEGDr+wpSfusoTl+YEtZfGu97lmtYrBh9CMkOQneqv3H2ks6yQLohcLX8g191vlX0Q1/zAJ4+XgmawwTFyKgqw42ABpuF5QASe2i7exAYIdr7U4ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GHYtCMHH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746740660;
	bh=b30cAf0HlKZ41HJeMtOxc9R39dOx2HMgbAgXvchRW18=;
	h=Date:From:To:Cc:Subject:From;
	b=GHYtCMHHdhaAl3PnGJL0FL4GJihWxFkOD2BAmc2EeIY7skbYPDoAquzhwWwPk6NWi
	 RM5F2PMDHp5ZQq8G4BJYa1FjsM8hDyeWXnaXbtEricn7ATrLN/wKk/ZWnF1kxujdm9
	 AQRrA4TIkj0gP2lKF1j4RgxVspkg5DFa8JMcAPYtoohdFJSwQfoo6UrOLuGeQqcR2S
	 uQw4IbG3Wti6uUCrGqBIXR4jnuTUDNJ6XVzUQFFUYceGh/euhoHXGK0XAdpETL2GRY
	 jE7CFqI0J34nBXINWMA4cK4A3cyRsx+/+VfkqcquuRRnM46voJ9tdZ/3EketjwSOPT
	 imd2nx8P3lC6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtlyX0mbmz4wcr;
	Fri,  9 May 2025 07:44:19 +1000 (AEST)
Date: Fri, 9 May 2025 07:44:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: gldrk <me@rarity.fan>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pm tree
Message-ID: <20250509074417.1accacbd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HFzHmAC6eUSk6fyc_U+gicg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HFzHmAC6eUSk6fyc_U+gicg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8979b0e76718 ("ACPICA: utilities: Fix overflow check in vsnprintf()")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/HFzHmAC6eUSk6fyc_U+gicg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgdJbIACgkQAVBC80lX
0GxAxwgAmNzdKj/fZeujhsoM9tKrWkuNKMQwFTjQVWEbuO4tI1AS2Z//fCzKR6PB
O+yPGKoJpCRUHFf9opmdB+bkSznNxYka8D60pCvVQQZ5r5AW+MAL4GXJvOqjWe/p
D1cB5JL9co03NCIXPf8dXTbWZhcP+0GoAwEMRZQH8Nq+0przq+vACYSYXnNLCmF3
B4ES+TjcrzIsykAjez3Mi+UL9uA7UD3Gu+7q4T9sCtjxGwgDUCI9AkRM7fNPPFXs
Kj/4KPdoM2igD0pugQT3DTwOFe5YEerQaEFfu7YmmzpGj7jMxvUG91MCjKdzrRcH
oxpllwQGLOuKzl72txjUX3zARCTm3g==
=s3U2
-----END PGP SIGNATURE-----

--Sig_/HFzHmAC6eUSk6fyc_U+gicg--

