Return-Path: <linux-next+bounces-7015-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB06ACBF06
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 06:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24F8F16FC52
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 04:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CB817A319;
	Tue,  3 Jun 2025 04:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Yk0eEXQL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACDB78C91;
	Tue,  3 Jun 2025 04:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748923353; cv=none; b=lc0vHevCzFskcmqcQc6YOffZtr5kpm8aTx63weNamYiAbbwhg3Yxx1+TuBCeQxolrlhKgnI50l1HCf44Oa6yI7W4fzeVjwiIm1wcPKpFDi18zEZm6MOM1heaKZP9QQFL+NqUcP3rrtZ4lqPoU5tQMykf1NKU+IyWG2TYsJMSbWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748923353; c=relaxed/simple;
	bh=8wtqj87pK4TUaKkyg3gX/q+LmyRidkRREKbbJzfSO2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fd6R25X8w7WSC6g11+3Wc/EBKz4CsvXUVdToeJDZcTpe5sN/milnuce5vPnPmMp395RPks8+VpNtcNoiR85eYxNa4RvZCvprRPgJzsswf2DrSz7jqtyfrb9fqYIdzOUDQf14082ZTWz1OFCGTrgBpJT+eE14MsWXGhU8ufKYV1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Yk0eEXQL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748923348;
	bh=iNRJprdEXnpmhBp7VXMM3qE8P2t0SxPIXVcfOU/81WE=;
	h=Date:From:To:Cc:Subject:From;
	b=Yk0eEXQLd9QeolHLfpBV5jf1dWUkQqMnXL2WZWbDEJ1HHFwZzjeP4qg7Lcn4lVxB6
	 Cg0Yz/ArwgAYfKA6TxPMCUACY1QntKGiJJhJfV8KlqxyBLyF7d+5awSPBssFpcX57l
	 aGw4f7bCneil5udOIAOwhpxnqMLaNrlanU988+kLDulM5WjysKzWPmmHch0g/7rM7X
	 kHQtdLN4mWId7L1w/OKBQnpnfV5upi3jUQWaDQfRtVDvDBDjMUC/SW5X13fST9T71F
	 bkqGaCzDh1PWaTl5e/AgGeurK6muGpCI/BAVATlrbPSdqncQFoh5ACSi7JraOnFZfj
	 615RXvWH7czjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBH9H0PJ4z4xc7;
	Tue,  3 Jun 2025 14:02:26 +1000 (AEST)
Date: Tue, 3 Jun 2025 14:02:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250603140226.796352c5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lC.IL81GQF8XA_q+l_xRBPb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lC.IL81GQF8XA_q+l_xRBPb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  a731614b3044 ("Bluetooth: L2CAP: Fix not responding with L2CAP_CR_LE_ENCR=
YPTION")
  8df2c74d466c ("Bluetooth: hci_qca: move the SoC type check to the right p=
lace")
  4e221e2b5ee0 ("Bluetooth: btnxpuart: Fix missing devm_request_irq() retur=
n value check")
  2ab3abab237b ("Bluetooth: MGMT: reject malformed HCI_CMD_SYNC commands")

These are commits

  03dba9cea72f ("Bluetooth: L2CAP: Fix not responding with L2CAP_CR_LE_ENCR=
YPTION")
  0fb410c914eb ("Bluetooth: hci_qca: move the SoC type check to the right p=
lace")
  edc14f2adc64 ("Bluetooth: btnxpuart: Fix missing devm_request_irq() retur=
n value check")
  03f1700b9b4d ("Bluetooth: MGMT: reject malformed HCI_CMD_SYNC commands")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/lC.IL81GQF8XA_q+l_xRBPb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg+c9IACgkQAVBC80lX
0GxkkAf/YLTifI9802jD9mRdVvuuf5r+k5q3+a9Wj7sZnOvsPQ8mrrJY+GfQKTVD
Imlrd+P3RbuPqgDXO9wVCz9dMG6B1WBPw8cVafWNS+RlmjKnqM5iNwU6TmRianNH
+7GWA95TKfAFE04E4FwHMq6a/hex0Ui7JU6qRwjqIinNpAd7eZx2C/mtp61pYMh7
w4CTAf7yVsL/U7mcaF4T80hwnxahKBSJXmGTxJooe7nk6cpUh22r+5/dxKeoWTs5
DhASrS1xTVLCuvboGlYhbSW3wSrBw8eqkaaDcsTWHUjezcOBxcRorcagaJGdCAga
wXSSYQ97ovI9yEnAbVRGf0sR/QGZwg==
=3ZVC
-----END PGP SIGNATURE-----

--Sig_/lC.IL81GQF8XA_q+l_xRBPb--

