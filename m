Return-Path: <linux-next+bounces-3435-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F386495FE3F
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 03:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31F641C21A83
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 01:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948974C83;
	Tue, 27 Aug 2024 01:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="azjP73Th"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50724C8D7;
	Tue, 27 Aug 2024 01:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724722058; cv=none; b=SoUEx7ewS2+m88jzGcwI35iuhFdfc5ixsCk+sFVwLJ5JyIfLHpYXf7LRe7Ec8aqlpWACOmlfJnZ2I24RkT+QU2hYPv7AGUQ6FLVc6DSZ4uDPf1N56SvyAOQL5903XtyM5yPKU6Cn+yvn5Aw1AQCtpOypH9tHqa3SyyT8Yu+0KvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724722058; c=relaxed/simple;
	bh=2HfsTuO4EjdMHYcVYRhIa6erVNqVZZtnlUFRv3PKkE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=alMV4EEy+kVIwcEIEm1aIfN3RzouwcfM6kzDoGQYTtRSzk6DR4ap+sHwwqDHWjIL+qyNKzlDbMMyDEIwMPhJkMebmkpCICq2Sz6juhajk3V5q9LcmaR4qcHyAT+iLzn7jBSM0IWKJupWh2mkXBZsj0JJAojvq6r4Z/7yAI0H/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=azjP73Th; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724722054;
	bh=GxwmqqBGuUCy12ralveGFNVRccgdB1AfwyCMHGMx1J8=;
	h=Date:From:To:Cc:Subject:From;
	b=azjP73Th2Qif2TNnQZaxxvVfXo+2d3DSX4nccff4f0Jt9w+AON6NyQGwkFnZ5HqPx
	 13vtOqurZAtQkCVqsiaD+577WxcGqAbhgKcQC/aV3dbk8WVPbkTl7PqdhFRETdyPJZ
	 39EoIEvDRPhJ966fCkSn/VBZH/2Anu8HdcRtYNwxW7mzykEW9GGGOxjxzPFiCYPKmQ
	 nPpD9bVvuADU48LcxPDPZlONXB5gpJl4IQtRxLrGbKGUwk6hi3MVSDfYwlGSOHdIDI
	 a0MLx2AKFYkfJyWh4DWFLAWWmawRBKbJDSrJsNrAWsq0TwVQDTXlugAn05UQemNTu2
	 /XnLoeplYq+TQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wt8zn5NQhz4w2F;
	Tue, 27 Aug 2024 11:27:33 +1000 (AEST)
Date: Tue, 27 Aug 2024 11:27:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20240827112732.534c3ce0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xv61S.TvQOl4ajtM87MXSdD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xv61S.TvQOl4ajtM87MXSdD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  7567b7da175b ("Bluetooth: btintel: Allow configuring drive strength of BR=
I")
  9f5a21d9963d ("Bluetooth: btnxpuart: Fix random crash seen while removing=
 dri
  1594ee3e104f ("Bluetooth: hci_core: Fix not handling hibernation actions")

These are commits

  eb9e749c0182 ("Bluetooth: btintel: Allow configuring drive strength of BR=
I")
  35237475384a ("Bluetooth: btnxpuart: Fix random crash seen while removing=
 driver")
  18b3256db76b ("Bluetooth: hci_core: Fix not handling hibernation actions")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Xv61S.TvQOl4ajtM87MXSdD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbNK4QACgkQAVBC80lX
0GwdDQf/bZE+TGa9KxejtTvCpRPXY5BkGl0iE1zu2+lEil88olROMj/DOS4CGMHm
zDmJY5HjUTOubMwLv8yUZ4QguXUltQpEP1BgQjgG4Xphv107EkBl7YlHBokWuiqv
FGRYEKF1D3g00h8g9SCbOdDbAZXY6mIh7wczrtIEVvg3uUeIrlDi+hD8zkf8L9GC
+rhuV0mtPNBucVtwKAbZsWkAf/+acUFnheFyypEHp8zj4oDqa/hyVzEeMPdzV/X6
vYmWU+21+nYeH26pZMtQlptMf/FCAePABzpGdehNwPeHI+UHLprjYJh3V1bHYCLD
XneTgjbsEIUIzooGj69avWPGVXKmqw==
=I4au
-----END PGP SIGNATURE-----

--Sig_/Xv61S.TvQOl4ajtM87MXSdD--

