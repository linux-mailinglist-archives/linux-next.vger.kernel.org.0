Return-Path: <linux-next+bounces-5074-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25189A036F5
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 05:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06C4D163828
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 04:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1106D8248D;
	Tue,  7 Jan 2025 04:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Te3sOedW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B5E18C0C;
	Tue,  7 Jan 2025 04:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736223645; cv=none; b=AkutmV7aDTg/87ZlSGMw5K3MKKut874Fem0Ifta3YdtQSIXQpNTgEY6ZZK+BhJkCCgmnkD+qcIs3SaHM/V1uUU2bnateivMR76BKvg1edav2UkaEwjz4uxTUcEqdT+xJ5WNktv4Me9hFpPSJZeMO9u7SDUWEj40JU96b/kNobAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736223645; c=relaxed/simple;
	bh=nriG8eA/0k/VVQprH8igLZYrTfqqoLI8hDEjrbFqG6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DYf6ZZor/vM2uce/795J+V/TZak0pS9/ezJVKDTqADw7hTWvmuuhLL5sf+TM7gghDYZCDNeU3WQVqeRXUzUYKr2AHYdXHxBCa9h6nDfDizpI180Bm+0UIukDn1SLOOMjtiJgPi7VpkjpNVfXMJg9rBy7Vp7BkQ8T9PpraInloJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Te3sOedW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736223632;
	bh=XxqVsucL7YJ/e9G98cW3QQBzMPeQRQgi27WCqAb5aWQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Te3sOedW0bRBQo+S7CbPFkH1iVvi0I9ZPngU7tXdVDHg200H97VImyaDbzz1avoKf
	 P8D5Q5eR3o+olD/zCpmOwtvADADgzNQMaCaganQZ1bCKAVBGMicSbrTbGIgscDEK5l
	 aUxl0iWiiH96xEZpISiZ8B0L3UP7lkmdKKv6ByC0yUwvFIgtWObZrMcTvMRdDtB69a
	 QiMsdKRX5+gqxsFEHvtSC3wVrqICmhcePoNuxB3oDm5a7OJir1AEMzHqBppD8JTXIh
	 YgwHaKmDMjkPxjR4EX0XiVrztigm3Y65TcU9H94uceURrNnjhETZu7h5Ld01v/SnBD
	 diYRzaZS8wjDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRyX00JzLz4wyh;
	Tue,  7 Jan 2025 15:20:32 +1100 (AEDT)
Date: Tue, 7 Jan 2025 15:20:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@iguana.be>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the devicetree tree
Message-ID: <20250107152038.02dbb1b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qOsrDa8FYZXcgXa7MORTKMz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qOsrDa8FYZXcgXa7MORTKMz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the watchdog tree as a different commit
(but the same patch):

  d3571aa59a61 ("dt-bindings: watchdog: Document Qualcomm IPQ5424")

This is commit

  b3db0b5356ff ("dt-bindings: watchdog: Document Qualcomm IPQ5424")

in the watchdog tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/qOsrDa8FYZXcgXa7MORTKMz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd8q5YACgkQAVBC80lX
0Gzn/QgAi9w5ST/cwqOEiVDLhOfGqbMlSOqrWg+XeYbijaarUl7lR+/IFMbPm/tp
aUnPNIp5aMaCMLULN3UeTk0Be5m/T4dY+KKyIQweDwPOKxTDOFPYfEtCpJWgV7T+
Rg4m7nv4Z+dklPdOHxzNy0rkMjj1VXHQWE3OrsyGfMntXjyCehNXB2obUK+WAmYa
cTMivgW1M0pnE8NuP+0f/bIhRsZINfkcMeDM/T/aCEmsXeJUkd/ykY8ajFXkFc9Q
83GmOjZ/Hl++i0XTP2tI023QtIGk7AiPbonC3V/HQ7yIpJLy6vjbutunW3d0KFmh
Z7IMsSz5SUhBiC4ugiOlDF+ElZQAXA==
=V6cD
-----END PGP SIGNATURE-----

--Sig_/qOsrDa8FYZXcgXa7MORTKMz--

