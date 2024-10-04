Return-Path: <linux-next+bounces-4095-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC9598FC5F
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 04:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 320EA1F21249
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 02:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCBFBA4D;
	Fri,  4 Oct 2024 02:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="n2nLKqb6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192AE1F943;
	Fri,  4 Oct 2024 02:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728009264; cv=none; b=NSuTb568y/aQDlV8Ub2FrVhzyROq328L0y63/S97ISWexNQbpQN94JYVbKrLRsZqiAVE4nOQf5Izw7R1wQ/N8cfTH8n4qPMIGmFNlVHRd8vbuvyWd4K4T2Uhml6eCt/XjWMVJ/mB1Z4JcCWzUPGdCWMl+Al4KuSix+mnMHd58Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728009264; c=relaxed/simple;
	bh=4t7I7o/UgcBgoHeiluwa0k9fUQa0GBHWaKA0pjjK0/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ESuQmKf8uxMItU726uiWAhIxVtCI0JwylfzT5Qk6uO6zL+H4phk0FzKuLO9M165mto8PBOK+M2DmjsMcQH/c4O0tBXmHZ1SjixKcqA8kWaNmxy+NiVCQK9LrCa83JHebz33AWiSpvG9aii7KLoieArIBUO80FO+p9X5aWkFjAaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=n2nLKqb6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728009258;
	bh=jJaogFdg78TEK7PgXXgsNPNi2Gfol/t1W8lXiBuEWVo=;
	h=Date:From:To:Cc:Subject:From;
	b=n2nLKqb6vMoefc9TYs1KbFDwJrYC5GyeNE3x7S0SKh3sDucalq+0lSuwvqY7HSofx
	 KU6F73YqcZf6v/LavM4LkDXA2fIPkkpH6+YUWDlR7nkwaxP8ShHPRXx4w8oO76H1by
	 gBKNuChFYohKWTTkFg1nHuFNrdWon5DsuRZbbP2MoxGCE+qwTmPf5uZ3ANVLD1wlBJ
	 xSvnM0euHoyuwFjxMBRZq9V8nskWypnRKlMs49xS491f2vD1bIV3m/kmbbH0F4W/67
	 7gS2RCU17zqNR5w3oDhButBTXDE+GHTLxZClFlIRYBCe/G+JhykKFalHRA4qN4R/QY
	 0fJPxgKgIDKtA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XKXgG0ZBHz4x2g;
	Fri,  4 Oct 2024 12:34:17 +1000 (AEST)
Date: Fri, 4 Oct 2024 12:34:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the sound tree
Message-ID: <20241004123417.2dea135f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UrHMNPR7SZuIoJxA7v9Jn.g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UrHMNPR7SZuIoJxA7v9Jn.g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the sound-current tree as a different
commit (but the same patch):

  3e8800273c4b ("ALSA: hda: Add missing parameter description for snd_hdac_=
stream_timecounter_init()")

This is commit

  740986edaf2d ("ALSA: hda: Add missing parameter description for snd_hdac_=
stream_timecounter_init()")

in the sound-current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/UrHMNPR7SZuIoJxA7v9Jn.g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb/VCkACgkQAVBC80lX
0Gx7Agf9H4cPFQjZPZG5xzW+eAw2xEcadQhj4HPdknAk25xic3Gs7wjF2R/gYMrN
8fxSf+8bQEJVi7dZwwddBou3FtJchnJ17fK0Tc9Zp1MNQoolpHRTs/IZrExjA2nI
3VgPZKKJFlvKMkK8uDEj9Tc6r8HbNyWuwHAUHA7/QUirur5v/+ScME8enYinOEM+
2Iw3+LazIUW1Z3LMUP4y4NLdxosav7rZVNm+vIVRNgYYNMj7+T4ZIo0FMPoVmSw8
S6b3+3Y3SYjVC3SipiWoevTx9hgVuTCbHaJVSCLTBWWkJw/HAjWiVh8ZHcYRDj/W
JB41aESfNjo0A9oQujo2mon3BOvxew==
=JnnI
-----END PGP SIGNATURE-----

--Sig_/UrHMNPR7SZuIoJxA7v9Jn.g--

