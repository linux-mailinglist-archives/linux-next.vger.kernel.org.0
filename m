Return-Path: <linux-next+bounces-5433-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7268A33611
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 04:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96180167CD9
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 03:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9716B204C1D;
	Thu, 13 Feb 2025 03:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CUrvGPwG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD96A38F83;
	Thu, 13 Feb 2025 03:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739417292; cv=none; b=q6U76mi85lITqE7TTy/lyMO5HFBu1UcXAEJ80d5kPeLagdBDOIDeW/Cm3iqsH/xGoLBojrEtkBXK5bnIMnimx+VMDH2TpMAG1J9hKH354WSuBTZErBpgLicUXr0Efay4c7Gm68I0ifu/jbMn4GT6P94AuYTSYW8HMuDb/fftPQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739417292; c=relaxed/simple;
	bh=WXPA+TCcDSANgl9rMrGiFBFSwDRaHAqWhEH+Uv/X0r4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nfwY1n+gwqZ+54BeXR5GKwlW1T1LvxKDrp5/ECFQhFFMDLpmvANoSiYTtFULsO51Dj4kipkulBMHSheHL1y4Q4rqhpW9KNjkCiG7qdYcBT+U/4aWB/p/zunq3FGxG1Qm0XWqnvbw8bxDPWKrJ1fRL2Hnve37MjOAzYEzhSldlXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CUrvGPwG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739417286;
	bh=VSE62iAbJ8/XyCqrBLZI8kJFHdf+IMPiVzntvbOSJ4E=;
	h=Date:From:To:Cc:Subject:From;
	b=CUrvGPwG0O5DV0a5vogsvUJoyu/HbgqvKSKhmEjccnOEpQclilcSA03Vr7DZyK8j2
	 4ZGOew9JuFEnudnMKFVgSXPsBtXBM43lnuVWLi06l69hPaselmRwFhu1lkUgmyu7ZX
	 4s8R54Wqlv7ArOYcWR/NWD5rykAcrWXBGwtQ483XEorOHc5wj8bn0aMvTbV+4LyjbI
	 IYP34x7oNwObEZRpO+BYdEsVTdstRmzQ/FQZMd5s5U/lfrVatW3PQvB1WBNlyubg4U
	 IQF1Ue3ZTEFelLK3PtzzsPLr7AxXeW4ifm0rltIkTBWv+76QD0bkIA4RRSDNrzSojq
	 YqJ9qfL8ZOgSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YtgcQ311Nz4wcr;
	Thu, 13 Feb 2025 14:28:06 +1100 (AEDT)
Date: Thu, 13 Feb 2025 14:28:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wei Liu <wei.liu@kernel.org>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hyperv tree
Message-ID: <20250213142804.4ba0e125@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P.snZPPoqoiWRE5KWVYJLLd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P.snZPPoqoiWRE5KWVYJLLd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hyperv tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/asm-generic/bug.h:22,
                 from arch/x86/include/asm/bug.h:99,
                 from include/linux/bug.h:5,
                 from arch/x86/include/asm/paravirt.h:19,
                 from arch/x86/include/asm/irqflags.h:80,
                 from include/linux/irqflags.h:18,
                 from include/linux/spinlock.h:59,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/slab.h:16,
                 from include/linux/resource_ext.h:11,
                 from include/linux/acpi.h:13,
                 from drivers/hv/hv_common.c:16:
drivers/hv/hv_common.c: In function 'hv_get_partition_id':
include/linux/kern_levels.h:5:25: error: format '%lx' expects argument of t=
ype 'long unsigned int', but argument 2 has type 'int' [-Werror=3Dformat=3D]
    5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
      |                         ^~~~~~
include/linux/printk.h:473:25: note: in definition of macro 'printk_index_w=
rap'
  473 |                 _p_func(_fmt, ##__VA_ARGS__);                      =
     \
      |                         ^~~~
include/linux/printk.h:544:9: note: in expansion of macro 'printk'
  544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
   11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
      |                         ^~~~~~~~
include/linux/printk.h:544:16: note: in expansion of macro 'KERN_ERR'
  544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |                ^~~~~~~~
drivers/hv/hv_common.c:304:17: note: in expansion of macro 'pr_err'
  304 |                 pr_err("Hyper-V: failed to get partition ID: %#lx\n=
",
      |                 ^~~~~~
cc1: all warnings being treated as errors

Caused by commit

  bc57d252ddf0 ("hyperv: Move hv_current_partition_id to arch-generic code")

I have used the hyperv tree from next-20250212.

--=20
Cheers,
Stephen Rothwell

--Sig_/P.snZPPoqoiWRE5KWVYJLLd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmetZsQACgkQAVBC80lX
0Gz85Af/f8Ziqm1BttOcDiLn0nNfdJys3iaIIpvYkCtq8LVlQ29Dq3jp8RZa6Jlm
+IpnbLzezWT6HpqLV820SlF4pGSxHV85v8Wi69yUD2D84cxOVCrlsDyn2nhaqA7S
NkwXmLbi5l8HgbPRthPix6E1CyEuGF2kNeBmGlQusa/2+TriBh8MxVuPiLO69PIm
ITQ+Qp2pwQPTuCigiKfvGNoQoxi/VYxRGCEdfyOAO9lqVcGT8j3X39oN3+cuT9UA
xN//vxG/Cwrc1ATbIHNkMEGflQar5wg/08PQ7zlSN6lBs7Nz4qjurv+qXqyqTI8w
PMAvuoW7ItoArGKitjwlhd5GuW5IYg==
=NXeM
-----END PGP SIGNATURE-----

--Sig_/P.snZPPoqoiWRE5KWVYJLLd--

