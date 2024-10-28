Return-Path: <linux-next+bounces-4475-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FA79B2A69
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 09:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B58E1C21BAC
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 08:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5A119006F;
	Mon, 28 Oct 2024 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EA//oOpS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E670218FDDA;
	Mon, 28 Oct 2024 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104369; cv=none; b=DM0sfOpooZPhpxUuveUUQWeDH3u6moJPlnG5pkrdCSxwdV/BNCoMjuS+oiR3dZICySOqzAYV+DDWfnHtdWjhE7j0yEHnJtdlWzJXf1ouiVYklRNJU/EdwpoUwHGyKCU6Cvw00rCIOw9DPhHq1w/aD2K/bBRLEEgYvpAAa5KlhJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104369; c=relaxed/simple;
	bh=GopXkU7JZeDGmoEI3dyDCtA1W4Jba/2uUa+yYlwZQ7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bUysOtPiHCu9Yr6D8Hijm+op+5NoBEQLfhyEAU++gnwumb4Mb9q1lnhan6BxZC5q3oYMnapk1aEP9jjdjUPTz0Je6VVIe8u0jqb9fXGtNAsCYHppq1YEeCEzBLZFNRhgOf0G3S1IrULoaaL6Q1QNOLIwaPIQnI0pXSIKCbcFsQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EA//oOpS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730104363;
	bh=UXVdC8/hF9DUQqRlF8lE/R+BCP7Zc9XO7nh8h9iZO14=;
	h=Date:From:To:Cc:Subject:From;
	b=EA//oOpSa7iw3yfpZz0D08nCFju5n6bmGgzjVd/EUQU+1cgNnkq8A9+mn4KLgDTsu
	 kwlajH91zZU9M/dd2bdIT9CPRcEUtr5qkM+Zsu721eVM5Yy/KqGo1OBCLh/fEdSznv
	 zsQ3Lelh1MnOvc7ItOpR3JNqUE024Fn0uEXAmRONAoa0DunfAER20xjv+8O5MY7uKo
	 3DR+1b12x0aJbNJbiPklAfj1w+Kwzmcyh0MPuV0oLEnP6AUACdD3JVxqWMBGWexgz9
	 ANauGU4Xm/syOXPZsFWiOY1fKxChX0fSBLKh0sjNVnmQURt8o9hurQ4MDxcwTD+JuR
	 4B/JXJ9YMfr4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcRTk2X2Pz4x7H;
	Mon, 28 Oct 2024 19:32:41 +1100 (AEDT)
Date: Mon, 28 Oct 2024 19:32:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the sound tree
Message-ID: <20241028193242.11597640@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kAhRrKdto6A0ANvgjKtDqYE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kAhRrKdto6A0ANvgjKtDqYE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/sound/designs/compress-accel.rst:67: ERROR: Unexpected indent=
ation.
Documentation/sound/designs/compress-accel.rst:67: WARNING: Blank line requ=
ired after table.
Documentation/sound/designs/compress-accel.rst:68: WARNING: Line block ends=
 without a blank line.
Documentation/sound/designs/compress-accel.rst:72: WARNING: Block quote end=
s without a blank line; unexpected unindent.
Documentation/sound/designs/compress-accel.rst:73: WARNING: Block quote end=
s without a blank line; unexpected unindent.

Introduced by commit

  04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")

--=20
Cheers,
Stephen Rothwell

--Sig_/kAhRrKdto6A0ANvgjKtDqYE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcfTCsACgkQAVBC80lX
0Gy85wf/bH20YNzEfDoqAStGTRv8vcbFg0FDgRNzKvgpK7HkCIMdT/VZHKuCcGYJ
BaJjNr2ABfeF8qn6Z9J4JK3Pv/jDb1A/3H9AQifaEIVeuJfvtqNepzccKea/c8n2
T2Nm/UrwpmVRNVulvtivg6ypCa9oia87tf7p/SCznXf5aBgxhZTUv05M7x1kz6ox
cTRIGQCt8KUlJcjTxGOkxlX7EiLEBaXJq5koQoONAeXUatupbYIGSORnjbSQGLvO
40KXjz16T1ovsD8ge4/oPRPsNxPZrpWz/6Vf/erG+pRMBFi6G93zHOcXrfpLfvhm
50N3/Z+MYxCn2XqAGkaMRfYBopuXoQ==
=mMHJ
-----END PGP SIGNATURE-----

--Sig_/kAhRrKdto6A0ANvgjKtDqYE--

