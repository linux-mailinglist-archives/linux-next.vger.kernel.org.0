Return-Path: <linux-next+bounces-3096-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4D293964A
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 00:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A98E21F21DBC
	for <lists+linux-next@lfdr.de>; Mon, 22 Jul 2024 22:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2463C488;
	Mon, 22 Jul 2024 22:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TXSzzb9D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2903134B6;
	Mon, 22 Jul 2024 22:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721686282; cv=none; b=UYcSOhbJ2FVSE/vdzSzWbemnvoHmAXC2h7AWn03MXsTrsm80v6k1u8n+ZNcKpIKnsi22bssxvOJrfeFvc6YAcbbraPeRsRkQO8LhH1ZqKFvtTaj/STAKrMazPS1ft+uAeQrUvOLuSGgr8GxIR6C9zNFIulZMyqssTAPYVwZmE80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721686282; c=relaxed/simple;
	bh=9vZVWygh/jx/N9NoIY5a/jpIqVietZ8ZMjc6JTietAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IA+Hv0Bx3xyscu5IQovu6q9vmWeqvl5oyCjyLWXcB6l1FEcaz8eOolGaMPbJTjoyRs9sgmnlirBkx+abYy1AO8k2bdS/+RnFsBT9muAe6a7vjtYgXHJugjeFnMcfmb++1RQeOoBdIkao/5EouluOSYDhCw8jSvtdB6xDMTbCv8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TXSzzb9D; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721686274;
	bh=kxClKtRtqEAzAbBNGEXeKy0kifIbRl75pcmn0ukBY/4=;
	h=Date:From:To:Cc:Subject:From;
	b=TXSzzb9D9nLjLiNHppCwbKF4zltoqduwzuFmZj/WK9QOM4dF7LvPzpozXVIQnd+I4
	 mWTBHxqd+RKThiir5b9BnuVyakTtA0VWQj/FHIyvQWKCH3fSPgia+YFCIEeJqOameb
	 uxcZZVNqohbh+sbRF5x1Lb7UScJHtVwdkO/j/fCwqJW+Eu+clKFAYWirPXgKVYPHue
	 mL4WVnQzm586jLzo71VD1JTvqEy6lRULxmEsyLYjZsFn8cFWO9oYufPrjJIJD4D3Xn
	 Gc2AtHKkBeSswy6OPilZS9oDC0kO631OxmwM8jv5yfjgOUlUWHyVXBNMz/AtvTlFU8
	 z/iX8hZkPKFzg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WSZHQ1QWPz4w2D;
	Tue, 23 Jul 2024 08:11:14 +1000 (AEST)
Date: Tue, 23 Jul 2024 08:11:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the block tree
Message-ID: <20240723081113.1487a535@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yDsqY6KQd8X8jzBsizM8dHX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yDsqY6KQd8X8jzBsizM8dHX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  2554b855a2f8 ("io_uring: fix lost getsockopt completions")
  77feb9505ce6 ("io_uring: fix error pbuf checking")

--=20
Cheers,
Stephen Rothwell

--Sig_/yDsqY6KQd8X8jzBsizM8dHX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmae2QEACgkQAVBC80lX
0Gy0SQf/Walug1tI8JeXbFVe0tnKeljzX3LypNOEct/LU51Set1izzvrw4zPCgJu
TB+tizgkoVyZzFsWOaAOpor70Pl0Q1w6RXPAH6CVeWyGbsv+a87Owzt+slmftcQA
SUrpCViYN3c/tXqu2UzmY0GxpHE0nyj8be0IdZBWi/vQFNv//rEIsmEnGbBd9IXn
A7QTc85/v6ZObnzqznaeZGnIl7Fv9QXDKAR3Su0NA6cyQ15gnZ4APkl8L6g+3Whp
6sh+8BAbaklFGOKzO3Qr6lkkyqvAxcAM344pvw4WszGNaACj8SlEbjjmb6fKusYz
raaTe0G3oWLlb7b+cjcUfrubYnjg1Q==
=6tpQ
-----END PGP SIGNATURE-----

--Sig_/yDsqY6KQd8X8jzBsizM8dHX--

