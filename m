Return-Path: <linux-next+bounces-3321-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74195267D
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 02:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A056282D10
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 00:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0111A20;
	Thu, 15 Aug 2024 00:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VsTayENF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A1436D;
	Thu, 15 Aug 2024 00:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723680411; cv=none; b=agHHyJeAJm73/2P9QzqqWj+R8G565rBnviVUs88wfvmu/saydrNeMjyOy9MccYJgV5DMQUnK9uAXQpI4gv60aAHxgX+G5lyOSVml7kR25NDFEI3Ag7gziBTatUQaHHByPa1M7h92lST0pAaBlYLbNidMYjkbLMkUL+LarMRbsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723680411; c=relaxed/simple;
	bh=H9pfpREOJDPtkrlyrUSjaBWRENw6kdmQ+s7JxNpN7wM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/vtRhmvzazAY5QSHCqY2lBZHp0ehNxmLkyRZbDKFFIsHHhzTYFJ+lOXHu0AzeDx16jmiIbPIMoMT6m4DLRezaQvkPcPYuJ871lTjzgNgWo+0TQ2tmgb/uzt+EisMaVAJKE8m5sRVCOr8qG/StznE+BjXz19Ivr/GvsD4Qlr+oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VsTayENF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723680406;
	bh=ARl6f8MSkmz4JW8KuWT5Ct613OXSeMqqRaXctk8vXfE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VsTayENFexUTHo1E6Me2WO/9yntTir0HgT7/dLkq0dCnj3QJeq+RDp597bONQAZG/
	 Sgg9njVEwgVSb1NMgpyDhiIwFTtLkP/txzXzetiyB+0Q1esm21R0fUmrT2lcmpnrmL
	 Apa/s86LcLpMg7bpBW6lT8GtRrHTeyLfODRlqKAO5dc3zO6U9ErWw50YwZhepHOl3D
	 KvE3/FKz5RWEelWlEBgHljagavCUbYHnf0V2Sl3Li7AMP3TjKY6kZ8JlvTFlMDAAOk
	 xSq8oBvlGUnlf82ySn2qc+SepuV5snK34ZzbzT6kwXR+FHALrz8TH3HN9OayI4oVhk
	 84hhPOX8ImBxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wklm642Yhz4wp0;
	Thu, 15 Aug 2024 10:06:46 +1000 (AEST)
Date: Thu, 15 Aug 2024 10:06:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20240815100645.25b7a87f@canb.auug.org.au>
In-Reply-To: <20240815095734.751c6ec5@canb.auug.org.au>
References: <20240815095734.751c6ec5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TSXRc_dSfWVSOG_aED9w+eg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TSXRc_dSfWVSOG_aED9w+eg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 15 Aug 2024 09:57:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the mm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
	.
	.
	.
>=20
> Caused by commit
>=20
>   2771559a5531 ("fault-inject: improve build for CONFIG_FAULT_INJECTION=
=3Dn")
>=20
> This is just whack-a-mole ... :-(

These files might also be worth a look:

$ git grep -l '\<debugfs_' $(git grep -L 'linux/debugfs.h' $(git grep -l 'l=
inux/fault-inject.h'))
drivers/gpu/drm/msm/msm_drv.c
drivers/misc/xilinx_tmr_inject.c
drivers/ufs/core/ufs-fault-injection.c
include/linux/mmc/host.h
include/ufs/ufshcd.h

--=20
Cheers,
Stephen Rothwell

--Sig_/TSXRc_dSfWVSOG_aED9w+eg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma9RpUACgkQAVBC80lX
0Gzjewf/aZF4t0WVC58aCraPlg31GNZSQ/ITCta+G376KMzlkr+pQqLQ+v1Ow3Mu
Yhug4RwXG+zvLan86Kgq8PlZrvsoh0os5YAesjY3akU92UbiEqscBwyxdbTct51s
xbUPPvK0eq10ql/LmWmowoqR9EeF7Sb5QD3mFh+FW4PhvDARwsiP4ho2BbRcRrQu
KKNtX7wmUv1UU/X6aGv5mXSbUzyCy6K0HKVlRVb6zO7FjMke9tHUnAzClVkTBWG0
RwhbkZmGzN4zgNJ+v7MgOBgSfBVE5+jEWhHGnzIk8shwTFF+2iLyOfJYdEXINkVi
VSLAXGDna9jt02Xt3/aElEjRlsbqxg==
=x/+5
-----END PGP SIGNATURE-----

--Sig_/TSXRc_dSfWVSOG_aED9w+eg--

