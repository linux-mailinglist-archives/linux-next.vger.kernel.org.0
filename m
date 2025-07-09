Return-Path: <linux-next+bounces-7435-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A45BCAFEA6F
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 15:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6564541E54
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 13:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4599426E703;
	Wed,  9 Jul 2025 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VQ/an0U2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF30A2DEA87;
	Wed,  9 Jul 2025 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752068402; cv=none; b=HOrHuvyaSbo85CG65nP8T/yUX4i+Y94FE6caV4GryGXfJc3Fd49SNH6rD9GeGc7y5PR8P6QxtD/mDezdxQECBRsVVZOsvXzDrLT7mfzGx7IA1aqg0C4xApxeo0gTCLi2tq2BsmtdpexvsoO6AS8dSRR55EDBLow1BAHl5H0HCPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752068402; c=relaxed/simple;
	bh=8nXQcSV63TNGyK/6vr+gAIb8qjWH5KoPuR02DMRFLxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OdARIMU3T7wyqOdI7J+QdLv9K+MMzsCv0pk+lS5xUhOfDIcVKl2gSytrxlyE/Ue/cCg94wJn+kYpF6VkZkJH6nXetEMNnp9WyE4heSC54mSAYK/fZ/LML4aPyVTIv/y83ps0RLU8VERhH6ZjIO3IXVnWxSHwja12D/oSNxO8Ocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VQ/an0U2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752068328;
	bh=5PqWMJxrOMtEpypWnoHuXYpewaUUanABLwDyrLhNaTE=;
	h=Date:From:To:Cc:Subject:From;
	b=VQ/an0U2+ILiZ4t7oTtRQjtJCbH/bl/YCD9GT4Cp+Ghsvp9hQgO1i+q+Rg8d7U9ku
	 FLzY2kbj39DyepfhsT+L8g1giLM9eEIcm8sGqp284di9icDhTjKzvIKYWHKGGCS6Z+
	 d/RNR3CTqxlhC94fSXogQNsPvE8PZ6amS+23nlSb3QnSjegFQG0mCf8owBm1NSWoEz
	 0Y64LEQeMuS7Dwtn+0t0ccyTIAwNdMUrwM7It3FTelfvxnpKu16awcq3oZYuWDbZYa
	 mVY6R+cEn3s6S++x+afF8Y7QTSldjzj2mq1CWbkR1buROHI3QmvTNMyTY46oYUip0B
	 XN25s1yIDwabA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcfFh43ncz4wcd;
	Wed,  9 Jul 2025 23:38:48 +1000 (AEST)
Date: Wed, 9 Jul 2025 23:39:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: boot failure after merge of the dma-mapping tree
Message-ID: <20250709233953.7afb7a8a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kHrdnwknmDn3dbY1sE6cxWv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kHrdnwknmDn3dbY1sE6cxWv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dma-mapping tree, today's linux-next qemu boot test
(powerpc pseries_le_defconfig) failed like this:

[    0.219439][    T1] ibmvscsi 71000003: SRP_VERSION: 16.a
[    0.219472][    T1] ibmvscsi 71000003: Error -4 opening adapter
[    0.219507][    T1] ibmvscsi 71000003: couldn't initialize crq. rc=3D-1
[    0.221963][    T1] ibmvscsi 71000003: probe with driver ibmvscsi failed=
 with error -1

The normal output is:

[    0.221208][    T1] ibmvscsi 71000003: SRP_VERSION: 16.a
[    0.221272][    T1] ibmvscsi 71000003: Maximum ID: 64 Maximum LUN: 32 Ma=
ximum Channel: 3
[    0.221310][    T1] scsi host0: IBM POWER Virtual SCSI Adapter 1.5.9
[    0.221653][    C0] ibmvscsi 71000003: partner initialization complete
[    0.221696][    C0] ibmvscsi 71000003: host srp version: 16.a, host part=
ition qemu (0), OS 2, max io 2097152
[    0.221752][    C0] ibmvscsi 71000003: sent SRP login
[    0.221778][    C0] ibmvscsi 71000003: SRP_LOGIN succeeded
[    0.223269][    T1] scsi 0:0:2:0: CD-ROM            QEMU     QEMU CD-ROM=
      2.5+ PQ: 0 ANSI: 5
[    0.239389][   T28] Freeing initrd memory: 1844K
[    0.302192][    C0] sr 0:0:2:0: Power-on or device reset occurred
[    0.302411][    T1] sr 0:0:2:0: [sr0] scsi3-mmc drive: 16x/50x cd/rw xa/=
form2 cdda tray
[    0.302450][    T1] cdrom: Uniform CD-ROM driver Revision: 3.20
[    0.302800][    T1] sr 0:0:2:0: Attached scsi generic sg0 type 5

Bisectd to commit

  ec7352735abf ("dma-mapping: export new dma_*map_phys() interface")

And reverting that commit, and the following one, in today's linux-next
release, fixes the problem.

--=20
Cheers,
Stephen Rothwell

--Sig_/kHrdnwknmDn3dbY1sE6cxWv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhucSkACgkQAVBC80lX
0GwZiQf/XuG2KLkjifmsXGvZdisyKFaQNdMyFNYx/abXDLgeHD0ros8Ir1kyDM4z
XkdxbaZyJRR3+23AQExnrqovJtuAy4juGvgzsFNQTm6q5TvbFx4PPC/MXPpKWVR2
S0j+79ZqU/TUAgpHNJ5m9BNYKqANYI/07/Nlt2CEvfzPGQOuoYwopCgLaRKoV4R9
3w9M0GSXWCqA29mrOnXx4K0EnlXP/VN47BwmBwxsUnhEmcziMjCl88LFgdy3/sJ/
Nrae3b03LK4VaDXoGX1xiWmsD0ldusPbDFTHVxy/JHLd6F64LjoAt33b28IS5rrz
uR288DDHOmR/J/5nrS40NdfrxLAd6Q==
=L0Jr
-----END PGP SIGNATURE-----

--Sig_/kHrdnwknmDn3dbY1sE6cxWv--

