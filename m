Return-Path: <linux-next+bounces-4288-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6225099FD73
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 02:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 948381C24248
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 00:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B87B433AB;
	Wed, 16 Oct 2024 00:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ntW/JMEd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CEF1097B;
	Wed, 16 Oct 2024 00:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729040271; cv=none; b=e56IrgXkmljGT7g5DA8Lc9zQkeWhY2ynn8WT2+Vs5RfMi65vw7vk4dYPVNuiHZ7zY5ld/OlyJtY3Pokhb/3SswtEUNPrqwurb9EGMcZiFzNlnc/IKO7ikmHB8u5VIcTSBiuiEh9knsTQSXGQiqHLZd5hhSIIZ3WSVQLBzJH2sk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729040271; c=relaxed/simple;
	bh=cUnKhKkXjfWul3ilTqcHV8hlqkYS5CiTuIlhw+xHBPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Flzk3s6yefLWkphDDtSi7m21IoCgcBdn/6scTYd5q9KUKtPBP3umboyY+54vGovP5JWmhajz97KaXAMvFZSO/xXcOIdtkbcZu6WFdJPxZ/G77+C6VxH1Wg6jfXMDcmVpMm87UXulxmQsJr6GJzVCcef99v+iKI2O9QRL0ZnPziU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ntW/JMEd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729040262;
	bh=MRYBgXgUSgi++5OBq9VNbC3h2psOne0GV22uzyKcVR4=;
	h=Date:From:To:Cc:Subject:From;
	b=ntW/JMEdsYnT/aBlIpSI0lJCNX+5fU99vgf9UVkZQL5r74OI/kACd0bPdRhhL/ulU
	 HQQvIvlHCsWWqhCKtOE68XGPsKplugWz148UADoXgQnEo7Lyd8+DFNyGQft/D/u9qT
	 +50QBNR+xlrSgTaf1RQq/9/pucStYbM62GYbdnUhRLXp4OI2xb8mxq/SaxlSPqiKAO
	 6Hgdr4jE8/QV1A0S6nDqUFpzPj8Lh0f4V9FBdsMQ0avw4nKW3xn9ticRp8k2ss1yhV
	 3xC9WWkAr48EYq3Pe/ALwHHJcoHtQN8yuklVoxSPLFul0fMfzOsATxwMlIvBZwrH2u
	 nQqLEfHZ8+88A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSsyF6kgLz4wx5;
	Wed, 16 Oct 2024 11:57:41 +1100 (AEDT)
Date: Wed, 16 Oct 2024 11:57:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simon Horman <horms@verge.net.au>, Pablo Neira Ayuso
 <pablo@netfilter.org>
Cc: NetFilter <netfilter-devel@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the ipvs-next tree
Message-ID: <20241016115741.785992f1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l=e2Vy6GThhGR5jBmb=yWd=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l=e2Vy6GThhGR5jBmb=yWd=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the netfilter-next tree as different
commits (but the same patches):

  3478b99fc515 ("netfilter: nf_tables: prefer nft_trans_elem_alloc helper")
  73e467915aab ("netfilter: nf_tables: replace deprecated strncpy with strs=
cpy_pad")
  0398cffb7459 ("netfilter: nf_tables: Fix percpu address space issues in n=
f_tables_api.c")
  cb3d289366b0 ("netfilter: Make legacy configs user selectable")

These are commits

  08e52cccae11 ("netfilter: nf_tables: prefer nft_trans_elem_alloc helper")
  544dded8cb63 ("netfilter: nf_tables: replace deprecated strncpy with strs=
cpy_pad")
  0741f5559354 ("netfilter: nf_tables: Fix percpu address space issues in n=
f_tables_api.c")
  6c959fd5e173 ("netfilter: Make legacy configs user selectable")

in the netfilter-next tree.

These have already caused an unnecessary conflict due to further commits
in the ipvs-next tree.  Maybe you could share a stable branch?

--=20
Cheers,
Stephen Rothwell

--Sig_/l=e2Vy6GThhGR5jBmb=yWd=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcPD4UACgkQAVBC80lX
0GxQFwf/VZs+GxgXy7HvuXZnZqy2srbQvG4Ezl4qWHUf0GKGVuGR19Wp1TrLm/18
usoDkcL7wGkhlrJwwPEA3VtrxMlYMJXbhxXlAtXyItTwNSSdxWiruAAE5vmKcigm
Bd/dgzzwQ7azo0PexghJq9IUX72XM98S2yc8dXtQEG++2aDj752qyQ0XzdekElQp
5DALjqWXvkVmV0c+UC/ndMuS/+zyXQHj/BeOaCKyO5m2ksnyhzhST+8Z/TZH4V5Z
S8uo2dSXUUhW9vAG8sFNAWWpqegt7kPYctUOYJPgrBz7W7Ct7uWVPpHYFqy37fQn
LxO+Sj36vXP8QkXzZmLJTlOUAT0QiQ==
=MSDA
-----END PGP SIGNATURE-----

--Sig_/l=e2Vy6GThhGR5jBmb=yWd=--

