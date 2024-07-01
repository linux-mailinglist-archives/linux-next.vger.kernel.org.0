Return-Path: <linux-next+bounces-2757-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7E791DB56
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 11:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2399C2813EF
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 09:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC9B84D0E;
	Mon,  1 Jul 2024 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gTmdpdTa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB871747;
	Mon,  1 Jul 2024 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719825898; cv=none; b=hsNf7w89VFwj8nVYSGw3PJsgKbiRsELx7T6UqMHIbcYgcb8U71d/bY9KXUC3FP6BSQmS7XuWrioCyOFlY1+4iu51EIZ7KVUGe1wzfNPHqZ8b/N3xZKhET+ffA0x48a/pMP8+hSJFTrxMivY1q9OJj6bVbZjN/jwv984QxEzSi6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719825898; c=relaxed/simple;
	bh=l/aUwJ3W0t+aKYAOyEESD3OIi1DKs7rYD0F099vYuf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N/WX8/z93Q94gxFm37OFwKSf8aAQPHSAT95/ullqADQbPEYf5+ZnxIoYToljNoHZ7MKM0j4TXvY0jP20yKbfucv+Ht/CbK0jjwn2vUPYLVFtGersYKjjiFGCueXYFAviHclLwpskavw/7SWCJNoIf/Yq7Q2pxktUX6RN42AwpvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gTmdpdTa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719825894;
	bh=kECb/O1eTJLIu5yP1sWutW7a7PeOquHqM+8cSCtYZYs=;
	h=Date:From:To:Cc:Subject:From;
	b=gTmdpdTaUfnENhGLak8jGrkVtOAwdH4aIH07i2GJ1fr2VZRv/c2IkQUP8Ewd6aFAD
	 GsCl+L2VsebkwZpUPR8+s+b8T/zvVrqNPejhYYJwlCHqme3So9upbO9ESpjf93rcaF
	 Q/cv4S0xWHXZqA97Ba4LcKzTb9VTRxUM+aFHq82Zj1FtvURGriM/M4Cohpq6EULQPm
	 Vhj5eETIK29ClLjqXp15APiZCr/khvUGDEP80iZ8l+2u/zHaZmgWJwsQqsSziDQJi8
	 7oI0ILPzOLSLBaEqvlEMAZ9ciDydePBm0u50kWMaw/4q1wU0Tg9kIYP947oJBWxaSV
	 //y9FvPzDo/FA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCLGs6CQFz4wc8;
	Mon,  1 Jul 2024 19:24:53 +1000 (AEST)
Date: Mon, 1 Jul 2024 19:24:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Philipp Stanner <pstanner@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pci tree
Message-ID: <20240701192453.3e4a0a3e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zIm4bSkca_aKesPjSeF23uX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zIm4bSkca_aKesPjSeF23uX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/driver-api/pci/pci:10: drivers/pci/devres.c:556: WARNING: Inl=
ine emphasis start-string without end-string.

Introduced by commit

  06fa2e1e9116 ("PCI: Deprecate pcim_iomap_table(), pcim_iomap_regions_requ=
est_all()")

--=20
Cheers,
Stephen Rothwell

--Sig_/zIm4bSkca_aKesPjSeF23uX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCdeUACgkQAVBC80lX
0GytzAgAidqE23BgSDSys+Y+S3M6GUAj0UAFfBVjNZleBnqnJmP3Z8UrXYfdgnoO
UVcHRXGjdijVoO7bEfyQP7+4i40h9c67ow5Jrs3TTWlKf58lAXF8CSphI9AllRtD
+jGC4GJv4jBrmTTPqspKR89EkqPULozmdeow2PLqiEjOjzhMoigst8bygl4I/po8
km/xwYyPNi7OBMqWEjbSSxST0RXcgsJmAXsJaU6u88XK3qcGXyHm5F2yletzzUjx
TsXdx+NGTcPdsTvgTbj9kQBp9kGUBEp24hX1pOCbA7l2HpaDH0CMXKAD1Yeum9XG
ZFqZJdUQFBDl+H1fABdIxE2zz1rJgQ==
=8hl2
-----END PGP SIGNATURE-----

--Sig_/zIm4bSkca_aKesPjSeF23uX--

