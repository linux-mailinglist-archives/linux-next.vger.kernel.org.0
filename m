Return-Path: <linux-next+bounces-2434-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC218D59DC
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 07:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5616AB21154
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 05:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4DD446D1;
	Fri, 31 May 2024 05:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cLhwqiY5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AD72595;
	Fri, 31 May 2024 05:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717133201; cv=none; b=j12wKKxuHqIBtqDnvB2mrzHYVkPpOe1EVoSa5iu4M/2UTFXYvkHD3oUwhWIB6HXbngl5MHvSpFDj9N0zAegfr/msxtnHl80/ZLsZ695KAktCG5tBmnenerf2ZrtkFxdCiHnam3Py7E4XfvjUhtltgLaHSLaTvjWZogOHQnN9+dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717133201; c=relaxed/simple;
	bh=YscxZCYLLDidxBBMmV88bjTXrJTpcqHkdjPKaE7Atcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JZu5upHz85mRvfZWJr2kYrmYa2YsiQM3LSlZQQEkZ/6Zsrp7RrAjN9Dm7AIRXFSDtyLZiECyQLPRweyVmmVkACFfdQ/U4zSqF5yQb7NR4aqI0SC6P/goxq4EYRPfNdBULta3WkN0N83KSetl8cT6tsWAypOKI7GkT1DwDAfePI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cLhwqiY5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717133197;
	bh=V8rlp/cSq87xmInN6Y0JSEeCQ1MbzZJjIocoMlFhpXA=;
	h=Date:From:To:Cc:Subject:From;
	b=cLhwqiY5FQPBk1JLP0piZww4SBQaq6x0BlTDRLPEVU2BlxBj+UU2BCfZbr/dyVe3O
	 qtzRx6qEFfFedt71QPLLP0NIX6KL3eTwJnvkLnyVLUGnhffPUmtKwtx+ySuxt5ppj9
	 7mZFKkZ4DQ7srjrFtoEwHNtcHbN8ejKVYQ5d96thC5d3NXDKlOFtveIAH2odyoaNfq
	 gmW7tjxq81klNJtE3dWdSuVmky4gQDD5Eb3qi77LePyBs+Od5rqXwRQskfFojk4Pjz
	 4ts8UAQabg9IhrngURSf+NhYFwRs3Pnq4kUypFEZzksI04/Qu+0wXNfcQFnRPeDiUA
	 feiuyKWPKM06Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VrBSF0DSYz4x1C;
	Fri, 31 May 2024 15:26:37 +1000 (AEST)
Date: Fri, 31 May 2024 15:26:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240531152636.1b58caa0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1aFX2qZuHvixQJo9YFQw9nP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1aFX2qZuHvixQJo9YFQw9nP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:586: warning: Function pa=
rameter or struct member 'bb_from_dmub' not described in 'amdgpu_display_ma=
nager'


Introduced by commit

  234e94555800 ("drm/amd/display: Enable copying of bounding box data from =
VBIOS DMUB")

--=20
Cheers,
Stephen Rothwell

--Sig_/1aFX2qZuHvixQJo9YFQw9nP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZZX4wACgkQAVBC80lX
0GwQ9gf+ItKVoe8/sCdc/3WKdDg38D3Orqm3wRvuiJ516LDUGu2vN069lYOgRwgk
p/28TWvjPDcSslxuTUZFA8ux0YuGLcS3R6gsHUESjZXxAtzjoU6a7l3YbooI0wZU
JVnDCp2xyTItxy+B5nFoWTGG5xp1cbi8+wFtNzgcxO0n0JOjr5ThAx1WLVjhjUJO
JXz1itVsw3Nf+NqK2FpIUsxw+TeWjVuYe2IpahnQjTDN7uTC61DL3ZpzIjvCMnOf
gLQV+IgELpzMirBjjsNC6jKAFPv8a1kgPLTqAcyv+lOw6x/RGS9xxFH6+cZ3cjWs
O5d4lrfvRu719zr/yjLynRJVt4Z9Uw==
=Ho9F
-----END PGP SIGNATURE-----

--Sig_/1aFX2qZuHvixQJo9YFQw9nP--

