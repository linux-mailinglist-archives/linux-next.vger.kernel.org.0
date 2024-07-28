Return-Path: <linux-next+bounces-3141-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA97D93E9D4
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 00:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C4002814C7
	for <lists+linux-next@lfdr.de>; Sun, 28 Jul 2024 22:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6B07605E;
	Sun, 28 Jul 2024 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HfslThna"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775CB4204F;
	Sun, 28 Jul 2024 22:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722204021; cv=none; b=AAa4mAlOYu1SHJmVDomz11hZTCEEB8jjRre1wwwEI2bSvAYgv2l4JqCA2Z9EiXYKtOgLbQq4Tr7nxRvSzhpC3o6NteJNodGonrvSiV0vYCIj7PP4mvmcIwN+iGvhTAMUEyv2H9OH+LQF3BjovcfCH1V4Std0uTLdGzV6Hgs313Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722204021; c=relaxed/simple;
	bh=JKuPF02zobEKZTMH20D7cKIsu1Y1JSu65JLU5FxH39M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ys6MakjDfvZP9LBmXkF3G5dThV0XxYVo8SsKfuzQKVsCfocgzeQkYASO7509HKNCSZy0HQch2Abgx+XQna2nLx77esqJu3fejRIMqeqtcIr0zKeE/31oeTl/ckFjax4hLkOPqcdgAN4BNIUKBpOU/2X14NsujZoNTKWNHLg2pMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HfslThna; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722204008;
	bh=eFh8+esHAbkTcms78dsXINf4xZ+3c0vfFRwHtJGQMTo=;
	h=Date:From:To:Cc:Subject:From;
	b=HfslThnarCSxZuIdOzS2L389S5cKb2jqUhPrf0KM5nZ9s3W/OK3AfOUEFF5VfeY9b
	 5QoisOQw5UdBl/fNX3qkShFBZ7KBU2LLrR1L4FrGeSMOUDLiAiO6McSMkPToknJfqn
	 MStRZ+5FMgWrCORBk0vrchmy6Ri4Ro0kMpsA855JS7OFtsKjeLmJ+3cV0YWE4TB9p5
	 rSM7BOtJxA4V3OiH5xiKwEmrkSiSd5Uj3iThXLPAriXJvF1WJnOHshSZSfCjnXHTkc
	 z8qKJYY7kO2Pgo0/tCc5DhmZ5dEiqwbqWPn9yy/EM4rXQ7ffVDTzjPYp9q4ElLeUKm
	 EsTRttFPp3tLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WXFlr3JCcz4x6r;
	Mon, 29 Jul 2024 08:00:08 +1000 (AEST)
Date: Mon, 29 Jul 2024 08:00:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the mm-hotfixes tree
Message-ID: <20240729080006.6a76c089@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4PF.uvcLe7eO9qYVnhaWsJK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4PF.uvcLe7eO9qYVnhaWsJK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  0d20ea526641 ("mm/huge_memory: avoid PMD-size page cache if needed")
  0e601f11c7d6 ("decompress_bunzip2: fix rare decompression failure")
  2ee111c7aa54 ("mm: memcg: add cacheline padding after lruvec in mem_cgrou=
p_per_node")
  6d326ba4248c ("selftests/mm: skip test for non-LPA2 and non-LVA systems")
  7fd282f0961e ("mm: huge_memory: use !CONFIG_64BIT to relax huge page alig=
nment on 32 bit machines")
  8b8b74c6cab9 ("mm/page_alloc: fix pcp->count race between drain_pages_zon=
e() vs __rmqueue_pcplist()")
  9041b9e6efe4 ("alloc_tag: outline and export free_reserved_page()")
  9fd9717aed91 ("dt-bindings: arm: opdate James Clark's email address")
  b728a52760e2 ("mm: fix old/young bit handling in the faulting path")
  b75409cb8693 ("MAINTAINERS: mailmap: update James Clark's email address")
  cdba37ac1920 ("nilfs2: handle inconsistent state in nilfs_btnode_create_b=
lock()")

--=20
Cheers,
Stephen Rothwell

--Sig_/4PF.uvcLe7eO9qYVnhaWsJK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmamv2YACgkQAVBC80lX
0GwrIgf/cZMPNqTXico3OciyQWg04xIZcOAMDQ2Ls9ePI5OglJRh9gipoExYR+ZN
TMRq3Jc548z0Uuv+p+tZqCRAQZOUlsAJ9M/kL85+ygE4BnogDyLWWi6rRTWUpdLP
0w2lGLTenjUcye4guE5CwwVOWXwFQ0Rb9QOxflihNWh654P2DMaJHG6acF8RTmIr
JTFFjOSoUGGWN6S10fZdNyHGWsIN4IDM29X/PNx3U0kQZgyHI3qBGSiQ8wjcVlEc
RrwhEI0CIFP7rKzhsjSHdH9mQ98i4/xxgGTpsjsh3ewwEUK2Fdsb4IcLhRBydDro
vOfzaCXQ+QwIxV35VpHBvRWSeStBBA==
=V2p6
-----END PGP SIGNATURE-----

--Sig_/4PF.uvcLe7eO9qYVnhaWsJK--

