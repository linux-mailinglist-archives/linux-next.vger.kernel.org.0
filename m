Return-Path: <linux-next+bounces-8756-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EDFC1DE71
	for <lists+linux-next@lfdr.de>; Thu, 30 Oct 2025 01:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D78D189C86E
	for <lists+linux-next@lfdr.de>; Thu, 30 Oct 2025 00:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25521D88D7;
	Thu, 30 Oct 2025 00:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UZotQNYa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE63A1C9;
	Thu, 30 Oct 2025 00:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761783978; cv=none; b=jan0rIXdmQ6C8d2zvYNxYI3bBhR1AyfoDpuCBEZ2k6cXmn4tXUuGFD1iuzR6atJdAoiswbTD35KmKA/UzKcSuJJqtCDAUjOew7gNI2XeSlaesRYUCq8GIjxoE/lo07jD9QUkJgV4Moq6/vAmqBpOaIlSJKanpr8dlH7+Q4y3wEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761783978; c=relaxed/simple;
	bh=7swxkkw+LgMHXDEOspWaG7Lnx1L+MbKswDgzVFO82L0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=juGilaoiVIQGBvhXDeaPJViaDW/AeELqiBTwIOMwkBobXHcie+NQyj7Me4B7c2Ntr5mULlSPoljBV2ti24CpUfIAZ1W37ZKzT508Dl1iBoB9iBuBQoZ6aPnopZIhVOaVSKp9WQvhF1CJGYdI8QFM+ClTSXVSqgO6QNFywXKn7Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UZotQNYa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761783972;
	bh=NhXeb7cf9lLfqVSw45QhwL8FWQK2bBZFACFxWRrK7ag=;
	h=Date:From:To:Cc:Subject:From;
	b=UZotQNYaHrgK6VxrP+3sZvqVdtHv4t/DacZ/AEZQjg/kW9nVenwM5tU64NNxbmLtW
	 52hJI8/qcwAARuqr8Ute2fTM3kZWctp7NfqYIth+kFV19YgY9uz/PABLbF+a9ZEVtH
	 cWOrsJ7gsqszdAfz4uZ8A+dkjLOPr2ljARem0Ub1IrbkKKljZoFNxijXoQPg7AqMhr
	 mwI31kU7t7YKi6aDrIHOCKeAs5vNN5wyaho6+FwOWxaIPVkCVnNkTvEPCSnfbmDe60
	 bMeNZnR8hCFc+rc4iB3b/Qgg3HM1TYpFsI94dKTIoN4jAEnnr497OwWCDclGO8FQVV
	 7ytKRe3cWDxEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cxlJy630Sz4wM9;
	Thu, 30 Oct 2025 11:26:10 +1100 (AEDT)
Date: Thu, 30 Oct 2025 11:26:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20251030112610.63b1185d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7+sOFzGHIfdJ9nc1HW3HdLH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7+sOFzGHIfdJ9nc1HW3HdLH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/gpu/drm/xe/xe_vram.c

between commit:

  d30203739be7 ("drm/xe: Move rebar to be done earlier")

from Linus' tree and commit:

  4f963693c60b ("drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_vram.c
index 652df7a5f4f6,f18232668810..000000000000
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@@ -24,31 -24,8 +24,29 @@@
  #include "xe_vram.h"
  #include "xe_vram_types.h"
 =20
- #define BAR_SIZE_SHIFT 20
-=20
 -static void
 -_resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 +/*
 + * Release all the BARs that could influence/block LMEMBAR resizing, i.e.
 + * assigned IORESOURCE_MEM_64 BARs
 + */
 +static void release_bars(struct pci_dev *pdev)
 +{
 +	struct resource *res;
 +	int i;
 +
 +	pci_dev_for_each_resource(pdev, res, i) {
 +		/* Resource already un-assigned, do not reset it */
 +		if (!res->parent)
 +			continue;
 +
 +		/* No need to release unrelated BARs */
 +		if (!(res->flags & IORESOURCE_MEM_64))
 +			continue;
 +
 +		pci_release_resource(pdev, i);
 +	}
 +}
 +
 +static void resize_bar(struct xe_device *xe, int resno, resource_size_t s=
ize)
  {
  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
  	int bar_size =3D pci_rebar_bytes_to_size(size);

--Sig_/7+sOFzGHIfdJ9nc1HW3HdLH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkCsKIACgkQAVBC80lX
0GzXSgf+JbA8rvneM/dy17pNphKi9zYbUxi7O0R2Q+UpdqI84Qga3C6B/3WB1za1
+YGHwZQTGmltgdfrsBo1R+3GnFPquyDvNAx1AW8SvkxqVOzOFZ/icpSMDcu9L4d2
N8iAjuBX91ivoyCqULbW8jWXkQ6TdYauCUiolXzSWgcTM8xyz9Fnzod0NlUpwZEv
Cwi0S8YGPI6kI/NdnEQtv+/h1qqfEfnEs9vVnPflfRBKGK4plp94SxOKdySLYdW0
tXIyPDgi1sEBjDPxGuoYzueSxsCL8Uza+Ko7E/qmIHZ5jWAb4j3USLJkahllSn+r
3cGhsrgND5WJg7p64aJLr00ZtV6XqQ==
=MsJw
-----END PGP SIGNATURE-----

--Sig_/7+sOFzGHIfdJ9nc1HW3HdLH--

