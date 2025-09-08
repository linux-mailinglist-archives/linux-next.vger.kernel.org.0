Return-Path: <linux-next+bounces-8232-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F30FCB48A25
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 12:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14429188C7CC
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 10:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4D62F3617;
	Mon,  8 Sep 2025 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="grJ80zKJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5F5F510;
	Mon,  8 Sep 2025 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757327217; cv=none; b=V82jh/F7PV2GX/YvqMxk6JDlroFO9jgRlrpi92QoTetzv/878F9Hx17wBQoYk8A2iGOYr3fmyVEXWBQqXlybFU+sC6JhmGiNEMv9Yn3auy4wyROneKD79YQF5g3C+IHYLnRFP1zpuYDeUllHDjCcgQsm4D3NO6c8C1eW0OSW+XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757327217; c=relaxed/simple;
	bh=lpf52fJMJR1pzyvgTZREWw0t06tV178tuatUPfGkt6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mG5v/7QuIweQA32BIl4qNwfCtah+1zqgtoYroFdfNA5BPVodjioEXVigjWfSc9DHXlViTigjCp5CukAje+7F0bPHGEeF4tdm1qeSHZwVFXaTOB+chkeE0xvGiumFE2P4V5xpovHT16741FVnWtj2k+79/rEeE9AufyWfIAwCegQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=grJ80zKJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757327209;
	bh=V3fexJ1e2oYGtpvMW45bBpUdU+IxcGU9k71QSdZsUCI=;
	h=Date:From:To:Cc:Subject:From;
	b=grJ80zKJE+79U2Jc3GoYH0KXIoSHO+iPa/rF3iWc7OlHk4tu0UMH2yqKiLLYardzr
	 ZQio7MzyM1/E7mcYBFrZjyWtDa+EDdXvJvCqZGOYOarmKW+L1ZILcYexjUsatl8huU
	 VJfu25ghjH5YFeKnLfex5QkNQZf5Q1HZcZqFj5OAORWI5YZGR0MLLzW7hr8Eh/Aw9G
	 6OQzKBNS3eXgtzXNTSyfftCnG+43mr2F4PZ4LwD1Y/GaQFdEpsMSaNILFgGL02MUlg
	 Uznp0jZIMmtXD9/O/sBB26QsbHrf0c7/oheBlZdiNlE6zdPatLgbzblvJoHGsHqqKT
	 /2V+56pTBrIUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cL3615tBfz4w93;
	Mon,  8 Sep 2025 20:26:49 +1000 (AEST)
Date: Mon, 8 Sep 2025 20:26:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the v4l-dvb tree
Message-ID: <20250908202648.32e2a6b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WV8IIB.QRRekxFi4AffFiNq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WV8IIB.QRRekxFi4AffFiNq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  aae65812f5c3 ("gpu: drm: display: drm_dp_cec: update Hans' email address")
  8bebc6523f68 ("media: update Hans Verkuil's email address")
  454bcf2523aa ("media: include: update Hans Verkuil's email address")
  e1c7015d6093 ("Documentation: update Hans Verkuil's email address")
  740e74c74188 ("media: update Hans Verkuil's email address")
  6bc4f2381c03 ("media: v4l2-core: update Hans Verkuil's email address")
  afabad4d7621 ("Documentation: media: update Hans Verkuil's email address")
  2bf39bdda0b7 ("MAINTAINERS: update Hans Verkuil's email addresses")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/WV8IIB.QRRekxFi4AffFiNq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+r2gACgkQAVBC80lX
0GwtTgf+I5ohUTk/5BywAYSWobmEWlJgJW70oZUVR28Rb8RnH3HQGlAv+1xhQ0Q0
AZ9QLHEseJkwED/QocaybpOm9B6MURrJOsE3u5uhtGjnyRaA7A15klSOBLqvt+RD
VWEcdKgzv3sdYPeZOgqj0/wI/u33byvBnf0f06joUgdj4PvC+y518VqW7RteBfTL
9iboVmIPz2MgJDVX8BPy1mUR5HFSIfw5VHyLLRaY7Vs8v9TgHmMb0hbYXN5cG/Aj
qcdTMV3bNIwhqc0ThLRqK7x5f6OVwNHc45kIhqEtl71Y8dcqdWEJESuPxXKLaXyI
fDkmN9zq5mLCBLAyXvYqlp2Go4OAfQ==
=PmeM
-----END PGP SIGNATURE-----

--Sig_/WV8IIB.QRRekxFi4AffFiNq--

