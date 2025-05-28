Return-Path: <linux-next+bounces-6971-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04B2AC74B8
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 01:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ABD94E7655
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 23:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E16267F4A;
	Wed, 28 May 2025 23:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QT/KZ5Ib"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0998E230BC4;
	Wed, 28 May 2025 23:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476789; cv=none; b=dQGWgN44l+xA9wQiaD+GfzTeFFGD/gjJ1UJPLL/AGHCyYDQCgGui3fnpZnR4CBCcPeWbB6kQVAvtaJK0mypfk8OBfkO+uRx9jXhHHEdl9j1o4cZIXKndCL5W0Gx1vm933rUFivXSQ6FL00PGvAxUlCwaeaaw8D4SrogVjA219zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476789; c=relaxed/simple;
	bh=DhBqnUjIedG9JS8VK1BbB24sdoXNx7XRfsEb4ZjG1hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eBvnyZXiWDZEVzDBl0j2HGT8czSJtYDot/Xg3rbaV7ByS6U1Bnm0ieAa2BPhHdPlRQOdTOUcnAVNqWbi2SG5RFjUaidF0UzKgTN8KvUmB6+i4fPND3CtZMkyUCgRFBprGE8jwpQyz32Xt+712+Z80hzSOdqPOH2kFFdZo+zY4VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QT/KZ5Ib; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748476779;
	bh=HGSaJktwoZxZeDutFXrfOH5muE8ZuuOS4FDyk2ySnzw=;
	h=Date:From:To:Cc:Subject:From;
	b=QT/KZ5IbAPOGBElOTDZ6tNTjTKx3LfcmlElDxau4Gu1QlnA5tu2u/nxzUuDtku90F
	 XV7fpdVBF26OL7EW+gsFlx8Jnwkkuim6QQWlNCzp90+V3toWvGgV4SF4A5zAVaYcRd
	 T0/W33df0Zi1RyPOdgTcu0cNPRxx+AVVzDBgyE6srednyinIZeJsTpOuvnHsPlU5fe
	 i20IJ7vonjFFrhD6JNdjeiDitw5+MVt5+38q2AdIXdu2KIblgzpt+5a07dYGI8Oxu1
	 t/8MUAj7Kszvi3wb6nd/AVOZMQFnPn6/v/8f5D85dZw+9u/vR/kQ6kYZO/GHDEwjHN
	 kshZn4iNtjt0A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b761R1sxZz4wy6;
	Thu, 29 May 2025 09:59:39 +1000 (AEST)
Date: Thu, 29 May 2025 09:59:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shivank Garg <shivankg@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <20250529095938.43087534@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nI6En3DRLOovoLi7wuo66Qo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nI6En3DRLOovoLi7wuo66Qo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-hotfixes tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

mm/khugepaged.c: In function 'hpage_collapse_scan_file':
mm/khugepaged.c:2337:21: error: implicit declaration of function 'folio_exp=
ected_ref_count' [-Wimplicit-function-declaration]
 2337 |                 if (folio_expected_ref_count(folio) + 1 !=3D folio_=
ref_count(folio)) {
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  3bdddbba5f02 ("mm/khugepaged: fix race with folio split/free using tempor=
ary reference")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/nI6En3DRLOovoLi7wuo66Qo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg3o2oACgkQAVBC80lX
0GwovggAhSJuPMkt10tT99KhWQP+HBTdu7+8PgFjp4lMvLlw+8q1p/gACfzv9PSc
Dk5TJ+/7Kh9pqsS7ZOOvJZEbIHZxkYTsouBezr2OGjvtTOk+0pnk6nBMfDC0+l7u
CIm0YiErX27lM7rJ7gxew0sSz5BWDNdVkYkZgqbjktBts1rI+lkuDKpgc+HhUwjd
CJLoW8DV40m/G7min3u93SJ9MiAH1ayscKk1AiEsrAh4wOsnCtPsMiOo2vORT2uX
BUrj/Lv1Yld0QNGnyTDeLYL6f87sxCIboBPg594c4vNaHNX6/Q39ksWyHDL40ryq
U4GQKUVDcAytCUpA1Lbcsu+0WXRbtQ==
=k8SQ
-----END PGP SIGNATURE-----

--Sig_/nI6En3DRLOovoLi7wuo66Qo--

