Return-Path: <linux-next+bounces-52-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 891567F6A99
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 03:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43A2F2818B6
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 02:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0F310EB;
	Fri, 24 Nov 2023 02:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pcZOQSMQ"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81B510D3;
	Thu, 23 Nov 2023 18:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700792238;
	bh=hVLznh1N/6w00XZWPeXHTEO2orW7OEONxjkwEONOiOQ=;
	h=Date:From:To:Cc:Subject:From;
	b=pcZOQSMQDRl/XIhLufCTaMrUfvYhta8I1mDlKR12veDD6pptND11R90w6DylFfhJ8
	 KcNKFH3jAKfOiRtmDYN4INYdWL7hC6RzZohlQwMMEmUVRIkogh6KGn1ZzBByLmGhwj
	 io/7eTtVbj6RAkanGS7H7EYHOMjNFbs3TArkCJZBs7mcpJXejrG8IetIY7OrV8iQnN
	 xmJrVRZUKdZqvSXs/ZP6Dp3TXxj+pUkedd6WnurUj1oPvEfr9b1KwVA1IiWr7R7gNy
	 Fh5RJUxCE2zYjotDUDrYVr47Vevi7EMwZ5ub9e1Y+Wot3oBHp8XRBkuc1inKUadDEf
	 vNJ614CL5z4Nw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbzC15Zkrz4wx7;
	Fri, 24 Nov 2023 13:17:17 +1100 (AEDT)
Date: Fri, 24 Nov 2023 13:17:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Donald Robson
 <donald.robson@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Maxime
 Ripard <mripard@kernel.org>, Sarah Walker <sarah.walker@imgtec.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20231124131716.13f6ec45@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iHKHr_3h.2UX98t0oNV=g3P";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iHKHr_3h.2UX98t0oNV=g3P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/gpu/imagination/uapi.rst:124: WARNING: Title underline too sh=
ort.

CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET
--------------------------------------

Introduced by commit

  815d8b0425ad ("drm/imagination: Add driver documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/iHKHr_3h.2UX98t0oNV=g3P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVgB6wACgkQAVBC80lX
0GzDKgf+IX4nKfbuqQG7jQERrxtwKtKeBdKnPIhO6UDc+IMWRbySt4rEZy3Jm/oD
Gy9/85oEQg2E4aXjpCVcYjZ5JG8iGwjWV8l21jVfomMAZg8IfVzIh+C9g9IlcsC+
KlGjgdY6R84kct8ycKyWvBU0lwNuxm6NxRhkftABxjk6IEP52a72O1vpl1bd7+i0
uWhwfcO2n3MZ3RZTwLJ0BIV+Rbdc0Ex3s2hmXTUyYsGWHTA/OySVSJNVcOJvmMEu
lSFjOjYlm4X0mbYJaINpB6ut+0+hYTF6y3ESZ+JwR8hj2T9SiyozjjkipxmNzEqc
RjXrzigw+Q0YANLzE1zXA5qpJIyyww==
=o6i3
-----END PGP SIGNATURE-----

--Sig_/iHKHr_3h.2UX98t0oNV=g3P--

