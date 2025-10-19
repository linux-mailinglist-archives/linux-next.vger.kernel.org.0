Return-Path: <linux-next+bounces-8632-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42A2BEEC6D
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 22:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CF8C3B2E3C
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 20:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD96022126C;
	Sun, 19 Oct 2025 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hFDlSsPS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768061F2B88;
	Sun, 19 Oct 2025 20:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760907279; cv=none; b=LWSMS5gMyoIWSu5rGtLHjgBgm6P988MH93qT+bBrtZsOQUdinisqmE274IvRAnRf+ymCunMEYDXIwWif3cKtUqq7cnhfyEEBkExqBHdtitcT6gZJlnFyp6A/mK+uuE/KqthZed9Yh+9D3km+3EO+tEIYvGXgkHn0vz1osRNAAFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760907279; c=relaxed/simple;
	bh=1uXc2VRN7CO9bLgvZI0yS8DJEGIMmVmcAVWQc4YCiWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XQ16ZepfYJVIZ4pSwfPzd052ogQQG7BR8FCwyVjvvTEol6Nu7L1XuvctpJIQmssGzsnygl3peY5dUPQ4pSxcjPKKjnCJv2RXoov2oChAiHvykHU6cWha7Y1Uz0JHl7wyYjMJzAfc6hUwlzhHUzuW+SLs1Y1z9drmXtJ8YTaTy84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hFDlSsPS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760907275;
	bh=wLf9lWayXwaLatvDExEYObnBTt3+LQZK8CfBrpktGnM=;
	h=Date:From:To:Cc:Subject:From;
	b=hFDlSsPSDceCUS9l/PrqPkMS2qt741yHHb0Ozh8yqJ2dU1zJHMjOep1+iwHmNk590
	 CyCKmspKHgSeFOKvS5vlGslo7heQZnV6x9JlOR4GGljhcogkSsaUM9gRlIvQPjmU7V
	 ok1FkMuD5gwYL7faz+cPMlTypksoh6zAxIlUpPgngDFP+2hreEA4aL3CDkhmYXSGZu
	 9DEQGCAV0KQ5p6GuLGS+Qoa9tZyXIjO4esNVFuEz7CBRpmwCf5CA3FA8D1YF7l+XJd
	 awGMOXdwYTHgB/T5cuPN0n7Q+9chjKahmjD088YnD6s+O6tYyAgZjIcI225vjzhaEx
	 AspDH3MaFdSDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqW5R0tlkz4w9v;
	Mon, 20 Oct 2025 07:54:35 +1100 (AEDT)
Date: Mon, 20 Oct 2025 07:54:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vhost tree
Message-ID: <20251020075434.6f55ad83@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zFpFbFlPr.B74B=G7knzp9F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zFpFbFlPr.B74B=G7knzp9F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  fcb623b81dbe ("ptr_ring: __ptr_ring_zero_tail micro optimization")
  118d19967530 ("ptr_ring: drop duplicated tail zeroing code")

These are commits

  c39d6d4d9333 ("ptr_ring: __ptr_ring_zero_tail micro optimization")
  4e9510f16218 ("ptr_ring: drop duplicated tail zeroing code")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/zFpFbFlPr.B74B=G7knzp9F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1UAoACgkQAVBC80lX
0GyFzAf+JN6ZL3ev/pmePW+LxTCn/0pMMTa2ilDQhkTOL46OkAFOO15nJpma5w3M
YgOhGGWJGMaviFodaFnher4y/sqOddxy4lbsOp+yXi7gbU7F5Vo/Ukeg3FMjYdG4
phB/VJAR6WWkC4CQGEP9wWh49wufAQxFo03B0iDUIj0x5TGQ0dAXbWFhUWk5e78w
V7bsvHTaSjohHvydF7w3D8CtJBdqM2oB6kmT+Z+k8Nwre79ovmHZP3l0e40MKkCf
TzmojKNmUue+ZuyTjO8JSKjB81UkhI/JjLOM6xVEPlzqxbwqI/D2MA6MsxwWOzGv
EYQ5sOVsp0SQ/6U4HEREnXcFv5TSog==
=lJXP
-----END PGP SIGNATURE-----

--Sig_/zFpFbFlPr.B74B=G7knzp9F--

