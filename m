Return-Path: <linux-next+bounces-8753-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 070AAC1D842
	for <lists+linux-next@lfdr.de>; Wed, 29 Oct 2025 22:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36FEB3B1453
	for <lists+linux-next@lfdr.de>; Wed, 29 Oct 2025 21:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8592DAFCB;
	Wed, 29 Oct 2025 21:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EdWGTwUf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B632299A8F;
	Wed, 29 Oct 2025 21:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761774727; cv=none; b=gnGOjkc9+RGaN+3k6MQSBwN5SIk8dbXkeN9PJ6tVVv3QVKhOYt0d0jn7I1jsG+CrFGuzJPqoVChAl9DUagkl9EGoxlHGyGexQxBJAyqLvAH5O/1KJi99ixgNs9dhz0APTAVbTyAeACa3xWy3Mat+NYoewvDauJ0zvvv6h/ygS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761774727; c=relaxed/simple;
	bh=FLS8RyiGm0u2wczORyexcBCuRP8pAa4MB0CjK9Bw1pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BetCpgwS6oV4a0IW8wW1moICXci3bUxpvX01oQFsWPJvF0k0TZX+Sf4ZnHmy2wHHvpQmAHZ5Pc26oKk86P29b3sHs1o/7TcQh4YH4L5B4Ioli2jlV5ol93pSxwYzkzLNalD3lW7hFPKKBHEsmbDj7Rp7IeVlTvqw/V4iz3Ocp88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EdWGTwUf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761774720;
	bh=YTY23PpFudMI3M3HdegKuqvRuIxptco4kHRxtOA/Iow=;
	h=Date:From:To:Cc:Subject:From;
	b=EdWGTwUf3shaV/AnBFR3aIToUPJuGTeG9n1ZKJk/+g4yYw+6MVSieZf0ZaGCnkFSm
	 y4XDMC7CSMNLOBxkQXNeidjcuRk32Gd+I9MUGPPImHvL1TYAmxtTY7+C335rcRH7TD
	 G5Ni76+7W4RlzJM+6HpIhlUDks4Z5yH48/wEfaEwN85zereu/ZcUOSuviHJcaLdTiZ
	 wKao9RB3QZcvDhm4SruoY+CSrBffuYrXyXv/3vVfAEMR6qFVATzj6dJEkyy4CEJqky
	 Y9zx2zyz4OnW98JKZAwc3chP1kkDsk0N0MoFxNFbfw1y28czgqZejNV2hft56JavSK
	 2IJOEIj8E5QTA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cxgv44c19z4w2B;
	Thu, 30 Oct 2025 08:52:00 +1100 (AEDT)
Date: Thu, 30 Oct 2025 08:51:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the jc_docs tree
Message-ID: <20251030085146.37ab6bd4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pcVQcAoYVK/VWzca5yVN6p2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pcVQcAoYVK/VWzca5yVN6p2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  564f84128bd2 ("docs/zh_CN: Add translation of rust/testing.rst")
  6d4a6d623098 ("docs/zh_CN: Add secrets coco Chinese translation")
  344657696e9a ("docs/zh_CN: Add sd-parameters.rst translation")
  989a716b1677 ("docs/zh_CN: Add link_power_management_policy.rst translati=
on")
  6c07193cb80f ("docs/zh_CN: Add scsi-parameters.rst translation")
  cfd923323d14 ("docs/zh_CN: Add scsi_eh.rst translation")
  da6572ec7105 ("docs/zh_CN: Add scsi_mid_low_api.rst translation")
  16dfba1581b5 ("docs/zh_CN: Add scsi.rst translation")
  9162cb790b42 ("docs/zh_CN: Add scsi/index.rst translation")
  fe67964dd6e2 ("docs/zh_CN: Update Rust index translation and add referenc=
e label")
  1e108599ebfe ("docs/zh_CN: Add security SCTP Chinese translation")
  b12bb7728152 ("Docs/zh_CN: Translate timestamping.rst to Simplified Chine=
se")
  4d926084ce6d ("docs/zh_CN: Add security lsm-development Chinese translati=
on")
  6d624576ca3f ("Docs/zh_CN: fix the format of proofreader")
  25cf7924b579 ("Docs/zh_CN: align title underline for ubifs.rst")
  e3f873992cc4 ("Docs/zh_CN: add fixed format for the header of gfs2-glocks=
.rst")
  37b1e0d4ab11 ("docs/zh_CN: Add security ipe Chinese translation")
  ab530c5fca9b ("Docs/zh_CN: Translate generic-hdlc.rst to Simplified Chine=
se")
  d3e7609c6e5e ("Docs/zh_CN: Translate skbuff.rst to Simplified Chinese")
  6d35e61606d0 ("Docs/zh_CN: Translate mptcp-sysctl.rst to Simplified Chine=
se")
  0694113d49b5 ("Docs/zh_CN: Translate inotify.rst to Simplified Chinese")
  f4121e639fd3 ("Docs/zh_CN: Translate dnotify.rst to Simplified Chinese")
  250fc3d68a90 ("Docs/zh_CN: Translate gfs2-glocks.rst to Simplified Chines=
e")
  a502ffe48523 ("Docs/zh_CN: Translate gfs2-uevents.rst to Simplified Chine=
se")
  46ea6a90b59d ("Docs/zh_CN: Translate gfs2.rst to Simplified Chinese")
  e0bb4c3524df ("Docs/zh_CN: Translate ubifs-authentication.rst to Simplifi=
ed Chinese")
  fe460c3ec8b1 ("Docs/zh_CN: Translate ubifs.rst to Simplified Chinese")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/pcVQcAoYVK/VWzca5yVN6p2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkCjHIACgkQAVBC80lX
0GyDgAf9E1T7UmhECxjpyZ4JaTZW9GKiD2fasDteSj5l+uLPxlx9p0uoq1Nejtqj
TOm4bExwhTzNzE3aAV9nBw4qOGoJ3qsyZ0qIIpJNshUetOaLrzDYyXPDyJBSP2Vv
duSYyPW2ILKNYhyfOOpfLb3afnY+Lzk85PUVaT3p3L9IwU9hl96p3qoEMAWj/XWZ
VSWHwBWS0S8Mq6SyFRyN6pj6K07SGByT4lQVNdmyDsIh4pHiajK0SKcuZroPYke3
X53gu0HSazAJcNpprh5mHCBsYibgZUTFH/6PjMSln7c4+RBV6o0CyOgdEd2Lsf2C
Phs3eUWOLBJhPUKgFutUTc8HvWBZng==
=+40m
-----END PGP SIGNATURE-----

--Sig_/pcVQcAoYVK/VWzca5yVN6p2--

