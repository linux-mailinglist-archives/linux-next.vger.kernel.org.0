Return-Path: <linux-next+bounces-2295-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 025E68C4C37
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 08:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E08F1F216B4
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 06:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719E11BF3F;
	Tue, 14 May 2024 06:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RvN8Kb2c"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8791862A;
	Tue, 14 May 2024 06:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715667520; cv=none; b=t4AHYFsypLdcnOL41gewIJlimwB6UsbCwqM2vzJjjN2z/s4aUPXzOTwXSiOkhKzqnveCZht5XUeI5hn9PX/7D1JMCm3R9By7xCWVRhhFer7hAoeEsqgLLGnMdhQz+V5BDX5HtxscwOYxThzRSmJ3EyLNtLBy8osTIDGx8xxQrD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715667520; c=relaxed/simple;
	bh=N1VRulDAS++FeTPHfhkVLv3G8zsvXTwRKOdXYJ5+O9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ddt881BdVK/UKT6sTenTf4eiLfhFemeI5msA0b8GNfTdBU5jJRSki0/Tnd6HSGzte6B02aiJ7GMM9mLl7FJ9uVPFnw1r97FoBP2fDV+GCgB78EyjVgvF0XwFkTsek16t7jXj2Yc2aP4aGNveb8HlGRBQZzCUDROJdrWLq7lEvp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RvN8Kb2c; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715667513;
	bh=TdCVAdsQiKHXL8qKY8rCV7UQ49gcVDI4OxkT8Nf/+88=;
	h=Date:From:To:Cc:Subject:From;
	b=RvN8Kb2cvGV3/CYKwn/TnbUNLwuf2HBc7uOZVOowWjeanyl3+OlnpoWZ+3bNp85SC
	 aidfj0LkpBTkdMjjz+TMK/DxXztlZrl/2NhzJdBQu4BfT/BG7ycY2a2GHj5vkZgivf
	 OJPJsPG7CdWrGUSQD0ic3LdJg/8YxjMHcG8iChkveE51VmSCP8piDRQFmdUIeT6QXG
	 9Quu/A6B3TcNgLL5nhXcG4kdIrzt8dTdQdDLnMzTSu6ndH99Zk9P7v3VGwNOSihW36
	 9vb17lOzfv6RedsmVo3IadaldzAMggnskiw7FMqik+Ff+LPiJFPtyq93wXlBC403hX
	 viOODGl+iw+Pg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdmQ024Sfz4wc1;
	Tue, 14 May 2024 16:18:32 +1000 (AEST)
Date: Tue, 14 May 2024 16:18:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vhost tree
Message-ID: <20240514161829.3b51ac01@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L+9gZudwmTpea5/cEP2apXG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L+9gZudwmTpea5/cEP2apXG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the net-next tree as different commit (but =
the same patch):

  a2205e1e9603 ("virtio_net: remove the misleading comment")

This is commit

  9719f039d328 ("virtio_net: remove the misleading comment")

in the net-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/L+9gZudwmTpea5/cEP2apXG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZDAjUACgkQAVBC80lX
0GxJwQf/Qjy+gs0259ctKpY1XM0aVGH9cx8ivjSO/h8XPxvqhshrsgq4jSJd359J
kcC02Sbyy2Rm9y09P5QclBZP5i11kcf5rqsIzPWZH2hxZvWL1nZiCize9K9Q0/rY
yLgMMdsMCX5Bhuk4vSd1iHF0ps8S60DuCx8VOdmO0BhqC8cDRws8cKvIW09PGAEC
GS8zlb1LzOGxSCAmh7iVBPZrUst5vPFTWCeK7RBEEDtOXBrSgUyQU8znwAaPxkCX
F+OEWxWQP1QEjdRFthkoiUqL7f3WlTFx/RGNSn7WVhaeI59O8k0K/vnGpBG5+8Ar
sWtqjnGOmm4dIVvPeg9SBqrMgoRTEg==
=eiaN
-----END PGP SIGNATURE-----

--Sig_/L+9gZudwmTpea5/cEP2apXG--

