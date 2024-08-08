Return-Path: <linux-next+bounces-3265-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0224194C6F9
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 00:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CBD51C21E1C
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 22:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA65615ECCE;
	Thu,  8 Aug 2024 22:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D8NUOW/u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B81E15ECC3;
	Thu,  8 Aug 2024 22:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723156068; cv=none; b=D/rVL6Knq3HFpQhZu+hKZ1YYoTqcdAkDby2qzDzeqR6FJI75OcWKnk9LYFUYR/nVfCN7jzgifoRp0ImqXXNUEkQzJiF+GhVj4+cYl/EQq2kfWCq/ZfbsK85iIfsiuHs+zfmv2QlaYDx3fonhg9ogMTwvxbUmoi+Ks6i6U32upv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723156068; c=relaxed/simple;
	bh=N9hWX0JLDQr+VWllV6AgBk/Qkw1o1thfCRZkimvQxc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iF32pFF1HJsKL9PYm4W1SzjtrxKB8NyAVAIlSkHmxfLJidTwqiw/u35TBQC7tVab3iweVOXdJRSgl3wTc0t8SWxuFRGOkkA2RSWgzm/aU9mCpghTw2rLknzoFjbAl8HVciwElmDRZqTPyOcx2jg3oEdTqEYzxqZGLDJt27C4hiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D8NUOW/u; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723156061;
	bh=j9ghecbn5ESrtKhpB8s7fkFBHCEx4fmHAVGbIzd+8QE=;
	h=Date:From:To:Cc:Subject:From;
	b=D8NUOW/uF3psLxpV2woeEdl6IYumLivUvKEojH4c5npX06MraLLlrD0iWaSFsIrOB
	 KNaZzHHKRGIHQPS8Dpr3ikc1FYqiOLG2OQsGRtgnICi8yp1ZwwGCINzXK7q7n8mhov
	 EVTGWmHwKJKRDUHr7Ynl/5YEIZRj1JzrsDdn86eSqyRMXsuO0SPZvsm1JBO+SYNW8m
	 agf5wOoN1Suuzh5BYqtQ9MOLEQpy8yQExG7lnzXR7Vw35ObD6IQ9D6xrejiQCmF/+m
	 /l1Ydc61T535RG41qTfQXjnIzEwroDcOb+jgMU8+xLTnDlpapoJ5kIjYRGPE/uTntF
	 qjf1q4P7ABhGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wg1rY0mtVz4wbv;
	Fri,  9 Aug 2024 08:27:41 +1000 (AEST)
Date: Fri, 9 Aug 2024 08:27:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the mm-hotfixes tree
Message-ID: <20240809082739.10122353@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5gAn2p7CPAxknZuG1+5.BkC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5gAn2p7CPAxknZuG1+5.BkC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  13eb8be05d21 ("memcg: protect concurrent access to mem_cgroup_idr")
  182fea3d44ff ("kcov: properly check for softirq context")
  2c5847c7f011 ("MAINTAINERS: Update LTP members and web")
  3589180d75ed ("padata: Fix possible divide-by-0 panic in padata_mt_helper=
()")
  90d939fc8e3c ("mm: shmem: fix incorrect aligned index when checking confl=
icts")
  ab579f2dabe2 ("selftests: mm: add s390 to ARCH check")
  dcdfab51b37d ("mailmap: update entry for David Heidelberg")

--=20
Cheers,
Stephen Rothwell

--Sig_/5gAn2p7CPAxknZuG1+5.BkC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma1RlsACgkQAVBC80lX
0Gza7Qf/UQhT/g3YTWgVKaDAWmavgX0OanI1Fb23sKDcacCv4lNq9f8nPb8hi7UM
y5s972hYJ/8tn/GfWm/DwIJvsrwc4Dqe7ylPGrvTPKpv/D5jbfeil0xcUjhnDrN1
ciJdyZGXZr4jNTmJPHmW2zvFIpnN4OAQo5J0RCyCcDJNDfPSddlwJq6tUUJrMsJl
3dNOKKgSLvJYuhwP/U+n6VpTmNIO8V4s/kyPFofErqKfzWaF/eOUFAlNZhgV9Uvm
wUGk4npSSpHYmvJBuANtBkk4jcLkhaqldVVfsGl1u74Hns+eA96bkY8EZZeEyWV6
lKWnkiZt4++G5IcF0asuTWNHPUnEpQ==
=0iiR
-----END PGP SIGNATURE-----

--Sig_/5gAn2p7CPAxknZuG1+5.BkC--

