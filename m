Return-Path: <linux-next+bounces-7404-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B43AFC6C1
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 11:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0423B56CB
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 09:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D91F2C0313;
	Tue,  8 Jul 2025 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tevp2bT4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA12BF3EB;
	Tue,  8 Jul 2025 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965882; cv=none; b=WAEb7bOjQWK/39LiNVaTZTorAP9bgsSUGQkzkKO5X3Z0HA9D9OXp3eaqOZWbmFkel3MyuJEaFZ822VdFVynU1n8vcMuVS+YyOJlMdi2KrPMxozDnCPwdMIaNmMSD7rYr+SgcDe8zLWX8YyNGzrFqhjyc9gdeUg6gxOoCwlwUfrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965882; c=relaxed/simple;
	bh=r1x090YX/tnqR60tHI7fzn9NINwny65K4OCQHtp8bhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ImD4cRs1GFEwWaJsxYlQA/8rcog0Mqsp73nneNrx+Vyo6sAfwwcQ+saPDJOSTeWBugFVXhOz+NS0N3gEJrcK+tYwhSIBfzF/y64mFuWHXuiKr8z+wzJqaqOxz31P38ET96iSRHbkO/UN90w99fZqb+ixHWQMQKB9BOFeXT0ituY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Tevp2bT4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751965818;
	bh=iDK/XBeVSLguiQBmA1MavzPVD6AE+YgFpRffIFyUwiA=;
	h=Date:From:To:Cc:Subject:From;
	b=Tevp2bT4cWd8N5sxII4/lMAC34M7qam+T1gf+9yYK2ndTKF9Qlf4zbVPNT42yvL3c
	 aMVyp0MZcM7LIjV9Czk3cjaZKUkerEg5DvjzXHGMW+MIACsRl89LPp9SbdIWshkSCQ
	 Gp7O+wI7LBoEQwDw6vodHzKoJeV09phI3oIrZ/62VY+zuJoqLOM1u30IsaeMWRtBtd
	 vHnp0I0srcnZiz4fz0btwPHh1ezIV8dsoBzoKS9WGI1kMKQYuw1XcITlkfly1yum86
	 F4Z3I9rWKvGHLE2xZ8pRa9r/FloGFmK5AkeSDxPXcRI58aeoUbRyXcKAmf/l3iQ6yI
	 g+k0H92FSkFuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbwLL2WD3z4w2J;
	Tue,  8 Jul 2025 19:10:17 +1000 (AEST)
Date: Tue, 8 Jul 2025 19:11:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20250708191115.68613291@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P6M7tjLgMilfgc8xX/Es7cg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P6M7tjLgMilfgc8xX/Es7cg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/cdrom/index.rst:7: WARNING: toctree contains reference to non=
existing document 'cdrom/packet-writing' [toc.not_readable]

Introduced by commit

  1cea5180f2f8 ("block: remove pktcdvd driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/P6M7tjLgMilfgc8xX/Es7cg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhs4LMACgkQAVBC80lX
0GwUkAf/fmNSnWDRXpIfPnjEv7/93CEHqhwpDMw6y0jBK7t/pOxa2isGTn6V+RRy
EthvICdQSWknVMXQAKxSWQ/ILZN2R4c2rf2CLPMqky/b2jJ63OQDr2xr3qA+QSQ4
4Db88hyNsmaxlXdEoGr4e2sfTKp3GeernNBtropUNPuC1AnUv92+dtb6C2M1mx6h
/L21N3a7q461U6iqB6+nxy5dUjUjNqrOMtMGBUOkSc5mN3DC6O6EZnZWxcYkRxS3
GxCIHl05nvZkqnPvy++7nORmExo+7oS7aYTF2pR3jb03rYpS8NPHY/+5Mf5T/wN8
GthfsbwOFsPNZSRhqxjxuSEMnCErug==
=G0VP
-----END PGP SIGNATURE-----

--Sig_/P6M7tjLgMilfgc8xX/Es7cg--

