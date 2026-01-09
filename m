Return-Path: <linux-next+bounces-9594-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D0AD06E42
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 03:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A8FE302BF57
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 02:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB88031A563;
	Fri,  9 Jan 2026 02:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ky3r+SJM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB7A2264BA;
	Fri,  9 Jan 2026 02:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767927285; cv=none; b=EPcDW3yzTtxm+DkA9V/3zrZBJru+IWPw1yNUIZuhLyKogaybM9mcQWjRwCbjjH9TtAqPokcnq9tyBLqggpiKbs8IIwe2cEc8kSCggKIhEwxlAYOU+ejMvv0lfwKpdSmxyff0H0dc/2v4FvPmqretMYa1V8R7CPGElQhsKO9Ql+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767927285; c=relaxed/simple;
	bh=25PbzqY9V8ERHPZ1FlufdB6x1F3QGC847b5x8c7vozE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r4OME1IofkLdKv9pbGXXu1qfbpZL44JrSKOE3hweg6K1tbevLgWbiXpHnQ0b6m6ZGOmlDW3+J6fu8sfu+HBKx5UJk0BIR0GYpgZJim/NOLOBZiESoEvmVwGWut+UR11lXsJOJgcilCr//zp6WYxasnjTRDAziTRN/ab4DDTUbLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ky3r+SJM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767927279;
	bh=c7L7YWLxRsvA+5ELP8FC8QCI5J1nWuF3GfW4reXiz3c=;
	h=Date:From:To:Cc:Subject:From;
	b=ky3r+SJMr4f/duvycoLA6o75GooWNoiQVjyWXA9AWM8UnZM3GuBPqjU858yKQfiFY
	 2tW8XdEj0uj8S/RtiCBhQlK/qTrrMJ0iPYbY08P9Xgh2lz5AE2aClEMcWY/cM92rKu
	 La0VwOEuEHpUAEIXOCxfF1M0fDqG8q6oxqTO88zBeQA6sA9YbG0a33Q4C0X0/KkD+Q
	 HGtdpYGwQcpHL7pgY9vSxE3WDH3matmK+3+ZgsPvkkH5xvT98ESWxPv56NTuWJ4RW3
	 wcFUUChiVBCjH8xMHdv5XM5+1XSXUxLqFQt+Mp+DZuJEh40HtTq6kMQLQ4+lWLfnR9
	 pHA4mVxgs81Nw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dnRFW53hPz4wB9;
	Fri, 09 Jan 2026 13:54:39 +1100 (AEDT)
Date: Fri, 9 Jan 2026 13:54:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20260109135438.5b4f463d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mDxmUqvf2iZgZ9AThVLE2Y8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mDxmUqvf2iZgZ9AThVLE2Y8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: drivers/gpu/drm/drm_gpuvm.c:1855 expecting prototype for drm_gpuvm=
_bo_obtain(). Prototype was for drm_gpuvm_bo_obtain_locked() instead

Introduced by commit

  9bf4ca1e699c ("drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged =
mode")

--=20
Cheers,
Stephen Rothwell

--Sig_/mDxmUqvf2iZgZ9AThVLE2Y8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlgbe4ACgkQAVBC80lX
0GxRCQf/RpLd4QJWZVnvm+HkrQVRJz8d48jf/FX/hvntp4APfJ+h+79JjAqivIIb
XyUfbofgja38tmx5ZraDm7n+68g1LxAnZ6PbDCy8OTKcxH/3SgSL0a5vRgRxoWkd
Ty5qJn/ORsuK/CKXeSvMiJMcRyIGMOqlUKD0xP4yEZWlY2WEtcrwZpOTRGT0rHoR
RMNT6TD6Rl4Vg2XB5vzSSTqeJzoaF64N3lERWTjjSK0RCahMGbuuaLRqhOvtzyvF
/xlnmGrzVRJ08H5HJBPHK5Yol3ISRgwnCZyA0bzKLNznBJAbne3qLa+vY8EU2Idb
+WwNygq4s3F7GTPbhp8eHiUXNO1HzA==
=rh/0
-----END PGP SIGNATURE-----

--Sig_/mDxmUqvf2iZgZ9AThVLE2Y8--

