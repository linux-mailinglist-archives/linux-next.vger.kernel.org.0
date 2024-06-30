Return-Path: <linux-next+bounces-2722-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D80291D4AF
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E28B6B20CD8
	for <lists+linux-next@lfdr.de>; Sun, 30 Jun 2024 23:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDDD3D388;
	Sun, 30 Jun 2024 23:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tevq+fg1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A82D45C18;
	Sun, 30 Jun 2024 23:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719788961; cv=none; b=Cyn9c3bKrQmKKwwcz0ZGZQR0T7s15qJYn7M6Xx03JiuNUVydA/rzpBZ1g4x3u4BHhGX4o0aycPHQcBYWILQ22DRpcgXmszM4GJM5xJrlqrFbigBqGVj989i4CzNkT6jLzudm9Aqhs+t5LZtKZtqPdSFdnfWZF+6J93RHIJs02kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719788961; c=relaxed/simple;
	bh=oJUvNd8+Erzk7yzDx40vkFWIXQ+1rv/mENLB2vpcpEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qEGT1kq7O9QQDovwrporJ06j+UVa912Mgsc6kkelWerh1KmgRtE8AblVnNEiO3HfPz06D4hOntL6CDNCDOw9zAGNKZ2Fc5KdVlVKDggTy55SXP7kalGh6ooqh26pkF4qOYTM8mDppgN/wLN1ndH1A3TwRnq9AdVyMt1/mn766eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Tevq+fg1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719788955;
	bh=+gIHKdQRK5Z4MWlbiZxnXGJUYKXbMvf1z3fPt2s7qOE=;
	h=Date:From:To:Cc:Subject:From;
	b=Tevq+fg1TAwfR2U7UV54qWSwbWQFFX/D+FjNY3a1VPQChc63PeV9nsYQCXXI/RATP
	 /Zskj7bTyGBlkAc47QoOsmlA316ZiZkeZxp4IbSb/SRU7oZMoWcyCzzuYWFeD0eeOu
	 0SQS7+ua5GoPlxTCO7LdVSr0XaAmFconERogBwcSA86Ukrvptrc7dZq3N7bcv1tldc
	 FTUvdPy388NiEKwFuNxks9Gj+TY4Kjm3EYwd8LBPs6MkCBmUq0IYQ02lRG6tiHF42s
	 MF0rQNpWmnOHenaGObsSeXkeRDK4sRlo1nOJLAELsTJZSmGqN8y3+d6NKtc95FS5Ck
	 KEyv+/Ey4ksng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC4cV6XQfz4wnr;
	Mon,  1 Jul 2024 09:09:14 +1000 (AEST)
Date: Mon, 1 Jul 2024 09:09:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ntfs3 tree
Message-ID: <20240701090913.2348f098@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CnYfNz6V0O0G_Q=++ulTpMi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CnYfNz6V0O0G_Q=++ulTpMi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  76a65ae141a2 ("fs/ntfs3: Fix the format of the "nocase" mount option")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/CnYfNz6V0O0G_Q=++ulTpMi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaB5ZoACgkQAVBC80lX
0GxcJwf/b6taKWXHr07BRr1sHHmxyrNSOt3ow7PQWQsKgOTJV+0W2m5DtLijs0+3
w16RGueX2nT2DHXANj6juAPZL6ubVLLFF7KJKuDo0WTf5q2rq/6kZ7Np239Nh552
3JvJELCufsQ+/UO2EouJqCkrNUlf24mJ6fneBFCczf36KB4EUpSWC+VGrRBW8BSS
3/XatLwJR6tSanjTL7t2gL6kL9W93wva7QZu8PHEJ9Px8KiN40rmwf1N8j+vmbAX
M2hWLTpT05RyCPo8cCoRmYt4CpEvRsGnxeGaLHwv2QgGszGSSCJfsE8cXHnc+BFt
x2PeRKomWv4tKusJ69OmN72XwngMKw==
=rlT6
-----END PGP SIGNATURE-----

--Sig_/CnYfNz6V0O0G_Q=++ulTpMi--

