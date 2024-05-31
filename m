Return-Path: <linux-next+bounces-2433-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD25B8D59D0
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 07:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AF00B23D8F
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 05:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39172E633;
	Fri, 31 May 2024 05:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C5hqtUW8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9887B3FA;
	Fri, 31 May 2024 05:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717132953; cv=none; b=BXIoo+wbQWmOs/niuyGP2uzxEJ2vIKMPI9MhKyDEURuR6kWv52P2ZysT2bQWQLCPws/VkksnhKusSNorWe+L7dZDWvHMLxY3rsnurYmDT7KHog8y02LiHMAY/sTV+sUZXbzxgTPxp5ciyNfJ4kTlQNRva8hSh33va1hOLxeA5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717132953; c=relaxed/simple;
	bh=ExOyrGLPq+cbNBHLnaqRDpbl/UFvrtdYmxw57uBQYxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W6iF2w1PhFa5P7PXb7HRcDrfeTjbxbFGqSGHDg19vPOK/06LcM2AkG7UjFEgoZibK5rTv0Nmg6yrfLd8KEMaEw9rEk653G2hBHIEXAstP3o0vuQCjCRZ3u97MpHpjgtQ/krlfe/vUXtNxx4GHL3f+Wm8KujtDHtV2fvE6z6/YxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=C5hqtUW8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717132946;
	bh=HtFIEAZ4yhYW9148ubuKagwRbxSRIkDPm5YZpkzTI3E=;
	h=Date:From:To:Cc:Subject:From;
	b=C5hqtUW8+G3hleGqnHQQY60Cat0xzp2u7r1RKq0AYi16A69r2EYdvDUwWJYxvu1oI
	 89Lt0pu25UoRj25AJDjKRFOgp+PQidmvo1DjoDAQ1C+AZYfe5rZaeGDKfkHMAWKxi4
	 u8StgGqphZ7HlbUnmbYr84yXZL0wET500cbnXj4ppI7+ddzek4UJ8TggDNWRlFAiXl
	 CoGY1u4y6bM4RFcS51k8pHogybSBaD3Z9x0XqfP6zi06HdoSxs0Nb7c+2aBSSaMmsM
	 icebIBEFODXgMbk+Us4wiOarK5jWsx1Z4ktTPP+LFmbhw5CD3i4v2HFAxpHXAzsTHT
	 O3HsYb05eiC2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VrBMQ2XMVz4wcC;
	Fri, 31 May 2024 15:22:25 +1000 (AEST)
Date: Fri, 31 May 2024 15:22:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the net-next tree
Message-ID: <20240531152223.25591c8e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QVjuUfo6d0P+GNzlp76I206";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QVjuUfo6d0P+GNzlp76I206
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
modules_install after an x86_64 allmodconfig build) failed like this:

depmod: ERROR: Cycle detected: rvu_nicpf -> otx2_devlink -> rvu_nicpf
depmod: ERROR: Cycle detected: rvu_nicpf -> otx2_dcbnl -> rvu_nicpf
depmod: ERROR: Cycle detected: otx2_ptp
depmod: ERROR: Cycle detected: ptp
depmod: ERROR: Found 3 modules in dependency cycles!

Caused by commit

  727c94c9539a ("ethernet: octeontx2: avoid linking objects into multiple m=
odules")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/QVjuUfo6d0P+GNzlp76I206
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZZXo8ACgkQAVBC80lX
0Gxmzwf/ZxtaD4L1nWZXMKjIMxm51/ifAQdM4CDp7pwLODu1ry1sSH+stG2/iUL7
h4myllHZsdwNS3vlQsRKjHxyWPY9NSMNuuwiRKmQ/2VkZtLj1NlcF7426Xd2oBjk
H6U3rJFhvIMVeVgZbdEqlepCrCGFDn5KwaRJToqvINCVB2Yvu/KqhE2OWg8dtjr7
OAY/6vTGxijOOSf0oOyJKvScv0GufSOE2gD1mQWtOaeiy2osuXF74H98VfW4m82S
3rKUdUPw9iyx/Xzev9BxrsTRzCHsSYuMR4MiV6ceVexoMwJFpscK8GhaHjd4fupz
9faHelVZH+ObZoL07vVgNPkYkCwmYQ==
=dNwv
-----END PGP SIGNATURE-----

--Sig_/QVjuUfo6d0P+GNzlp76I206--

