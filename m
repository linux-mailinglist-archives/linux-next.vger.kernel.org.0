Return-Path: <linux-next+bounces-3257-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5A194B5AE
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 05:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 281191F231CE
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 03:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD5B78281;
	Thu,  8 Aug 2024 03:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iPjqzQm0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976F25FB9C;
	Thu,  8 Aug 2024 03:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723089504; cv=none; b=XYsarZgEF/X37AqmEtadADhYWcLnK0+u+nZHZAofsqK1EKDrL4cD/afwE4gOIso9LzlRZIq/WyW1EoKETMhhB0uhFeB7EdcO2K3Od9NhOFC+T3N/PJZESQs4/3N1yAF5Ms3h4gHNnmTdylZzUrgR1CV7VZy/39z/IliNWtWj0Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723089504; c=relaxed/simple;
	bh=+9rdzBsr0htwR8Hq5XfMsRF4lvKQmew0oWrmgUbM4XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l3o7Wo+CF5ON8MOSTodInJD9/LmJE6QfSjhuJqau0eXFPA9MxoukNs/txvsFT3AqlglD6+qzv3oDZ2eJ6ujmltwmtmF5VJKZX2fP8kF97mS8mv69Gk3OsXK4K/FsUFXE/G3DigOlukc/MY+kK+vCjSVf808jHKL7hRyo4hC3SE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iPjqzQm0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723089497;
	bh=1xxGJDcK15w64/U6BT43yx1jQ8k6rctFSZN1VAiJOxI=;
	h=Date:From:To:Cc:Subject:From;
	b=iPjqzQm0GoYOy3+eHLduRzmW4/tRiEdMCpqdJwd8yaWsmp1TZdYGkmexgjMyMpo1/
	 KzybKp50ATv0BMb2PwQ4YcVQloOCIG//nabcY7599jIWjs8j9LqnmJIy15vEbbOv8G
	 iLki9tgnfBaUsM9DUWHMu/weH06UfPYTS00V28auOLnIWwqioOLwQUiUEE82H5Z2dM
	 LgA8+kV4Nr89+/Ob+AF3Gm3m2o+y+nwgmRISK3j4/SL/sMGAa0wibySVomzq/aNN98
	 a3sNVCfUfs4XW4vJco0ymOdwwlIbWzn0MGcxi89iB/4xTVCwpBCh5bbMAkVfyre625
	 BERXfBFbAsf9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WfYDS6jwjz4wcl;
	Thu,  8 Aug 2024 13:58:16 +1000 (AEST)
Date: Thu, 8 Aug 2024 13:58:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-hotfixes tree
Message-ID: <20240808135815.5e3f50b3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6AdgICgD4593a607BTn_R=W";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6AdgICgD4593a607BTn_R=W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-hotfixes tree, today's linux-next build (htmldocs)
produced this warning:

mm/memory_hotplug.c:575: warning: Function parameter or struct member 'nid'=
 not described in '__remove_pages'

Introduced by commit

  ff4440b02821 ("mm: keep nid around during hot-remove")

--=20
Cheers,
Stephen Rothwell

--Sig_/6AdgICgD4593a607BTn_R=W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma0QlcACgkQAVBC80lX
0GwDMggAgEWC8ymopw7eGy7yfFoHI70Lb3eoottTWNSgGpl0IE5mJ+gFHOfrvPjl
r7tu8aG31AFGjhZmajv/hVCvnvYbpoAOUXVGANTT9lkXO+AfoGm6O/QzKvHM3Utp
AnKyKEgUnknV7Wix9G3yGirWOmVLrN3wlUE6A0u9n8IuBCiR9KNBqOaegU7FY6ht
pvQbaMktyncPf4NZ46APXt583Sxy5z9nHhzA6dV8t43sQ3NvfKDgePM1AgvmLkaV
qHQsZagmi6nDpt4G9YfUE4PgAzt+LHWiiJLgCdHNAyoICAuIonmUHmp5v/QBrfKa
QVUch93wpHqPmNSuZKfmQvuMBGf8aQ==
=XWHc
-----END PGP SIGNATURE-----

--Sig_/6AdgICgD4593a607BTn_R=W--

