Return-Path: <linux-next+bounces-3346-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A5B955FD4
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 00:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F8731C208F2
	for <lists+linux-next@lfdr.de>; Sun, 18 Aug 2024 22:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2E51547DD;
	Sun, 18 Aug 2024 22:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VtylMuh8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76548BFC;
	Sun, 18 Aug 2024 22:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724018785; cv=none; b=A2INt2tiBVqe2lXG80xtTLCEh9RAIbI0Segy6B6PBkBpA5bh5NQVSKFhz2/OdZg9/I0G/e2tQOIvSCLYwLzMAmqHnTjYScj1FsLVPfwjpxvHDjrifcZ1ohH4xoXPkUAfVb1OcSgMLcZu3DPYJBmMZWgCRuIw1t+/q6jbB8vXj+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724018785; c=relaxed/simple;
	bh=kkMsguy9wHyHkyIM/pslHCuo/40XEBATe/riJJ/KljI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XSqmL1jxZOjKH8Tcp6kJzeNOxRjaAOaZH6oOO9B18bBUIi5Wkr0eEFRHbB78RKo9b8rOzTw1TegX9Eu7vXouECErZIUdgAbhvI7ITqn2cfYWlj49bhEesMXbSQHmxCttpaFdSmGSuXTLjh7m6KjRMG1wTP5Mm7iXemawEkvg8eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VtylMuh8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724018782;
	bh=ajM+82l+zi8O8fMxjh6huQoD7w69FOdrtP2LsoZS2HY=;
	h=Date:From:To:Cc:Subject:From;
	b=VtylMuh8ZnAF2jGGfNlsNfHBXuHcvzwuWv/295r9NbIACetjb2vUBjAwHoYrHXfNL
	 P/sqyORgeoAqhnHlX58nYnTgwBgdu4J+Z99uYo27ymP/E1nW0HLsIC2eTtNqtoAw+6
	 YckVGCSKA1eufyUsNhLu/vAjhz+1Vd448cJi94wOK3yxXYbXGsrDEJ32fNoNs/Iw/C
	 C7Yw+vX/AWPGIv4ZuuC1y1WAx6eaNnVVTpby/AHM3TQXFhcb6aSWUXCa+uFZWQplUJ
	 h9SQDgyEFA6N1WC2D6WJ2HTTwiSe5S1vsC9n6DIiuCDyGrNm/VXsKa4b5g6/mYDNn/
	 0xRInxSbPQ2cg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wn8vK6QDhz4wbp;
	Mon, 19 Aug 2024 08:06:21 +1000 (AEST)
Date: Mon, 19 Aug 2024 08:06:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the arm64 tree
Message-ID: <20240819080620.2b149e2c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ddD7M8oYzEfM8T4Kb6vfvzT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ddD7M8oYzEfM8T4Kb6vfvzT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  8bb0376fe082 ("ACPI: NUMA: initialize all values of acpi_early_node_map t=
o NUMA_NO_NODE")

This is commit

  a21dcf0ea856 ("arm64: ACPI: NUMA: initialize all values of acpi_early_nod=
e_map to NUMA_NO_NODE")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ddD7M8oYzEfM8T4Kb6vfvzT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbCcFwACgkQAVBC80lX
0Gz/MAf/fgxLk6GMCB3tgfVGsnMK6plUF5N8KtXltCi8GScmfIRX03Je2i5EXUG+
h+V6C8nCDOkfYI+j8m9/qpzJTnGAasv8Z6pWA7tYJ7Q5uERD5NIHPgp9Od68ywyK
u56Lb5dajuXLctol0caCHNnRajVGXK/hP+acHGiILBHaM0YtC5nFF+wXyF/3PSjR
fEtNnY5u8Rj/qCVW4yS1nfwyAXHbS4Fgo7A/PjKyCENi3W6iqCi1xJRLNYOP6suy
ZjPOaGlxIc2AtoqZvfuzKrcTQQwRj6BCnj8ZWSGPlYbQS7p70fN8eid6jdJBDJh6
Sda+24A3C1355YfD5IeDAR9+iiuWRw==
=2C0f
-----END PGP SIGNATURE-----

--Sig_/ddD7M8oYzEfM8T4Kb6vfvzT--

