Return-Path: <linux-next+bounces-6403-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53227A9E6FC
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 06:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C574174522
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 04:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D74A155333;
	Mon, 28 Apr 2025 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fbxgmESZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B60E555;
	Mon, 28 Apr 2025 04:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745814285; cv=none; b=RkfZHLMtXabKGslFUmMXXIoXFrgZkt1TV+ay/e1YpTLNKYfU24Sl4Vl9C02aMwAN7x1HrucHUe32WIStzFj4CKUQ0UMzljjNtGhlkxcExxLtcRGoLX6H2ebyJGYWUtOwYeqarrEbaqMDgnIdR9IV/hNXZlyvi/i/zSjiVADBCT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745814285; c=relaxed/simple;
	bh=ITxCOvLfc7IqZdWthxkE0qufEXnjYLT1P7eL73ZCbhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IxCYrazkYhilQnn7I45Up9HmITfMR7NeC3Ti8Uz5Dz9lGy+m/hr1mgDRngxHSUg1mTPJI+xOvd/AOG/RbzrX9sgwRS4scDlfGhvgk/2F8MQh8BemAIHh7N/i475i0wv0McsfPYjvyudWMhO2xZHbSXpRQQdCMvE+u1H8gjqe2xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fbxgmESZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745814277;
	bh=lalSLyZdMzTZKOT3UAq8T4mkftma20RRS1pZI8TpCgg=;
	h=Date:From:To:Cc:Subject:From;
	b=fbxgmESZYZa5aMEHbsvbs/vanmW+PTKjTpW9ldDJZu8tGi3OVQ6vEn2gTnfstcctH
	 Rag4h5ZzXCLs8d6xu0UF2A/q1WCivoqBCgARTagYppW4FYm74Pn6e/1WI+dvn2A1HG
	 TXqttiD9MKyNDldq0eLV/WNaBFZH2W5qXdxPy/TO/TaCRjSafEY0IybWAAQeqc3tQP
	 UgrhCQw8EclMMeCfeGYalQ9pFRlD/jKBmwa4jO5z4nyD1pViBR4vqquDKnnj6IqZ4D
	 5D/pbHjQXfu5zco7O0hpSz+0vzT4BROPI6lc4YO34rukzmrM/e7MMQs73G+AR7u3jc
	 s7briY/l8j7nQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm9MT4B1cz4wyh;
	Mon, 28 Apr 2025 14:24:37 +1000 (AEST)
Date: Mon, 28 Apr 2025 14:24:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Asahi Lina <lina+kernel@asahilina.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-nova tree
Message-ID: <20250428142436.4579b115@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6ZV=ZrqxFCSH_FYgpw_JFIW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6ZV=ZrqxFCSH_FYgpw_JFIW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-nova tree, today's linux-next build (KCONFIG_NAME)
failed like this:

x86_64-linux-gnu-ld: vmlinux.o: in function `rust_helper_drm_gem_object_put=
':
(.text+0x1b6cd15): undefined reference to `drm_gem_object_free'

Caused by commit

  be8d1a24798f ("rust: drm: gem: Add GEM object abstraction")

I have used the drm-nova tree from next-20250414 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/6ZV=ZrqxFCSH_FYgpw_JFIW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgPAwQACgkQAVBC80lX
0Gy0bAgAo1I/o8WVrC0aCM0mSqUSQbcz/dRkYfRo10GjGocnTbuvLCdeXN4/Vg8b
cAWk3J8iv6JtjzdggHrb3OqcBYpxcUh3v0R9201kgh2p6T2HgH+SlypzFxHDJTBk
CeL9rBhg2sL57h3iFUUmkRwfEgA2Px37rPuJjL6ND51iMlC3N2qiyCiSrxlcQyCq
r0kCKRk4rJFL9pbq1yy21ipwhRXO2SInek+zixL5yu2PTxvmwKoRzIwU/ozt8wfP
L9BZHkOWjxMc9JFMsvOiLnkHKdLrF8bmMcBQZTieMs54nRBf6SdmOVCcoKYXn84Z
HPRZggEckNoIY0XEiiop1eZh2OzgzQ==
=7/oS
-----END PGP SIGNATURE-----

--Sig_/6ZV=ZrqxFCSH_FYgpw_JFIW--

