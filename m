Return-Path: <linux-next+bounces-3868-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B2E979AE4
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 08:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACA99B21102
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 06:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BD81CF93;
	Mon, 16 Sep 2024 06:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pqDDzcaK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB6918B04;
	Mon, 16 Sep 2024 06:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726466495; cv=none; b=OuRHSYQuztTDImVMs+FgpsTG9VCjkeB4gmOk77UnEgIqgkmqlrOsMfrTVE0NPhqjJsEOWQV+zquqgxB9mJG5w/n8F+4H+DXUrS1FQI5DzbAw0zDaOnIX6VlqVpFI7lUtxF04ox9rEdnCbsBZj6OoRsI99t4MIPHBb8N6mPr4Vg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726466495; c=relaxed/simple;
	bh=Y4GvHhf86OFrSs81sLChY0IrxUL5iCbPlr4+IxgPiCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PhMRbgyhtXljQWGiSxrQr7oICqYVsL7eb1xc0JarPYUi2Lqy74o7wCP8aqtqrj8VPRAW65VD7Xll8mhv2+xhVur76h/X9tpd/kaxXD823h9SypJNoXyg0SFDnhCQn7oP4cR5C5SFIsNbMGYmwFgdV3TnGHIEUDMQ6C4O3Ur8VxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pqDDzcaK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726466488;
	bh=FcbpB6/6aFomwqP/LdNGDDMD1VP/Afvv11raDHsoNHg=;
	h=Date:From:To:Cc:Subject:From;
	b=pqDDzcaKnulcvvOXyl0p+h3jSadLupF2KZVL+CEgpWPc+AkCkMRXq12ctFZxvrI+E
	 QxqWbvaKFVIwI/DYUxEfj3hq3xH5qqQHbBvCBJuF5Ioupj7G5i3BHXUO6aCzfUQ860
	 hDPqX9VPdb/1VnOGq100vB6upP4/+fo+tH6xW+ye8n0jnPvhXUCvL496xj6CIbxsJW
	 wYAD3KLS+LH/O32+YekBavUJRxQHoICBrBazyAwN8u16hkir0QjrFdfhvqqk66XmPm
	 /csIucuUC4Bd/AEwqmRbcP8t1Vi1F/kQDLoH4PJUOXhivnnQgpS4ua5RWExie8IYEG
	 HfohHqErn0Ngw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6Z6b6hRQz4x8f;
	Mon, 16 Sep 2024 16:01:27 +1000 (AEST)
Date: Mon, 16 Sep 2024 16:01:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@iguana.be>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the devicetree tree
Message-ID: <20240916160127.60a93bdf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i7RQrKtlJ8zwy7np=fPHiEQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i7RQrKtlJ8zwy7np=fPHiEQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the watchdog tree as a different commit
(but the same patch):

  0a543ac529fe ("dt-bindings: watchdog: qcom-wdt: document support on SA825=
5p")

This is commit

  f051e2e409d6 ("dt-bindings: watchdog: qcom-wdt: document support on SA825=
5p")

in the watchdog tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/i7RQrKtlJ8zwy7np=fPHiEQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbnybcACgkQAVBC80lX
0GwhrAf+LnjPYezZHU0iNVMoW3ljkjp31e9ghS2oiHJ9EyVffRs/NEhmEFzavt7W
ELkuun49c7MKsvZqzFmyil2QfE0hmEPQ1s4KVM8mwxf1PmoaAwiQdhLefQN/42MP
JB4IA8zO2CrvFXU/tSUH7OTyNft2Z7qxcYJFIIIcmmobyhC3YyWb2YTL8uZlhpS8
Z4qDrpzMf7dayFZ5TO3vDdklEsoiLVHaGTf19zAydJ+jnPywhWppGVUxa13w/bbR
vFX9OBeydwdii2yx+K3lvWny4LFkKzinRXtDj7xiluoCcsBD4nTR/pIl86kPpWRC
tVS8YnW8ZYw2esWVF1iylo9bQKOAMA==
=bElg
-----END PGP SIGNATURE-----

--Sig_/i7RQrKtlJ8zwy7np=fPHiEQ--

