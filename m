Return-Path: <linux-next+bounces-3267-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 094F194C7FD
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 03:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7F9F1F2326A
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 01:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0CA8BFF;
	Fri,  9 Aug 2024 01:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Wk7InOJW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D279D0;
	Fri,  9 Aug 2024 01:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723166586; cv=none; b=oCPTRDYGyvSKKfIeZW5mhm+fmN+KmPAy+D5MaJ5dUQk/26ZRP6GRsxNtZWRRBkfo+rWiy0GHvZV8UbCgdrw2Y1YqcB2/du4T9TRV76sCiwKCr8avE/Lt3c6dp77tiqYdD1T+2V9KjLZVWZlohEWHYSNTIEl1xP0vKstJvpoNydk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723166586; c=relaxed/simple;
	bh=OGRZoQ4HYV+HHBsqv2IswACAlUxiSf2w7hO2J/4qF8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VxmRv9puBwxUHqAMUrbotSukSkB1XHdnZWKa6Eep1NWXBCKhjrQ1sRwuL84EaS3ZnlxC1SDcDKLssR5gbxymyLc9ZomSD2RGkDqdos1HVWUDGWGwPJyCIvXxxxasFexRGGt24h5qJUJSBa1nIEnysvlAISLu2uCUDusguieVFsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Wk7InOJW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723166573;
	bh=rcmrzcRQHwUeLNJRQa0jQd3IazYdekZwRB8xnKFVUC4=;
	h=Date:From:To:Cc:Subject:From;
	b=Wk7InOJW8NZ6rFJJxjW6tyBTlZjpOUwSyqND6OygFgO1q63wDASNXa9Gh0PlZgqMv
	 /fzdBSAiZTd5MI4RaqrPag/3t2HQbBQJ72WZwHtVR453F8Z8g1jXnzwtuiR5/aJPVw
	 NC6EWAMMqNB6WmrG1b873uJKJlzkWKOTKqaCM4j6W6I0fQjEV0/BZFPnN7KOhmn1Tp
	 wlyEISwqoOzmQuKm4VOItjaTj6vVyvn5joEc+dhdOqTHHRkJaU3b48NyRzKM88Q5re
	 tWUr/Fnt/lSVOCRWQo2153+w6DtH2xIF62ooU0okhcH2a4xADv2TmV//6I4D9AvfGD
	 0MS8OtrXKsWmg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wg5kj4ZXSz4wcl;
	Fri,  9 Aug 2024 11:22:53 +1000 (AEST)
Date: Fri, 9 Aug 2024 11:22:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound tree
Message-ID: <20240809112252.5af8025f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sOcqvAryE0c7f_seDFKcB2S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sOcqvAryE0c7f_seDFKcB2S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/usb/caiaq/audio.c: In function 'snd_usb_caiaq_pcm_prepare':
sound/usb/caiaq/audio.c:179:41: error: unused variable 'i' [-Werror=3Dunuse=
d-variable]
  179 |         int bytes_per_sample, bpp, ret, i;
      |                                         ^
cc1: all warnings being treated as errors

Caused by commit

  e95b9f7f2ee0 ("ALSA: snd-usb-caiaq: use snd_pcm_rate_to_rate_bit")

I used the sound tree from next-20240808 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/sOcqvAryE0c7f_seDFKcB2S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma1b2wACgkQAVBC80lX
0GwQigf+L0cOBrx4nCzlV0NdYtcNHnD1AbbpFYBaanAXCRnH39NuzEnZ3nfCydWP
37jd/myhsdsp1BLqBmgvlH0qsYfvThY0zytOCCMyj0umv53Jcvvub8Xzq5X8RbaI
j2MKgCiO0FER1yb+THGSSebxJfptYNxO99pGh2m5cBxvi57X60mPAaUsLGiNSCVJ
jVxCY34eOE++BxqS0xC7VjCwNh93dB9MSxmJTV2CjDlFkIZqSicrzdJL6YddZfY4
9h9yML4fidNRwndMD4IFt78Sz3kmvI9S9353TEV3uxi9yW7DAZHhLgu5VfxkpNJU
hy/2URR7yQPXRd/cv6VYmGjtBhUzoQ==
=CcRV
-----END PGP SIGNATURE-----

--Sig_/sOcqvAryE0c7f_seDFKcB2S--

