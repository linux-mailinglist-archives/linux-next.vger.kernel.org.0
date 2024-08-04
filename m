Return-Path: <linux-next+bounces-3224-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D89470A0
	for <lists+linux-next@lfdr.de>; Sun,  4 Aug 2024 23:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BE3A1F2101F
	for <lists+linux-next@lfdr.de>; Sun,  4 Aug 2024 21:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4211226AE8;
	Sun,  4 Aug 2024 21:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UNea31ec"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3A9A2A;
	Sun,  4 Aug 2024 21:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722806258; cv=none; b=PR/f6xhcjee45+YyM/54K0170Xaf3VI2yshAHPjq5lo5XCzBs3tFQ0CC8CTl2OWykjdJtJ9OYyvGR/ZvGveiEefs4sXikgCVazHnRydff2ioIyHLQ85YV9C9gcNIFJZZT88qRUlwp3D3k15QHIYhDN0KnyAOvd7l+Rt/wE9/qSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722806258; c=relaxed/simple;
	bh=UI2uq4D1/BMGdVP3uULNzeZa88ZXAdb9J9sb8Lum+GE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c8rU9q+5VXRmeTMgFNdADIytBMzeU1oWW4qpqfl0S/tyMdr160cbzhfHyIguXpSSWGZoM55N31aJ1cZWdTaCcYa4ccfPb/VXxSVAmlwdk6NZZa5WrHQe4wktmO78ULUBLDrIEkrtJzpr1o9g/RIOUxMVITYp8NedQsTTSn5E3rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UNea31ec; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722806245;
	bh=cZnut/m33D3KNXROflAPe0MPjd0m+V9GHvg4mneIeLE=;
	h=Date:From:To:Cc:Subject:From;
	b=UNea31ecCyl/NEhkqoh7CDI55nM1J3cmEO6KoHjEPDKvMslRoEdw0tgN9HiIf1pHq
	 TW1Sbdo6flrAhsx8aJZyEO/h/L0ObOfdhmekbVDeyxDNycXGBncSYGK4D3Z70R+2dt
	 TpX5JJEDua2y/vYPicKEMDpDK1cRYuc4H0g98uPL10fDFCbcrQ579imN51spZ2dfDj
	 FXXCfjDN9LWz65WeI2xbQbTTbfCRur3koVweyDc1YzmyJTIvCea+oeJyp8wsm7T35a
	 WGZxX1aGH28FUG2uzlSXEbQeaJ5nI19/JAnJk/bPd8/5K1b8uNgabAHPyOOoZTAy16
	 u5urF12uJ1kgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WcXTJ6KKNz4wcl;
	Mon,  5 Aug 2024 07:17:24 +1000 (AEST)
Date: Mon, 5 Aug 2024 07:17:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-ID: <20240805071723.571c7654@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kAf1eKuN.iIf.xBUlGLVpAA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kAf1eKuN.iIf.xBUlGLVpAA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cbd28071cdab ("mm: list_lru: fix UAF for memory cgroup")

Fixes tag

  Fixes: 0a97c01cd20b ("list_lru: allow explicit memcg and NUMA node select=
ion)

has these problem(s):

  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/kAf1eKuN.iIf.xBUlGLVpAA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmav7+MACgkQAVBC80lX
0GzQyAgAjIbdLSRCPIidKnexA+GYbNuMhdP+F6BG2WiGJK9AxJqJGW5C2zG3/um4
Ds9DM73Q2JM2LBlA3YnkqwO/2+LlVpcDiyvI0YvDsrzpzmZe7A2+Z4G3gUuuz8pN
U2rL6aWZczukwWvxBQ7rjPzRBmOG6HELpX0kv6JjJ6w31Ucqhq0QxayAifEa0Aeo
WMY+sv6c4ZDhvNauoq/liZw1eD7ztLc5mw+bh4VHExwvZ6uv+gw/JywJZxOe04yy
Gzf6Eo7v/gEa8FQm8tM5wp0TvhF7xXTK7CWBTAEBfJzyQtSqpuAEgyurmS3vimOV
uJMSbrnzGBi2BdIceK6Hql1AwEvZIw==
=SBMy
-----END PGP SIGNATURE-----

--Sig_/kAf1eKuN.iIf.xBUlGLVpAA--

