Return-Path: <linux-next+bounces-391-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A247481266F
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 05:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3D841C21513
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 04:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BBF6116;
	Thu, 14 Dec 2023 04:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jw09IomD"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE4D106;
	Wed, 13 Dec 2023 20:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702528153;
	bh=fSio+a5hsquQcmFGlgo3t3PTAmDJ0JhFaGUBOmHBkOg=;
	h=Date:From:To:Cc:Subject:From;
	b=jw09IomDoeIwO8NkRPDRjaVG1dSceWD9O5jN6C1uM73ZLDgWedWDrETl6bKiZgA6E
	 aWX6CjqUJtUeiJwjZzZSiI5EM6+OQs2dGCeIw6JHUYKZtTM8uGt6xtzpwy686LAsHY
	 4GBNll2Amn9JDwEXZ6cTPbqDn/c/YV4BRNvskQRWgKTr3N/fEjmICoSEQorTvxMQep
	 X6lu6xvYLxtJ6DmKOH5+t0Tl1ZGIMguxPx98lIP6ZIJj7eyz/Kjb/AJ0i+46Z0iYK+
	 buFhpStmxqYiXze4QrKbEcsrAjWF1eWsydVVC/KWvPNRAie6k2AlFsLI22CkJtsYR8
	 tEnjytqUicz8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SrKB03bMTz4wqN;
	Thu, 14 Dec 2023 15:29:12 +1100 (AEDT)
Date: Thu, 14 Dec 2023 15:29:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20231214152910.79669d55@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P_BLPKXO6mXYrOnn7/Xy=dZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P_BLPKXO6mXYrOnn7/Xy=dZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:666: warning: Exces=
s function parameter 'crtc_state' description in 'amdgpu_dm_verify_lut3d_si=
ze'
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:666: warning: Funct=
ion parameter or member 'plane_state' not described in 'amdgpu_dm_verify_lu=
t3d_size'

Introduced by commit

  aba8b76baabd ("drm/amd/display: add plane shaper LUT support")

--=20
Cheers,
Stephen Rothwell

--Sig_/P_BLPKXO6mXYrOnn7/Xy=dZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV6hJYACgkQAVBC80lX
0Gz65ggAkY5wM7ftzJDSboo2uOdckggzqOiwUFwq5MBhPPV2fny4SaOFIBp/fiqd
DUz8dsU8nLRaRFWDOSGIyBmETXDdqAc74JzCkda3bEiyABViyZydr3LytUJVheJg
o2j/MvOqUD275Y4E2EAekflFt6KpKGpcNUP+Q5YU9QlyIBk/aigCF48vwrFJnrkT
cLI80ooKwEDo11LjQrQ+2QpCPVUISJvk5nsIlP0nFIzres1WSwUnagtoZc9Ac0Ep
h/7fEMfIPVPvW+lpc27roPuXAbNjX7ymPDnOqUCgPckKRhUnoNZvGRVzF7ieNbZS
qU6gC8sjWL4Xkm/CIbxnX7n2gCql/A==
=Rma6
-----END PGP SIGNATURE-----

--Sig_/P_BLPKXO6mXYrOnn7/Xy=dZ--

