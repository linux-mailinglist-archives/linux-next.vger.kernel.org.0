Return-Path: <linux-next+bounces-5011-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D31249F8B80
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2024 05:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B94169B45
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2024 04:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A32E7082B;
	Fri, 20 Dec 2024 04:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RsdRu2aW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D962C859;
	Fri, 20 Dec 2024 04:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734669746; cv=none; b=DxbUcsBsLgu7GCpppLWhVGtF5rRzdy04mWUG2QYCvppLk8Cutv4z87St/VCJYTqeRkNQRPT3MWqTIJDvGnEabNOqBQCj7bphS5Jx39ktfpJHkQJ8QKXXTr791++DW+jQ6MHoADCO7J360GFVm42cbVoCnFMPJYwi+WInWSmb3t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734669746; c=relaxed/simple;
	bh=vsouJAYZu0kUkJ31sohQaHS6Er+ELVA28rnVBI/tx/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sg1OzrI9XgCydPNmlwYcjJlovrAQ6vJlfV7cKR5LfppU6AE5GW4TX5bao1rxCmOVUapzMcoxmBvq8c1PkstF1EVu1V+fraWii2YUW0WwaYKh4vv85G2yyCuY8ceTZMTjssGrikykyMqzr3XuK7n6ee7FpOucPrMdRHEeYfkZKf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RsdRu2aW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734669726;
	bh=X1sD28c5lvOZVoU2CZWWg264ZPUBOVNrYwpPBe1nkjE=;
	h=Date:From:To:Cc:Subject:From;
	b=RsdRu2aWiUAhNMBU2p/ASaTgyoCMLuZyD/op2g46lRjAWAp79BQBHZ8rBSUk3nHHO
	 RcS6xDTcddqQIYkLLJit6CYG0q54cjKO5qgxZAsPpupPR6LiDccsOpMMzv8O8fFP05
	 IaF/jbAYAz0OmruIAdT1SYCYhLvmBhyWYjmMM4GmdnvnUs+xHd2pbn65l8ltjNRfZm
	 3C8Ijhx6ZSXIQMDwh0ZzcGkCefPZTAYeITu5+nixFKJ1E1aUt+8W0c9OrKmfCqNNyS
	 rW+nCqiO3sSwgld0iVo20nVFMCd2BMENrXLVr/TvBe/znyNm5ZQAy//zzZCZLGbqra
	 ALoaQC6wK4gag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDvsB0nx3z4wc4;
	Fri, 20 Dec 2024 15:42:05 +1100 (AEDT)
Date: Fri, 20 Dec 2024 15:42:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20241220154208.720d990b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AEjIXrQB5G1FD5m3QdsPQc1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AEjIXrQB5G1FD5m3QdsPQc1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/xlnx/zynqmp_dpsub.h:86: warning: Function parameter or stru=
ct member 'audio' not described in 'zynqmp_dpsub'
drivers/gpu/drm/xlnx/zynqmp_dpsub.c:1: warning: no structured comments found

Introduced by commit

  3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")

--=20
Cheers,
Stephen Rothwell

--Sig_/AEjIXrQB5G1FD5m3QdsPQc1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdk9aAACgkQAVBC80lX
0Gz/rgf/WPa2cHf9/Fh49P40jSDpH770drpcWB8/zVLnufEEGip4+d9M1+ow+N+t
voKbfrJFbUa5iNc2GLXhl1ynJidtrSB5OIVpsfpqvKOUhPQ9N1FjGWBMGFHaktoa
a4szR+KdCyOw0nML28PX0fyGHHoskaaN/rT6sIx9F/a10aQSJSODHap5r1AR3yDC
PFrwiC1s2uA+v8RJsw0Xo/R/lsu3VYpuagmvJzhCF6kUI4WbH5KIL+IBA1Qg38p8
a5TEsZdF5e3OrZ4YQvgUOv2jVogs7tdfFyV9CH66ciLDylXmkfiKNedctKEfSDzc
BKFSa0To81kw/6VNnNlS3coTcqNfJA==
=OPvd
-----END PGP SIGNATURE-----

--Sig_/AEjIXrQB5G1FD5m3QdsPQc1--

