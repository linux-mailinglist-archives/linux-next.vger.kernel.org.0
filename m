Return-Path: <linux-next+bounces-5227-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B251A132F9
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 07:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DFB9166594
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 06:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072CB18A6D7;
	Thu, 16 Jan 2025 06:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WEESXWCf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526407082F;
	Thu, 16 Jan 2025 06:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737008006; cv=none; b=rhdP+4J1IjPhyePmjRcGPNU1W2uXSKHKbY1cBs+QPe/QJ4E4PN7B5FRPlr/FQe/syhZUzIgm6+gnNM5k8HeYO/f/Gq1YJRTg+bxjyLoRvag4/7RUsveFLptyp03MQTDhydtJ0DVeUjQgSLj2LqJYeBRPp/Qx/xgi5a6TU8LzOpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737008006; c=relaxed/simple;
	bh=8yhBH1oVLLsFb7xr5WcGPtj16XNMLOnVnOHRoaKC0FE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SyeJIB55PPZ1LnzUVNEuLANwCIiDi+NeadB2Mh88w1N6OfmS3nY0q9Wehihsa6DrKhrPZUlS31IhhE+EGRuv967kelbj3j4X5KjazuXExwv7ZFB7VWWV2PNvILuruqIFGWrW6txbrrkEHIVxRKLZGaT0FkDXZFY4Jbdh1/dnR2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WEESXWCf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737007994;
	bh=ikx7tLRt0uJbY3V7Es8FmtydVzBofz3dFsBGSijGDdo=;
	h=Date:From:To:Cc:Subject:From;
	b=WEESXWCfM8/wkt5ASf9CYveNOypu/ZCKnVXHSRkf6rfPODa9QXK61JoIHHO0OIhCk
	 D/8xcUuQ27EPihtGuSmJ1kFAgvm+P0Fdj3jaD5OqUo497BZ2xD9ZXR7Ff3bqzOpfxq
	 7Wok29whNpWUvzfJCFnSdBtVHzazOE1v7oKxuFSEzNKWPR9bbv/QVEiV43gw1NG1w4
	 u0YmoztvX6dyZdZJ+ILi27c7v+s0K4EPiO979cE0r8ZCI/mMSRZW6vsB3jlZz6Pua0
	 f6hhhbeuXatEq5X7PCkhCk5gG59XJXhgqKMSA7SOAx4B0UbF9nNQg22U3rsWoN3Rp/
	 TsBrnoKsnuwhw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYXbt1qmmz4xSn;
	Thu, 16 Jan 2025 17:13:13 +1100 (AEDT)
Date: Thu, 16 Jan 2025 17:13:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kvm-arm tree
Message-ID: <20250116171320.5f3aeae6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l3xiKl=UO1gbkgZ5r=SxPJY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l3xiKl=UO1gbkgZ5r=SxPJY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm-arm tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/virt/kvm/devices/vcpu.rst:147: WARNING: Definition list ends =
without a blank line; unexpected unindent.

Introduced by commit

  affd1c83e090 ("KVM: arm64: nv: Document EL2 timer API")

I missed this when it was introduced, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/l3xiKl=UO1gbkgZ5r=SxPJY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeIo4AACgkQAVBC80lX
0Gx9jAf9HiVFiWVgzzkwQ6Liud4XXjGrdYmrRvtZzpv077SeTsL/cxEKIi6P3V0o
j+9Qvik/FkuTIJqS9LUnwQDAJcO2L040QlUUXnUJkPWlCQ5PiyZH2jbosoSCgpQZ
PBv0rmQP6+8p9JKJNYaVG5z1iUN5Cu9MVtWAbtCCVqjq4yAJUgSD5Ec1DEsld2Ua
AeAd//g7AtFRKfw/69M5u+qdQeQ0s5bV6Kfrq0qlxEtu79jEW+I3d34QklX7i1AT
Y52hTm5SHhzxljLXLU1pQxuczwM/K1GTrVeQqV+B8mibiEyel8dp0dM8jIdq9Fss
WiXcHjDrjqRM+RbMFm/BG0fDxGjk7A==
=pz38
-----END PGP SIGNATURE-----

--Sig_/l3xiKl=UO1gbkgZ5r=SxPJY--

