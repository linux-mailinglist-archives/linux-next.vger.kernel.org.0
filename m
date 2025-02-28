Return-Path: <linux-next+bounces-5606-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2F5A49277
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 08:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15FE03B6924
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 07:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4610F1C5D51;
	Fri, 28 Feb 2025 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="arZSwl9+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB7F276D12;
	Fri, 28 Feb 2025 07:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740729072; cv=none; b=oQ+wZGzbshHaG8n6aKGWMQdBabe7HNwZBx87/87CT4CADz547MGcYwuVF39I/Q+v6wpaAFm8qVdQVlQrGQHjf0PitPd3FsGgEYQjeDUQ81dx9h0SnqBrd/q1yx9PZIpw9cS92Y3qlZ6QKhesSXnoOBM+9c1d8NPcewVScvIVKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740729072; c=relaxed/simple;
	bh=g4DlLjrA4NuPV6YPR8FPkDI03/s5GEle7HGB+8oyyCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WOBKdpEtYMoO3yhgUhchhraR6KuxC4iCLIEzMQAbxO4GqXO+CElc1yj9FV3pwKr6ZhlYOXHfOH+0Ef1iGsBiu7c9EII8wxEEhuCWK5sN4geHpcV5prvoD2vJQTEdvjDPxCy0MCEIGtGRGjrybS/M7yeJ7zn+KZJFv3veidpexfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=arZSwl9+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740729065;
	bh=8ioxDyqe2l5xwH/KIAZN/3nme4UDv50ij7juAmjC8QQ=;
	h=Date:From:To:Cc:Subject:From;
	b=arZSwl9+9CdnfK3Jt6KI91Cw50yxEh8FJG6dwYEbRMtuX2iyAmjLS61MfECFj1ehI
	 a2/oJKIkJNxAysHWLlVjje3RDFBUpCed3Nh6NrlAVkS65R7yWTmVtSoiH9ql26A7Ni
	 5HzmkvEqubCIzhJNLza/mKm3aE/LY1MVuJI8K3AYGySjFwkBIq+MGoMtGewX4n2Qia
	 PqgHhoM5nh7fYkRMKxVz/kcCY4hr2+VGC/3ahLMX+UXpdhQaLBXhntiGrkm+vY47zF
	 kWhGc7PaaqyqycfPC7ztni/Fis3I699xoT/ICkNUw/cJCrlWIO0t39Lm4H4jJj5XL3
	 HfN9JiUtEkWVg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z40kw2sWjz4x5f;
	Fri, 28 Feb 2025 18:51:04 +1100 (AEDT)
Date: Fri, 28 Feb 2025 18:51:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Borislav Petkov
 <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the edac tree
Message-ID: <20250228185102.15842f8b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3iseymt.C8M1G9LdW2dLVot";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3iseymt.C8M1G9LdW2dLVot
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the edac tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/edac/index.rst: WARNING: document isn't included in any toctr=
ee

Introduced by commit

  db99ea5f2c03 ("EDAC: Add support for EDAC device features control")

--=20
Cheers,
Stephen Rothwell

--Sig_/3iseymt.C8M1G9LdW2dLVot
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfBauYACgkQAVBC80lX
0GxDkQf+LlR+LFzhpciC7jlbC8eg9DSIumKJoRBhyLr2GZiit4Ko98s4jWToZ+Dg
X4MOJEpHk62TgIsh3eEAU/c+mlD0zqqqj4fFCkJ1wUwNgXWhHNgu4rXv0JhT93ty
QeG/N4eZ8YRmi5hEdR3MB4o4F1kkZV8VYzYL3WYQwDfKicY8w/wJIqxIF0yNVvm0
T8U9Ct1fDil+i7UJ+TJc+OPoPCwMGsuRIuK4jOXRXznfrK7jKBD803KghYqJJ4Ng
CdDI62R9NNsOfNIh1TzFRlHcI68dA7KSPrk9r+4YLYvdH+d+B2a2oP+qJL+Hn1w5
Q660zPFcw9LRJrty5U1twH2/8NC0lg==
=ftAJ
-----END PGP SIGNATURE-----

--Sig_/3iseymt.C8M1G9LdW2dLVot--

