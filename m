Return-Path: <linux-next+bounces-2425-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F19C98D566C
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 01:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80503B26114
	for <lists+linux-next@lfdr.de>; Thu, 30 May 2024 23:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2024186298;
	Thu, 30 May 2024 23:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="N3zGeZhX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055061850A6;
	Thu, 30 May 2024 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717112657; cv=none; b=rdhbKc/NQI5IYx+R4rJvCNmR/80Yr1L7M7UbIEuz5RjCZsTf3HUThaTeyh0iERIHN5INR9O+VG4jIwMPz8bfeE4IDoSlry1yfWbTbYr2qN846aPy6VkTcPZpbr5NmXwYjbtKomYOyQpA15KahhElIG+RkeeI3g+ZwxlPiub7uzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717112657; c=relaxed/simple;
	bh=Ds/OAfP6wUiqpfuiBKd5qSOxQme5FF7/mW/DjUgHs+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VUoLyIbL3lXlRneqibPy6B8YtPlUXvNCxLEkiY1pMbdpT94SunEjY11jaSoNWwO5ads/kIuOeKlUlK6FQqamx8dW8P3uLX/quvW1cPnyodxvDZqB4qbPo3B+hFqNT+6iOYx2B6+3nAig6YXRINoNMGvJWcLUmA7rxGDvOTtqjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=N3zGeZhX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717112647;
	bh=bssQrBvp11evNiCddFSWm9HrMRb3VvoSdcNFyFwmdM8=;
	h=Date:From:To:Cc:Subject:From;
	b=N3zGeZhXBSNn1cvTppLUWT3Po11Pg58D61TE8xVclnhf+IyZvSEx4qjzvZ9l0Y35v
	 KboZNynd8VQzF/62TqvJzhcf753tZDGTfsvZWzVRNiMaCCq4bjpunS75OYE2X+uwce
	 w2D8VRSlzU0trUeMJ+yzS9cXasmIFshnXgcaWoMW4UOAbDdBf4Ys8asMJQ98vM75U5
	 iFHmm6RJrNp9RGkLT8cxzp6qssVcvJgBNwJ/LnRIw2pGeVow0fk9+Az/dCzNVX/zhE
	 SQ7pZi0mufN5KdySy/t3pSn1lKfaD07IBqnPttX0YXEXglwndAR/+JKvVnU0R2XnBR
	 82EAFph36gVag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vr2s30XQyz4x2k;
	Fri, 31 May 2024 09:44:06 +1000 (AEST)
Date: Fri, 31 May 2024 09:44:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the sound-current tree
Message-ID: <20240531093717.37c4ccf3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aTTsrfeOcACxbOJPJaCPuol";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aTTsrfeOcACxbOJPJaCPuol
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  700fe6fd093d ("ALSA: seq: Fix yet another spot for system message convers=
ion")

Fixes tag

  Fixes: c2bb79613fed ("ALSA: seq: Fix incorrect UMP type for system messag=
es")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: edb32776196a ("ALSA: seq: Fix incorrect UMP type for system messages=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/aTTsrfeOcACxbOJPJaCPuol
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZZD0MACgkQAVBC80lX
0Gwx9wf+K9IHRTi1TxRlIzsDdPolGHNRFOQ+MjiqT1Oz/yAgwFdR3RpdNjJmrYhx
EvmkRBQDw3kd3au3G7PHiopJRjH+oFowd5n8Z5ZTjUUGK3NZ2weXlaGlx25OsMgZ
Lx4FkyL4DsNr9Jeqx3XMwGwuDcvUq5Wv5Fsk3lK0KopQUlYpQY2NBkBvu8wZnwD7
4aD1N6PWvyJbi4yF1Bbcnvoriac0JWIv+A9F2OYPHZ+ngJ2rLGTPWwCJZyJFzCvn
XpdJPqmlF+KZmC0s5ibRRCwYBYt8XYXUas/Iz4+r26J3Bluy7cZBNkf6cH4FCfgr
nMHpTPE2NCKsiXH9pq9F1HXn1vcatQ==
=u07y
-----END PGP SIGNATURE-----

--Sig_/aTTsrfeOcACxbOJPJaCPuol--

