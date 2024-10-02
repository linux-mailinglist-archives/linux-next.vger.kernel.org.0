Return-Path: <linux-next+bounces-4054-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3B98CC01
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 06:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0DE41C21376
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 04:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8184717591;
	Wed,  2 Oct 2024 04:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gIJIk0bq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6F5FBF6;
	Wed,  2 Oct 2024 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727843178; cv=none; b=gvJS9IBFC5DbLwTZICTQ1M44I7B1xipFmkH5up1MNX+BPMoAcLtDPQS6iUVvhHA3jTg1cviwJvqE9320scX5PI3R4oAPCi//OaXQS3/KlRtp4hlWWc93HdJFr7B7B6qtAfgOGhCYQgwrDcphy2N54RT6iqL56Oi0EDob3RTAecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727843178; c=relaxed/simple;
	bh=tCpXCr3i6PC3TGs0ql6SnJnCWFyptm8nEWhBifYksTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D4Touh5MRsSWBZnzitAJJauUV9Gz1CsajijFI5mMn21333Y6yp5oH8TfHML7ipgA3DTMq59fYLs+LOUcfkUGYe/LCgULQJWI/vGaFRhT357c88/URlKcFY80g3/5g08/8N8YAuu7KLXPexemK+ZOiK0/CKOw8x/Jqm9UoGYfENU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gIJIk0bq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727843173;
	bh=XreBBvYmR+1f68rr88+alfR05GRP1Yk0OyQkCRNnLHE=;
	h=Date:From:To:Cc:Subject:From;
	b=gIJIk0bqA3GsWLJdjIpotDDmw24mN4kev165yiB0yPqGFYoIDSCo4wX4aCPoKWogr
	 nPV7FRADNMssRmUmovhrFIRIROWjuanNjnJYTs1HzjzlOhkpR5TqBecir7JO5qafEH
	 SxkhTBlDtqrzOtblrqjNptohlf2EoWDlMWPfEouS7bKdCNu0RgsDdAz7h5iXsqWNJF
	 MIcVgg74Vw2YNF44hFjn3SgS/g6XkuGaFcoVV/yLPxLw4tE5bbP7Ic3T/fOdUT39ED
	 GeVHHvuAmSfGpSoTrfdAUsi1SMv1CBmJBVSC3PfrYuCUbee+LJp4mkd7LD0cApKuXS
	 JzP0iPk6pvB7g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJMFK4fVtz4wb5;
	Wed,  2 Oct 2024 14:26:13 +1000 (AEST)
Date: Wed, 2 Oct 2024 14:26:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241002142613.62008f4c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fkwnoMc0F+721SRhUp08h1v";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fkwnoMc0F+721SRhUp08h1v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/drm_fbdev_shmem.c:1: warning: no structured comments found

Introduced by commit

  bf0978203a74 ("drm/fbdev-shmem: Remove obsolete setup function")

--=20
Cheers,
Stephen Rothwell

--Sig_/fkwnoMc0F+721SRhUp08h1v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb8y2UACgkQAVBC80lX
0GyZtQf/SKe/UJTN4DqdP7ROGhDelpLaKN1/YL9BIDNuz4lJOAwgkUWnPf3Bjlvs
f1dcvJyVcfjPEuXO+ZfKbuhyL0KUnBan4jh6UKSjtquOOAtfBSFd/OijnMT7TyMl
NfzFbNDYyE0e7VrGEbmh7YdamiFs28K14peJQY/8wHU/62ci8yh7vw92Jzc1I6/J
fhMPzBijrhXcOFyUrBGlU7kvgY7GpVYAyMOWglItrB2ghnq7ZroRGiS64lb8OgCb
ngC21WOp9TizYdx3yvIkfzc9siAg4xW1or/oajOdC1H2aJXpPZyO6QxAz9OzEGOC
JSKErFxxeirsbQKqwLCSvxDVa3CsdA==
=/9Ya
-----END PGP SIGNATURE-----

--Sig_/fkwnoMc0F+721SRhUp08h1v--

