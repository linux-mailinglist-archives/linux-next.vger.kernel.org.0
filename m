Return-Path: <linux-next+bounces-2393-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E018D1031
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 00:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E0B81C21226
	for <lists+linux-next@lfdr.de>; Mon, 27 May 2024 22:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C081161B58;
	Mon, 27 May 2024 22:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AWXaxdl5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496CF1667C9;
	Mon, 27 May 2024 22:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716848373; cv=none; b=TAabmj81bRYVW8hvxBuga4HmwrUeSVCWMdx9qElK62yXcNB7DCEDG8ppMGz8GgLUXcPLHHVXLpWqvvQPzd/IBNY8kYiqLWejdWnd4NAt0dumpkVOvKdyVkOPq7daH8V3darn/jYL73IA5Ks+Gu8WrA/+UZ+LIKCMW2mnmnwuwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716848373; c=relaxed/simple;
	bh=ms53SJU8uT9WYVQRG8jVvS3grObwOxRhlhxnfU0ujY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JpN5S8lOHWHQZBlzfpYbUuZzeAd0Q1oSziV4HauAvWU8QLyPLB2MILSrLTRZHRsgRBVcxQArYF4RT3qSlk77Ud/QVKlpfM0/iq1T4sz7k30Hh7dz+dpeI8ilrsg0e9Ss7MPPrhO+UHaqLp5FwmUYRB63R9Nfi8mB+tk43Jr85b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AWXaxdl5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716848360;
	bh=xX9ZFj+rSlOvBdyaOW+bNOxJLkSdWp7W0ftITF3l/F8=;
	h=Date:From:To:Cc:Subject:From;
	b=AWXaxdl5yFbPBODhWWyhM7SSjT2iuTHqhG3gAaasVdkhzpAsSn/WQAmDxjGTt5gVw
	 GDs4J5/k3kkMuNmBkLsVBxpRLO2PxDAYEeeAv8jxVF5vZe8wMGZlwY4vXTKqsMtZ9v
	 b8c+LiV+5YpX2czqPWhdCEO5tntlQOciTq2kct1qIgg4DE3KQIiZDwybCdTrG9/6GO
	 WgBJV9xVSlDn094fHsq/6g2tdUyLD7HXA/lpRUtFx/Q0o4xt6+BFgZ+mQ0iiTLAWKN
	 WE1UMgPaex8l/40eCejPH5OuXDXZDh9gAMGNE3ueknbsOXVWrTPSrr0YiXVY2Ja0SW
	 RgMfCmhN4/wYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vp96c1XNxz4x1C;
	Tue, 28 May 2024 08:19:20 +1000 (AEST)
Date: Tue, 28 May 2024 08:19:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the jfs tree
Message-ID: <20240528081902.3677843a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P=UFHx9_XAwut6VhBoTFP+y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P=UFHx9_XAwut6VhBoTFP+y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  71653c99fce7 ("jfs: Convert dec_io to take a folio")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/P=UFHx9_XAwut6VhBoTFP+y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZVBtYACgkQAVBC80lX
0Gy1TQgAo69STWQIRvRTzHHSJF0I1/oHfwXHblxIqQIvV6qzPRJFreBB54cZcSeH
iDlRSQNnvzr5/kcgsWYHIt0K6a8jNT4BL6mgruxsncik6r6vSS3t7eV/70KCB/IF
RJFDwk90K5GVUpPwSVQ+EWhPGOQcFQlfuxZG/QDjHPsOTy+P1g5S2UtIsG1MFkkX
Xi02D95xddSlziVY8sTWeUnulhvpjjfNnWAjn/nsefKucyagVWZUeHQJE5QAsaGF
Y/yPYCKU65fWHV4/GiOeTL6uhCnzoCv53T0maCouKwp4LBccLO2xxPRdfVcbwoE3
RjEWX/NRu1eqnkbJ0T/PPUArLIbQTQ==
=ql3E
-----END PGP SIGNATURE-----

--Sig_/P=UFHx9_XAwut6VhBoTFP+y--

