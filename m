Return-Path: <linux-next+bounces-4429-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF959AF741
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 04:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55759B214CA
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 02:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7F7502BE;
	Fri, 25 Oct 2024 02:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YiE8lvu8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2BB4409;
	Fri, 25 Oct 2024 02:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729822154; cv=none; b=LM5IMUefit6x66v5euSuhj7QLk0HUnpG6sM6r7mVlTq31XOjkQXpQaJ+ptv+fhR0UKnseh3b8Ok9ig0QfX/8saOs3/qi3ftvndMRSyo8TFFl5Jmk8/OK37032iHRXJ5dv1ZWPXuRw7I7fZKbnqeD7FPkE4o4ffuK95Y/09pq65I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729822154; c=relaxed/simple;
	bh=owZQFjRKSrFscUTMzgy9f3qj0DPeqx31XBXz7yOfruQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XLsgNmN9gFnV00upCYu2InyPK3StJY/F7qOqmf5Nnm2gtCAMeyu2SF7inMPpxscc4eH40MzPXe0eBMqkDx8CSFbkY9QgJBYyvEq087i1w+aSNqwz0WtW0Q0fGI31rc689w8mWp9socHRxKCmROve3oZs7EsmB5a/f6QkRUH0PtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YiE8lvu8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729822146;
	bh=gQgSV610ILSoL/cGnp5h07TqziRXCjCy1JOVwfPy+4g=;
	h=Date:From:To:Cc:Subject:From;
	b=YiE8lvu8jxLB8dmO8gNBrcDv6F7mIVbHfVD6kmhyG7QR7A+t0cZWR1C1MQPse4fkG
	 el2ijzH4va3r9hLpqpsoX3xJgKs62ez6oeIntsiWj/lq1wDnsDWU4UO+5VlJ8TlHu/
	 1ivnw4G0nYUKDGbRtD6zsEDEoU18AsFNzSdhyd8YzN8XWzsUH8jba1aw7puEAdl2pn
	 QFS9nlr9JMSG9vL1XQIvuFMw0hiOMhZOZfzmxMXVjoyO7H09S5VAksM8WZPyKTq2gg
	 6GnPq0GhzqogdHVe/Tb/vLsQFhuIQQMTy/A4wVkX7ZeFxmxyyu0i7wsYy80RSauGPP
	 Yb9krmgDEFcug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZR6T6Y5sz4wbr;
	Fri, 25 Oct 2024 13:09:05 +1100 (AEDT)
Date: Fri, 25 Oct 2024 13:09:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20241025130906.3ad6329e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eG+lchctPBHezqo1T6aNxH0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eG+lchctPBHezqo1T6aNxH0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  fb4560832d4c ("Bluetooth: ISO: Fix UAF on iso_sock_timeout")
  300b75192c4d ("Bluetooth: SCO: Fix UAF on sco_sock_timeout")
  92e242adc4ac ("Bluetooth: hci_core: Disable works on hci_unregister_dev")

These are commits

  246b435ad668 ("Bluetooth: ISO: Fix UAF on iso_sock_timeout")
  1bf4470a3939 ("Bluetooth: SCO: Fix UAF on sco_sock_timeout")
  989fa5171f00 ("Bluetooth: hci_core: Disable works on hci_unregister_dev")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/eG+lchctPBHezqo1T6aNxH0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmca/cIACgkQAVBC80lX
0GwtYggAo3z04zeo14tOPc/xnmxsNhqIHHDczLDJcdFFXoLMzV3CECRZaOKzowLg
XRJtguCud99kVh9UJQWHry/TWXcghJUPGJSfSkPmKzl/WLAsMt/xoypYoYMkqiWS
3/DquPxqvbS4pApGCYCf3FolG+9fL1l89r8wb5/m9zNUuRib3fsmlXbUDb42IK6O
U4M6OI3c33PI6TtWtvWNt70+1zOiEwTaJ/41UHNCg0jssNcg7Ut2T299dXGtzb5T
rAHNcmw73mQztWrVlDEyM7QKRd5yaU1EeErQ4C3weSyhlTWj2NKnJaXDXBseblFR
8e5AMDKC01h8wI08re4Vicys6ze1mA==
=buQe
-----END PGP SIGNATURE-----

--Sig_/eG+lchctPBHezqo1T6aNxH0--

