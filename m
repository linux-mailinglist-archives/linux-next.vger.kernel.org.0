Return-Path: <linux-next+bounces-3576-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC596AE8E
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 04:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B2C61C2138B
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 02:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E65538DD1;
	Wed,  4 Sep 2024 02:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UUp49BvW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886C7443D;
	Wed,  4 Sep 2024 02:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725416924; cv=none; b=aRxVdIDTAcvZpb9dnuqqHuEAA11z/5+wya/WqgJpt7qWKklP595uXdeYYKTmSRCHcUAmgsOdZ4nJHQlSdlMSrKckSMeTgF3oowXgvc5rQL6weFzKbC79f8ONfw6gcwOl0xi353bVwN0Xa2Fq85FbkpapiOThbk3mNqacVly302o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725416924; c=relaxed/simple;
	bh=B+wiAafhN1/NEkju++rMTy5n7TvrXrWko3cpU8nfabw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DXLc+Jmbgjlw9UtN59A+EsX/rG3wrFjz44Vr3nwCou3bPAKiAx2nWm/p3BbnS6KUXdleU1Xqv3BT2gz7ofXqRtdR9cAvnYH2w1fOnOHH/pwRmwwIijPVyaxoTd4pQy5fZc05FleVigf9G/lKl0xxLi1u8/YZ0t5Ycjf57vVwP0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UUp49BvW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725416919;
	bh=IY+G1gOfJT1Qk2FQx74kbsyqWHJN/d34Kpgbt7r1wdM=;
	h=Date:From:To:Cc:Subject:From;
	b=UUp49BvWTk7KM8rMkhr4CSPbvU64T7sZW7CsfnoGSYZneeITSlASfLxjfMefgPA86
	 El/GZPTorEqJfNqLtERgbVLr3XoFSAZmHmB4jcDHTypUPsjxVBJBgML7Hs3fo4O8dP
	 qWKYQ27txuPxQttr8Okht3KIetvUGvRjh7+1gjknY2r9XsUgFI/kKNKrh1G9Lbwc0V
	 OXN+pb1/FnCr50dOHOv28GpyTchSplorbBbSZ2F2KwDiXDaZBRVxHVzedLqO9W8hce
	 U3Hdw5RCy48C54I3+8JovXbVj2kQqEb53PDkjP4QxCyqsjrJtwioUxAVyHl1K+SUEg
	 Hq3ySYo8wU7Jw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wz5yZ4hhzz4wxx;
	Wed,  4 Sep 2024 12:28:38 +1000 (AEST)
Date: Wed, 4 Sep 2024 12:28:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20240904122837.41d1cf36@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SeW=mwjGc+vlTXbhLd5yzjk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SeW=mwjGc+vlTXbhLd5yzjk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  80d2d2dbcce7 ("Bluetooth: MGMT: Ignore keys being loaded with invalid typ=
e")
  4e76e85acacd ("Revert "Bluetooth: MGMT/SMP: Fix address type when using S=
MP over BREDR/LE"")
  5785ffa39009 ("Bluetooth: MGMT: Fix not generating command complete for M=
GMT_OP_DISCONNECT")
  4dd2c5007a2b ("Bluetooth: hci_sync: Introduce hci_cmd_sync_run/hci_cmd_sy=
nc_run_once")
  61bea6923172 ("Bluetooth: qca: If memdump doesn't work, re-enable IBS")

These are commits

  1e9683c9b6ca ("Bluetooth: MGMT: Ignore keys being loaded with invalid typ=
e")
  532f8bcd1c2c ("Revert "Bluetooth: MGMT/SMP: Fix address type when using S=
MP over BREDR/LE"")
  227a0cdf4a02 ("Bluetooth: MGMT: Fix not generating command complete for M=
GMT_OP_DISCONNECT")
  c898f6d7b093 ("Bluetooth: hci_sync: Introduce hci_cmd_sync_run/hci_cmd_sy=
nc_run_once")
  8ae22de9d2ea ("Bluetooth: qca: If memdump doesn't work, re-enable IBS")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/SeW=mwjGc+vlTXbhLd5yzjk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbXxdUACgkQAVBC80lX
0Gy9Egf9FeZwA1se09hWcAQlqMYbuaqkmFrucP93s+UrUY+K8/wXHk5FC7xk9Qa0
DqrwllNxEhsNCMqwQJQXeENDvgDBK0Jl0eG9Yr35SQ+E36Lnx2j3SKzlXdVrKjMP
F6GTTKxSIRUb+wOm0NWNOdgoKOjxlVJO3aT0wRvqhvE1Pj4mmf354pr4GaRCsKul
rhtqeo31YZR1GI+SoypU5W1axQv4tnitzXkwfDr5bXXeO7xASZE1xHlXfDPoitWs
7yD0uDFkIovXxkWEG7uWv9vjuL8/xiFqX+OwdwSr0jGqD9VBeOBaFMQaLKjGX+jD
HnbFw8vSy3/UeuXcf6ONu+N9oT/YvQ==
=RXIc
-----END PGP SIGNATURE-----

--Sig_/SeW=mwjGc+vlTXbhLd5yzjk--

