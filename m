Return-Path: <linux-next+bounces-7799-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB38B17958
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 01:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 092AC1C27871
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 23:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDBE26056D;
	Thu, 31 Jul 2025 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HJAw2AZs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4BA21FF4D;
	Thu, 31 Jul 2025 23:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754003935; cv=none; b=C5YRocyXDWKOCd50JXMe0sTTOwiyo0GkJS4Tf/nvS5aa6UKngyO8ZPpoevs+IXHQ6Rx3VJJfEj2c6eUn6cEop2xuz40birOppmoM/GpOeZ/TIQnP0JTWYWkJm0CHw/rlRpAu7qSOpaS0DdPxpmN4nXm2Xfi5XkdnNpIZnerM7g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754003935; c=relaxed/simple;
	bh=M2a63tJrc8tqZdthdnhnaTh0mVPu6EJ/n+9KgsduVpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I2qCVM7IGILXTANkQJlVbgDostoXeOnAT9yvKbhU24kRYbFhAjNP8YkvBHFCmG+/EzJrRAvSUNGz6XLa+eqKzTgLTyDjz4ZAwp07gIpY6XjAFa08GVJyx/H4ww7QAIxcrHvfhbhjIFOWeHkzhe66RAlPjedgkTbGs9hq6mt2XUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HJAw2AZs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754003694;
	bh=DICQ/ozQ+3WlYXVC4uaWMmEf69BvCyNApGqBFuBRRMc=;
	h=Date:From:To:Cc:Subject:From;
	b=HJAw2AZsAK0tQNMMuM7yzTVDzlM8vdA9/HnbEcxWoNgjb94UUQrLrLM2oXBzUiHob
	 rnHVa62MykeZ6cUrroYVJz0jzEA4RyKRwkt7qyRkqILZfxxWxDRG8pCHaCYj7k/yLf
	 shcheuxtV6uKTE9HCSkaqchnMoDoQVBwKps8fu2G3uZp7P2mBAhrIKi5oX321PBfhm
	 NeoaLXK9AOCTLXjHNIuSL+XMThqguSTsO9+ft5k64wj1YmB1PPEFVZC5TYAR4IaqQN
	 mW2fcG7LLzdzlvURO2rTxHxY+7M6XsQFiZxkVJj0IuZIi41XnZptzaec7B1Jo1IvDR
	 C98e72jT/36rQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4btQ0G0TPzz4x5Z;
	Fri,  1 Aug 2025 09:14:54 +1000 (AEST)
Date: Fri, 1 Aug 2025 09:18:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the mfd tree
Message-ID: <20250801091841.6f21ae5d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KIB9xn9wG9oyRT0AQa27U_i";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KIB9xn9wG9oyRT0AQa27U_i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  b6bf74c82178 ("mfd: dt-bindings: Convert TPS65910 to DT schema")
  3221ed185d18 ("mfd: Minor Cirrus/Maxim Kconfig order fixes")
  d5526eba3f47 ("mfd: Remove redundant pm_runtime_mark_last_busy() calls")

These are commits

  006aa8f57f55 ("mfd: dt-bindings: Convert TPS65910 to DT schema")
  73e52f871fc0 ("mfd: Minor Cirrus/Maxim Kconfig order fixes")
  8b96324c75d8 ("mfd: Remove redundant pm_runtime_mark_last_busy() calls")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/KIB9xn9wG9oyRT0AQa27U_i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiL+dEACgkQAVBC80lX
0GwriQgAkWKaF5RO6Pgm7/WiVy8RniaQvyd+HCOO1+WYaGMdPbIX1FbxtvZRIgy9
SssR/fGMthQPQ4jA7Hnm5mR8Hkb+TtyVZjBRdV3pBGeWd7S3wyU1pdJyq/3UYhlu
VUHfsYVBBq+d8+Vg6vY96VRFyXspbmu6YQM/mq30Zy+86Pxsy8rKxx3g/m+4lvX4
AU2lSFRQQuUzrNl9USrC6DP4ze61XK4f71IWqcBFZ6kqJzzwgpmTGW4XLm66k1wx
lTvmyBYTHEXFO4r0l23B3qCzPlWkWGyespgte8AkvipVl8+UchpOcs8l+v+Ezw3D
whQ9AshbagxMUHOSn9iKKsoQy5pPbw==
=Rv4S
-----END PGP SIGNATURE-----

--Sig_/KIB9xn9wG9oyRT0AQa27U_i--

