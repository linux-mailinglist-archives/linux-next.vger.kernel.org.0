Return-Path: <linux-next+bounces-3409-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FE795E56A
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2024 23:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 223411C20C88
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2024 21:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358D757CAC;
	Sun, 25 Aug 2024 21:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gMXCW/Be"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AF32F34;
	Sun, 25 Aug 2024 21:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724621237; cv=none; b=YxWFyeq4FqXyGpvtUIAw6RvRjYVY+Vrb+CNEWru4HOCpSU6qfsCfo8tKB3qRPHdi6TcHnfbj4wNROeJKgHFCHpzcNo5YUpMY5W/TtDjx8e/+vULhFtHe+QB08UYgG/oH+vfyDkbPXXsIgJItiYaB9ZWZEygjnBkHOmuTOcKmg78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724621237; c=relaxed/simple;
	bh=D8sQQyuqWl/Sf31wE1VNxK3QC7OCBFoJMgZNn/2G6wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RJA9zQ4yRx2P4FJMngJkbUN4kXYxqTMurpVpvPVuX/z8zgplZgFsYF6fmw3dJCDbSDXuBvWJ2idDSPyKWFbPYub3pAHuHS1ihEcNMUHtbXUXgwFesc1t0aEv+8w//YzzrNy1Dwioj2Iq6qunbD/x9AEBMEg1LRIIPWjuxMw3Y2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gMXCW/Be; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724621222;
	bh=kooGwXWHRwXXBSuZ9pRDjETETiQP0zaJE9KyF+QdJJk=;
	h=Date:From:To:Cc:Subject:From;
	b=gMXCW/BeCF2hya7CAToqxTnfJjfV7svOzKTewtEipEBtzq4AWoyREj38DuhjYP+X+
	 jGNtQYUV/z+JjDqV+N3qZwS1RuSrlolb1+UVceGlx1VGr2ZqrRi2K4WKfWgAMrcu1g
	 ifUc/JbEDBUKBf0YjL08ZJfvhHWv7qLNWvjLaj+OV3VCQTDQCVD2R6NiZEIXV+MQN5
	 uwrBdOBDps7MN3aQ/UYRbMKCyE37kYCS29WZZeE/qLnEAWUMwV77z1F8xBZcJ9qwSd
	 PdOTr4JYTOaDcVCzQcpXdF98Krj+YyYmy0A2yjCpAZjN4i3UjgDZ/ziO+XAk5tVaWC
	 8ayRwYAcvpC6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WsRhk0zDhz4x2M;
	Mon, 26 Aug 2024 07:27:01 +1000 (AEST)
Date: Mon, 26 Aug 2024 07:26:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-ID: <20240826072629.21b175f0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CdO7vxloEgEchXxHUlE1.=l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CdO7vxloEgEchXxHUlE1.=l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  81c87e0a531b ("mm/memcontrol: respect zswap.writeback setting from parent=
 cg too")

Fixes tag

  Fixes: 501a06fe8e4c ("zswap: memcontrol: implement zswap writeback disabl=
in=3D

from the mm-hotfixes-unstable branch has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes
  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

It looks like it the Fixes line has been split by the quoted printable
mime encoding of the original email?  There is another QP artifact in
the commite message as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/CdO7vxloEgEchXxHUlE1.=l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbLoYUACgkQAVBC80lX
0GzhKAf9GeqyetsH6sIjbGHVBHzXlCQKURm1XErPxik92re2qYomdnK9BjkHScsn
34ABv2Aqs6Ay3hl7n5loAntzkYgBwm6gUdQxI+L8nB/GVGR8f2ejI0RPiEs9RM1K
wUZPCoAS2gf46TNS46hN317F/LXk65+Mh7COx4sY41iAQV2DY3nCYuWwtjrMvRtO
rlp4EBtZRkNJK1x/14WxzaEq6SH2XebrrRhG3qy4A80WYX6V2P/WOvriSRN+iab0
iAUFtT+BIDHrr8Ad9ojenVbTYRxDT6LN/06slJ2usgeYuWMaW8O1FeqqKDL4vGsq
1hO6jlAcFmtfuqtFQJXzRvgqb6WJ2w==
=g82n
-----END PGP SIGNATURE-----

--Sig_/CdO7vxloEgEchXxHUlE1.=l--

