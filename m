Return-Path: <linux-next+bounces-4835-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626F9D6CF5
	for <lists+linux-next@lfdr.de>; Sun, 24 Nov 2024 08:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2016B21182
	for <lists+linux-next@lfdr.de>; Sun, 24 Nov 2024 07:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734C138DE5;
	Sun, 24 Nov 2024 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o4f2SSI2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928132C80;
	Sun, 24 Nov 2024 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732433724; cv=none; b=sa6dlq3KNx7KRKcR2ttaUko/hepUnPYwcmAelSsNrCWuBF2vZrydHUtWH2k+L92zVsBHjqboB0FZHRKZeNlVgfp80oNrqsg+0oXQcCUCVfZR63yGa/YKh6CF1voQLNUxpJcjchsB7NMatT51LK5LIFEr8eqqinaquQTduf0+150=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732433724; c=relaxed/simple;
	bh=xD0OTv8NYqXJUcI0861MpKG3gedbbh4T5TGm05+Z46s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QTB5QOYZWZJLOHwq5ibP+NmVsKmPQclclRKjyxvvyNrBuqr8UAfZ8PsRELRAsi08sefTn+Vr6vaFWvSlo5CKpA3ZQd/RpY6FN/YLsxjAVPQ4PMLosFR7HvJS3B9cQurixoY+na/4s1o8dx68QrK/ZgHvjbHbZ9KqA/q5BDdXcek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=o4f2SSI2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732433706;
	bh=ISNUCydJFPrrwpu/ZQRl1WMIOCTUMaovewwJ98YskrM=;
	h=Date:From:To:Cc:Subject:From;
	b=o4f2SSI2WsD4MsmFe+i5jSx3oRxyB7SnoK5XfQcVwNp2w19vAzp2EYpciiD3iVRO1
	 00jNLcOvyWgqP9hdFe5AJjNI7bFvmp0QwvPuC5DnDC9mmkznyIX7lhaJSwQUzNxwxX
	 aXSMznstdr+JednLMvcws1x3MLluEjRBAYXELjHuIjYcVpRkNDy7U/QquYwvDFUIia
	 NLSzvmA8pXWKva9ox2IjAGkgTZ0dCWsWAWYQRv25hjtQqzYLOFi/M+biwERcZLe3nT
	 meX5HcQnG6hNsnbguhbwsm68li+FJVt7pczfR0NixLC8P6Oqwt9YLIzUynfHmxqZgM
	 NXtwV3nMijg8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xx0wp17pxz4x6P;
	Sun, 24 Nov 2024 18:35:05 +1100 (AEDT)
Date: Sun, 24 Nov 2024 18:35:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bcachefs tree
Message-ID: <20241124183507.5241d705@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s0htmlwwT+yDhu/dNb/xjrE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s0htmlwwT+yDhu/dNb/xjrE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a4f3d037408e ("bcachefs: Fix evacuate_bucket tracepoint")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/s0htmlwwT+yDhu/dNb/xjrE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdC1ysACgkQAVBC80lX
0Gx4YAf6A8bqdcC6sthwP54prMgE/HK9rLuSbF1Fr5GoNSkP0ajxafjbZVOftmkD
UWtg5jOUm7yST61ELoWEarrCMGIjN7oEQuY8yCKfhqtGogsfa3+V7HxEnGdZ6ooN
NZBzQuETYxv+GgWM7ZSCOcTu8+ShqjW3pt3d9D0WAdb4AYegAdspspF3viXDMArc
pqi1/0mOpx1YE5LK/kzsBbSkkfE9BdEzdigRVmrTsGpig1awio0MvdRTVxG3efHW
lII3RFpYGlOwhBhff4UBh5a6x6z7+7csLiUSPew2cSXl20L/e+H6KSpy/LA9f2DG
qhwPC6m9wJxjdIYsS0jrNvEpTBUZqg==
=+B4i
-----END PGP SIGNATURE-----

--Sig_/s0htmlwwT+yDhu/dNb/xjrE--

