Return-Path: <linux-next+bounces-8086-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB6FB33370
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 03:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD9CF17CD87
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 01:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D1E1E5B82;
	Mon, 25 Aug 2025 01:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AmCleDmH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279784A08;
	Mon, 25 Aug 2025 01:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756084020; cv=none; b=Uwy0aPFnoLIHR7CMbE6tgQ1c37M4vDuUb9oX8GuckNF3Nx5ipnu4SfBmvsoFB25TeLZZt0clyt5utS8oHy4Xt0zAoQYAyz/wG+8NBJu5v/6VxogDU+J5SND2dJkHzx0PFjVEgMLwSfMu/P7yt9cpzz8uwzhNIE5E5vOkIRLoSYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756084020; c=relaxed/simple;
	bh=Z9tqbrFBHvLYg+TCrKFdIRZPan4X5CDYpubKX72ftNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O8XsQLIZdm7+TwbeGmZB/Bqh0Qo/cfeSY12TcCjQhx2cMOAhMz97FUw7v3r+O12IjXIQ1ntL8hRyIbwmb5mpVguVzAOz4QiR4rL9YOFmHTfVJLkM98qVKt/Djfag22Vtfw7znx2NxW9JJk1VCJNKkq4WTlCeYTDnXNP8J9eucXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AmCleDmH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756084014;
	bh=DpOg1gFQbGBJAG8siwpcIoumG8fW44EdJ4m9NT1aNnM=;
	h=Date:From:To:Cc:Subject:From;
	b=AmCleDmHJIVwc0IW29LsC8epqtetqkqKcw03hHjbMh6JMyZL49Pnb4jgOeItJksJM
	 PlG5deOU9KNE2i9ac9G2Vp7q33DUHFZ78kO+jnu1g0OGWLrRbdhTj02Ne1CLpIjVLL
	 R77UbT500MQmY2IoVOTYl2ZZVGp0jCsQq9ka2vsS+zudlm4LLBHfyMPIfoJVMk39Qi
	 nNENI3ufrsgj4f4Aq3XVdypdz3WUqNW5NvueMD4VYCs1Bz1MEGadY5kQBlvqf1tKgc
	 vpOtqna2KUEZ/FH42857/b58aBmKaW7DJEs/7FClFU7p+AZmz2/UsNCdem1qmP/1rI
	 192DScIYSqTLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c9CLQ2llYz4x3K;
	Mon, 25 Aug 2025 11:06:54 +1000 (AEST)
Date: Mon, 25 Aug 2025 11:06:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250825110653.68826b22@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+WUInC6jaow1I2Acz91x+0H";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+WUInC6jaow1I2Acz91x+0H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  c49a788e88e4 ("Bluetooth: hci_sync: fix set_local_name race condition")
  0dbbf48d4b4b ("Bluetooth: hci_event: Disconnect device when BIG sync is l=
ost")
  05be312ba55c ("Bluetooth: hci_event: Detect if HCI_EV_NUM_COMP_PKTS is un=
balanced")
  e090ee03a6ed ("Bluetooth: hci_event: Mark connection as closed during sus=
pend disconnect")
  f6305e06185a ("Bluetooth: hci_event: Treat UNKNOWN_CONN_ID on disconnect =
as success")

These are commits

  6bbd0d3f0c23 ("Bluetooth: hci_sync: fix set_local_name race condition")
  55b9551fcdf6 ("Bluetooth: hci_event: Disconnect device when BIG sync is l=
ost")
  15bf2c6391ba ("Bluetooth: hci_event: Detect if HCI_EV_NUM_COMP_PKTS is un=
balanced")
  b7fafbc499b5 ("Bluetooth: hci_event: Mark connection as closed during sus=
pend disconnect")
  2f050a5392b7 ("Bluetooth: hci_event: Treat UNKNOWN_CONN_ID on disconnect =
as success")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+WUInC6jaow1I2Acz91x+0H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmirty0ACgkQAVBC80lX
0GylhQf9Ek06lnyOtDJww9qUS5Fw/u7rzb56L/SPh+XciAq/SM1sPX6ArlUoj72p
mcLEenNmeZNhdDcrJEI2oKYkUlt2me24kvV72sobXFu4V7YFEWA/rDcbtp8KgXdx
ocyoaSEF1Rlq/ehLyfr3rtgUZPlsJIs6w35RPdONKchpej/4ZdT2S4iXsnxBXC1x
4mVoE8AjnuqD79lFsM6Qg6bxA1SzTa9hSmyiuBYDKQH0c9xtCvWLegiG9iyFrJQV
LQ81adYlT5ADpWi9sGff+8DZIqB5sNydQvVHkPpng7uoOL49082FEnhklPUfU+WB
Woa+KHC0olRYYvE23aWVY1fQxtJ4Ng==
=bq6o
-----END PGP SIGNATURE-----

--Sig_/+WUInC6jaow1I2Acz91x+0H--

