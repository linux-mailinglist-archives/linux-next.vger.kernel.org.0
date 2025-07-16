Return-Path: <linux-next+bounces-7575-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE86B07372
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 12:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4A6C1C25104
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 10:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E817262D;
	Wed, 16 Jul 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qt1azQGH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777AA194A60;
	Wed, 16 Jul 2025 10:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661881; cv=none; b=hcqXkOR0XCp8N/nTOI82t6Zg4c3CDILbud7ykLnXmUQU23F9LimzM/tpFltLVN+cD9jHUmfqpjlfIZV6g4lVuM8mS6KVVs2Cm9AgFaXsI3y5FhZBFhbbxB0IUmX6+bJWdM/8TFAVic5mgOB+h0DzKyIedjAHE3Sol3SfhC/b3/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661881; c=relaxed/simple;
	bh=7HichYSLdssFx4/h5uorSTGusxNlOgcsdcKDCeWJGkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HFbjaw5PkHCSA8z3yvBTmm5TFUElZsux4eFoNOd9sSUQsJEmoUvcOl1pVulDxgq5Bt6oPEBmAzAl5GgaDHxqR097JJRp5Uf+BdnfOuZnyiufXHFSdmRRQZ5SVp/fRD46KG8T3hG/GzgDZ/VfRI4pr/DszEVq6oX07qLkF1FB5nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qt1azQGH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752661760;
	bh=YM5CD0wi9sXVlQrwReajd16Ogn8j5KZtBYTgVnrYdMc=;
	h=Date:From:To:Cc:Subject:From;
	b=qt1azQGHh0kTgPw2jZGT9ilbFZrb3b0Te1MdqZUbcTakVor0xMw55MvAc1HdGDsFO
	 TF37qoiYms7nUa6mrtz7JBJjwfz3t+UwPemwQe+defX4qTD5i/FvjVX1zXKGS9YS/m
	 X5LaVf1+1Zt3nRSCTQKR4gCbdVAcfQA4dWOqXQbFuR93Q91KaxaqitAqu9t6zZiuzm
	 +JqSAkv8hUn2AzOx56zdcskq63SC73NhHIqUDaB9kuz+BF/VCCenh+vyPI4BpHuvSH
	 xF3wdX5Fb9TUp5QlvAzfcQhWy74y06ZGpsbINV0uCuL0WNpkOI7CgysjZ9i8o/36Y1
	 NfmlYdW+XD1Yw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhsjq4ZQWz4x4v;
	Wed, 16 Jul 2025 20:29:19 +1000 (AEST)
Date: Wed, 16 Jul 2025 20:31:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250716203115.6e02e50c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b9i2EU98fNzWaJSltlNFa/h";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/b9i2EU98fNzWaJSltlNFa/h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/drm_bridge.c:1242: warning: Function parameter or struct me=
mber 'connector' not described in 'drm_bridge_detect'

Introduced by commit

  5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")

--=20
Cheers,
Stephen Rothwell

--Sig_/b9i2EU98fNzWaJSltlNFa/h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3f3MACgkQAVBC80lX
0GzJOQgAmpCq0YSRtNRb6Khe7E2WiPGc+ZxCfaVMDF6aBuTPhb4+A+FFEGHJdJbJ
7oPeiAhjpMAtE8nr+BprQibAu0n32wWfmypP0oA1Z4fyCe1T97OgNUfFnpM2cowD
KboyF/4H8NBV1fD8RDv+ISh7D/d2szo88SmOeYQASxntWgmx1kTNIP1dKkxK1YGM
VE+FoRtz1J5sHIKnsuNznPV06I6xlY0zHZylqdI7lmkdXN/6Ha8BJ7bu7lMvn90C
LOy2SgejWdVZFxUKnScONm5ke/5ifOmxhZ1YH2D5uXb/VdlfQMOqDA/Reuff7Vdv
Hic5HWcCy0iTmyzgqjVvr5sp6OeUxg==
=hdR0
-----END PGP SIGNATURE-----

--Sig_/b9i2EU98fNzWaJSltlNFa/h--

