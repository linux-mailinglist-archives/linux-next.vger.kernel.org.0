Return-Path: <linux-next+bounces-7591-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED15B08060
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 00:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4AEE16DDDF
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 22:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084D82620DE;
	Wed, 16 Jul 2025 22:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jQvLoN+m"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD52B9BA;
	Wed, 16 Jul 2025 22:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752704282; cv=none; b=hji3NceI7AcENMytnkGC28BpxupAfbwL+T1phGwiSHdzGa9e+qi2LsUvfOUN9EIEaU59cTt4S7bie/lvXfek6flTkwcLJiluXz/7MpdLTPAiIzBjP4zvOIkhPF6Ta//9Een3zzfZ+CVoGWiv9awXG54CqBEzrZakwhNUbqQiHb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752704282; c=relaxed/simple;
	bh=Fb5+Z0/dS3VG2z9AkJdIGY6v9M8+Y9kXYI4dhRhPN24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sHYHZ866BRH/wocwA2dBcD5k8P2Xd5dN+hrI7g4ImbIb9t+qJVeihoxszRNzuldOn3ZimM6o0W7YXmBasCo//xGV5wufY/lBuyzJGCZqPUi3EgxLSKkKCewG7+1Sr9GQA7PpuplTnyvDoNU3oYv/d+djA4/6cUYDDRppI4i9Rt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jQvLoN+m; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752704156;
	bh=fFYG6PPnbQ8OzebBcsFqUrsGV3OfxtvSBGerPj/Dum4=;
	h=Date:From:To:Cc:Subject:From;
	b=jQvLoN+mv4bMm3cv2oaWEB784oJl+EHWu08sB3mnzzz2vYYqTWsds/o1kErqlX8qe
	 4dRRyNggqilodkD284WouKmxEfJdTbYteBjSM+zuQ8tjF6e/jI+6I/IY/7eARwiIKR
	 kJBElY9NsA72n83YaCW66g2rdIIq1WqF5d69FZn5zu75dtCO6bmKA84zX0N1vbEd6b
	 0hlUXSAq0rE8rOGnKHUna8yBINdpYd8V5N2bJ4lXRuOGxXARVYVxYUvDL4UmABcnAF
	 wiaufU9s+D8xF02OEdxrsWBoAmrcz35iky1TWIOJwoH9ELIdupq9S0Pmchj9G4S49y
	 HmFJtvv1EsF0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bj9P83Ssjz4x43;
	Thu, 17 Jul 2025 08:15:56 +1000 (AEST)
Date: Thu, 17 Jul 2025 08:17:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vhost tree
Message-ID: <20250717081755.1128d163@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uT+LRpQ0Xza=3ZeUY8QFvUI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uT+LRpQ0Xza=3ZeUY8QFvUI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  45165a10d85d ("vdpa/mlx5: Fix release of uninitialized resources on error=
 path")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/uT+LRpQ0Xza=3ZeUY8QFvUI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh4JRMACgkQAVBC80lX
0Gxtqgf/TVojOS/vH6KIwOrJwrz7Xht51KkVbnl+NjiquWK3/uVezO3MGpExpeoT
IyyqW5eiG70LO8cx6/d/Nhp+NFUF/v6AfwsqQ5ZGsa/sj8FoHFVh+KvwYPSP/m3q
iUG4CxlH6kM/zZizNclSTbKFG8cJmTArK6iDQQRzeJvG7QjwRdSZa6oK3iD4fwrL
fmX7GHjg7o+Vg2W0N7nQBjm/gqYvU2XyN4KCOw3RuUVc9KE32VxIZTiojF76qDiI
XJdgsGS6xg0Dp5eglLXe+HalUM/etJ2zbLPhdfpYYO/BpxxyvDOBX0XjuWWBq31O
siwdcx9Y5muxh6GJFYxpWiewzoWxUg==
=+lal
-----END PGP SIGNATURE-----

--Sig_/uT+LRpQ0Xza=3ZeUY8QFvUI--

