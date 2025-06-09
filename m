Return-Path: <linux-next+bounces-7108-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF793AD293C
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 00:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A19C43AC6A5
	for <lists+linux-next@lfdr.de>; Mon,  9 Jun 2025 22:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663502248AA;
	Mon,  9 Jun 2025 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bjjGJGQb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E12940D;
	Mon,  9 Jun 2025 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507302; cv=none; b=k5tkYWSmLnrnsmRhKwjAnfW7Coh3LGsXBNmWaFSnSbGw2DKqPYuk/3fJugpoNxaGa5PtNxUnfNi1utKmGItPE5SWoD2kBTUAB3MnQT3IRVpbfOZmaD5E6hJuMuS5rJ/DZOfIbb+xMxuclGCROjfqm8c40CPeKcJ6dwf6NH9Vmjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507302; c=relaxed/simple;
	bh=3T0Ph9Y8Jofs/eMV0ilBx4FpMxvHvGyrtVQmBHzXlWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ILbfbcbeBMSFIQiAz4NSXKHpEWQ2EdtOKuLcxmCe3hAwSMsHP7BEsA1K9lMqAPtSKTx1xgFDWk2UH1NApaWKQw5WIeea+RnZkTcKhkP2Q4AjKEcBhzBuvDN4rBPCdGVGlngUuC94k9GbfOlLEGKQZYJ8nEsdJmniuNYCXCeBm/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bjjGJGQb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749507294;
	bh=3CWltzBAlEoHOZFaS1nfZT3ugYjf+e04I+Pc3sHf+WI=;
	h=Date:From:To:Cc:Subject:From;
	b=bjjGJGQbE8/C7MQE7Bdnd5jZLBNlpCFFQZ5EtmMK9ZIS/u0GfzVaA/gR7zvFmaGYG
	 YH3lCD8K/uYpsKvY8PeXW2swDRiVdmHOjQ8IgCqcbiYW8pdM1EftxOWTR+wSUROwsl
	 YKdaNgNC3UNUCQTnf1f57rrSJVoiEjYA5V5kuBPARi1XVpIyVkS42czBCCy2zjXVJ4
	 giD6xvj0P1hvlMZMhhNV4OFWLK+z1lQfzwP0n9bGK2VUzVWRMg8ik52LE+3+5QYKip
	 sG6b19LN3E0C4nDdAjqrr7ZJACrhA28WcPnmfIyVPsC3VMR9a2F+6RLs3nU/oVl4hs
	 YwilEebf6KoMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bGR715y22z4wbv;
	Tue, 10 Jun 2025 08:14:53 +1000 (AEST)
Date: Tue, 10 Jun 2025 08:14:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm-fixes tree
Message-ID: <20250610081441.5e799eb6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aardT+oN_HeWHEewNUrgdpZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aardT+oN_HeWHEewNUrgdpZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8a48e35becb2 ("drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate")

Fixes tag

  Fixes: a4ccc37693a2 ("drm/msm/dsi_pll_10nm: restore VCO rate during

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Looks like the fixes line was split over more than one line.  Please
avoid this.

--=20
Cheers,
Stephen Rothwell

--Sig_/aardT+oN_HeWHEewNUrgdpZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhHXNEACgkQAVBC80lX
0GyDLAf9HCSt6j6xzOzM2TrCO8ffMy5jOGuqkSdxSitrHOXaBPV4F9rMd+2mxTHm
f9WSoZUQ1Gz2DqNUodu4GZm4lVxgR3+KmC68w87IuHJ9PaBiCcIaKVOqxdS/viYb
QrjvVTsPv4AEx6p0vGq9L81yz8W3qcStjFwE9w+P8+6Rfi1J2KlC4XYWF4mjyuPZ
fciSYMazFqCeRvyicy5Txfj25pwCXc76wEx1A+C2iDZEKZzX0VVtcTESLFfNSzW/
enSqn0Wfi4hwHi1X4wFSNb7+8u3RkAxqCMpfCtC7JPjXtUlsbJHv64lBtnlvShNH
Ac8+UoZeDwBrDNogV1RTl8f5e8VL5w==
=WHtl
-----END PGP SIGNATURE-----

--Sig_/aardT+oN_HeWHEewNUrgdpZ--

