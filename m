Return-Path: <linux-next+bounces-5713-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E50F4A5B66C
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 03:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F2837A74B2
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 02:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682AC1E2307;
	Tue, 11 Mar 2025 02:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GJOH5+2l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14373FD1;
	Tue, 11 Mar 2025 02:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741658695; cv=none; b=sXlYh0E6w7GsVontdiKljQDRsRnE74CE9jT8Lmq1F7FoW251teZ1MOZmFVKQZOukI2fXlzw1bWRmQkawTwEKtR9L9xndCPcow+b+xfG0dL/3bjaeo+os+XwEXHgT0Juns3HwFtSx1xfpjnh3kIp0OUbxYG0YwXKmxvlJPxiSNFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741658695; c=relaxed/simple;
	bh=VHMrKqhpYUmRanfgiEYjl4Dpa9ZGizbuJ2E9zZatBEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lY8A3HnWErCN0+BpFr81RmFWQpovIW/It6+p1Jws1NQLGQhkhOZpzPh4OVF6rbZzqcx72F6AFiT8a/oNWdnI8KR7R3KikKqkuh1qJoE8/gOoXUQhydtm3Yfna/mPtISJrHECfsIcdi8lHa+HBUFGEkd2mrOSMXn/EDNU0yKiSeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GJOH5+2l; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741658688;
	bh=53y+lO1WpbMGCgaxDUAvybBmVxTmGb+/kXbwt+Wj+Vk=;
	h=Date:From:To:Cc:Subject:From;
	b=GJOH5+2l1mKlsSU3ovhdYk9E70/dBalkUOIEGPx3lv/j2cTsmNHgG5rAXSBznrhDS
	 ib2iU9evvg4xuknksQmrEO1kV9E7c6eXcF4HYwZHZS44DcEg2Jw+pzPLKH0MlHJFtS
	 gWYzMtxNSfx8ycXA//qbPiC5XpOCPRLONIT2HdeuV7X1atm2BzCYNvFm2ZKB6Wx9Pm
	 FmbvgBaQ+oXuAQC8YZtqfmLSX0cNe9BvO6byJFBLflfv32ZlDIfQ7E06M3SEwu6jb1
	 X6eZqbO5tNgSy1I+88q74Nb8IkD7wLF0+ndVOb6KuzzpwGWHD4rZy2mbU27Cx66q79
	 HCF6a7mrEHpWw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBcXG2vDTz4wcw;
	Tue, 11 Mar 2025 13:04:46 +1100 (AEDT)
Date: Tue, 11 Mar 2025 13:04:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250311130444.0baf2349@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xah6Fz0YMHfx9/W.cfM2V.P";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xah6Fz0YMHfx9/W.cfM2V.P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  01aa72784e50 ("Bluetooth: SCO: fix sco_conn refcounting on sco_conn_ready=
")
  8da76b2ac810 ("Revert "Bluetooth: hci_core: Fix sleeping function called =
from invalid context"")
  c01c0d443bcd ("Bluetooth: btusb: Configure altsetting for HCI_USER_CHANNE=
L")
  c7c65369f5a3 ("Bluetooth: hci_event: Fix enabling passive scanning")

--=20
Cheers,
Stephen Rothwell

--Sig_/Xah6Fz0YMHfx9/W.cfM2V.P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPmjwACgkQAVBC80lX
0GxK4gf/aF/kTXC5O+8SZutLdatEAYMaJWUSECGcZlmLOHvwVmhADNY7qe6EDPOd
BgCaanmwm64JNV5nNu7r/orlgNul33bhSBpqusoW/D0Io2Ucd4e9QPKTRVJL+XrM
fTXAyFdtdNj3W9iZ/53C47RZNuQOPryvWIKO/K9VfXa6fcpC8CrGZ/diD/3/UGyo
ixbozTAyydXc+1sLuivRubr7NWGaRSVz4hDrqCqPOrWP553mdreMaJH+tn5fOC6V
AQzwD7PgQ4Fveuu1HnDcVFpQr6uqvd1obXP2HCIWH24iPqHR0oxMdiPVHAqi3LOa
uo8lTH57R/pwTsBGxPYuG3oy7jRijg==
=12wp
-----END PGP SIGNATURE-----

--Sig_/Xah6Fz0YMHfx9/W.cfM2V.P--

