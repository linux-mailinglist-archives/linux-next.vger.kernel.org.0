Return-Path: <linux-next+bounces-8665-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4CBF40A5
	for <lists+linux-next@lfdr.de>; Tue, 21 Oct 2025 01:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C6303BDF08
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 23:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0033A2F90DE;
	Mon, 20 Oct 2025 23:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dgCWgneC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCA72FB092;
	Mon, 20 Oct 2025 23:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761003543; cv=none; b=JrlnMYDVXi72GnjOsmZugWPnLuHPCERBJFTlT0DT3Sf892ujuUyQff498JbuFojF0bWqZknnBTw89mDbEFXcPHs785baRMr6PgyCHJMbP4Nk0w7U7BpUkpSegsdCVRQD+Gz43ONcf7SOwvpM7BXIhJyHM4ZLf0no3bckSTXz5n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761003543; c=relaxed/simple;
	bh=FSokUeqjc/iwEMKKtJogVUv9t7EJiG4zB0cctzN4zvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KNdN8cU/tcQUAoBFGYFWTKCFKQP2RhvpygxjNprCFNtEzJL16tvb35tvZaHQLeIwm7nbKdkdHWaQBKwy/ffTjOuTGj/DD0wTO+lMiSqp73ID0ubdX9Ly3dsl/S/Jqt2WBUvTd5DGXnptzdMZ+O1Lf7JaSFXC4zAR6/2ceBtahHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dgCWgneC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761003534;
	bh=MJ3Kim+T/lAPr4AboVMQVgBCuEyOdsjuOcCqGVwkQwM=;
	h=Date:From:To:Cc:Subject:From;
	b=dgCWgneCgOaSg4SvFxAxTjb+1DaxRCPBiOqqvavaelghbnbXwSDtyZFC7ZLtBI7KJ
	 m/PzdvZktTRIS/AUd3aPDkGj1CQ0Zh65SxiMIbToaUDqg5vYgKYMa0rrWgCeCsuhyf
	 KLrCClIReZFfJwLShN2WKe/ef9Lg4tuA1LPa9Ckedz0ihMEFPGz0O1bk+rf+HQzawG
	 Am1Vq6Vd7/ACIi+5gb2KpIC3kPxnT9NkVcqxX69B4Kjzaactwj9YRzn5/Lp8AY/OwT
	 8DQ3HOweYAB8FCGzhaltyzLborCWmjkWRrTWdH20TyFqP5kplqDnXYgPT8nw6cd8uh
	 6yVfQGAidelLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4crBhZ0m7cz4wB4;
	Tue, 21 Oct 2025 10:38:54 +1100 (AEDT)
Date: Tue, 21 Oct 2025 10:38:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Johannes
 Berg <johannes@sipsolutions.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the iwlwifi-next tree
Message-ID: <20251021103853.16dcf3a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/byCgwI6usLbmh2dU5D1/bfd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/byCgwI6usLbmh2dU5D1/bfd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the iwlwifi tree as different commits
(but the same patches):

  a4985dd902c2 ("wifi: iwlwifi: mld: add null check for kzalloc() in iwl_ml=
d_send_proto_offload()")
  1095511068a4 ("wifi: iwlwifi: mld: check for NULL pointer after kmalloc")
  a5480346148b ("wifi: iwlwifi: cfg: fix a few device names")
  9659a0e1be26 ("wifi: iwlwifi: mld: Move EMLSR prints to IWL_DL_EHT")
  dd8d3ed150cd ("wifi: iwlwifi: disable EHT if the device doesn't allow it")
  82a7623c2bd9 ("wifi: iwlwifi: bump core version for BZ/SC/DR")
  9f2e28c6dc9e ("wifi: iwlwifi: mld: use FW_CHECK on bad ROC notification")
  33b49b22cc6b ("wifi: iwlwifi: mvm/mld: report non-HT frames as 20 MHz")
  69bd1cc16155 ("wifi: iwlwifi: bump core version for BZ/SC/DR")
  51991a669bb2 ("wifi: iwlwifi: fix build when mvm/mld not configured")
  9719cbf7da94 ("wifi: iwlwifi: mld: check the validity of noa_len")
  b76d6dbecb14 ("wifi: iwlwifi: stop checking the firmware's error pointer")
  9c895cf74c4c ("wifi: iwlwifi: be more chatty when we fail to find a wifi7=
 device")

These ar commits

  2c2cac5db67b ("wifi: iwlwifi: mld: add null check for kzalloc() in iwl_ml=
d_send_proto_offload()")
  301412c78880 ("wifi: iwlwifi: mld: check for NULL pointer after kmalloc")
  eff45c2c7721 ("wifi: iwlwifi: cfg: fix a few device names")
  dadf65564f98 ("wifi: iwlwifi: mld: Move EMLSR prints to IWL_DL_EHT")
  f0da0070bcf6 ("wifi: iwlwifi: disable EHT if the device doesn't allow it")
  966841946697 ("wifi: iwlwifi: bump core version for BZ/SC/DR")
  e5a6ccd51e19 ("wifi: iwlwifi: mld: use FW_CHECK on bad ROC notification")
  bd6df14cad4f ("wifi: iwlwifi: mvm/mld: report non-HT frames as 20 MHz")
  09ecd7fd5f20 ("wifi: iwlwifi: bump core version for BZ/SC/DR")
  85d275c9b57f ("wifi: iwlwifi: fix build when mvm/mld not configured")
  47e98d2232a2 ("wifi: iwlwifi: mld: check the validity of noa_len")
  44ff9dc46bb8 ("wifi: iwlwifi: stop checking the firmware's error pointer")
  4b2626b5d61e ("wifi: iwlwifi: be more chatty when we fail to find a wifi7=
 device")

in the iwlwifi tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/byCgwI6usLbmh2dU5D1/bfd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj2yA0ACgkQAVBC80lX
0GxC2AgAlZ3C7VcgfbbAoaq4K7fatSt6MhXmw9GuWt0lrYAMUEf2CDvL+1YviSf/
sSsnmVkLm2N93c8exvboua3z8cAO3Q4HajACjhxxiEgYzHizfVCJCeRRcARVYMje
ni9DcCCUxP2/02fPhZADgsa0hUbPmQmtPbTUBl6ZrJRbT1C0gqD6NKiQr59GD4Na
yrEeTtffdtq9Ol6pS+WNDXCyjOtAE7WXhVqe9ZuM0PQUPpmXh0E2XLLZPn3vRpJ9
uypnbYRq2nrtRCiIHpxAUtjMTBB9Fi8A93y2dcJF66i5O24Pkc2AstOg8eobiJBA
aCRAKVJXrkeTKUSZKAF8JsD2Fq8pRA==
=AAdr
-----END PGP SIGNATURE-----

--Sig_/byCgwI6usLbmh2dU5D1/bfd--

