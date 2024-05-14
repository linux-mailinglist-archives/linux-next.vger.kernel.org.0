Return-Path: <linux-next+bounces-2297-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4113B8C4CAE
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 09:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8E451F21BD4
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 07:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60CF10949;
	Tue, 14 May 2024 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uREJm44h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCEAD304;
	Tue, 14 May 2024 07:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715670862; cv=none; b=tSbl1OHfWCam4m4emFO/2HBE8D7eUpYqpQx5rbsOakh0TFutMOfVxr5nBzKlO7M5XQw6TJowxhJUCFWaGRemQ8XptRRXRm8QlD322aRX8r2sUE+zJ41bAEeDEUKXSSE8qYGUt8JdlSji5V0BdB+sWokGU2LDmH9aJp8gsqXWhLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715670862; c=relaxed/simple;
	bh=DTuJK9qCwzkoSftdj5VkdIkyAp++ZGbRmYHAah7IaHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jyPsOXHsWE708P0/uIjmZ8FG2AUDfmMSfDmBbZm/Om26oXuUJzNBqwiJk5yaWbuatlMEjYY+2cALeyDa1cyC7j742o2DMF3/HlHBuE5N5MyLEaCnuAA2Rhc2lHnzFkZOK8wk1gq9qfjHApkmNBsKffsGnEh+lcI6eBaS/nd672w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uREJm44h; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715670858;
	bh=OW8ww9loR9RfCx+NN+4ltvUd0I6KWOej7/iAa3BTV+A=;
	h=Date:From:To:Cc:Subject:From;
	b=uREJm44hE0Vf2rREWdcJPdjx77hb3OBPS3qSgL3oY9Qcs5MMFaMythSHu0HzyEO3p
	 dew2PlraD7Ruly8KacjDb3GCXIpOy5BpO8m07LWhvReKHfWO/dQ5vtIoBFDtxO3o9o
	 ssKEh3M25v/Ti2p2mIEPEGOV4u9iNaFSrKZPXQwdZaLtadlaZOemU+xJxijehRsu0+
	 NborkPiED1lIhs6xwy3Hp1idNP4kl1k+vlwd/bLPKUD9mSGzf8nbvHZ4DvVWVjLnAE
	 ODqA73jZ65JTN0q7dtj2UwCeOVP8QsraYbsERHBGsAYmQ1h1MPSGY3voz6isdSTERX
	 TZ55iUV/GQl6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdnfL3PvTz4wby;
	Tue, 14 May 2024 17:14:18 +1000 (AEST)
Date: Tue, 14 May 2024 17:14:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Pratap Nirujogi
 <pratap.nirujogi@amd.com>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240514171417.492a1301@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kSOf3SnN_YMpWwB4Zg5Rt+R";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kSOf3SnN_YMpWwB4Zg5Rt+R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/include/amd_shared.h:110: warning: Enum value 'AMD_IP_B=
LOCK_TYPE_ISP' not described in enum 'amd_ip_block_type'

Introduced by commit

  a83048bfa402 ("drm/amd/amdgpu: Add ISP support to amdgpu_discovery")

--=20
Cheers,
Stephen Rothwell

--Sig_/kSOf3SnN_YMpWwB4Zg5Rt+R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZDD0kACgkQAVBC80lX
0GwEPQgAoUs/hR6H8Rmz2/jozYwpfnYX0DonDzksBxV/uDaaD25zCnKfH3Zd4QDv
1blzoQ9GegOtzR77akoutYPLE+f0gKewk02X8n7yPG01CXu+WAtMHy+OFz4HJIPs
frJrS7lgoR6YmPRq4j5PQjc1tM/amD9kU0XZaFlp3wwJ6KN9O8VqejOBijYTHWqp
GIrCLvcpXG2y5KQpK5S/q/lEZARIn6QR/odG0xIfBPkBT3tej2oOK6dMq6EKxVHU
RNAwvK07HwnZDpSZX8owlnE+A07JH2JPLPz8VcoxONF+mh3qB8vNLA9r+hgFDbD/
UCzHUNpS5vLjlYp1Yp7xf78iYqrKfg==
=siMs
-----END PGP SIGNATURE-----

--Sig_/kSOf3SnN_YMpWwB4Zg5Rt+R--

