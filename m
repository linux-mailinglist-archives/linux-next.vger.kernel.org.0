Return-Path: <linux-next+bounces-3610-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB9A96CF91
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 08:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 462511F25E98
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 06:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2499188CA5;
	Thu,  5 Sep 2024 06:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J04RDaaB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C54A14A4F5;
	Thu,  5 Sep 2024 06:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725518578; cv=none; b=Onq+8rIugoTIKEPc3wIBxvqL2UeJck+uqE3rruq/hWS4C8I9De/6Ijhf/nPvMl4fat4gVNTzk3g82A6dw4YY9HrR6yH4KwEr3cDvdV9I3gN1jsI76fUYNZQd4YGXYMDthJPR5I6Vcp2U2qATOW3v0A3MGGbWrT0maz2VB+NDu+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725518578; c=relaxed/simple;
	bh=iqv59G5DFDbG0kh8HBQ4BZkaSr7n64v2l/30jLWmVVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ay9YHZX7bls3Zhm8sB5AyANh9CiEhdl8NLgtWhI9+ITJd9nzmL79mne51C6hprRd/xfN74XAgQWHRYZ/mJR/sQ8LGQNd7TJk/3u/qnqJkj8UGNhvGSucHDXW/vRuTDopLdSEFk3f3jVq8Grtblh4bZepAowk4vbQshqsMFnoIW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=J04RDaaB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725518574;
	bh=wSAiQ/Y33gTRke4A5+hecOxh7F/Z0l5rzaBL/mS4S5E=;
	h=Date:From:To:Cc:Subject:From;
	b=J04RDaaBtybu9XqhHCDAZo+g/GUofu+D5Sr7b7QgTdwZxVx6j0vOJ5UXevYj0qWsG
	 kdXo0/4zUj0TuFgHGPYOZ7YCI4gOyRMzk37f26pvln1x4q0pfxhKIzYl1AJVT8qVY+
	 sjMkwSHix0l11wsjh5rxar9SMD41ChG5wiCsemjuaA0VoSLZhXdKsKvgOPBwJWaT/i
	 ABSq3noNRHTb9GzFMpXdLjc4bcIrMk0THyEL8l6nuNKw6lYOQvL9wQtrOecTY+Lrlz
	 3PYLL6wks1TSLjjmJaa+3VSnZvjB6EMXe6YruWGTGKJ8sRB8PmOytekRTyRqE9/a0P
	 6+49QN552GT7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzqYV4dBkz4x21;
	Thu,  5 Sep 2024 16:42:54 +1000 (AEST)
Date: Thu, 5 Sep 2024 16:42:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mfd tree
Message-ID: <20240905164254.71e53f73@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9=K6Yv46iJhwcizTog+qmRP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9=K6Yv46iJhwcizTog+qmRP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the sound-asoc tree as a different commit
(but the same patch):

  555fa39ba1fd ("dt-bindings: mfd: mediatek: Add codec property for MT6357 =
PMIC")

This is commit

  761cab667898 ("dt-bindings: mfd: mediatek: Add codec property for MT6357 =
PMIC")

in the sound-asoc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/9=K6Yv46iJhwcizTog+qmRP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbZUu4ACgkQAVBC80lX
0GwhQgf+NFqbdJ/QdTi/daoRSTWyGJymjyvCOtNevLExFpKOuzTG8HgOOCbED6bT
ytHogHaUK6REjfZ81ljEPL77ryqVB1iBA3OP7nqipRUj9upk5DcDnhBKn7kVAYai
9GHR3ediM53EDA198HJ3rYL+0gHVTLYF16AlRQ7ogFs/sDwO9nX3HMU/5NKFOVfo
ydm5sx5ZoO2vAt9I+vDaCu9pXNK/6baxV8muBfjv9/by0dPcBjoRVcBdCex4j9js
Lk1FdtoZaxUBaVhICn9vI+w0YJCwofP37fGiZaNJ6Ko5Bi7edDUemh1JlaTkxX2S
4MuGP3EEtO41NKmngkKQhjrowpIffw==
=wn9L
-----END PGP SIGNATURE-----

--Sig_/9=K6Yv46iJhwcizTog+qmRP--

