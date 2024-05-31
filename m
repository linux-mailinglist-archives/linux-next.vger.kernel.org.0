Return-Path: <linux-next+bounces-2437-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B2A8D5A53
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 08:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6C62B21D3D
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 06:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5357BB15;
	Fri, 31 May 2024 06:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WC9P8+zI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED6133CA;
	Fri, 31 May 2024 06:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717135846; cv=none; b=UgWbrh5Xux0bOYbFtO8jOlxAReJKryqqIL/1AY/Xvh78QRfUkT2Klj31AZV3Ol15MMjBVm17x/0bz+ilUg1fLd3c8Mdp7av5kDDvHE2oeoNNLPAwCE36/7p6I74RVZ2dFibnCvyId2/SxlLZFPqJCD1uO8i8aHYchvJmughvE48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717135846; c=relaxed/simple;
	bh=Gj9gzF0s09A4W3AMe8wB0HJKcKD2UaFP6kRjeco+TcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OpRpyOf4X1zQblaH+FL0C6aLBsxJ6bZNJs9lvWFD/ftqrPgd6mNubtx9Lnr5D4kLD0WE3lvOSjCOJ1oipHRhPkGm667kmmJ7uD/QVFawtqGmD72jZb1hrbv11d60d3gIKx5aIyVmOI2/LCFJFK7eYaGsD9DWONx/vqtJNBwCzbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WC9P8+zI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717135842;
	bh=N83lgVL3UmZpYki66e4jJm4aMg9RNq6U/qMJo4knh10=;
	h=Date:From:To:Cc:Subject:From;
	b=WC9P8+zIndY4+dF6Gj+kkymZbh5Fq+MYEriIkFM3T+qn5gMqBzP8M38Cux74QsAqH
	 VuuF+AslOIuRZGzKT/lE83loOJRdlgZQlEGzWl7d5/iyT23YeDtx8ESMAtRsNiKZwJ
	 tbpZJ+iqkpWWN6N0uI9ZEJB0x6+9fxQ5/lewiVkCmDmb2oXv9fckqxlaP778FWpNNf
	 L4uHV/5k1q9Fx7uPqC906XUPRSFtFgdduLp21AwbYsgBXHyWJOdaVthT9egI9hxIqa
	 LNu83U9skv3Ci7MsYuF44okGG2jbYbQFzTdKW+20CIkW5DYEK7IE+GCvse3kXUGOq8
	 g7yRF0oXTPUWw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VrCR60kh7z4wbr;
	Fri, 31 May 2024 16:10:42 +1000 (AEST)
Date: Fri, 31 May 2024 16:10:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the risc-v-fixes
 tree
Message-ID: <20240531161041.600281e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d.XZadld5LF+Nb5qf6dE2sS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/d.XZadld5LF+Nb5qf6dE2sS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a5e8a5b08a48 ("riscv: fix overlap of allocated page and PTR_ERR")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/d.XZadld5LF+Nb5qf6dE2sS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZZaeEACgkQAVBC80lX
0GyMWAf+LmUmQOCdbf5PIYVJvVohKjXJ+I5qQRQMX2cTvy5iak/iGBcoi0Vi9GGT
EfMyIiyrMB1IuD/CKWmF65Kxg+u6mX934C5QjgiXq/diaeM94Y7D4L/JCSGPVIY/
mqrFdCEMoPL37681fj9CSXtVUEZyYw2BipBkfa/miGS6/V9VrMOThBtX7jyJ/nbm
DfqxMADY+CYHGXKy3vomIsOnH1+1fVmFkxv3XJR4zb/DlhkBs74fbnuhgfo/t+SD
HyfG+FccSdeJRdMVY/es57aXwOMCT/G6FW94XNBvWy4eepA2hoVePyitXMdN7zVb
HlV5LQk/FtiTn2ehPMyTceoKNQO1Kw==
=7MZ2
-----END PGP SIGNATURE-----

--Sig_/d.XZadld5LF+Nb5qf6dE2sS--

