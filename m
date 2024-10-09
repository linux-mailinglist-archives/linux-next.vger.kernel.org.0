Return-Path: <linux-next+bounces-4159-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBDA995C70
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 02:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A56C7286A11
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 00:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CF55684;
	Wed,  9 Oct 2024 00:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ECwHrA8t"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1232846BF;
	Wed,  9 Oct 2024 00:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728434996; cv=none; b=XAf3JCWV+cH3O/APme79m0g00Yjfaz9bKP2240vx3RJM4Y2N2OL/rwYSuXNQYZzEUyhLV3sqTvb74cXV8jrUqNe3ECLdNGQxYlDGtJ9dXlGH8tA8bbH0WvtYh0/nBBIf91amcSaIM7FjwZgpHKFF4F7MHUf9OoU7EyLX8YoRWxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728434996; c=relaxed/simple;
	bh=STOQI0Qlp2ZzzoWNxsdgR+qGL+o+mt73TtkNoE8PtNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tyqE/f5efemQlJjvuLxrthMianHntwr2Kgs0jDnyNypuEPd8CZBjS8cLbRfmnmBYBC4Do87eJNNzlybUPAsu+FnQfBpoqnp+hRpXms4sczURhD5/tQztuazK3vfPVmUQHZ//L6pWc3MLqyrI187F4TugD66awXq8PYb2haY2GZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ECwHrA8t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728434992;
	bh=Are+66SNPt+XSuJv5WmVQwCztHRVCez4JL75YAeAqhY=;
	h=Date:From:To:Cc:Subject:From;
	b=ECwHrA8taoCzQNHhzVUmjBt9uZHRe5uWj1qtG13/jviNVtQmc66/Zffki2AePZ+9v
	 tF1iVmcFw/Cg3BpsolxNcYVxeOv4FAr92RqqLCXqFKdDsHmbNCaGx6x1cUhoTvH+UL
	 lvpDDVew3LE+QLqQLa+DPgUDTybRKQ8bmn7XuwyQlhDnIHf1ONw5RFw1OWJ+I7cV35
	 2nx1wvjLNT+aQNvGkbv8tMv9QKru57QiI1uilePDFvBlkq//jKbFkmXZLC8K7dV48l
	 69/ogyFU/zd2xlDLdYtZFB33DHz9Binyuhyf3KjLpe2Zil0JEgIAjr6AjSXSsgP2By
	 YWSz9c7lyPklg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNZ6R48QSz4wbx;
	Wed,  9 Oct 2024 11:49:51 +1100 (AEDT)
Date: Wed, 9 Oct 2024 11:49:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20241009114951.101e4794@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t7ORZhJQiG_hYqcuISwYoML";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/t7ORZhJQiG_hYqcuISwYoML
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  81b3e33bb054 ("Bluetooth: btusb: Don't fail external suspend requests")
  a691ff3d3280 ("Bluetooth: hci_conn: Fix UAF in hci_enhanced_setup_sync")
  ffb3f98d4dae ("Bluetooth: RFCOMM: FIX possible deadlock in rfcomm_sk_stat=
e_change")

These are commits

  610712298b11 ("Bluetooth: btusb: Don't fail external suspend requests")
  18fd04ad856d ("Bluetooth: hci_conn: Fix UAF in hci_enhanced_setup_sync")
  08d1914293da ("Bluetooth: RFCOMM: FIX possible deadlock in rfcomm_sk_stat=
e_change")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/t7ORZhJQiG_hYqcuISwYoML
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcF0y8ACgkQAVBC80lX
0GzgEQf8DK9ftS3ARrmNcMH1JlLcowfZ465amDyBmOVH2MrFBzUCXE9d438lm+zW
TfSaEPgPUl49WIz3iNW0Ec+7ylDfWr1g99RfNET/IG+ksJU82lZhs8wpzX10KyMY
mnOA/oy/bcFW9r6F85V348S1MSBmoieuhC1Kc4DsdAyXi6zrVb4axYxDcqQMfwoI
9nK8tp0F0MMdE2SYBj/FHIKc04uwDPdXmihKyr/uzpLkuqTQdLzEt+Q6efv+30C/
qjWgtdWhy7j75g3xxb7q2UOs1t5AckjWK7DPjhzrpb1eVcO9IionngwB0yN83/Ah
VXyVtOy2v9M3kHXoCiZUQ/xnG1k3Kg==
=vKLv
-----END PGP SIGNATURE-----

--Sig_/t7ORZhJQiG_hYqcuISwYoML--

