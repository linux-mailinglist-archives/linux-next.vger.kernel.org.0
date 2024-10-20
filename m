Return-Path: <linux-next+bounces-4336-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1AD9A56AF
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2024 22:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D62A1F21AAD
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2024 20:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1907819596F;
	Sun, 20 Oct 2024 20:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tbsZbRoD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7D3EBE;
	Sun, 20 Oct 2024 20:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729456712; cv=none; b=Au+OeyKhiWO4e/bUwtWxl85skRdWgKZsYEO1gIrC6934tcJcNUhNW4vWkcwwYCAPQtvHOkMO7irHQ+PT+WzeHYbYDv6K20XovGN6w7MVa2UHvXcyR2tAnVsJG+EO1ky8s5jqVRqA7iE3sXKJfmKqiWCXbT5lRcksq4adjvQ85+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729456712; c=relaxed/simple;
	bh=zh8WXvb4pOel/M9rWGjzEwB1wBqWIcHGkly/uLp3KfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dScsrGkY56i/lH+6srNIWdEP3LQ3zT+OzzAIC37OuZP49wrnNsQVgzOL1b76OkPWQLyTqNJ7zVwAWbZ9KrUnHg7Fl6M4+OzC1/7QvvsctKjG2sw2D1KrTRGRTZ01jU5ASiyvCL1DRVXojQFLBmRCEJaUKgPCMN/1o5qR0aT4rP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tbsZbRoD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729456703;
	bh=zh8WXvb4pOel/M9rWGjzEwB1wBqWIcHGkly/uLp3KfY=;
	h=Date:From:To:Cc:Subject:From;
	b=tbsZbRoD5ngp+W4wUN/MMzgQi5HRoNnhdcgKmW6UDad8MYePwMcSnCoWNGKz8hUvF
	 WgNA1Iw1661poQgQn8phd6+8ZEkgp2+wHIEOMP8rc2vkMG85Y8BV45zSI+gIRjJ+dY
	 3mIyweaMJlNV+FPKpAZ0sHkFNEDPz5n9vfa4ed9iVvyMxC4/iJGrW3uyZigx/yyezZ
	 2ZVpwNnViSbxwupe7bng/bC/Tv3RsfCxMAC3N0OpV/F8H8W9P+8Zc/H8RyjuaCCZGn
	 YsxPaULi/XcHFSXfjsqH+bi1ClZZNblrANQ7/5H80zNGf3KPWX1Xid7A93P4fAhVZn
	 dMg0ObL7JyHXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XWqyl2yMsz4wbv;
	Mon, 21 Oct 2024 07:38:23 +1100 (AEDT)
Date: Mon, 21 Oct 2024 07:38:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error trying to fetch the bcachefs tree
Message-ID: <20241021073823.1a89e1fa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B5hNYQIqPi2eE+kOASZ1UpE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B5hNYQIqPi2eE+kOASZ1UpE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the bcachefs tree produces this error:

fatal: unable to connect to evilpiepirate.org:
evilpiepirate.org[0: 5.161.236.196]: errno=3DNo route to host

This also applies to the header_cleanup tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/B5hNYQIqPi2eE+kOASZ1UpE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcVaj8ACgkQAVBC80lX
0Gwu0wgAiIjTQmPepBaLiL+gNQ3Om6G0Xk+FPq8C4lNA8WLK23vZb28P5sSIx2Qk
+he2Y9HYKpcWhMwbPAF5Rmqfjt4fvVBYwioNV0DQCjusO1jwtTgeZT39Ybxruvu/
pziAoG3YDGZzsu8HalYuxJIkjcri5uumrUyorMIqpjSVJaTvBOu226rB1IGZyQ65
xRFXAN0WQsaDoto9VHg19Yg0jAeVwO1K2lLV/251a6FvfbhoSAkYfr8+tI4yGtyv
ZGvxEnGotTv72zg3Mv6qt7UkRE/e/KC9K+rOVfU3DbhiPwIOLe6C7wn4kf1AGxTh
MgoMlVCrUwSWZIGgm3kDrYvwRXBtkQ==
=kXfy
-----END PGP SIGNATURE-----

--Sig_/B5hNYQIqPi2eE+kOASZ1UpE--

