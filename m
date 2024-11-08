Return-Path: <linux-next+bounces-4703-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9889C16A3
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 07:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 877D1B23C48
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 06:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF6C1D0B95;
	Fri,  8 Nov 2024 06:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="psRnedlV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1360A1CF5F4;
	Fri,  8 Nov 2024 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049020; cv=none; b=U1ury2muGZzg1rExoIqF9B52asGusXDZfsFsTcSc+NWU0l2uJW2NB/XMt1Ia8yfMpVhfdlhTyaTz5oEjIPorqBxfrpTOMQIrblLlo5oyCfD22AQIbVxmzkDGzKOGP/UxRVQ91XEa4zGaTVniLkx8qRv623hH0U6RIZjI5gtN0To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049020; c=relaxed/simple;
	bh=krPF8bE1Pw+JIEbBWkHjdlETlrvcr/RPLZzkQc7cRgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tDv/THfFOdeyDNnRfgKVTN1zmE8v85HXncnk3nmQ4WNiATsYsulx1XJmQJMMy/osw4w5Lrm3VbDT/3kWJcGYVnwf5Qf3u5dr7kxWyppU2y5L7DG5nasLlY5dbxrUAPDHVDUj/q1IxJHlRN6gvuIE/6s8HdSLFxHQfYH7KmQuzxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=psRnedlV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731049014;
	bh=LQGyr1XSjGE9ZDiGrm/yDf2dGEiFCy3MIqS0AIM0Wg0=;
	h=Date:From:To:Cc:Subject:From;
	b=psRnedlVLhvL1xwwjLulAcUugSj1Kvf8XVgJlpu1dhMnivJgePQmWp4iS1yKVVbv4
	 gkQhu55nqT01nTh00RKXPA09ONRK4Aqh/WcapbLALY2QHU7iq2shqhvlDxF1bmIQFJ
	 sLszjTNhSiBz8iS+b56/Yr9yczqwOJRme8k4/0VHKp6/CWa15IQ6rRPMlv3CB1JC1S
	 ZN+N1xrs3bYdb0Bvs+TYu89x347z8aV0vPjfLdHE0pnA7qkNEoYj74rsXxt5/d9QRp
	 fTKRJTMT8L1kLp975pVzo/NVl5e2C6lYvFqNdYAe/kp0/mOG965SOq9F/jvoJzNWhS
	 NoHzdL9kVppuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xl8r52c5zz4wbx;
	Fri,  8 Nov 2024 17:56:53 +1100 (AEDT)
Date: Fri, 8 Nov 2024 17:56:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Philipp Stanner <pstanner@redhat.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241108175655.6d3fcfb7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9cS_GSxxYOx_.WHv0fv0wLh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9cS_GSxxYOx_.WHv0fv0wLh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/drm-mm:571: /home/sfr/next/next/drivers/gpu/drm/scheduler=
/sched_main.c:1359: ERROR: Unexpected indentation.

Introduced by commit

  baf4afc58314 ("drm/sched: Improve teardown documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/9cS_GSxxYOx_.WHv0fv0wLh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcttjcACgkQAVBC80lX
0GyaaAf/eOLS6c0HIrzh5Q3g4RELU5f9WzYrcmAembUOfNR9nM8XcJi0AkTAC/xD
a2h9KC05+oN2rVMbRQ06ewyPAyMuifQelDoG6CShmie4pZp5QxDUxbkb0ZwvH/KS
r0H/VhPmcWFwtE/gyY1dNhk0cEMLQEjZR9cPfkbXvCEBUvlH/e2aerHn0jEYJCIJ
mQgO7USdzwhGp0q9vGgZPLo8jMO7QIVuAusc21ILmY6F2iFS46Ds0Zb0tEAz04d1
hHXpv724oO+MnFpw5YUf6AVhx6LdmirUallkO9cyJZuqvsHJGRn81x33wRaJr7W3
qL7D0Y2Mxt72KFIEGx6ahnhOh4EIDw==
=KhiW
-----END PGP SIGNATURE-----

--Sig_/9cS_GSxxYOx_.WHv0fv0wLh--

