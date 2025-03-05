Return-Path: <linux-next+bounces-5648-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82488A4FA6F
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 10:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C57BF3A8A07
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 09:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B671204C27;
	Wed,  5 Mar 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sHiwr2ME"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F531FFC56;
	Wed,  5 Mar 2025 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167768; cv=none; b=en8FmETnQXbJ3mibsF/jwzug43qggC3HxVMZGYie28gnZ5/8Z8LdwZENo/pbtBMkhhx5ylYJW4ymUqmWlaKMWGtJWoAxg9ld4zlGIWNUE0UgrA5vY0BXvWgVJGr04Ojpb1o+aREOTYdliVSJrM0mNIhclnZXCRRx5tKsKXjWuj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167768; c=relaxed/simple;
	bh=uPNjC/4WD+Nm/k0mn79F0j10P+oCLFwzHcdFBwHjAf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IMbtP4lCjQV9Twqvsel+DZs664Tbq1znF57XF93/X3XZB5tG1PRZVhyKzMDPaVj81aenfA43uF/s5bw7QRmxn8onXAwJs9jWCE1BQ0br7a37r6b7MgV+zOmkanXe3pRME3L4Tuw53vRphiBhP7iUYa27BgXkTVDZwhSm+nNsnjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sHiwr2ME; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741167764;
	bh=imUp2AIUuz4ZhZhwvuVRk/zqwJaJUu7W2+h6se8kMsc=;
	h=Date:From:To:Cc:Subject:From;
	b=sHiwr2ME/A0E/dESRL1UVuMy9KpD9h7lfxWtfCLr8aTrE2f3kyXHmQlGX4RatBccU
	 kWeY7ujNY1UEVbAYqrQKDmnHUjllChxy01UuYAzVJ9OTA00CO8BBfhMub1FmFWjLJ8
	 yyH39ny2S63l7FkefLGJ0DJ7YYHWoRMnlNSXJB/tKBgL7IrEZgKUutyLkMMJVBq2um
	 6H4aUhb10Yj1+VQsYHunW8f013ID2FxEGzTntZw75ljJaePDpInlb/D9oWrdmTVsP3
	 cWfMnRNHKjym/XbAwMEILLdJJl+HF2in3GB7MrwAtqcStuqqFzjQQlc9PHpgES2hGi
	 yFW1N1D/RiOPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z76zS1qc3z4x0L;
	Wed,  5 Mar 2025 20:42:44 +1100 (AEDT)
Date: Wed, 5 Mar 2025 20:42:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm tree
Message-ID: <20250305204243.0458b36e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AkYAdmJjE0++xdBHvpXv0kh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AkYAdmJjE0++xdBHvpXv0kh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
these warnings:

include/linux/mm_types.h:482: warning: Function parameter or struct member =
'_usable_1' not described in 'folio'
include/linux/mm_types.h:482: warning: Function parameter or struct member =
'_mapcount_1' not described in 'folio'
include/linux/mm_types.h:482: warning: Function parameter or struct member =
'_refcount_1' not described in 'folio'

Introduced by commit

  bbde3b621cf7 ("mm: let _folio_nr_pages overlay memcg_data in first tail p=
age")

from the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/AkYAdmJjE0++xdBHvpXv0kh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfIHJMACgkQAVBC80lX
0Gxs4Af/cWv6hZQVZDIQbh6HUmfHibdwPt8aFErtbcUyhwZSmYzDCssIdjVVHOiQ
Y/XqeW6qw8fc5a4uNvw7q1jGoVztSgssVLStf6QgfLmnq/dmlBaG0GCx8WLBAs5u
g8TMQxpre6nxeFtMaBojQRpqYRc7EDceYRTnuiGsshU3zaFyi6NvxaXD61DDPAuE
MXfaqjS6O4bCX20SApe2p5VoQD4NoXhw5rnm679VfBmV19PqzZt0fVkPuqwnrcLF
gpCfba6P96nUdpUEx36HiwonLpFYTNLBRStEDm3ldeeCKFsZkKn17HzSmS8R4sNZ
SjPNoBysknpTjJw6lUSH56uAL+S6ng==
=C8oe
-----END PGP SIGNATURE-----

--Sig_/AkYAdmJjE0++xdBHvpXv0kh--

