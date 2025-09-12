Return-Path: <linux-next+bounces-8277-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E2B541A2
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 06:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62DCF3A775C
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 04:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848922147F9;
	Fri, 12 Sep 2025 04:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ky8vn3Jb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A081F91C8;
	Fri, 12 Sep 2025 04:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650359; cv=none; b=iSdfH64aFrebXH5Hqm+1ZmjH7R2KVFtdY7A2R/u3UOXFHiC0yh+CQ/qv/fzgnX6QrbhnxWzxk+DlY4mXTHLRJ3ekFyy3Xxxnx/ntSSp5MOIKd9u9Pbkym1E7Ua0Vu1hSbP8TMqAqJ1GjsLHJUqlB2wncMu0u+YdonSqp1SBsFus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650359; c=relaxed/simple;
	bh=5dalgK3wNp0Ugp5s0DObfoyPNrQQbmvYf6npe1LBWXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KbyC6gD/O8zgD6KwfbgNVpypNOR6B2J1bDZQsnUIs9iEcdTAm3WYsnwG1TyOKqiZ2Ao+suNI5fdIGFJlED9+JGugTx6RvyfeQjqr0eoWHfbdOo7YgmSn02x3jTyr6ZTY4gHRjVgmeKcw/RsqU/XURxCiiRJXkSv4BBDT3wYsSqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ky8vn3Jb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757650353;
	bh=hGuC3yj3H39+Asb7Q2B/ZqdlijGwENJJJrr97U+XodU=;
	h=Date:From:To:Cc:Subject:From;
	b=Ky8vn3Jb6wWJl9WKsB2xc2+NfxRRvuC57Boby/b4qrIedncLlK0nRpYqKTH0j7B45
	 nIogbtQIonodTjJTIRAGv1TlAuu5teA0mJ1LzKFgQuHicW0FolRdHkZ28mXLIcvaIP
	 Dy/yuUixPrYdmBPC/dAOkrdSwI84h9EI7DR3ed79/PZStsV8aOL4RGcS21PIpQOANn
	 GUAazY6hi2uqFRmcf2n2n/2b0I+UERJ00Y/wbmgKOLiqKysw70MrVAf0Vv3XmLRRxo
	 K5hB52XuhXliGAUQ0Y7jQSNMRSvEncFWzKqunqsnLLFIq2e0nKLqfd+dUv5vKOMo2b
	 INyhfjb5TqJcA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cNLcJ6xpjz4w9Q;
	Fri, 12 Sep 2025 14:12:32 +1000 (AEST)
Date: Fri, 12 Sep 2025 14:12:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Balbir Singh <balbirs@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20250912141232.17bd512f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CAiNis4Cs0jKLYn/h8DvN=2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CAiNis4Cs0jKLYn/h8DvN=2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: mm/migrate_device.c:792 function parameter 'page' not described in=
 'migrate_vma_insert_huge_pmd_page'

Introduced by commit

  9a5e80c43c9e ("mm/migrate_device: implement THP migration of zone device =
pages")

--=20
Cheers,
Stephen Rothwell

--Sig_/CAiNis4Cs0jKLYn/h8DvN=2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjDnbAACgkQAVBC80lX
0GxAtAf/Y8Q561Si4LvCVeLcr1guTEGAZomSX8y0+BMMZYGE0O83RLBEoqw+82cc
nrJUZLVcfzVVz3HL3XaMTG3+o4QxxVgPR+vrcD6St+J4KmBm2exyblgOHD/NXoUu
wfyAvPiv42YYlx+YP82YMxHwjmo9/40tQum0jsb/4ZwvpyaKO+swW7aUjm71w1UL
xOjHXfvAQhlFLrHSkUyYNiKohzHk7/B2xpbBu6we0kDqTjvcBkQI9bjr2iWs+PuT
qVm4ZOB0tueMr+sxACQ/+4/BOMcrja0XanF+5xnO9+PMRLdGbh+OlJ8NOfDI1Q4A
9ULKs7sHwwivJr1XohJ0NZ4mtDHoFw==
=uqsi
-----END PGP SIGNATURE-----

--Sig_/CAiNis4Cs0jKLYn/h8DvN=2--

