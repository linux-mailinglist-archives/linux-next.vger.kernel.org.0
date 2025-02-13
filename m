Return-Path: <linux-next+bounces-5440-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15999A350EB
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 23:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA20A16CE9E
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 22:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E1520D50E;
	Thu, 13 Feb 2025 22:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M3uOm+lX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA21714B7;
	Thu, 13 Feb 2025 22:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739484460; cv=none; b=kdGoOJlGirrrW0nloeGlAzv1e4dDVGZM9itjaed6oz69v6ez7YEsYBc/GialBLS5+1tv1ax1Bt0U9xn5pYkgE6uc3mkRDiQnv+NGapoRTH9GZe7SOAXB1qccUsLqw+oUQ+DDBry3MJDYP2MkNaSj3HEMzMaYx/eQ33wJfN7VBWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739484460; c=relaxed/simple;
	bh=rR+PIPrrevgZsMne4OXF17fZy7PN9nS9mfmCS7vjRe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BlpOwY4wnC6gCryZbupcyynV0M//90NxvsA1mTCuxzPXD3uuiFYMh2R2m8xCA3PF9xPBRzj/EOoD3mUjXx9rQBIKWKLa6/W0v3gsDdC11LWWc1c8hOavjm1IeC6jEU4k2uba8Zzm8blXTQe2iISQC3+w3nDSmbWAHWn2miRC2j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M3uOm+lX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739484448;
	bh=4EPYD/tsiZSSWO1CeLxlz8p0D/Nu6FBQx0Nm4r6j93c=;
	h=Date:From:To:Cc:Subject:From;
	b=M3uOm+lXSbwqYcADCJMThHyozmfnqoJsVXkuwtZpvtosDsZR62KiLqzuZVFYgC3Kl
	 B+KqRrFDJJO7gs/UaC20t7f4hoXRNRf4L7mOybtp5cp7OoG7X0pq1tdvjOVaNcRgjX
	 AFh12GbaS+Vb0hQ6vbNTj5H4PPouVhHg1eEV9kKPMg7G5wl9xdu0ypigsGMHvyOqod
	 q8O59kjccVOZ6Uo44vUeNydEPqZB3nRrHhx/tadWTZx+qHfWk9ZKhoLAdOtMgc6BKU
	 huAyGt/eVG83/UY33rIGNpePwq48m/1V9HwjhurKpmlpvOrhM1DzkOxjD9EEXf8/SU
	 t4bIjYUEn6IVA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yv8S01w73z4wcm;
	Fri, 14 Feb 2025 09:07:28 +1100 (AEDT)
Date: Fri, 14 Feb 2025 09:07:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Dorian Cruveiller <doriancruveiller@gmail.com>, Luiz Augusto von Dentz
 <luiz.von.dentz@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bluetooth tree
Message-ID: <20250214090727.518fd7a5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n.aW7=RYRJFW_.ridA=aWwY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/n.aW7=RYRJFW_.ridA=aWwY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  289a0dc9d7f9 ("Bluetooth: btusb: Add new VID/PID for WCN785x")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/n.aW7=RYRJFW_.ridA=aWwY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeubR8ACgkQAVBC80lX
0GwgmAgApWhaH6E2iz0PwRpZE4A3nYccytweX/ncrAoMcYWOPPZYjVZCENGwjinD
7KbW/6prBCAWRzBaWK3NoXbLMaMnYMF/fghGnFquxi4wIOfhkGM8lUFQ/B3IS/5f
3QTZdGXFOVo5IjexIV29B0Ei7wpeGgFlpchQV+NoBst8IDoKKk0/MYHZvgfd1/oC
r2c4iVyGFIyndfL30awZ3+tQeEddqZf+p6o9Sq5+1vbYUqqBICR+2T1euGtrIxIa
eSsfxsG5ICdlo9EO5DgWPDHjh8X4/S/Dkc1B1jeIRo/qxZyByld3O3NuuSyY6/Hm
nRYb4R42DSe4U04yOGZxyX114+pNhw==
=0kaV
-----END PGP SIGNATURE-----

--Sig_/n.aW7=RYRJFW_.ridA=aWwY--

