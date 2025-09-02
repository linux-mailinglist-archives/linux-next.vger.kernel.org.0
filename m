Return-Path: <linux-next+bounces-8171-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CCAB410BB
	for <lists+linux-next@lfdr.de>; Wed,  3 Sep 2025 01:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0985C166DAF
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 23:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E3C2777FC;
	Tue,  2 Sep 2025 23:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DXMIX2OJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71C13D987;
	Tue,  2 Sep 2025 23:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756855431; cv=none; b=bzt6Zw3Y7oiaUsqNm1rhNZD6ISaW2zlMCXL+HT7kCzKlcLOSMxnaGLIjJQU0a67s0ETQtIJuc5Um+hlhW8TiJbkRfWPdpvRmZRjXJ1oaLWHSM/XPYqXMzwfPdiFeuJSBoS9y8t7iUCxfe61nidwLxPaQeXRR1jF93lWBrSOlkRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756855431; c=relaxed/simple;
	bh=GSkVN/wo1shKiwymn2DhIIsvFtemJ9XsP+OixJlaP7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mqkcYPjqwLY+syekKDJuR/OxIOG70Kj61fR0m6BRFQv36w9CtjE+EQKe++bp5DVHlX6WUlgDDUdWQf/jUFKvQuQHNp0oP8E5aejGja9LgFAV68KPBVTS3Vwayx9HcAApAmejSs04GktaiRTpB3lEs32AB3YIZx4Ft8a7Ch5vC7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DXMIX2OJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756855427;
	bh=fBaSbLdBvSiZ8i52ohMqxj6fEamVwQYcdHnLz8Gl0OQ=;
	h=Date:From:To:Cc:Subject:From;
	b=DXMIX2OJB7jssdK3Fw/4raqiGlKbN5tmQSv7ZE7RN69eCopLutj8xF/tPch5v2U4y
	 aAEb31RLcAaxZ2JXLCaq+V9bARzmLFyAVAokj2iGwjhwtrMQ1h2Ej3+sxkWvryUvKX
	 yhR3KzhK7S1dGaJ+eqlKiJIYNwH4wDzYF5GoBXnHC+NVCxqF5q/+NP2jiNQuA6/ub0
	 oJHtQj29zZilAPb2ZTi3TgAgjr6wFoAyk7Ak3+U7tDSkRVjzW8mwH5ROIAO5oCKdqJ
	 iU8zKTqAFnRA7F123uipWL93T4AXeJG9pyP6nC793cNmPyFqMiHA0NvgLJHULUPlEM
	 gnJqryoOH9mFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cGhdG6HwCz4w1j;
	Wed,  3 Sep 2025 09:23:46 +1000 (AEST)
Date: Wed, 3 Sep 2025 09:23:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Calvin Owens <calvin@wbinvd.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the bluetooth tree
Message-ID: <20250903092346.0cb5db2a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C2SICSKdqHU5plIz8FupHrQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C2SICSKdqHU5plIz8FupHrQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  16ebf6c26de5 ("Bluetooth: Fix build after header cleanup")

Fixes tag

  Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header=
")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 0e272fc7e17d ("Bluetooth: remove duplicate h4_recv_buf() in header")

--=20
Cheers,
Stephen Rothwell

--Sig_/C2SICSKdqHU5plIz8FupHrQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi3fIIACgkQAVBC80lX
0GxM5gf+IRxA+v+sR5FYnlvGEOlVdkmakZ7vhzwQ2N+/gQlfssiNkRVPzCrh2kRA
U2x7jx8u+Ky8N6o3mFXEV6pSE9KjCQq8ZwvZ1AlPuwLX4Q8b89as3e/BaAPCGXSZ
2BXQo+qsR5Il8Tfrz59KrHnmTIW1+Lgw3ubFSr1yYPcbCi719diwT+hCE+WZQBPv
KQPTGwbzYAqUZfR3WcQZTlCoTnvOsobjeUWokaSQXQDao/HpANy2eS2Z7KJ6AX1e
7eGaWSuRNYBDqm3dT2c0f+4cYAtlEV5NcmZrEMg8yggFeAelUPIKBo4hn6/uJSeW
lWmPQAa6Gt7YcZrdfamf/vk4UpqjgA==
=tf05
-----END PGP SIGNATURE-----

--Sig_/C2SICSKdqHU5plIz8FupHrQ--

