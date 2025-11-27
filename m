Return-Path: <linux-next+bounces-9233-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E3DC8C6D9
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 01:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 202E73B35F2
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 00:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E5C1DB551;
	Thu, 27 Nov 2025 00:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OgpvmI/U"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1089E1D88AC;
	Thu, 27 Nov 2025 00:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764203462; cv=none; b=PfVm20u9nJ93AyMlOr+gsbAQkCn9Y/9X51O7bm5vEY1rnxdTbpWDP4Puh0oCnKykxQDt8ZCEt8PdmRKcCzpXrtGlHYNdoiUmw+Cl/YDTUNI5fkW2d8k0DaTsesQbrVvCOFxGu92pozenTdjnmxV8haF+DQ/iz3YpMISoVj4KPt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764203462; c=relaxed/simple;
	bh=07ljFLtSCi6Q1MuDowKVM7FA0+rWDPGXomKmyQjTXgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Blt3R1lgmfNsTyQyV+IUXcE857ZqmMRDUfqXdcRkWptybqPKf+BSi+GUc7bvvXx4MrlxlyBUhtGRmMh3nz6bhOz4r+v+8Gdedrf7flXzzN/BR1i443L4Uk06wh//XrzRjWVTm8QNmdnAk1eMGVTnJJbyhudPooMcEMPy58Ca5+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OgpvmI/U; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764203456;
	bh=uloaAAWBAukvc0gmB88hIgHgl6MkkTtbLUnMIVoual0=;
	h=Date:From:To:Cc:Subject:From;
	b=OgpvmI/Un1K/y1I/VUnBfK2KNocdXpR1kt6KhkmuiztUd0MT86hujJoSB6t+EXy+i
	 r7kTtyUQiZMZFJtIv6mZv4yXMR6HIBQmfu9vdyKeZOiHzDNbFyjrjINPDp8LVRdoHy
	 vqc7F0s2Iai1w2dfrmVAsLdiRYHBQHiudZHi5kjLj2U2wEGWNhC25WjkPYfsH+5BxG
	 WBulrO3qRhKCx8sWJzs6oKb79CHiyGbLSv74Bs+614NihqZIq2/ZdjcizLF44PegWJ
	 /cpF4fDgFEbTynorNDCk4Nv2Zn2PJYSa6eiynB1Nq82/GWT5LvxOa+KmZmetvrhlAS
	 ICkogBZae1deQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGy5W5lcrz4wGw;
	Thu, 27 Nov 2025 11:30:55 +1100 (AEDT)
Date: Thu, 27 Nov 2025 11:30:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sebastian Reichel <sre@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michal Kubecek <mkubecek@suse.cz>, Sebastian
 Reichel <sebastian.reichel@collabora.com>
Subject: linux-next: manual merge of the battery tree with Linus' tree
Message-ID: <20251127113054.5112674d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GYsWMY8hnajhVLt1YmdmqMf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GYsWMY8hnajhVLt1YmdmqMf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the battery tree got a conflict in:

  drivers/power/supply/intel_dc_ti_battery.c

between commit:

  ad8cccc24887 ("Fix Intel Dollar Cove TI battery driver 32-bit build error=
")

from Linus' tree and commit:

  3fd1695f5da0 ("power: supply: use ktime_divns() to avoid 64-bit division")

from the battery tree.

I fixed it up (I just used Linus' version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/GYsWMY8hnajhVLt1YmdmqMf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmknm78ACgkQAVBC80lX
0Gyqngf9EjFlRQuntykxtNEIJQhQ5T2LjrkSjSTIZ6TiEG/89pf8Jb3bVbtEYLgM
Hc2+JlF9XeBTLxZxM5JnysEH8N1sw0J3sOlqLUcC2rObULiwO84wrXvB+QM3GxMT
Ashcm+WZKUUG7EcJZGROE339dVXGI6axBh/BpMfccm7dr0kiuva8+q1dmuCDGBNs
MrQSBWoodCos5oANPUygwqF7NUMbBzoLY1l2pzGYbLIU4otM8LCGtsGTqe2eU9I3
o1QT8cv3lOpFfySRNkgBwT8RKGLhWp3DEmXeVABKgGBvn43mfjtwARsEU2LSKTCC
KkSca0L7hTTNG60BsPWb8O8jMvWR6w==
=7774
-----END PGP SIGNATURE-----

--Sig_/GYsWMY8hnajhVLt1YmdmqMf--

