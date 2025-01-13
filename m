Return-Path: <linux-next+bounces-5172-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8698BA0AE8E
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 05:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EF223A2FAC
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 04:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FACC170A0A;
	Mon, 13 Jan 2025 04:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ux+jOAXV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A7314885D;
	Mon, 13 Jan 2025 04:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736744068; cv=none; b=EMQGp3PlpHxbjnbBZkiy3U3RfAMFoxXtUy7K+Gg1NjOw2ua2qjI5svJSEgLPBsoQmkpBngLw+Yg7/Luai+1hwX6VLfbqMBmEyoJevHCV5jLsWO+jqe+LpSnXthJUN7V106xGjCiQw1pUj7uJTjs5dZw7WLrDkH/0Ks7o99zC0Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736744068; c=relaxed/simple;
	bh=k0bmeLqkWBWzQWaKLlu/J+M9RYen7Bwh8cwlTzXOV5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Lf/bySRP9cf/HDJAIUd9FIjMU1u5eSZ6/pHJ1cWJ8VpLk2R7P42rc7nOYvZ/VNl1Ol4IAy/aIFph3I02yshSML4hlruM6AIiuCInhP0+FMCrR/mLhV9lHAd0v/mJZitqNeLh9b9i4z6jdUVawfCx6AeZcNWMrNrTFDc7CCKt99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ux+jOAXV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736744057;
	bh=8Pe9dHu05Z1/5aoLPZIE7/oJwAEXwkpbKSl3TTeXzko=;
	h=Date:From:To:Cc:Subject:From;
	b=ux+jOAXVGI8lIYqCTKQMBtyZDoJI0yf9Kk33B18F1hOoK48TKtCIsK3qOpufDAQbp
	 ClrX2Ytwh0KM0bTRMM9mjgApJgKpk3/sBTuUAtwSeAJS+KyDMtaah1QxSQY8W/Iy9O
	 CoSljrzeTd2bPZMjks3Xam93Q6MuiaClRLRFnZcKbIiOJAX4EQnot3YpJgdy5X48Ms
	 JLhnxuRl370NljAJhK4/5F9M/tZEbCEAcjfMPhzqtbz5CEBkGsr6BP68UZQ3K7/gDv
	 rh/NBVZcekxTYlFs3LwrOI3gWEjNJMbCqrUEauz6EY9AX/pUsSX7eM2X+T+O8KIu0R
	 QSDmxqRdI6Ieg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWg090dTMz4wdF;
	Mon, 13 Jan 2025 15:54:17 +1100 (AEDT)
Date: Mon, 13 Jan 2025 15:54:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Kun Liu <Kun.Liu2@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250113155423.3be0e78a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m_sypzP36iM7bcbJF2_TRnI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/m_sypzP36iM7bcbJF2_TRnI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/include/amd_shared.h:352: warning: Enum value 'DC_DISAB=
LE_HDMI_CEC' not described in enum 'DC_DEBUG_MASK'

Introduced by commit

  7594874227e1 ("drm/amd/display: add CEC notifier to amdgpu driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/m_sypzP36iM7bcbJF2_TRnI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEnH8ACgkQAVBC80lX
0GxR/Qf+OQFQu/wETcW5F9VJRcqkrcweJz3svjoj0/D9ipc6FiDa8xoMTy75Er3T
7Tb4jMupwHIxNmDhtqpfZa30U0V1V0T61glZ3vmTlzkiah3ZrUeN4O5ozxP7Z3us
a+GaeR8I0dHQKiD9gHGr+tfXZoDgysggaKx0tpb6O7w/xvoieyfNOaRR/aLbUAho
16XFZ6cBCNBewOADJ9su8fC++eYJOoG7y0rZTbz25g4KVOUioLqlIFv0YszRytHE
VYpvSeNsRhFaqRKzCehm9a0BaxakW1mHSTif4jGJ546/xM/9FoKoTNHFMZKCDAV8
xB3LJa0dMd1H4vvTPhT2RKEqwH5l8A==
=AnP9
-----END PGP SIGNATURE-----

--Sig_/m_sypzP36iM7bcbJF2_TRnI--

