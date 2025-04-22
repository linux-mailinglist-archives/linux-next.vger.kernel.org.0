Return-Path: <linux-next+bounces-6301-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E7BA95AA9
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 03:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 917AE173339
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 01:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBD719049A;
	Tue, 22 Apr 2025 01:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="einY7QyZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACCE194C96;
	Tue, 22 Apr 2025 01:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745286448; cv=none; b=Je9atFvmpW2X7kjmn0dhJMPWiJqJZhOdgrLL9C+n1tQtBuwpIEXrrYFLbvxbyqA9jXjVa64uwVmyaoDYCZqkAOcylupYW8S6UeXPj6QDu+TEgHcpsn7mYzn0FTqN46Oum5WkH3iRDduVvRWd7rOJ26AfWUXuFZaj3VdnvjbT014=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745286448; c=relaxed/simple;
	bh=7SRN6yn1A+vHtNV/bso8eu+SnX4ltApo7aZ8u/vVW04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rRi2xGTo40h4l3A99XehDHzbfJH2fWgPBTOdkQ4b1M7fvmk2DO+mspuSnyBbrZ18/U5NdJ1hErbMWnrp+IJEALrL9GAl2xQkrIOaBdo551eMCq6KZpYHFzRz6y9DlnIbSu9W3zooUH4pFWklrotyYDzxFoDgq6eOE3GHVTz5HuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=einY7QyZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745286441;
	bh=jdZT00tIy/ppY9OQh/U5pq3X+9Kj7GiUuE/NV6FD27M=;
	h=Date:From:To:Cc:Subject:From;
	b=einY7QyZR7hxI/FQZB71dSW066HKMmcpPhCwOrhZZ8qg1Cx03OWI67wgA6rT8ey1V
	 4ZyGcq/yB+24KBUXRiVB12oVC+sA81y/KoPwsecueJ9Weum9uWAnGQbuKPcDebBLlV
	 IUIuXIZF0h6xqHvG6rJTmX3L+MK9vob85DaWdg3GQucZyUlwEnqEFJ766lNlTgj8g0
	 XiSk5Qo/PdAzBxbVy6JtW5vRFPImotutkvg4ZqxsHbeT5sw0QH9NVQdl/RddIvHR8o
	 DZ+Za6LL432tBTgl2zZpYovoOOscg7HXIGC+yf2AOeQNMIv1dcvAXXUdTENr0hE88C
	 DiKeY9VluhJeg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhQ8n3Svqz4wcy;
	Tue, 22 Apr 2025 11:47:21 +1000 (AEST)
Date: Tue, 22 Apr 2025 11:47:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the powerpc-fixes tree
Message-ID: <20250422114720.480cea29@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eyciFYFZlkLIGhOs35UBWT7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eyciFYFZlkLIGhOs35UBWT7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc-fixes tree, today's linux-next build
(powerpc_ppc64_defconfig) produced these warnings:

arch/powerpc/boot/wrapper: 237: [: 0: unexpected operator
ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX per=
missions
arch/powerpc/boot/wrapper: 237: [: 0: unexpected operator
ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX p=
ermissions
arch/powerpc/boot/wrapper: 237: [: 0: unexpected operator
ld: warning: arch/powerpc/boot/zImage.pmac has a LOAD segment with RWX perm=
issions
arch/powerpc/boot/wrapper: 237: [: 0: unexpected operator
ld: warning: arch/powerpc/boot/dtbImage.ps3 has a LOAD segment with RWX per=
missions

Introduced by commit

  b2accfe7ca5b ("powerpc/boot: Check for ld-option support")

POSIX shell (in particular dash) does not recognise "&>" - you need to
use ">/dev/null 2>&1".  (My /bin/sh is /bin/dash)

--=20
Cheers,
Stephen Rothwell

--Sig_/eyciFYFZlkLIGhOs35UBWT7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgG9SgACgkQAVBC80lX
0GxbsQf+JRz/1CUUMq9xsdpOy6RYo8y3F1OTh+LJ90eo9Wza0FEC+N4YXuf8b9xB
LzVIzz7zcjEK4Ca8x7npSY+7d6eeFdQK3uytDqxfQkClwc2/4rcGvZEqQRV2h6Ql
yEbctEcYDjfI2k758CGIPKE8u6FhNhP86iJlQME7eg8npPhrO5W0/zVFX4Ou/3gy
HwdEGy9DdoO/ebY08+aM/sEw3KKKuuuEgNreUNOA5/5HxLaLRKiqs9F9I6ojF1oX
nIaOVdXGe2aM7KPjYyVt5VyGfnpRDIJuJubaUfxycNGWnZKqEr9rMFq8inG6vvHY
zUyO/TF7f7ognDRVgxwtxB5MT4uiTw==
=qq3W
-----END PGP SIGNATURE-----

--Sig_/eyciFYFZlkLIGhOs35UBWT7--

