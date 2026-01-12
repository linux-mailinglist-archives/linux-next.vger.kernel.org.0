Return-Path: <linux-next+bounces-9611-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 237F4D15619
	for <lists+linux-next@lfdr.de>; Mon, 12 Jan 2026 22:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E770F300EF4A
	for <lists+linux-next@lfdr.de>; Mon, 12 Jan 2026 21:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EB7322B72;
	Mon, 12 Jan 2026 21:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WktBhvKT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0D330F938;
	Mon, 12 Jan 2026 21:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768251979; cv=none; b=dEZA5HiPkBjPjMVA7UxjK15TjtbknJkLsjVzBuwmkrJHReUhoJ1jF+SyN/40LMpspV3dIHJ2C1v0MPjXAn5SRuLwS01jaGPkmkUdkZ1NU45JtFdlhMfC+qo+TxriQ4TRUmcKfEPRDLnSalXBpaLUATj818TzyAioAAok9jm55HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768251979; c=relaxed/simple;
	bh=jepYMYjvaJVOIuZfrODYVP0WHdD9AJtXfV4BS0Txg4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KoO2ixldJ1ByGJ8BwMqaWbFIj952t5ZhMVrLdPSz69o9p/1JaeWYpQ3wBFSCMXm7GTDZ10AIEEJ4zMVZbQEfogCn9Y0aZgqf74rhpZR+uLucsQ2A2gUCQxswPhhRNGcG6/TaSm/jhttoAfzlFPxirbYFXNNGWE2bLjemaNWOZUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WktBhvKT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768251967;
	bh=Hw38B4RdIQlah3uh29jp8Hq/gi+gbGZyPV72yTtiMf4=;
	h=Date:From:To:Cc:Subject:From;
	b=WktBhvKTwFDz7eE12ymhDTYkCk/8rY2TEv6+cRmYc3T4OdC9CW/g3t5OiEDX1fUsy
	 wodSl+GAPGsZHLbApoNkdVe+AET4ZkpyeO3R0gd2Y4YYDW/hH07Vf2YwwABdHWI6ED
	 0+n4NlWJJ0ZoNJVGDAq5OBiXkYPYqyfrsEofbOoNuJjnkbEmhEH6i7OmktycAG+bZz
	 vdez2pmErOB/7I8oGVFWleOOOEsMv2TL4U5+KVBNHUldDvLfI2Ji12yQIawcS5g29L
	 wg1TlypDMGUilnPIw2qXRCxrF1iPfxPy2lLn9N5ghI5PUL+pkrRPgdKHo3L3j75hCa
	 tCPDmHL3YCgmg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dqlKW3Bsnz4wQb;
	Tue, 13 Jan 2026 08:06:07 +1100 (AEDT)
Date: Tue, 13 Jan 2026 08:06:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <20260113080606.07743e2b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XD7Kz0TpDw0N1W4QwDg5pPL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XD7Kz0TpDw0N1W4QwDg5pPL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  35a48f41b63f ("clk: qcom: regmap-divider: convert from divider_ro_round_r=
ate() to divider_ro_determine_rate()")

Fixes tag

  Fixes: 859a7e020b23 ("clk: qcom: regmap-divider: convert from divider_rou=
nd_rate() to divider_determine_rate()")

has these problem(s):

  - Target SHA1 does not exist

Also, the subject in the fixes tag is the same as the fixing commit,
so I have not idea which commit was intended.

--=20
Cheers,
Stephen Rothwell

--Sig_/XD7Kz0TpDw0N1W4QwDg5pPL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmllYj4ACgkQAVBC80lX
0GyISwgAiTmlWb4DhsiEzvv6xXoQjC0urAvmpxWiIOuBBoTHgHv2kIvrvgTsK6tf
Aj7OsrxXy1+cUZgQW/qh2vdaGln2ZzSu8kEnRoAlxiQproUSjQmt8Ag8OF8Mw498
lk5YK20uyJrWqRIpxle+CKP7vkCTqBB/x36d/6zzp6XKgP7Smngho4i0virFfHDZ
hVHjoOeciOUxZvqGrfZunK3bbNnGE4dQcZfXR0Y6faNWNXuvOmJ9hb1qJr8yFwaG
W5TWuBf55WeSdZgBcZYfbZq2iPxJEyX/vXRfyQ2UGapPR2h/U3Rknx2EKGKFIEhQ
M9nYFXFF/lbYDI/6IEVld5ewNTzh8A==
=SE1B
-----END PGP SIGNATURE-----

--Sig_/XD7Kz0TpDw0N1W4QwDg5pPL--

