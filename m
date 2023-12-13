Return-Path: <linux-next+bounces-385-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA2581202C
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 21:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6D271C20D71
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 20:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB54338FA3;
	Wed, 13 Dec 2023 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FEJQvpla"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A6F9C;
	Wed, 13 Dec 2023 12:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702500347;
	bh=5GMpPPKkjli4S2G40aUAA7GwA63q542tCYEU3PJr86Q=;
	h=Date:From:To:Cc:Subject:From;
	b=FEJQvplaiHT9FKXQi+N+jsqwJ0WL7E8G9+Ru+9y7Syri1lRD09A1ru8jYs1G0Rhrs
	 gnZfC1R7KVmLcauT7wG2GliTebcJxa3Ma7a1Gg1tQa/8cFlJzWyOhBlrFWlrDRI+DE
	 oz7ZNqS1nASHKo26reg3n0ru0hMrD1P9kEndZgXOIl/EAcsfRqyJ91c5UCkenV2AEO
	 NrnkVxfrxU4g0kLwQtbAyhBEUOlVOXNXz0VLKMJOujOmDyrdkWy7OAGs1OQueFj4eK
	 6CHmN3Oft/kMpzUvYQcaSOkfGMdoGBtTbIUCjOyZF4Yh4t4LDjCuqqnmi87KPTUhQq
	 4OxtRHhdbM9WA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sr6vH2xZHz4wdF;
	Thu, 14 Dec 2023 07:45:47 +1100 (AEDT)
Date: Thu, 14 Dec 2023 07:45:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Herring
 <robh@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the input tree
Message-ID: <20231214074546.453a926b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T1oOcLyVsQ7/xm2RZo395XB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/T1oOcLyVsQ7/xm2RZo395XB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  877ee02cd962 ("dt-bindings: input: qcom,pm8921-keypad: convert to YAML fo=
rmat")

This is commit

  53ed3233e6b5 ("dt-bindings: input: qcom,pm8921-keypad: convert to YAML fo=
rmat")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/T1oOcLyVsQ7/xm2RZo395XB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV6F/oACgkQAVBC80lX
0GzqBAgApUbV2hf43SCziVUMx7hWpQU442ovzZck7iI6EytQdpCqTSIf/b7tXfh9
tVFBFULBOzfaZirkXDr9biZDlToHRXRhyMDHBoiWYJodO96bz4XmMfz4f3royjl0
CqL5OTSiazJb9VXbiQdTPFuqUKz89UpMkdvOGsxvG1RjBRDb4BdhKKX7xIlP9BxV
5OqxQff30/UQOUkwNCMqzawE+cKM11VvRnXtIpmsxPpHfcdEgN/D2sfZ12RILi33
RwZCy+wxGHOKR2zzBOybFAVzC3BN7+8YQfk09ZYnnzOuHQL7ZyuBu/nL5n2Arr3k
sCjujy8UJabZyDYY0p1/S3w2wd9wlw==
=FdE9
-----END PGP SIGNATURE-----

--Sig_/T1oOcLyVsQ7/xm2RZo395XB--

