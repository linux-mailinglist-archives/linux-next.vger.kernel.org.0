Return-Path: <linux-next+bounces-2832-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0F4929D7E
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 09:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43FDB1F2267C
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 07:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847063611E;
	Mon,  8 Jul 2024 07:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="E2zQid4O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289081F95E;
	Mon,  8 Jul 2024 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720424844; cv=none; b=uHLTWJCCcTyfLfyi4+wHElmVMkx3Ckq3F54XFlSpeMTie4Zac7TcQvfQi9xtKkA7N8OXy9B8X98M5gqQp+vpA0Fzf6xlPbyKrEdckkLgBua8LtpUc1+yHQEkVrCUKOR5P6ulrTz2ACixoYLfZRgc72tI3PN6g7SFmYmZrKCt1PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720424844; c=relaxed/simple;
	bh=8Z2k3BZcwmPS5NZekmHHmhoLxoCPN9hUUCjEfOMVLVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jUvzTSjY9AcyZ2T49lDS5HcDXOZBOO4x91K06yZW/nvsoTs77HCGnFE/LkFEhoIsaWcMjdfV6dM5oW8SrBT4ACnD00MBPDaj92Pm8N5Kn5GMRfEETkWfuPaFQFyCfYN7TeO1N2jCul9Wn5QfjUjqSvNVnFZ3yIrtJ35VRsqc0ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=E2zQid4O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720424831;
	bh=09Zjy/rSrpJ72U2T+hum41Qx97pBBeO1XCvHM8jaFZE=;
	h=Date:From:To:Cc:Subject:From;
	b=E2zQid4O1outyJKvdhhBUo5fNvJp2cQMm06jddT77Si+gYVTDaebxz10GmgXgRpEb
	 piCBPo92dRuLjE82g+nBqxSNElur7Fglk+FztMwy7TEUXwTTw7sDRjdaT8Ck/D8Nfa
	 AyUOWDP2z0CSzYr/hzmJ9dIaCn+iPdYBVw2tK6HB7OW06zExYl5U69XXVzEQHrBArZ
	 KSz/3AorBStLbZ1ixIy5AF+pmZuTnLIQla3SAigE9wcFwv/cR+mIcFW4B6dgryZ95I
	 WLtbfNnZphxEHfyOJ+GvPjIUYPiWR05X/8EPk4gfhTPnAJT3kQD3HKpj/nsr9xa39S
	 OMIUGgcjbhVwA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WHbmv4GCSz4w2J;
	Mon,  8 Jul 2024 17:47:11 +1000 (AEST)
Date: Mon, 8 Jul 2024 17:46:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the mm-stable tree
Message-ID: <20240708174640.3f489828@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fc80t19hb0462kiVFqyPKtw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Fc80t19hb0462kiVFqyPKtw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  1ab8425091db ("nilfs2: fix inode number range checks")
  49ae997f8f0d ("nilfs2: add missing check for inode numbers on directory e=
ntries")
  68ed2a394a01 ("mm: avoid overflows in dirty throttling logic")
  76ba6acfcce8 ("mm: optimize the redundant loop of mm_update_owner_next()")
  8dfcffa37094 ("Revert "mm/writeback: fix possible divide-by-zero in wb_di=
rty_limits(), again"")
  f41e355f8b48 ("nilfs2: fix incorrect inode allocation from reserved inode=
s")

--=20
Cheers,
Stephen Rothwell

--Sig_/Fc80t19hb0462kiVFqyPKtw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaLmWAACgkQAVBC80lX
0GxUVwf/W6flLKGxkIKLkJjlNsR2L9YWgiVbQFp583xQiz/8bHHxbZpmMN3M7KxZ
TLfd29YDw+HqW7BxQDNXeg2WjuisDOvvRZ+E6I5/tCGwNfYmaHRGR+7oG8AU/fRV
WBt82NGIEfPZ1VeYRfkHGJjOZ3bLzg0JxRj8D74ocbvKSaFxXWeo0ZCA3xSESoFp
kut0M2rlrTK6ur/TKY9LcP99xcjoNPGtvQ6A0VeJ2jtWpPO2yfnnWOkzidFo5CPH
m1Ii8FF17HWh6U9V/hkni2nTfgO/j3bHsGHqGZlE1BPfIKgQiv0Ze+lSdCVPp3pf
8SyCMl1ekblv07FxPOsSCF3BSG/Kfw==
=J/NE
-----END PGP SIGNATURE-----

--Sig_/Fc80t19hb0462kiVFqyPKtw--

