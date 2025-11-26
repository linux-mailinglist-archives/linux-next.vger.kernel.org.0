Return-Path: <linux-next+bounces-9221-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49576C87C1B
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 02:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 094E33B372B
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 01:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFEE305E2F;
	Wed, 26 Nov 2025 01:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tCyKPMJa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF842DE1E6;
	Wed, 26 Nov 2025 01:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764122366; cv=none; b=GMyJdAsQZX3BXZ+zpHx/EH1TUtPdonQt2JCGz5Fkzpb5V8mNbLepwa2PJZVsk2VBXgSkPa7LPrUaGxW6J+8wCmiUVNhsT2GTjMs+rN1eVpyUxRWc/Yr7Xs0StXGB0LfJMAN2qP+wTY91Lyuz8DTNNjoW+MHEfYHMOp0HRlPv4Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764122366; c=relaxed/simple;
	bh=mUEcO21EUvPQ1VrhcWjkhEi/PQB7xjgJB4UiREb9eTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s6PyAOycFsRPpor7997Pu2X2M8NjdeBdn5vXH/4sGPCLJp/DfMWvP6iaPa8w2S91gZeae3kpjpAm8ByyYb3BmlRQj7POLj0UYKmtVtfkPD6gh1KVKiDuRnd3MdBGxymG02vzNhkwxrMY3/LUqkXr3uDhIoO1nGUurtlod5F0qfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tCyKPMJa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764122361;
	bh=0JQWge3ZqCAzz91J0sD0G2srmV0czoTZoLlSHM/3FSQ=;
	h=Date:From:To:Cc:Subject:From;
	b=tCyKPMJa6xYPXLVuXcb+/qJ0Ek0O7C9i9Uglj+FC+VNHb4QKyS72/b5tp3zLvD0ST
	 MdTU9YLidBWTvd8MyU5Ghko9KBt7V9NQnFzQHfGYq/Fo/Qu79flvtCK+sagIJXDTyk
	 bmGQLOrDI1cghM83P6N6PtfcPRqR7adDzMKq9ns5B6PaxlakUJgBNh2UOOzC2uS51i
	 HpyYppHwO8EoIzs5VM3Lrl7GDT0qFQDSvEdREs7RYXTARfvouN/wn7fduED3DiETm1
	 0YGk5dzXmgG2+TmT6ZHfH6Mxr516Vet/++wsej9rzTkG3b+9dn76ExN8nvWc6/Pv4c
	 Lb18MzkVemKnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGN613y01z4wGT;
	Wed, 26 Nov 2025 12:59:21 +1100 (AEDT)
Date: Wed, 26 Nov 2025 12:59:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the iommufd tree
Message-ID: <20251126125920.207fc959@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4R7+VAhz4qLoFUkBPSNbDk_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4R7+VAhz4qLoFUkBPSNbDk_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommufd tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/userspace-api/iommufd:335: include/uapi/linux/iommufd.h:456: =
ERROR: Unexpected indentation. [docutils]
Documentation/userspace-api/iommufd:335: include/uapi/linux/iommufd.h:457: =
WARNING: Block quote ends without a blank line; unexpected unindent. [docut=
ils]

Introduced by commit

  9f0b286fe401 ("iommu/arm-smmu-v3-iommufd: Allow attaching nested domain f=
or GBPA cases")

--=20
Cheers,
Stephen Rothwell

--Sig_/4R7+VAhz4qLoFUkBPSNbDk_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkmXvkACgkQAVBC80lX
0Gz9dwf/QATlnEH3JHumIkRwjcJwxNSdKzHTLT4PAdc6wktZUk51cwYtZunZaU90
+dHHZIvGrmarT3LmJWl0y+I8/GvoGA3Jk1hMdRym7rv0+ndVXeVbDjQVNDn1TAHE
22I4Xt1gXJWadr9c9CY0flW+vD1oX02p243CY6gUxX8a1sdZrqMzMtG7SyIxRcVM
TEAF5Ac2ITLNMFVcVVA+Z3NPoRgFxMG8t47luf6hNYbhHUmX0zi2jlZJmGOul026
2z8rmI5ezvsNhoUj2L8ABWfh7NjvOJeMxcBydr9jxJw+XdnqnET4JM7PcH9jeu3u
202jehGOStsWBxJBybj8QHZohrV/bg==
=l38d
-----END PGP SIGNATURE-----

--Sig_/4R7+VAhz4qLoFUkBPSNbDk_--

