Return-Path: <linux-next+bounces-3894-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D9B97B4D3
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 22:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6C071C21A5F
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 20:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AEC188A25;
	Tue, 17 Sep 2024 20:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CTDzRSen"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2319B18BB84;
	Tue, 17 Sep 2024 20:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726605703; cv=none; b=fM8W9zM/0G6yOqPNF5g7v9l+qrRGBF0Tosmqzpcno7PcJrmvZ3CHtsUp1TBD3JQZOkDSTp98e/x8rBFQWPnlwW4hj9LRGAjY2jH/yJGv11GlqH9m+bnxDO7wmdHZb7loTAW2wLwRFugKVYaP4TWZi7vyo1Db+tCIODIk3lwQ2qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726605703; c=relaxed/simple;
	bh=fikUEvhA2F/DLT6CJRCulDPUDE0kxzIHWavaAKpyXtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KQ6PHtIB2m6SZLZue2c4h9aIRY1AguGE46mSU2yapiVvq3BQvj0iVbQurjFHUso4gNKpgcp3oaIKynBCTfWZ9FK9EXpYrAfPe2ghEPbCaFpUzfiv3Prl7V3fUsqQiBnLJiWv9MYIFASwXJN5CsuAgpawdslHF3asMyEYdNjjNY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CTDzRSen; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726605697;
	bh=6IB0O1MXHz7pszAWs32ApPlLk3Mgs2ti7s6sLJU9e+c=;
	h=Date:From:To:Cc:Subject:From;
	b=CTDzRSengN/hSYpvGxrfvUMzn8n29SjacgEHbuLTdsJeBtNg647nLwOmHpgvt3GAx
	 1rV8kyhhyXxTSJFBF1dZy6ET7UcwAXlMxe5lFitBhUlk8QBvUjwvQSAY0uz6c7SY28
	 bgXqJE3dQSlD8cLrSwe3+9P2kSQvKD/8oofn2uPGAYscnjWVO0yOfgc05QUVCqNAKw
	 mzZDAykcvg+bsg0YJSN4aHhpLfXoQFhjsi6odeWR5L+mhQHjmZMu3abjXRxPsjuVqA
	 GXrwFXap4XhKVAaGTE84dNC540+4iKCZhvJFTCL/RkZKu5r3iE1O+EvwoypbMk0/ln
	 LnE17cHqciYYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7Ybj13hBz4x8T;
	Wed, 18 Sep 2024 06:41:37 +1000 (AEST)
Date: Wed, 18 Sep 2024 06:41:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kbuild tree
Message-ID: <20240918064136.65e069ab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ucpvnLM_Qv4.JJwlmQPBGho";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ucpvnLM_Qv4.JJwlmQPBGho
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  c589902e95d4 ("kbuild: remove append operation on cmd_ld_ko_o")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/ucpvnLM_Qv4.JJwlmQPBGho
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbp6YAACgkQAVBC80lX
0GzRRQf/eCD1Cw4dX7mJb3otrqnQlNI0bPj9tOX5BxPLF6nkhPSTt42V3stQiTIM
B7kJfs9+2eWdAMhaSOHghk2r4Zf9sb8dbqZU/BuCfXtP/ApBMmMMR3CyPd3BxT/U
0nIxymyfKbHPnCh8vCdvsz4K1+Vk7km6xT+LkDRZKKRp/34LJvCWZ2vLg3xNjHqj
iz6oWTb6lwAhMv3jNv89LaQAV4DHz57sLDWudPNG1AseXIrJBBTZKL6GzRMrp9eA
yq6nM0eebonp8HgRe+zO22Zj26PalEcnQQkE/UktG71XwnYYi+btqNQlhYFkRlHC
3I8OYaOQcbiUbH3+35i3vKDZxfpACA==
=1EfH
-----END PGP SIGNATURE-----

--Sig_/ucpvnLM_Qv4.JJwlmQPBGho--

