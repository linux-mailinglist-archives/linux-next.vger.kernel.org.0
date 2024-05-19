Return-Path: <linux-next+bounces-2352-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E101B8C9730
	for <lists+linux-next@lfdr.de>; Mon, 20 May 2024 00:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0460A1C20850
	for <lists+linux-next@lfdr.de>; Sun, 19 May 2024 22:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B235339E;
	Sun, 19 May 2024 22:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hExUOLb7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767B12E6A;
	Sun, 19 May 2024 22:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716156810; cv=none; b=FGCH75FUdD5L4Kr18D65uwJvUm/jq5vv84+uB9JGBFrTt9MS4dAY7ZkzslLkVRyFsaamddrpqAOgMw3aj/XHmRu4KGhpnSlZbI1bm69mH212+Mt4W0ejRUmfpt2hHdokqgspA0FIam6CHYzWqJkdUCHfDcPyP83hd+cRbR6uipM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716156810; c=relaxed/simple;
	bh=j6mu/mzzm1BTh7OZuCIEzxe1kk8VKmd79CiJpdZckvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Oj8OU4Qw8Ew+W7B6tzLCAQ72ruOL+iOos3ung83shHbT5Vqqu1UDl0VkOt6alE3OfLHbUKE4z1SG41MFLpDsWvGtFlqcMvSZjOp53YM3AX2bWiQcnmmsUGTBdVLxkzflTUJYeLcbbg038ImbavQErIO/pkPV8rlkKoOU/BkBoMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hExUOLb7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716156804;
	bh=uwGFDmqqgD1QU85nJB0RJL4Mhki2HTGdHtNGgoDw1hg=;
	h=Date:From:To:Cc:Subject:From;
	b=hExUOLb7P/5R6nBOrLFKRmJEHZ9UTjsCToi1aujbygiAlhyzWmWskBwTUmngTcnFw
	 gCvn3q2n4sHNiTxsOROORIVenZwIHD5WQVi7F6ZOGX7C6z5vXRa/kyuyqwrTPx6HrH
	 SGscfqf61HY7EdMiHTh1YS6k00nmqUzjFKVnD+K1A+otfjf9Sk24sBJDPpgwdBYWc0
	 NC9tnAs3m6c8VZiZziR4ApmPy2ITlbF7vOsOlLsP3mDEF9Fq4xXMhNy7BgkGez8vbE
	 nSPi9n3QXz1+DiEiD9T+O2n2qiZR7UkFxoeSb10r6C1eAVLDEDlY1BaNpqKJ5UXMGK
	 pXtuUmEyisSSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VjFMR4khbz4wcR;
	Mon, 20 May 2024 08:13:23 +1000 (AEST)
Date: Mon, 20 May 2024 08:13:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the random tree
Message-ID: <20240520081322.6ba49ab6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TeU8xM1ZQF42/NDPuyfXb_n";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TeU8xM1ZQF42/NDPuyfXb_n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  1fc5311ffcc9 ("dt-bindings: rng: Add vmgenid support")
  f5730cffbbaa ("virt: vmgenid: add support for devicetree bindings")

These are commits

  a4aded1ff575 ("dt-bindings: rng: Add vmgenid support")
  7b1bcd6b50a6 ("virt: vmgenid: add support for devicetree bindings")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/TeU8xM1ZQF42/NDPuyfXb_n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZKeYIACgkQAVBC80lX
0GyG7Qf8CrTkYyiQpjI3cC8gedh6lCQkaCPux/DDM8yJCUnlR8ocSh+aXPIWdLgr
xaDiTPjmdolRjrL1dMT8DtyauOMgKIRLU6nr54N/EAAb97NOdLi27EXcWe1r2QcA
JoXZhCb4f89KC2HlLDWDGFPHsmOtNOTUSaVEu87XeCHjqH+vrdRxrkQL+nEV08E6
uRFai/bCL4oqDo5S9u63WFePxyfB5H476JtpwzWMiZY81VeyMVg7cGUIUu+zu+Gx
OxC3rjvlz2eBEMHTNx5cJghuNX+HzwlwvLGpFgUZimBcLffknTvzDVWY72kDcjQ0
E+8OiQ237IhP99LBLi+W+Kujk09mDQ==
=Uica
-----END PGP SIGNATURE-----

--Sig_/TeU8xM1ZQF42/NDPuyfXb_n--

