Return-Path: <linux-next+bounces-2236-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 311358C074C
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 00:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A990CB22236
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 22:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D58133285;
	Wed,  8 May 2024 22:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sUlng9vF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F4138DF2;
	Wed,  8 May 2024 22:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715206998; cv=none; b=jA/WK5A3ihoqhHkCP63ReWYBPX04Yotre8mORZ7X5MVjCaE9IJxLbLhbDbpuJGKyUEZBZXfnoepfgqloql+oYl3ZUMktqu6zVIvE8FX77BTgHZ9ITNy1C9g9DrOTY8s50vVwbN8eyw2ox7OS1MBRVF8lwzdIYfn7/bG5MXgDX14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715206998; c=relaxed/simple;
	bh=uQjajuGKUecMKdRwLw/2GOGaZW8s7SyWVSMMbxDLJL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Eo9JM7KxdBT9nl//7BwAdHM/EmjGxOPnWfr9vixdpXMXallMYRFMroNWQosk/V3lz9jW1e57ZjA2ILcpUzGvoehnkJ9q82nkmhsaXBzZ/MmhjpFFpsJt5h4D/Jms/sdPSdw60ROVTwc61wC3cimzsy9Ws5SThELpjaK5NMMaon4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sUlng9vF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715206994;
	bh=UVz6jPQHqik8U2fpmbNZ7neSQXiaNXUF2HoxCG0Guxg=;
	h=Date:From:To:Cc:Subject:From;
	b=sUlng9vFvsOHyJVqz8cMRMZQuwaFYnNn01cg0dolLExnWz0NDllFugYWrQMRFRu0f
	 uYnQB/1eBEbBhw3NaFH/x82YCoCWK4v9OCzj3mYg2ASuI31OY8ci0SWJFGTYrN9Oq7
	 r3aGGJYtFDVV46NTYawlMGQ+HXBumNjrXEkHgfkIZHDputHuEWNTyJlvRfF+5MuKJC
	 pxnPCrPFU4Z6Ot1k8bj9ASzVEnXIhd7Q3K48uSEuWsBg4YfIYTaYNlDNL9VAz8GcNf
	 9fHpVzFnn6VAAfjBhL/XQlvNPBWoB+N1ifhGVUcHjsmwydsMjBpcPG/cL1COOsPtCS
	 ORjggrM6iBuBA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZV5t3d33z4x2k;
	Thu,  9 May 2024 08:23:14 +1000 (AEST)
Date: Thu, 9 May 2024 08:23:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20240509082313.1249dabf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lgQCCIIT0DmxP.+oQRf_d+w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lgQCCIIT0DmxP.+oQRf_d+w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  27557a840463 ("drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible")

Fixes tag

  Fixes: a6ff969fe9 ("drm/amdgpu: fix visible VRAM handling during faults")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/lgQCCIIT0DmxP.+oQRf_d+w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY7+1EACgkQAVBC80lX
0Gw/qAf/VFLT+0JO0Jyp7sMKOjvTacTmMjMgnWbfF19SnunhBvK0Xg+GMQ3pmysd
44sr4bmeWshJVfJil1QvvKbr8jecVU+VDYof2CRWa6Y9IqWrHbqaYRjGOP4hv375
uGYVToN+PxCC/wf9E8Kgz0R6Q+7W+YUeyArpBM+a51+a69zv3E8R2vPrrvc0BNul
gYbTmHELpP2Z68jXs44MY5cS044K2rjAIJxA5Xboob5aJ2/WAl+hxHR8M70wdYwr
j6eUKA8ZPTojsmI8+deIX1UvRnfEZJrgd8IYwfrJ/YLpUD7b0itgAxG812Szh1Zk
oAuiZQAxjyqM6KFqgMje7Tvk0Gspcw==
=BAOE
-----END PGP SIGNATURE-----

--Sig_/lgQCCIIT0DmxP.+oQRf_d+w--

