Return-Path: <linux-next+bounces-3027-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D91149320C7
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 08:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6528BB21985
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 06:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1E91CD11;
	Tue, 16 Jul 2024 06:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QO/e7/ng"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E7AE556;
	Tue, 16 Jul 2024 06:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721112882; cv=none; b=B5Qt9U0ycLrGAPFLmtChtCFjAdnCr9fStOpJqdIo8lU2xnNuy8OXtghmwIgV0PF5okllee0DpaHDwGG5BunWeVULvcsHNtGEOrhuVLK2rLY9DYdzEk4hquHTz1l0mk/LnhRyw23B/21JLg9RTOhtkuqZIJeN2MCqx5cxmTlGkyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721112882; c=relaxed/simple;
	bh=y9u9BfMi2pzTxyeZINCSQb5zGRPZzrVhIRUHCYFe3N8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j/3/AbANfr2zJcYHSjJWdhzMARnL/1Zop/nQGT1p6JUQSu4dO8UhHV417h+2RCHCZnhovC9WB/kyhjHEZokgFaIXTgFjbxdXVvBGFTaHRLym7/7MOpuVqR4/T9OjDqXrCtrzZYah5NjXJO7VbeooxUptR9qfh5qyOfC+zpWHCe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QO/e7/ng; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721112877;
	bh=MLzjKEa62nqzTCjCBEQPDm/giOfD6JdarZC3Gti2dfc=;
	h=Date:From:To:Cc:Subject:From;
	b=QO/e7/ngcIO81+lVUzk+3QJ5T+PGYlvmL2ycLvhRAdYJtUU9xvxxUvEDvgi+QHBhW
	 P11xhXWsEiI3OSrM4FfFZF/ynJexBbWiI0vH4gNOaObVFTEinC8G6vsN68GduCrsjR
	 MRH0/RA+saqemmUhRQc/0ycym1mDcbObuRGJaCWBdfgsvuLwWLj6w7TwnSslfdh8KD
	 GtehUJOK56JDWPsEec/+IEJ1GcUhII1N8e9OgxLZy48wp6Y3dV8AfFUMXwv5sIpKmY
	 dFt6PpbsUtLhPJCB0M2unA4fUeAGCHCvkzbjDwOt6GA6BxRgIvXNQR6rN+g2Yca/PP
	 4HKITcFEb96LA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNVDX6Xv2z4w2S;
	Tue, 16 Jul 2024 16:54:36 +1000 (AEST)
Date: Tue, 16 Jul 2024 16:54:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Shay Drory <shayd@nvidia.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the net-next tree
Message-ID: <20240716165435.22b8bfa5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mFv1NVk8tx=sR/9i89dwHTz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mFv1NVk8tx=sR/9i89dwHTz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/auxiliary_bus.h:150: warning: Function parameter or struct me=
mber 'sysfs' not described in 'auxiliary_device'
include/linux/auxiliary_bus.h:150: warning: Excess struct member 'irqs' des=
cription in 'auxiliary_device'
include/linux/auxiliary_bus.h:150: warning: Excess struct member 'lock' des=
cription in 'auxiliary_device'
include/linux/auxiliary_bus.h:150: warning: Excess struct member 'irq_dir_e=
xists' description in 'auxiliary_device'

Introduced by commit

  a808878308a8 ("driver core: auxiliary bus: show auxiliary device IRQs")

--=20
Cheers,
Stephen Rothwell

--Sig_/mFv1NVk8tx=sR/9i89dwHTz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaWGSsACgkQAVBC80lX
0Gxybgf2ITKmUskUHvtQglGmVAeVYnASe7wme/AKgff1Adh8ofJIA1+ondebtYus
JWxOyJPAdXu7rXrttUp14m5FdFye6YIOTmrmFr70JBiJxJAh7Y28sSBtCWk6wWWo
pEiL7HG28lu9F/wO3Yl0/2mTNmX5KNN0CeZnjD6IScRmRBCCM2bNrqBcZSTc1BGl
TlkmYnisRAI+/bhJg2AcyOXNcGPxRZCorFB5owvNwAlvL7DAfbA4LdMCJf/uRr9K
cWc4IZn51xfx5NadbTLJfvFCknQG2VrhbHM/krBp0n4TLmDU5wGPpkYWQrCE6CNr
PXtwu+wgSFV8BnmDG2MfBpciyY90
=Ubod
-----END PGP SIGNATURE-----

--Sig_/mFv1NVk8tx=sR/9i89dwHTz--

