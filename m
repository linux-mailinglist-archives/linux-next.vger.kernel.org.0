Return-Path: <linux-next+bounces-6883-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDA4ABF18A
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 12:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9AE53B3153
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 10:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD0B25C821;
	Wed, 21 May 2025 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="G2WFQgDd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8472E25B67E;
	Wed, 21 May 2025 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823210; cv=none; b=TV/HkCFhEuqbUcQbTqT6t1pvNe8O9XBiOh3tWIpWu6b4vwc+4bZEsDzdNQ/3JLXTmD81bdgDjO56WwgOa2s19lAtQWI26PS+AtdfbBlpRrBy2gjeuiILJWuO5XSMNVHB7ImoqGv+6gvg1Zr6OiRe/K4ioYZXP3P4j6A+L1iShnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823210; c=relaxed/simple;
	bh=Hs6qdEKelj3z4mpZde9psEVGMz6cGM+tvSkLFEKJBNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FSt90/EWNlnBrZubY56rCOH40EnnJYZVhkNaWDIvIyjg7ffLFiZ4bBWxrcTxsynySA0fc1revRLGfeNbs29KbzAsxToU3Cv7KS0F5kiLrk2x79qyVHwGQK4MTnVOpHVxx6ROp5sdJa6MLc81MOohaGaQCvsgpAyyWDoYmdk/44I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=G2WFQgDd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747823202;
	bh=4E8tJ+zW5WhcyHadKqtGYVqBSRgkH3XD3TfPB8AabDA=;
	h=Date:From:To:Cc:Subject:From;
	b=G2WFQgDdjl5xJjr+L0i7Cz8msV8qd6srlDsE4O4ybhexHzJ3Zs/Y28yIHcIKZPaSt
	 b7x6uG2UllrNmsXCIyRkwuZphxoTAq0oiB6ON7Rxe/t1yWjMSVud3nM4Xm/mu4hg7P
	 3/5mKCJSSyp0z+pAFucJ4fr5TJjcR492RVaJ6Kn17pMmVVMsisUoR3SErD5hbXi8bP
	 rPZzyfl9K3pwvZL58ClUEN1jAvAqMTnSC5NlrtIyN4qODcaa1jhJ8fuNExXnhKOqhW
	 K2+bbWp6ECQ2BkO63rNgfUJmFVt8l3DEisillaqEGZDMs+EvfrkL5Tjnn01sLLUchp
	 CEJc1vpbjtHlw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2SJd4pKTz4x8Z;
	Wed, 21 May 2025 20:26:41 +1000 (AEST)
Date: Wed, 21 May 2025 20:26:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pci tree
Message-ID: <20250521202640.53a4fc3d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G=Dq+zjUKC44yE1qGMJvGPS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/G=Dq+zjUKC44yE1qGMJvGPS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/PCI/rcar-pcie-firmware.rst: WARNING: document isn't included =
in any toctree

Introduced by commit

  2bdf6ffe9f66 ("PCI: rcar-gen4: Document how to obtain platform firmware")

--=20
Cheers,
Stephen Rothwell

--Sig_/G=Dq+zjUKC44yE1qGMJvGPS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtqmAACgkQAVBC80lX
0Gw4NAf5AblevEkhGowA6I82ZGqUuW/cI3ovR1Zh1Oi6sUKfZDhz2zbrHXQih/Yz
DILHiJVrWW4nHvxZJ2r+CxG0X4cB/TOVeayjVOfGY5h02/D4Kw/QOsthft+CP37K
mjq+E7deRa6ILTmPgBKuH5bRho3Ev9tWGio9glkUCKSKI4Pf/1qpTOJeIM9jnnB2
gCvDfXkCiSRd9SXJmHtzRuQ0MuB1hv4pX8qEd3VaKEuQmRI2rOso3kcNd/9YUxBg
u9Po1JSNn5bbm4De8eDqq8cR4BLDmDGBei4QwQuFfR1sMBWcWRTSAKl2R5tfP4vR
xTbP/xGUnvfBqCkqHVmt6PxtKd3jxw==
=wiRt
-----END PGP SIGNATURE-----

--Sig_/G=Dq+zjUKC44yE1qGMJvGPS--

