Return-Path: <linux-next+bounces-5086-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFE8A0516D
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 04:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F270188557D
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 03:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F9C175A5;
	Wed,  8 Jan 2025 03:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="twY4ZJuB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5861259490;
	Wed,  8 Jan 2025 03:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305439; cv=none; b=PmKzmx3ivSpjP0of/rsHkqohGLS8OkF8omItOntTrYohf82Y/J+paLOW1XtuPlGzox2TAvlC1nPe1s+2FBjin9QTajNGrYRaM4sQb47qLIZor7UhQwHJJ3MMLkiyJUX2Ho739+2rDMgMzD6Hn7b6XD9ghD/I56xo3zJpAiWEQoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305439; c=relaxed/simple;
	bh=LB8wPattgvhgTcINi3w1OE/byxKEQbyDgoAyv+uBnik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CmtcfVgFRZHmyK4MTN3+bjuJP9ltf/Fks9n5/qhztc7lrYiQf/eWxUed1l4tqcwJVx0dOWCOYiyyp2CHFBgY1IR3+LOS4zGXNE/9PLbqVBzlO1wujuhOJwm6y4doPZhrTj6Rda50LXE04rkIPRsfTq2UCH0c1VEKLS3XXdIwNBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=twY4ZJuB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736305427;
	bh=3bxAVa4SsfwwzlkjvpSYMeXDYxVgp/gRArWpfULZ7Ws=;
	h=Date:From:To:Cc:Subject:From;
	b=twY4ZJuBJMgaw/E6oCwsumXztZ8R951cVmOyxX9FNBKko78iNGC9thTuhWLbjBzOG
	 cklFH6pxiHt/hC8VOQVSQ4ZQN/lWZ2cJ9VVX7eusk/NiRcq3UVdT2MasZnYQlNW0Pq
	 cWhBMR4+w+Vw3Bcm39kKvxTfbPzKEUpw8ajsHXU8p6z2COciXWr82+xXa1ouLUAQ0s
	 XR2q73tnkpwSE1JlKJMur8lGdK+kK78ieY2za/MopDEZzcJZ7GcMF8BlsCn7TJCWs0
	 GWzV4vgtxslXkmSRIQ5ObvI7eXjB1/9h34ALa81NUOEgPApMQVijeEcTb7j9EO65Qa
	 a4d9q/07giU0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YSXmy6t7Nz4wcD;
	Wed,  8 Jan 2025 14:03:46 +1100 (AEDT)
Date: Wed, 8 Jan 2025 14:03:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Andy Gross <agross@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the usb tree
Message-ID: <20250108140352.177285ae@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EnSu9Msh01YeWCGcFjcj85c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EnSu9Msh01YeWCGcFjcj85c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the qcom tree as a different commit
(but the same patch):

  485ff9860801 ("arm64: dts: qcom: x1e80100-qcp: Enable external DP support=
")

This is commit

  5f440a7b003e ("arm64: dts: qcom: x1e80100-qcp: Enable external DP support=
")

in the usb tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EnSu9Msh01YeWCGcFjcj85c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd96xgACgkQAVBC80lX
0GwZhgf/XvfULybF7RwFl8ZXZa3SN9aND2dCtQ4TQhVjLUnFUfUkD1tiBy0Pz7t/
dwhuIB7W/Fw6MJbx2EtC0J7rfanmw/q/qrNWFmn5oqebnNSCnoLBh08PAPe/m2ry
1bqB4EY4DntiCpx73wNCuK9A07C3KWLlYEyHvviZlxBAk0ZDXbuZhu6bVIeLaVbf
IYpvjaBMHw+8cA1MNSLBfMI3BmGYInDgpsVmleupeTBL/fV4C0RX21SUj/REbmhb
Dm4qtTGAkuS7aVNcHGBf4afFXRRuaPu34j08W5qV7a49Jvby4mcV6U7gpPGVPx7n
iK0Nl5wiBdtRvEJiKeB2hmQnwy7W/Q==
=ajCe
-----END PGP SIGNATURE-----

--Sig_/EnSu9Msh01YeWCGcFjcj85c--

