Return-Path: <linux-next+bounces-2488-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FAD8FF701
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 23:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E44D62857F2
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 21:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B18219E1;
	Thu,  6 Jun 2024 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A/0f0sJm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9382F2B;
	Thu,  6 Jun 2024 21:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717710442; cv=none; b=nphNbn+wWKNmRgyce9GkQbXZCMOZXwbNiJpnUsbOlgOZAPDcgN1m9mSjmlTvxEbBzRL9n7x+iPXDEr1knD+aS7bXnUNUxYCop8jbuGt1zy0jfBzuon965Zqbz7cXnfsLT/rAdRgclGRBSdA8W8TVlrX4vd6jdZNdHtbOnrgWAEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717710442; c=relaxed/simple;
	bh=/iPN4m0a4yNtyGO2fZsVP3jEdCk2fprkDN6p48JCvKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r3xWDb31kB0BnrueznvF8NJppthuh5j7mrlYhJ8u9teJFQtMPOyG+L0n5EBNNMW+ocGdVdMQoEArARypeX/TSoHssoO/NNe3FU8/zaA1wFcJexiaY3XmsSMZfZ8OeDujwzxpErJbNm3Rcvshu9q1ISxIje3abU+6QluSt44J4lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A/0f0sJm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717710434;
	bh=yQKunjdgLYpgpq4ERfEQ/ViJUETeK4Sm4IU0aIcVhGE=;
	h=Date:From:To:Cc:Subject:From;
	b=A/0f0sJmBt7NCudA0XzagPS1HPPHb1LJIFmVTPZDJUt7t/8kp9lM09+RZjWOJJwLK
	 xOgOwQuVPLECJjTUrJzVADPfqkgoFM8f4BcgQUNGss4gTT31GGMw7K1On8GJeEad4e
	 xsTpoTqaQjUGI66MNvrcFPl4kXsvc4U9ZrEW/JWcZmaK6Bpk4DCmNBxLR4sKroFu7n
	 aclvDdv+hRpokGikTAldAoP2Xsgu78KrbfNQT4rQR7baWoLHC11HvQTw0ouAiSKdaj
	 Cw2tUDuhm0N5SC33bZq8+KKEpoHT0Ysr6vqiOq263E6BXgQ3ooDTQiIf9uHeKqL24x
	 TRJiACXSZ+D7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VwHwx6JH6z4wcC;
	Fri,  7 Jun 2024 07:47:13 +1000 (AEST)
Date: Fri, 7 Jun 2024 07:47:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Cc: Andrew Ballance <andrewjballance@gmail.com>, Benjamin Tissoires
 <bentiss@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the hid tree
Message-ID: <20240607074711.4390fbe4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0lB1VbUxYf8kXxngRTZOhZx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0lB1VbUxYf8kXxngRTZOhZx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cfacaaf33cd7 ("hid: asus: asus_report_fixup: fix potential read out of bo=
unds")

Fixes tag

  Fixes: 59d2f5b73921 ("HID: asus: fix more n-key report descriptors if n-k=
ey quirked")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 59d2f5b7392e ("HID: asus: fix more n-key report descriptors if n-key=
 quirked")

--=20
Cheers,
Stephen Rothwell

--Sig_/0lB1VbUxYf8kXxngRTZOhZx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZiLmAACgkQAVBC80lX
0Gz8yAf/S8QjsnCuBKsoSlI3HHp2pqtIAb1biAfEiy6HjVQn+kg6tKpD22aCkOOz
nK+zcJW0EGhbQvOb5hwNQvmOT2+mOwuLTPmZyR376674cK9I0hl3bpvc0OVaJ+rV
ukdsFa6Qu5UYQ+3YjyfB2Xouo6qeOgiRnOcYM5VPswbZgccfAR3kAW9V/LaV+y9z
O/VAMGOJyctTv6JpfzrtsX9cB+KJvrcbuCHep8mXq4vdcOlVnU9FZRCPJMu6X9pu
4jmKD36NNWegKhOdetx8sSWPtbBNRmCn0WYNSxliPQsqbAhVzVxLiCCRs/CpEbju
3j6HDGw5BEXnCONNqXcSIhL2U7zR0w==
=A6L0
-----END PGP SIGNATURE-----

--Sig_/0lB1VbUxYf8kXxngRTZOhZx--

