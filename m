Return-Path: <linux-next+bounces-8873-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA6C390E4
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 05:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E6C4D4F6357
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 04:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB1B18C031;
	Thu,  6 Nov 2025 04:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nabP6++f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED8618EAB;
	Thu,  6 Nov 2025 04:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762402048; cv=none; b=euRy8gT/znE2KvJPa+mqV97M9LkpMF/RxYqVPy04pehSULOO1AE1NYjNc1Zl304WPy9YqMOQcDheayvo7SCuFdHOFo1G9roJkhpOg/LKOw01N8EqTs1q2WtwAyxNs/P0GP/e85x51UXmCKciCxzuTWIMK/1RCoKu+frzdL5ydSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762402048; c=relaxed/simple;
	bh=TBPpRPHB9O3vmOlCLgO7jAbcjtF6WsoKTAvbT//srXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=leUIgSZt5gXQaRzKvm+wptfQYl4VcBbBJc9jeBimfN4ldpkFXqzINu222qkzGlOntr2XOkqazU5RUSJ+H9gigKSoFMd+rrGgmUhEWVl/AKVHRo5Lb/Nwb5AL+05aQMNa5OJTIXFiqWzTYF2bV7ZaMPkdHIPGwcHGAV4bVIpwGkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nabP6++f; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762402043;
	bh=sMNsGWknN/JaYt72ZThqTIrgZsi0hfoUuuQT8aPOHL8=;
	h=Date:From:To:Cc:Subject:From;
	b=nabP6++f34bizm7G6AWBLhfZBKVKTxtp0dbrKFEoH9c1Rx8s6koeRYWq7MCWZ9t++
	 9L+h7FVwfiqUOfP/QLdvYNcLB4kHxqhqTO0EvB9oMS/4G8TiauM3h50gG6FvB6oLfo
	 KYSYaOUeAl2agEy2eONPIlEt0o21Y8XMLOiwpIhzglMC2y3TzQptamgvzxm4JrNGWf
	 IRo4vc5KbT3qWIo5b1msNWquNR4RIk3lNg2TDPoX0s09Q8JOxyQGpsd4VgohkoesrF
	 wwfVHIBxZ1QXIr7Ri6/0kXjqjJ6opGv7L3RR3ShvjHnYw6eeSkaHzrngXNVNWaxy0p
	 a0TJP+o4/rRvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27tz5mT4z4wM2;
	Thu, 06 Nov 2025 15:07:23 +1100 (AEDT)
Date: Thu, 6 Nov 2025 15:07:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, YiPeng Chai
 <YiPeng.Chai@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20251106150723.72ef9e86@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HTr.bcjM88iwQINF/laxE=R";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HTr.bcjM88iwQINF/laxE=R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: drivers/gpu/drm/amd/include/amd_shared.h:113 Enum value 'AMD_IP_BL=
OCK_TYPE_RAS' not described in enum 'amd_ip_block_type'

Introduced by commit

  7169e706c82d ("drm/amdgpu: Add ras module ip block to amdgpu discovery")

--=20
Cheers,
Stephen Rothwell

--Sig_/HTr.bcjM88iwQINF/laxE=R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMHvsACgkQAVBC80lX
0GwPOQf+J4ssFYzPj28KjB40p5sVNr9eHRGyCH+vl12nepM1gYRJDSJYGwQihtQ5
SWX3i1SCj7NgDGKmvPGZBPwfZZfqkkI/M9FLuKf+q5N2sBzFexN6qxzCDU5hzmix
QWQZvWYXoaSGho73Wep5dPITITKf/WEPyhujCDryfvmFrd6adyJy2lMOmm683wA9
6O2sbZdsDGAk64pCfGqKGTvBrjSbhflE2cY8Fz6XSzJAEedUAyF5Q4uo6G4Lx23A
LBuyDMhT5rW24JGGxsoYxctEMuUVHz9H5Aa2IkVsD9sMwC/5NjjNdSsslGvIRhOi
WOzhxBcPQtk5uQagdqUX1iR5hg+oTg==
=a+fz
-----END PGP SIGNATURE-----

--Sig_/HTr.bcjM88iwQINF/laxE=R--

