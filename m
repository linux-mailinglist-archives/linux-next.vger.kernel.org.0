Return-Path: <linux-next+bounces-7969-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E517B29718
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 04:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DD661964D65
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 02:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8D52571B9;
	Mon, 18 Aug 2025 02:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CzSJpoG/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1591A1487E9;
	Mon, 18 Aug 2025 02:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755484740; cv=none; b=DTMnaEZkGz9ZPDtBvnDlJpT5zgJhV/7b/7LWUeUXy66iBq/RFPyftXQEuXYfn+J5QHpKwPCAEyQVfhJXPL5PlDpmBspx9cRXBtRvjxXuBzwVRa57mbJ/QJrhpfZ18gr50x2edcgkn05PLEQdzfZcre84KUHzIQeTIeYoTEbskpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755484740; c=relaxed/simple;
	bh=3Yqh3EVomf82xiiL/vIrr8WQJ4PscX/SkdGcVji9qGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qfKo61Tc1oMcJv1TBHvGSvJ2NnwvmxQY4yvG7K3MvFu9s0122VNXxJpbfq4f2RO/2inN3L+ZRMptUizGh9+rbwGsBjtvbrLlj4vPxKt9TRbF3gpO9QArgtAfRkYNIP+49euO8xcugeFDYKQPRr8OVjX6dvIyj8XyWZ4Tq3qx/80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CzSJpoG/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755484735;
	bh=/EDNXDGvVfSLRGFAXKGz2eTcc7Spw0fcXsFzzN/5iQU=;
	h=Date:From:To:Cc:Subject:From;
	b=CzSJpoG/GgfU3PY9O6GYZQTK4BTk3TntijldJ+X3foNUkaFWj1OoaxpTOugdQTBio
	 7VE+p4y4hrFksFU1MfM6mF2n5CLsovO0BcdjlPJP+Kz4O+oYf9r6k/U33pDv2HlNMP
	 GG7/G6JBa7hcFI9MY+tOb6MQtRyr4RTvnZBROFmD0c925zljg2NCjJ1hFQ0eNl8djf
	 GFSUigrfKwvjzQSKbDMKPHip4XTQvz7kc29uGOER0Ts+xWxdqxPay0LjE306/tcyg4
	 LsniPvgflACICgUa4+z0iAbM7odf75g18BjctdVoHSaodvD3AZqKDVNic2xwNxqbNM
	 QOjO5LxuwW2yw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4xjp279Lz4wbn;
	Mon, 18 Aug 2025 12:38:54 +1000 (AEST)
Date: Mon, 18 Aug 2025 12:38:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Danilo Krummrich <dakr@kernel.org>, Javier
 Garcia <rampxxxx@gmail.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc-fixes tree
Message-ID: <20250818123853.51aa3bc4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7yr2msOT_t5hQ/B_590u7Cu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7yr2msOT_t5hQ/B_590u7Cu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2446: ERROR: Unex=
pected indentation. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2448: WARNING: Bl=
ock quote ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2452: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2453: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2457: ERROR: Unex=
pected indentation. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2458: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2459: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2460: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]

Introduced by commit

  6cc44e9618f0 ("drm: Add directive to format code in comment")

interacting with commit

  bb324f85f722 ("drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected usag=
e in literal code block")

from the drm-msm-fixes tree.  Both get applied.

The drm-misc-fixes commit is unneeded.

--=20
Cheers,
Stephen Rothwell

--Sig_/7yr2msOT_t5hQ/B_590u7Cu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiikj0ACgkQAVBC80lX
0Gz1tAgAgAhVdDzeptXMLx88AmQAPNlAy0Xzi9slrZrZ1hwwDh6oyS41qYbLy9/J
9flRTMeEFCjFYu04qzmk3Eb8L0tdy2O3CTpXY47upNERgWuXhjU25TCLRvQ0Pqms
CtTixVhqEDLaV8C53UMj4R/a1aImOvS0OfwGnNKk1QQqfObErG0Qi0WF5sUfPI2S
5kHDIjJ6WAX2Pr0HARYzhKHIMPreQxq3LdScTWwovdedE4XNZ1rAvFTr3qHRzke2
JLBdjQaTswwDfxwDLHs3XaEn4LnUWjb1o0wATNCfljJeJ4jBTvfY6htEWjKv/0Wt
HVf3FtpWq23lzX9dgALG99VBdZC4hw==
=TljA
-----END PGP SIGNATURE-----

--Sig_/7yr2msOT_t5hQ/B_590u7Cu--

