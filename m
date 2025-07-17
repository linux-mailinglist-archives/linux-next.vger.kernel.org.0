Return-Path: <linux-next+bounces-7610-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B29B096EA
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 00:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38FA6A600D2
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 22:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300D622B590;
	Thu, 17 Jul 2025 22:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z1CSoWbF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6616A94F;
	Thu, 17 Jul 2025 22:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752791384; cv=none; b=E+63y2s4aNvHMgvWxT701xsTUg5zyKil7ndjSEWdgXJJKEbjJ7CRfIjPT0ho8WNZNfBLrkAWaRvZNomCVHeEtf60MficE8+uBdCEFV8A48TQ1M80zG3Vi7ByD9uUYZDi1KwbEyvr9Zc4NuA4X7xoCIF4fpue3+wpW9Dmkyx1Rus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752791384; c=relaxed/simple;
	bh=/YWz8OHO92KXvaHSQojZ69/qVFC0xP/OSTDPFfEKBZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XnPpXWInhdu1OHXycytxoVs6bm9U+rT++viFEbGN5O7Aa6CBQZ5QYAFGF3l3SHgqz6X17L7dMmn7m6E0YTHxBQ+Q+FJxou5pv6eIe9hvOv/KSfJ7iDHdm2TYWuLR3FfWgTYWBQGDpNOmdxa9ctfaYVMfc7T1tODJ18RhJd4VzLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z1CSoWbF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752791250;
	bh=bagg6DwvFzPvgqV4M24j+KT0bzFkBH+6JVE19OCUQ1w=;
	h=Date:From:To:Cc:Subject:From;
	b=Z1CSoWbFxkzK07wPeAfcQrZSUTl1SnkpxkimRj1gbx79UDXMpL7jOvUW78XtKrTaa
	 QVMRvNP8ynOgp2j8QmjcFbHzeY2/piFkoHdo2B5InDBcZbpl+3QraLBasjSEkSH0Bt
	 T8WhHDaT16Kh19RblNwevFpkc5oaZOCOSK7tpNbE+humGK6Ugoc2cVS4S3xCJKckW7
	 UaO/hc4DY0p0arQImZxB1R8kCHTmSmTOduWgdWKyA2GJvZZpIWgOc/zk2Ief3Oyyka
	 WhOOM3IB26Kkugsv/Kv7xMciTH8AUB6diqmyxVlT1OtQdhcXoOQxxdW8M9+XacDjJ0
	 fLxeMoCQwTDsw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjnc22PWhz4w2H;
	Fri, 18 Jul 2025 08:27:30 +1000 (AEST)
Date: Fri, 18 Jul 2025 08:29:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cxl tree
Message-ID: <20250718082936.40138acb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nYmK6fbkLEWpFubnp0H+86f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nYmK6fbkLEWpFubnp0H+86f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  105d55ade07f ("")

is missing a Signed-off-by from its author and committer.

In fact it is missing any message and any patch! ;-)

--=20
Cheers,
Stephen Rothwell

--Sig_/nYmK6fbkLEWpFubnp0H+86f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh5eVAACgkQAVBC80lX
0GzEbwgAjj+sA47IcRHZI01MqL8I5zTb3hr1UmLjrPmvwb+puHvuVh1JFOeD8aX3
bXt5Zfxn5Obku7sK9ijcN+NWdEPXgadlSMsF+G/YT8bN1HItTlVtAbeIzJFiVBRU
X+QR5PzqdDU8SibAluMmVuRZ9/13HsOl/eMloXid7yJzY/KuJh+PYw5OZEK+Qpmo
hj86C0sgQB1tONAqgXeJPgGKkwRw13/fp3u8rqKrHdBFpfa1wOguZ7V8m4T7A8nF
AN2PPmHOi7rBGISnz7gXjsqS6F4P+YLDAvQK6kkrWekJTcRVY0g6/c8fIQhWMqZ0
wbVlggzry/xaSK6gokhNrPNMz0yWNw==
=R70T
-----END PGP SIGNATURE-----

--Sig_/nYmK6fbkLEWpFubnp0H+86f--

