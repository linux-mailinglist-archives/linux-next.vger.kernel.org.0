Return-Path: <linux-next+bounces-7392-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1124AFC1BD
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 06:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AECB4206FF
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 04:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8ED8217719;
	Tue,  8 Jul 2025 04:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cJDJajZ6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1F421767A;
	Tue,  8 Jul 2025 04:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751949859; cv=none; b=dArIWP2RYRP75U8w7pn1lCOtyuUbYzLMvCr+pmnxayxKONgkBnYXfjICt54dvGtvmVL9ZDna95qEs4KIdIzSSliaOSPiR2cKd2DemOBxoBzHNE9qirYQQWesmJs0oTyVQfUbMKnllrW9Gx4AAe8AEEdPtXTu0X08Zcof2G9THQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751949859; c=relaxed/simple;
	bh=Tmj2WWxQ1vLCYPkk03e2pP/Oq0gUuCmP7E/ZT4hBsV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hfXA/lnEfTtRifMvaSJm9fwGfBabOhwZvWOzUsm5mrLz+rAO3erxyOzkgjLIeovyCa6mNfl70Qazdi+sEX7uNG0FF87Dw+24uLbEN2oAMFi3rCRshc4uUdy1t0FMZeU9Uy/oNBy1qon8fpsdl7pY3d2MXoK6lTSMfZwHQF7xbAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cJDJajZ6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751949794;
	bh=Tmj2WWxQ1vLCYPkk03e2pP/Oq0gUuCmP7E/ZT4hBsV8=;
	h=Date:From:To:Cc:Subject:From;
	b=cJDJajZ6m795XCabOd6Xq6w6DfzlBOKrlEAkayO/ll2otaFZ2ySOLMZGaF8d9txfb
	 ID626gvdZn7l9eTEX4/FUyJIUpv9UdVavF3ZBCav9CyO0cNiLS6yQMvCrtjNDg7FXN
	 9k7G1D+nT4v8U7oDiOwVhbeYbs3Tf79MJssYc/7/rYP3mqzwOejwlWxOifzj4adVyY
	 kkqRLzdGn/9g6vvrthNu01+q+1mFIBogSqim4nAPqaetJ5pENvNHaJ56FLSQbK2u3F
	 bin+/fg7zEEXr8Yte35/nSWxgHjy7ApIvlgvUwfp20FAjXUPozLD+6vV+vZAfMtMjL
	 GEE9UDn3PQGOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbpQ96Y30z4w2Q;
	Tue,  8 Jul 2025 14:43:13 +1000 (AEST)
Date: Tue, 8 Jul 2025 14:44:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-msm tree
Message-ID: <20250708144409.73aec136@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k9EdxbP1gNVwKzP0oYfQ3+8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/k9EdxbP1gNVwKzP0oYfQ3+8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-msm tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x43c: sib=
ling call from callable instruction with modified stack frame

I don't know what introduced this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/k9EdxbP1gNVwKzP0oYfQ3+8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhsohkACgkQAVBC80lX
0GzpOAf/Q/McXSnqBtbg1M0Iahrt4LVMCKnPvL3iQtOnc5zN1fyISJi2QikvCZnl
Uw6uMI02RQNTxSB9piHHQeXWACTLtzUvCIERCPoVeX8EKiqt8GlXJeujL2fXnW8t
KyuxwKeeIgs+Zjh0EimEAxrJVl1u/wJAmCCdEGrvUwTED7aA/u1tGZhBYWB6f2H5
1CuuT48lfKZNypz1RBHDeu/C9vm+SoAegxmSg7VU2L0cHmiVQDWzBfLiqoyM31Pz
CHkpdGZapC+MDMIfkCVepbC7UBFY1pI5Hr/6fOrF2n+sjl6JWQ6yiHea6Oj378vC
yudT1hrK85/lsni3sBiEtLWQZt1zMg==
=BtR+
-----END PGP SIGNATURE-----

--Sig_/k9EdxbP1gNVwKzP0oYfQ3+8--

