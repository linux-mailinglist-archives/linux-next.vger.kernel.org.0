Return-Path: <linux-next+bounces-5837-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53696A66052
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 22:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A59C416F2A7
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 21:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71511FFC4B;
	Mon, 17 Mar 2025 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AK21o6Fu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9931F7916;
	Mon, 17 Mar 2025 21:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742246268; cv=none; b=texJNhXuby62uprWsXFsYSRv4V62QoNAFM0D4tNJazoV9qOCRovA162N4Lk5FtlB69chzveEzM3rN6XRIkqKCgbnXplvD6nRcExGsgfoXDuidZq22SSWPeSUkm1s/i4zNaxjLFkH5E8lTVBJbVCfRycqj55nSfaJbzMbfeRrWGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742246268; c=relaxed/simple;
	bh=QYLOUBEjdnyfT54iqSQ4S6A7SnHgRiCZJRpueifzRyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=maUGfQTVvFwHaYtmn80sBYOw0FQWKxteIP2HVZwaGk1G+kj2FEibaHKOPVrw9KcRDCLBPqTFb2viQB2rvHsQXTl9vFlK/eLBJINzrUB+6hBd2t9j0bOww1Akx51bWjUI+mcZ7HefrCVBPT6XsYJDfcpE+OB7yQTTFR1mHcRjXq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AK21o6Fu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742246264;
	bh=YU9quJPTIYISwNZ6rh3ERFz67+zPDglhQfl5TTdQQUE=;
	h=Date:From:To:Cc:Subject:From;
	b=AK21o6FuccvpM3RHkWYr84AqlmOqAdMeatQX/95grkz/tLT6Jw4vUdYaPFW3tRD7I
	 6JMjMMNSIXj3b0YrJQ48uduY7qae/Y+CXQKrlnpVOV1UqDQjGTTzhG1xA6s/zy1oqB
	 QCZ2ldBI8WIGzZ2p2w9Pt2ROZX7xe6Sk548zTCndpzyy8JUpZlE4lV0HN7jCoV/4vW
	 il/D3GHD3kBTTQ0gv/XrUTwUgDhyTn3n2HdpNE/mwhAlRJF/jF6YK2gzwtIqzVVTj3
	 eRr7lg5yRJlLBGttUOfkSUe1bQ57mastcNEsF3qq7NEwpJrJAboyGIw/wZR4QeghLt
	 BJN+KFys4YRZw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGnqq6gvGz4wc4;
	Tue, 18 Mar 2025 08:17:43 +1100 (AEDT)
Date: Tue, 18 Mar 2025 08:17:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tpmdd tree
Message-ID: <20250318081743.32c72c1c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dD38/NjlR76YegvWRU3o2rX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dD38/NjlR76YegvWRU3o2rX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  04c72b01f618 ("Documentation: tpm: Add documentation for the CRB FF-A int=
erface")
  cebcb37cc882 ("tpm_crb: Add support for the ARM FF-A start method")
  1cfb6e10a755 ("ACPICA: Add start method for ARM FF-A")
  abf6e84648dd ("tpm_crb: ffa_tpm: Implement driver compliant to CRB over F=
F-A")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/dD38/NjlR76YegvWRU3o2rX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYkXcACgkQAVBC80lX
0GzCNgf/eAWalAyQWo4mw0DOd2qqQu75FVrqpwiojYy2tR5bN25Hm8cphuOEZ76l
O8cFydKRcrCAo1zvflMCtvDOWIVlCxLAxbvBnLNRp/ITD6R5+0vsfvXTn3o6K1uu
H6Wjt2E83DKqNlVbbdmbikqxPBUWDFJ2p4IEgGOcjn0G6hyNVkhPDs6DusYWvX+L
e1O5ZiV2dRja/3b5EhdTiZuipRevotiTG9zyV19QyIu/E5o+Igs91Ga2+QKJbiep
RZwBUPCQvcnL0+ymKBM6AM2K/g6JIsjuhmL1JD4c7qPbRz/BZVOrSlZUO5uMncij
Ov5PtnG2o60LEnfodRGCUFJzSMWwLw==
=8Gkf
-----END PGP SIGNATURE-----

--Sig_/dD38/NjlR76YegvWRU3o2rX--

