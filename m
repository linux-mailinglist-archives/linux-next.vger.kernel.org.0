Return-Path: <linux-next+bounces-7301-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C346CAF0855
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 04:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C0361C0593E
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 02:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DD219ABDE;
	Wed,  2 Jul 2025 02:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Su8ZC6sb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C731553AA;
	Wed,  2 Jul 2025 02:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751422349; cv=none; b=aEbvuKpu8BV5j7tozie75Cf/uKgWfO/kRIoaJp3bJL/W1Mftp9SUh55zNGy3xfl8+RpKVazCH+UHQ5Jw+2wHBEkFRZHoRVl4jVQnaO5ES9xRxkstmayL4MeG7A6Gq+yfOiOjlEgSw3Tignk/puDoC5Nwl9JwrrCNMb49oHjuWVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751422349; c=relaxed/simple;
	bh=QExLhnSbB/x30DEL+T86K50SaBnWTT5K33Tm+6SgIlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M5zbNaX5ZBt6elrIjg5UnhEpxGnJV26hUVORTPZvUwTX9/7yDw8OMrJuq8oDGehxOZsNGJqsV+tQPdOYxRsF9Q4eqxgLjo39a+2j3yc+wVo7svt8MX4rGKBfcjkd4YiLGdZxLcBmYR4mlMPjKxyC2WpjaK6xsejxgUCYmUOXut8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Su8ZC6sb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751422331;
	bh=wmUGv3+hSVocR0bGCaUm3npQbhvP5RBTITs1xd40P0A=;
	h=Date:From:To:Cc:Subject:From;
	b=Su8ZC6sbG5UFFpB7Q+XdS9fEHjJZPvOwQ8XssiKydV/ihnEFBi8LZyasg50pvYYXx
	 wbUT1QOaVgDJEX74Ubdf2rrvd4l81Iy+Gp4vYzkMx7P/DdMlluFRajJhDbwaCcwWt7
	 ptjiCCGFrYc1q39RiFMpWjcpImoA1aU79y+e71yxMYc8L4QhPXvRtjneEC3wvz7eNg
	 RXbMVGpodpl9HOfiYjS1iSBnBpUIrvBnfiCcCe0QOksSQmvuAoAyrWoQj7LEbWXtxT
	 F4yTGdAEFs3uNFuIIqAA8qkdgX47uhB1fRPLxIdNZY3t+3VAjylZ2aZJ4pOUw0BvTj
	 6h9lzvhpPPdQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bX3Ld5Lsvz4x21;
	Wed,  2 Jul 2025 12:12:09 +1000 (AEST)
Date: Wed, 2 Jul 2025 12:12:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250702121222.6882dd74@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O8qkvtmYyEDNcGjKDJptJmk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/O8qkvtmYyEDNcGjKDJptJmk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  9b36e38d0fb5 ("Bluetooth: HCI: Set extended advertising data synchronousl=
y")
  8dcd9b294572 ("Bluetooth: MGMT: mesh_send: check instances prior disablin=
g advertising")
  41d630621be1 ("Bluetooth: MGMT: set_mesh: update LE scan interval and win=
dow")
  1984453983fd ("Bluetooth: hci_sync: revert some mesh modifications")
  8466ce07cb6a ("Bluetooth: Prevent unintended pause by checking if adverti=
sing is active")

These are commits

  89fb8acc3885 ("Bluetooth: HCI: Set extended advertising data synchronousl=
y")
  f3cb5676e5c1 ("Bluetooth: MGMT: mesh_send: check instances prior disablin=
g advertising")
  e5af67a870f7 ("Bluetooth: MGMT: set_mesh: update LE scan interval and win=
dow")
  46c0d947b64a ("Bluetooth: hci_sync: revert some mesh modifications")
  1f029b4e30a6 ("Bluetooth: Prevent unintended pause by checking if adverti=
sing is active")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/O8qkvtmYyEDNcGjKDJptJmk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhklYYACgkQAVBC80lX
0Gx+iwf/RguU165QmqYoZiIK1kA1f76Rh+3FkqLc8wZKxj7yomIx78m+rFQZdw0l
h7Ga+8R9XN5+v5+c5qEK2Ez82nVX03osLt+xhij3YlJytAp3xh31KzWo0kwSzX4n
5lJO0/DLoYYnL7J+VLK1N4UXiNp4m0MJHk+0z1jrhQKZ2/fN1R38hTbQA0TUjhIx
adGtPkvmfBk/YyT/AUbqNUifDJP5oPI/wwweasO2ID5AKnrZhM6HR248G0hPzJex
EHTd346KKbYeH7BpU0r7zKLMnP+aSHfLgxfVjMHzhWKVsjppAlHfun05FpBFPoWk
S8x/4CvLXhIFomocIK8vKwUNXF50sw==
=AneY
-----END PGP SIGNATURE-----

--Sig_/O8qkvtmYyEDNcGjKDJptJmk--

