Return-Path: <linux-next+bounces-7112-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1628CAD2BEB
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 04:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43273AA3F5
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 02:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679C025C82F;
	Tue, 10 Jun 2025 02:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YpB3tFA0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD0225C6E8;
	Tue, 10 Jun 2025 02:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749522414; cv=none; b=md8qk3auY927ECHwMIY6a4DPHSIDte2YGijew3qO32O5GjHpXeOyUpCJ3EKMy0Ez1R78x044ZZgylLZqqhmwgTwDcJ/wOQif+ecw397JYfv1sQ0fcqM0EuDDj9Lb1mswWGtKbWiPCgC4bZtKIBRq9WtecjYxn6XC9bdjjQ3fOz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749522414; c=relaxed/simple;
	bh=J8kM33vsRGHi9m8T8d7X7J2CWub4VfFnBrC5y0DnWRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OWcQr0ldKHzO1r3cQ96DOXohxCMn8ZuodDqxG2tNtrGoKgYQxT5+Pdh572HVd5T0nR7zY6JJ5owdEADRhbvlcQLJV+ztAptPWQNNDQJ350yZ2jYU5tIXzQFiSEbxyAzBZOB3ezWcEQkto3ypFI4bH/PG+hmGVnWVzosztAbzp78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YpB3tFA0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749522401;
	bh=EWSk6KSIljgLvLf6oA5qBj0Z+cLLmJQZ8aL2WMZmYNU=;
	h=Date:From:To:Cc:Subject:From;
	b=YpB3tFA0L69dzDtsAQJ1greJDZnQ1pfbulXYIFNeN92UaPocXOnF4xz33jMdju5lU
	 74WH/x03DYho5c77O5q5mhej50JOFha+Wsedp+eeQ1vBkGxqe5HBVEzjwWHMr7SXm9
	 CjGlhuCcsLtt+/oolbyNL1LPfwwePn3oLMZ7YW5Y4NdGA20dmU8YqI7pPszfFT4WgV
	 oIydTt4oNYicOaqdC/FJk3JJHkYMIeZb+I/j9i/uwp0mdoGFBVJY5bwfeuwyxPWZRB
	 1zNmQsNlQB8Be6VN89xzDkUcgQhTr3yIfFzLnrSQKrw9cYOoH581p5PB4C0+5GuK4X
	 nEh72Yg59yQ9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bGXjX2fh6z4wbX;
	Tue, 10 Jun 2025 12:26:40 +1000 (AEST)
Date: Tue, 10 Jun 2025 12:26:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250610122639.3600392a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WhzEbeZGeG3SkQc2pBPI.=5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WhzEbeZGeG3SkQc2pBPI.=5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  3812bd9eae38 ("Bluetooth: MGMT: Protect mgmt_pending list with its own lo=
ck")
  fa2c8bfe6794 ("Bluetooth: btintel_pcie: Reduce driver buffer posting to p=
revent race condition")
  e849b59c9db0 ("Bluetooth: btintel_pcie: Increase the tx and rx descriptor=
 count")
  31b3d39c89f9 ("Bluetooth: btintel_pcie: Fix driver not posting maximum rx=
 buffers")
  6c5d0010e8a4 ("Bluetooth: hci_core: fix list_for_each_entry_rcu usage")


These are commits

  6fe26f694c82 ("Bluetooth: MGMT: Protect mgmt_pending list with its own lo=
ck")
  bf2ffc4d14db ("Bluetooth: btintel_pcie: Reduce driver buffer posting to p=
revent race condition")
  2dd711102ce6 ("Bluetooth: btintel_pcie: Increase the tx and rx descriptor=
 count")
  daabd2769850 ("Bluetooth: btintel_pcie: Fix driver not posting maximum rx=
 buffers")
  308a3a8ce8ea ("Bluetooth: hci_core: fix list_for_each_entry_rcu usage")

In the net tree.

Also commit

  a214e21449f2 ("Bluetooth: MGMT: Fix UAF on mgmt_remove_adv_monitor_comple=
te")

is almost identical to commit

  e6ed54e86aae ("Bluetooth: MGMT: Fix UAF on mgmt_remove_adv_monitor_comple=
te")

in the net tree and, due to other changes in the bluetooth tree, is
causing a conflict.

--=20
Cheers,
Stephen Rothwell

--Sig_/WhzEbeZGeG3SkQc2pBPI.=5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhHl98ACgkQAVBC80lX
0Gz3wAf9GWm88hi/qZV6+reaD2tF/KzMZarLQOgPtRE6TSAYt0ZVUP9dEOIOPWyh
Jvyn43Kjz6eOwewlwURoQeyWfpNUQEQlidmJN259sXOGxI4uU8TJrNtMubgBLvdO
vBPPRJQN89XUGD8uL2CxCjg6acqjlc7s/uiKiauw+mu0Kj644YGnQ/0mvJkgJgky
ITc4b+KBcwjwDAAPWBN2Vm1qUrT8fFsd4qMB9JB3SuezYV2F3lvuUfY9eOzO3499
dJMNcPONiCP73aR7EGRDEN3zfcEwSU7wRdDmF+2Dqou/qmNEw4Rwnc/AM/qyUlGz
P58ip+zT38WtOAczieYAZZFYL0a3MA==
=2XaW
-----END PGP SIGNATURE-----

--Sig_/WhzEbeZGeG3SkQc2pBPI.=5--

