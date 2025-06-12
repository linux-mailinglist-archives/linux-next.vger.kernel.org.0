Return-Path: <linux-next+bounces-7144-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59098AD7E3A
	for <lists+linux-next@lfdr.de>; Fri, 13 Jun 2025 00:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56FD4189544E
	for <lists+linux-next@lfdr.de>; Thu, 12 Jun 2025 22:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79D82DECAF;
	Thu, 12 Jun 2025 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lLM8nIe+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F60F2F4314;
	Thu, 12 Jun 2025 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749766227; cv=none; b=KpMfPmG//zorsnsdW09Iq5CdMVkoNg2N/HzDTS+JXEsz0Ql8yhVH3zFmijIb0RUPBhIUGfqhnhEpFTfqY9wMVDYmc+Wi89mkd6L64h8KyT9SBZ/ICv/2RshNJwQ2EaOMGv5ygAbp9vbjZ6q8EyutRC9peRcL+4LfZ8M8hIkZXDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749766227; c=relaxed/simple;
	bh=S2gYPM0sCGujSem+8EB0TwnL2THsHZCvkt/WFygqnu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NzZGpY2CMYiI4mAWEfIkaJvvZE/VQoX7E23v95Kp3uDUU149BUjQZ/0ox52sK3I8cIq4CXclUgIpP8kvuYZwKzcwjMvcSZTJN/pXbeRZZp73DnZ4ixUnNbDwsC6efR04/Vl8IBQCIwaFJX31CHWQTI499WqH/d3o7m7BWYtKYC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lLM8nIe+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749766217;
	bh=ZkD44VQb3HGi61nG/Jp9UAmY1hNv2SG1ewR9gzzSnd0=;
	h=Date:From:To:Cc:Subject:From;
	b=lLM8nIe+dOs+QiDkr46X8ZCl831unz0Pihh+PuYoJEp2SQzTP0kLT3fQZkCh45gT/
	 FR6PunO832RjhFjggjnXs0edDaAeadsbvGjoZhnBiN1eWHe09j5aIG8UDKAg0QcgVq
	 wpwtGhh1BTuz1f5m6I1EHrZG5HqJs8m7g78PpIbOpwMztXVqGyo7zmVa74xsKi4D3v
	 WeKxwoaeLR3WyquAkhjCWrd3rymAQ5QEvX2A4cKWVBaMfdnvRqeXce4o/D7GwoGftO
	 BATx2KcMTj6BUc8U3IWWEN0XkiIcK6ZDIjy5QAmgYXDvaRetG9tBkrVf2NmsIJxXrq
	 ZPlE1K83UVOvw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bJGtK0SSTz4wbd;
	Fri, 13 Jun 2025 08:10:16 +1000 (AEST)
Date: Fri, 13 Jun 2025 08:10:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Networking
 <netdev@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250613081015.55da05b6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Dwbecz444FCaAcDuhrHyS84";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Dwbecz444FCaAcDuhrHyS84
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  2814f02508c4 ("Bluetooth: eir: Fix possible crashes on eir_create_adv_dat=
a")
  31b3d39c89f9 ("Bluetooth: btintel_pcie: Fix driver not posting maximum rx=
 buffers")
  3812bd9eae38 ("Bluetooth: MGMT: Protect mgmt_pending list with its own lo=
ck")
  618cabed8257 ("Bluetooth: ISO: Fix using BT_SK_PA_SYNC to detect BIS sock=
ets")
  6c5d0010e8a4 ("Bluetooth: hci_core: fix list_for_each_entry_rcu usage")
  73700cd6bd6a ("Bluetooth: Fix NULL pointer deference on eir_get_service_d=
ata")
  dcd2b35c9b56 ("Bluetooth: ISO: Fix not using bc_sid as advertisement SID")
  e849b59c9db0 ("Bluetooth: btintel_pcie: Increase the tx and rx descriptor=
 count")
  fa2c8bfe6794 ("Bluetooth: btintel_pcie: Reduce driver buffer posting to p=
revent race condition")

--=20
Cheers,
Stephen Rothwell

--Sig_/Dwbecz444FCaAcDuhrHyS84
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhLUEcACgkQAVBC80lX
0Gylxwf+Ly/SHyn6+RwVqTc3G6k1lMM8G0ZHH3TQiQ6HHULrALmdhCBsXdMKkRDv
26/+93wcr5vl4wEJfh1jxACrQ4QXrMsBWGpmsALh+/896H0TxTLXRqWhAd9ZTML1
VFNNtNQEjQEYcrdpB7BuDvkQ+Ef+VDcYJyPCSp+chsRErV9AFm+kG+yOp3hUXJEB
V/ZFpm0J6BvXPkaa9i/Q+Nos7jgTgHGwvoes2FcW9abvxLALAhn6jNKIF7b03lox
euOD1IyhmzO5OWmGDamw409nf0/n16QSpjDdZPTNvyhYRQquMtrvEifSf8sBjqXu
syUB4cnyqHnIPtKwfORG4Z58pdloQg==
=72vQ
-----END PGP SIGNATURE-----

--Sig_/Dwbecz444FCaAcDuhrHyS84--

