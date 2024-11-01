Return-Path: <linux-next+bounces-4570-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F2F9B8A27
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 05:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35807B21D31
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 04:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF38450E2;
	Fri,  1 Nov 2024 04:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KkAvnGu+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B109038FA3;
	Fri,  1 Nov 2024 04:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730434059; cv=none; b=tfhhS47ERxi21bnHie2Ly7GCji3NyExXQ0awtfWRbdxrP9UqA3T6ZBWnqD2N8VEDD03dnBS8/V80mwkfmQtcTbpooScXolyHZSh1UnRtjGgVrd587ryZbk86o/PYy98IkQukeJjP6wPosYD1TcB78zWZm3JpGIkoiaCp3/MeR40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730434059; c=relaxed/simple;
	bh=1sEXB+ushg9fQ1al0t+VIyGQ0yT1lVo4SrYrQPA56/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AAB2jW+QlEBD8A36HeCZKxpXcz+REQ0v0Z8E0mCBS2/gNHAI9TsJvL2Sl6OXL2JzKzYsJ6Hg/ZpUNjNLI36RdmsaNUsfmc743NnBm6Ca4EfVB90otlTGP0KOnmL0I738M/nBpt4C0gVU3F1KU9HoOhMPlYpU12wQPDfwCHBfrP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KkAvnGu+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730434049;
	bh=9dDxhNEZb0bvr/fHxrN6Wiv6fmCfOovAqAmzrRTl8XM=;
	h=Date:From:To:Cc:Subject:From;
	b=KkAvnGu+bzc2mYiUrqV66oJoNUoVHotY6d4bjAI92giigS42xLIpfPCoxB3UYYEy/
	 JCohVlsotoPQe+l1RkVTs0HsaaHW1vAHhjvd0lXaWWYBrF+aAklsIL/ea1QxR+ucQR
	 hOQ07k4WN4isJs2jVboX8c+Fy3PLlMA3nuBSAaE7Qo98dNeJjwpEfGAf9MzzxAKiT1
	 bUQjE3KTtOQzihXIfGrX3pYXKfQxHpPLaWA/kHdcveCjX3C0/NK+0IuWXVrvyInxXy
	 DIAQdD8d9mpx0bjnRheQkL49Uf16ZirFCn+8GciMhHNnNNKqNR6HLEXgmcBUCCrr96
	 fyJij0lw4D2pg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XfnPs2yMgz4x5J;
	Fri,  1 Nov 2024 15:07:29 +1100 (AEDT)
Date: Fri, 1 Nov 2024 15:07:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Amit Sunil Dhamne <amitsd@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Message-ID: <20241101150730.090dc30f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4xMmUkNb+HNfppPlUGg2g9U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4xMmUkNb+HNfppPlUGg2g9U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/typec/tcpm/tcpm.c

between commit:

  afb92ad8733e ("usb: typec: tcpm: restrict SNK_WAIT_CAPABILITIES_TIMEOUT t=
ransitions to non self-powered devices")

from the usb.current tree and commit:

  33a0302455d6 ("usb: typec: tcpm: Add support for parsing time dt properti=
es")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/usb/typec/tcpm/tcpm.c
index 7ae341a40342,a8fcca029e78..000000000000
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@@ -5042,13 -5055,10 +5056,14 @@@ static void run_state_machine(struct tc
  		if (port->vbus_never_low) {
  			port->vbus_never_low =3D false;
  			tcpm_set_state(port, SNK_SOFT_RESET,
- 				       PD_T_SINK_WAIT_CAP);
+ 				       port->timings.sink_wait_cap_time);
  		} else {
 -			tcpm_set_state(port, SNK_WAIT_CAPABILITIES_TIMEOUT,
 +			if (!port->self_powered)
 +				upcoming_state =3D SNK_WAIT_CAPABILITIES_TIMEOUT;
 +			else
 +				upcoming_state =3D hard_reset_state(port);
- 			tcpm_set_state(port, upcoming_state, PD_T_SINK_WAIT_CAP);
++			tcpm_set_state(port, upcoming_state,
+ 				       port->timings.sink_wait_cap_time);
  		}
  		break;
  	case SNK_WAIT_CAPABILITIES_TIMEOUT:

--Sig_/4xMmUkNb+HNfppPlUGg2g9U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmckVAIACgkQAVBC80lX
0GwBDAf/W4gv00KbXldu+bRHS7XvZKlBefcap8kdsd8/2oJCQ+m9fNQmSpzrGQ9o
bnY+e71VnEp8nNmYwjzdWv7qNSAvSOyL/T04tOaqMciNMq5vDRvvpq/KC2KFsFb+
23wSBa9VP2G6LDZ3QvkkvYclMEgeL/AQB9E2Ny9mYvdbD9EHgll329G1ktIAvwsx
9dkcoyslbv5cCjp1F13irxZ1EkRmibvdpt9OCNqbw67a/OQsBCi5gSrYsadBozEN
BZhDnxjLAv/y3ZVn8O2rYGwqmG7RxBkmjI+Wwl9S4iBl9zGBfxEpPjucmsmd3QMo
+om/7leOKiNGGsVnl5GGFpolR/uMPw==
=m1uX
-----END PGP SIGNATURE-----

--Sig_/4xMmUkNb+HNfppPlUGg2g9U--

