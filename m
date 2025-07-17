Return-Path: <linux-next+bounces-7609-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF8B09690
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 23:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A95BD7B752E
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 21:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8292309BD;
	Thu, 17 Jul 2025 21:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WUt7qee1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FD922FAC3;
	Thu, 17 Jul 2025 21:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752789203; cv=none; b=UenTLzsuHs4W69ivycnXCxSL4ZhuidTAWHzNftVYPV1oYgk9Xubl96bSOwH08ShG9bS3L6Nc3VWW3rUDCT+1E2Ks5WAa51+MJGyHVsk1PJ9Av9/BCHpGvy1QmPXFl3n4tIe4+Ex159lscazlZxa6FNQkpixZw2QSJA0/F6liGuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752789203; c=relaxed/simple;
	bh=GtMgELCWvRoFo/rYn6zH+dCieTJu9K8Blbs6bK9Gi1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fi52wCdJ+Sq7h8vhaIAGcP4g7inNz/BgfQp63C9jCx/X6esZMi2WToS58Aip0ULIpauXIFPC1F87RIloKanfwOBERBNn4wY10vl2h2RR4+OgcdIT+HU4H523Jcp+5LX5dcQvcdTYfiTLc5CtwoghmvimiHLT8WE7vYVaZyRHTR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WUt7qee1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752789069;
	bh=qJ5RAy58CkG6yS8iKowZUkPvQ1WrS8QmeADwW+qbQ3k=;
	h=Date:From:To:Cc:Subject:From;
	b=WUt7qee1dfYQJsApFrBHgdqWX6c/rP4gv3RlNhavokkgEprDUvdFigCmADsJKL28u
	 cPvYVHUS2JCNf0VsKZS9O/pIn3wbGF8/krO3Xwz5/7l8IKNGo1DMQVSVs9zs23Pghy
	 V8xSQJXRqfnqrUbsLFWYNm756phFUINMB7cbKvOI/l4l8yYhj8xCftv3MwcSciAB84
	 P57NakLURxIuYtB6cvkm/rgl7hh33NokUtOhZmoYZZ/yL+tQ1PZgKCtQ2M5yc4CEfq
	 R4rRj/j9FO3brJIW4GRyjj527ZZv1YIUElwRtZ1MyD1wnNq9BiPhCOTGfxvuRulhdv
	 n06GoMugUOykg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjmp52WXvz4x5k;
	Fri, 18 Jul 2025 07:51:09 +1000 (AEST)
Date: Fri, 18 Jul 2025 07:53:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the qcom tree
Message-ID: <20250718075315.0deadce1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PO3ecYEOfBh=QNqPDkgFo6U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PO3ecYEOfBh=QNqPDkgFo6U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6d5cda400e94 ("arm64: dts: qcom: ipq5018: Add tsens node")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/PO3ecYEOfBh=QNqPDkgFo6U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh5cMsACgkQAVBC80lX
0GxVbAgAoSkehIJbhoKb4MDDcDu+uOnQgmuc1BZnLxJb4RzKOSma9CBWyqXPI6Zq
Tofg8h+V882f2BYynNbwA70xWro+m9Haq/keuOThWqq/xipXizu2E/RMs154/yKL
d5ZjNGZofLJp+khGv+LOhmVbeMTMzN8RIdIfNyeYswAb+ou9CVidVOsd9Tv8PTgQ
O3JrXvoBZhC1n0NbPCoedzhNDZ8E2FExVBTz+J41ZwLZCP30uc8w66Yz/Wxv7h2m
gouxQ3pY7JpbWjTxUKtUf8NtXU+dBM1uC3LfRyYIr3Jqzj23gfBVVTA+PRlwyqZY
STQCiPHIdDSEoSff20iAaNJmb0vaaA==
=T4Mj
-----END PGP SIGNATURE-----

--Sig_/PO3ecYEOfBh=QNqPDkgFo6U--

