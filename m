Return-Path: <linux-next+bounces-6319-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F02A96608
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 12:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7390016C828
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 10:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6397A17A30D;
	Tue, 22 Apr 2025 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cBIKsacz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEA213B59B;
	Tue, 22 Apr 2025 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318025; cv=none; b=WG91tqKFV1c8R1XBI5zA7ferw+BWUaQx4HPq+YL/A9jX0ZCSP9ILJWbJd28hVjGLI0Z8bmJ/kQzLN0csgfXxsFKo8yDXbwlGdD5+ja0AnCCHT9mw09XD0jnHbkX3v03bJisdIsJpekL4DxjRe3kNOn/3DW6s/aP+fK28tCEsC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318025; c=relaxed/simple;
	bh=RQmHOPXhl+cT1Q7qQmz5urJeUX82pkpUae6vl1eCtD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A/N4Y/iO18UFzjcX8snusay4kwQJ4W0Reokm8K6fJTjDcEvV3/wm087FQhx3AFHe6pLprZdvZSK/vyBAtZKJnJ+yk6G9HoQQ6UmVAGOBt3OEXrhZvsbIs1PeS9y4uf6jfGCGlC6mXFAZoLB/zd85NMJ3QSmiWK1LDcc2+XfKwoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cBIKsacz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745318018;
	bh=BkEo3n+Opvw7/TrpdnLeOc0N1MM2AlzwF5qEPUIc3Vo=;
	h=Date:From:To:Cc:Subject:From;
	b=cBIKsaczhUy5WE4yckx30jWv7D9+gBELiI26kcnAYjazVzRIjQAFuc1fBmRZWkjiA
	 q2GrmFRcm6JfbPywk9X+dabLaCl2/0e3Oqs2HZoDgqDvS52E3k5BhL0aVg1L4y794C
	 QtE/UP0ftHFnxpOJFICPxW7TzAtP66FVV1VUL8RjiVE/xnKK5WdMvklGZLn0qThW8O
	 doF8UtEyhPNR+AWqrelyOvBAXVIbADEbvLyJM1Jdydoe7GukIt/kRTu9JyZ5afs+s9
	 tiroHArBTq/XUp9WQysdRXau2NesKDsnzvIEREl6j8efROE1c0dubX1B4T7pnEPxtk
	 mAuQSmxRSk80A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zhdr262ydz4wbr;
	Tue, 22 Apr 2025 20:33:38 +1000 (AEST)
Date: Tue, 22 Apr 2025 20:33:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Yihan Zhu <Yihan.Zhu@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250422203338.3ff1ce14@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pLuk+mNc049c71LOJZYoVKk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pLuk+mNc049c71LOJZYoVKk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1068 struct member 'mc=
m' not described in 'mpc_funcs'
WARNING: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1068 struct member 'rm=
cm' not described in 'mpc_funcs'

Introduced by commit

  652968d996d7 ("drm/amd/display: DCN42 RMCM and MCM 3DLUT support")

--=20
Cheers,
Stephen Rothwell

--Sig_/pLuk+mNc049c71LOJZYoVKk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHcIIACgkQAVBC80lX
0GyU4Qf9HcH7ui0rvZvy6V1pAIr52OJCa9srKR/B9BzPbwmw2azYfX2bPjqzBf1r
/l91SnFQiDHumWMQYZD6cE1U646c0FL5KmUQrSeW9pcE6FX4VC1HnyYRBIqoVAc1
+mzF8dF2ZjxrMwEsK+LD+3yqmOhE9KHJII2G7tZ5BYX9o0GsF1LcBXgehzfp3lvq
BwxoVIz4CE7fDLdp5nA+Go5uBPFu1E9K7yyJlaZXl3sFNIQG7SqRYxueQQeIYGry
XEI42+LvZvBgnRJaFHPJHATfjZEREqIpaWUSnvn2jq8GzF1RM02FJXg3j5qgTa7R
3BVgxQ97m0+C2d20HOD1z1VjOg7vZw==
=xOCo
-----END PGP SIGNATURE-----

--Sig_/pLuk+mNc049c71LOJZYoVKk--

