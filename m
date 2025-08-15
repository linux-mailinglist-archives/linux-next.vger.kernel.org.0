Return-Path: <linux-next+bounces-7956-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA4B2768B
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 05:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED1A67AD15C
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 03:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193911F3BA9;
	Fri, 15 Aug 2025 03:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="k4vpW/SW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1017A318;
	Fri, 15 Aug 2025 03:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755227481; cv=none; b=OE2NVcSCouuRz4szwPEK8IBEg7GiDhPUoiKQG88mSdNyfV53SQoG89WNMmiStQZauDwa5WyoNNs9bp352tNd5ArgvvPh3LJT8QBHIPjkhjWBoXH/y2v6njklB1r+kbxnx7yUz1KqFOSrKrS3BU3wJmqjUuv3q48mEfwgap6JwTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755227481; c=relaxed/simple;
	bh=qHRRuytUocIu+CsWIt7kgTlmTi700czCAy/wBi+AkVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SYYMhDPyRkEDy6ZbB/S0/Ff49+KkJWBt9pUtEXDWUFC+/6Z2o3/L2FzT6i7ImTxnnW9ilSb/3Yvl2fbIuNWrnOMCsCJNzIEDbZiGpBf4Hvblr9tK1ytksrLfd4jFPU39exHaxq9dsbgHsgpGqJhfK5AN3WkICfp5HWpQh9n/L0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=k4vpW/SW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755227476;
	bh=G2rGAl0K6IpCoyyBehhidHY5X3oFGur3Y2aVw+oVqTo=;
	h=Date:From:To:Cc:Subject:From;
	b=k4vpW/SWjWdVAbW1Xp79aK0HlV3wcdNZucOlMvfBS637bC7BXFKoThg6HCbUxjW/n
	 OMgnz2lDd/L43TjH/m+uigR66ZGaHUc5Vg+VTwgx+JJzdap+eKSblyoEEuKmd6u9v5
	 Oxu09sUbhSVXyQU4WLaIp+6oUgysg/XDzMsqYuH2WgJiGAYhbxtlAN9WaHX5B5MJH5
	 5Y6iHEJi3qLgwEl9qwTO8QLSCBnwQ1RGKKUPbhL6LEwwtH7ogil9sUoUGUukQJdjmb
	 cza3zva7fp7A2aY0NAX88tW8oryGYe8TGouVO84Qm9Z1JeNv3KfBaMLdmJrvhYgUZN
	 kNyNfjx/cEhPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c36ZX1r8pz4wd0;
	Fri, 15 Aug 2025 13:11:16 +1000 (AEST)
Date: Fri, 15 Aug 2025 13:11:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: Dongsheng Yang <dongsheng.yang@linux.dev>, Mikulas Patocka
 <mpatocka@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the device-mapper tree
Message-ID: <20250815131115.45518c74@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EBeG+jrE_i4huEX4E7A8NNN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EBeG+jrE_i4huEX4E7A8NNN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/admin-guide/device-mapper/dm-pcache.rst:46: ERROR: Unexpected=
 indentation. [docutils]
Documentation/admin-guide/device-mapper/dm-pcache.rst:48: WARNING: Block qu=
ote ends without a blank line; unexpected unindent. [docutils]
Documentation/admin-guide/device-mapper/dm-pcache.rst: WARNING: document is=
n't included in any toctree

Introduced by commit

  6fb8fbbaf147 ("dm-pcache: add persistent cache target in device-mapper")

The line numbers are *after* I applied the other build failure patch.

--=20
Cheers,
Stephen Rothwell

--Sig_/EBeG+jrE_i4huEX4E7A8NNN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiepVMACgkQAVBC80lX
0GySFwf/W/mra21Cq6REwIEyeGLGO/9Gi0zy3hK/X/MmnYHkhvp116h1K+NkX2hS
GFdE5mvGvdvntPVwz+bpEbRxMMyiS/sE1a0np7IWFY3Xy6uxCApbzCuFntre27bK
jAsqWPtCSJx4tBCTdpvU1pIqlrSYQOZdjIM+1CISmD3W3eaY+8jAAhhVMKGHj612
sEJBGbGpPHqBnzZxCEcictfE+SzZEN43gNlLvSTQW15npV58Mf474bzcE56OacM1
4qzb/JQcWrTuirN2Z34dnCMuVPmL95pcsJkjBl6pLyf/UA93zdLuoTzCe9B7ioFa
dKuDd3M0pXjzzTRobH29WQCE3gulHw==
=ZwHT
-----END PGP SIGNATURE-----

--Sig_/EBeG+jrE_i4huEX4E7A8NNN--

