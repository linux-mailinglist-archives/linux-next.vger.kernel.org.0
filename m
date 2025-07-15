Return-Path: <linux-next+bounces-7539-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F76EB04E86
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 05:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93B5B172F59
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 03:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B1E258CC0;
	Tue, 15 Jul 2025 03:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aaC3W5Bs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904D29A5;
	Tue, 15 Jul 2025 03:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752548979; cv=none; b=K2il2ODHJn3jMcF/cjYIvkmdPVumspN8Uko5KjY6NeIB6g2nnPSTLEz8wUK+EEWQ2b5CFObFP1fDQoOr6zZ7hLQyBlTvW5CgPMYjbVYsLPrCgcpLjX9OQt6Iic+QY5upoKJEhLZ8eh3rjJTXU/8cYzT+1Mq9RneRhG0Mshe8JM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752548979; c=relaxed/simple;
	bh=L8/i1va+2JrI9YXZ7aijfuaaVbPVIN5MDiW/2aqZrxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QxspAaPUpVwO+NH/Uasd8IL7wih3u7jLSFeIjuD+LKROiHln2HCXLzHaMJRGe+lGm5/eX30i4q4haMmzKiqUhVXpJI4k8EJT/5HtU7uteekycfUhM3xjZ7cjo2F9bMB/n3DhfWBOWbjbVZsbFYDNOgyS74CQp3sn1QdzdBug0J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aaC3W5Bs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752548867;
	bh=KdfTu7GiEw1EtHpgYak5/Pgb6HzQ9pux9LvK7R08N/s=;
	h=Date:From:To:Cc:Subject:From;
	b=aaC3W5BsEx5Is7wvAi9zQJwmjVGD6d2e0pM6i73QKbA/spoq+GhZouLc+cP7RYLLm
	 dqlbTstyV2prI93fvCM6hDCiwI8vIa6KKO8c85tQJDfhtJiyuXINkMzq1jpuLHLw5B
	 o12k6Ro8QMBHtarCqJY7kAsFb5Fmw/3VZW7p5J7dy1wF0ztjf0Y084H6OvSMTt//Du
	 u+fdGe0xIV0elaL2w5ahqHVJdxKYYAPksWV0E72tGKSeRc+Klz3B/lUNaio2NpShCK
	 yw4ti4oZlyKrY4a2z5qo6ITdcg2Gu04RufojDOZaRnA/SR+Hg51yWNFjp5wtzl/jKK
	 xpFRrR+wHzrUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bh3yp1Tvqz4wbW;
	Tue, 15 Jul 2025 13:07:45 +1000 (AEST)
Date: Tue, 15 Jul 2025 13:09:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Christian Eggers <ceggers@arri.de>, Luiz Augusto von Dentz
 <luiz.von.dentz@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bluetooth tree
Message-ID: <20250715130932.5e13bfb3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tc987yom9=v3oCBYifv_+ZT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Tc987yom9=v3oCBYifv_+ZT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bluetooth tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/bluetooth/hci_ll.c: In function 'll_setup':
drivers/bluetooth/hci_ll.c:652:60: error: 'struct hci_dev' has no member na=
med 'quirks'
  652 |                 set_bit(HCI_QUIRK_INVALID_BDADDR, &hu->hdev->quirks=
);
      |                                                            ^~
drivers/bluetooth/hci_ll.c:656:68: error: 'struct hci_dev' has no member na=
med 'quirks'
  656 |                         set_bit(HCI_QUIRK_INVALID_BDADDR, &hu->hdev=
->quirks);
      |                                                                    =
^~

Caused by commit

  be736f5f89d5 ("Bluetooth: hci_dev: replace 'quirks' integer by 'quirk_fla=
gs' bitmap")

I have used te bluetooth tree from next-20250714 fo today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Tc987yom9=v3oCBYifv_+ZT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh1xmwACgkQAVBC80lX
0GwI3gf+KacaxO1MX6+SD4sRsGo0iZZFlwEZjhHCwqBtePA+/bo/5yRMxG9HrvCV
lpceoJBgBPJoXMnUNX/dUWECeqkNG2csLEiCZ1qbPulSdSZgjKnqGR6SR3WV7oUC
UY7fONrDr9fl4JxHUqGKR1Vi+ntzg5rMm7jlh40q7qI8DEXIDiuMcnNvtg0yTpRr
nU/4J2hjEzOpW9jK2dKlxGKIPd31b1JgVM9ZRUfDItZ2/Gfqb0WoZbcwMo5fMn2+
ZjJ+9cLOdL3aOsxpgh2G1Hl0qyucaNI9nhX6wOdbM3tq6NlCRvwJfuocum7NUy2J
M4/Xpg4a1tI9mEzDZO9dCSkOzpGlrA==
=OH8/
-----END PGP SIGNATURE-----

--Sig_/Tc987yom9=v3oCBYifv_+ZT--

