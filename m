Return-Path: <linux-next+bounces-5439-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B94BA3506C
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 22:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C002616C272
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 21:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFC424BC0B;
	Thu, 13 Feb 2025 21:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="onYEdFgY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420A828A2C1;
	Thu, 13 Feb 2025 21:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739481596; cv=none; b=S33Mek2c+LOfNJPDUXcThnEae8Tm24rBqszGc3EziE5MHrX0LsZu95OMdgN+YsppqsUiW9wipLwHiwqCURCcQCUyN/wPJYXiZmA1WZWN46SsVI1Cu1Z7UyF9foHsGbhZ7prSXsM0QxN8xmnX/IeykLxjDMZHke3tjc4M6dIgOd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739481596; c=relaxed/simple;
	bh=bJ5nQnb17od5bXXiOB41hiSy7HHxGYaBssTKGcpoP7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i6F96yqeo18Nq5gXnYYjXsJQ4M6Hhsqt8dW4/0uqUz0mwFQet49jVXAK6DV8laT1IKBpopFQPxisJUxKdkhv0kGVRG4ICDbFBMotNIsQiSbfghV7tkAyzdfb1O/wwXg+SfRYHI4vh9q1o3Xbp8Wwff/zuaarXU4F7V4EUlTVF4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=onYEdFgY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739481586;
	bh=Gu3QKEu3vLNsaqWjmCMPZuPKDKil57t4gk+a/A2oKHw=;
	h=Date:From:To:Cc:Subject:From;
	b=onYEdFgY6E7ZK/Ki5oTqYM96EIMK+LAYminT+7tTwTRN+kj+++e8FZN70Tu1h/rt/
	 4N+dTyRWWufdbMu+RS1QjQqnniwrdJmHkmPv3rFkRkefGtTcZzQ+J5LRRkP0fYn3uf
	 onE2XieG209i3ihmHqlu9NVP8zHM7Y1qVVZSBUsvgCruCFxYWn61kCwUQkgeH744ft
	 MQPRtSxkDUTcC5zU8VIcl631rLIjaTumCTxelXD9Eh/srtvxsU2xosKuERx/XZt+QE
	 rimS6Gck2OAIfTKD7Y4CXUwz1nULIKpp89zx1v/CoBRTqmzDgqAJrN+wIMMxeuBmhU
	 jjV1R53wri9Lw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yv7Ny3C4Xz4wcm;
	Fri, 14 Feb 2025 08:19:46 +1100 (AEDT)
Date: Fri, 14 Feb 2025 08:19:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250214081944.71114c57@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//7R6TqH1lE4epBm.XlgIFuV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//7R6TqH1lE4epBm.XlgIFuV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  37d0ec8e50ca ("Bluetooth: btintel_pcie: Fix a potential race condition")
  6ab54a717189 ("Bluetooth: L2CAP: Fix slab-use-after-free Read in l2cap_se=
nd_cmd")
  a6b7c150b32a ("Bluetooth: L2CAP: Fix corrupted list in hci_chan_del")

--=20
Cheers,
Stephen Rothwell

--Sig_//7R6TqH1lE4epBm.XlgIFuV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeuYfAACgkQAVBC80lX
0Gz/owf/XHnQmSsT4rMBmTVSevN17IsydgYK0fTYYjPKkAvTRkZFL5CrJJG19lJI
PsqgoPT1m2RJF7lLxPB6Hx32JeDaK7MsRGTX9Wfm2y2f+QtYZ37XcFCSZhG2RRtR
faPhOvAV6aQPsEl8jrqYuV8i24JzbIrgDM5s3eJQ5GmlGWTjietQ61SED6LwT8RJ
lPhVk8Mt9glzTcD25ptNoUWQuQH5Twan4d5IvkyZkVSkGItjW9vR0f1LxLnvwGOH
S1gGC8aMgISaxMOxLCEXM34q6miJHGfuLq3jB9LU4ue9ZcaLRGQvQAsbKndtYgKA
zhNr05sFD+MxiAcolTcGqq9As49RoA==
=+MMV
-----END PGP SIGNATURE-----

--Sig_//7R6TqH1lE4epBm.XlgIFuV--

