Return-Path: <linux-next+bounces-7804-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1007CB17C1E
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 06:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8DF05A055B
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 04:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985481F03D9;
	Fri,  1 Aug 2025 04:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cedGEkSX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029CD70805;
	Fri,  1 Aug 2025 04:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754023221; cv=none; b=q1CVU5jxrtDLxRp40e++pkmfWfhq1/QvLOYpWDOQdaUKRuIWj3uU2RMQrd192dKV/efJIAU/tjcg07pwq3fp14SZ9So6BQrP6VFg8qmlALv01NcDIR5X4H3Oj23ObKmSKKZS/aosZntub6A7wdf7hTj+L+8Kdk0yIGCj3bXEhNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754023221; c=relaxed/simple;
	bh=UMXokGCSmTtoPcvM7d//OLN230DgWqQtv/WPGiPAZ1U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GrQNjhFcglO3W/DwQ0P0hEZXKbwYI0+/kJnA435WJOg3alywtVS3lBrHOfUpN+bZlByWnBXNF8/o8Bo3bwMXcROQYZnlnrTQibrGFnSYMSTTUwQ2zSF5tAk2Joz6TOwCxV7PynTX78zQuc/XobIM2TuqowTmL2xHIASrHF1ngpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cedGEkSX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754022987;
	bh=sV6mo9ZCyDloUTZ/QsaeKaHmTXRkm+ofv5og386E/BM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cedGEkSXunKwuaJolllvp9Y8zczJ1Q8151B94XnKzHugmSqteCBmNQA5FJRflw6Js
	 XEsOqLLJqOViUwwDNy4ZKYqKxgiedXPyIplAHfKsHDKAdbArb1PD1zBPaH7CmXsV6d
	 3u37pKk31Cj0f1Jvalomr1fUsfUd8NXxun7df9RFTC8jMM/ArY0SNq60WoWKu+L0Ch
	 Ux9vMoCrMtFIu5uJNcmS7w9C3UFiDljwdsyfN/6TYB25iN9d5o6UTiXYSou1vsw67F
	 AVVVhsbmunuH8UMQONttA6rFmDj3wfrdhoLQf/rh0OWWhLWU7x/U8HnuXJ45vlAgb5
	 FK5hRAg/iCxaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4btY7H0Vp8z4xPG;
	Fri,  1 Aug 2025 14:36:27 +1000 (AEST)
Date: Fri, 1 Aug 2025 14:40:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-msm tree
Message-ID: <20250801144016.4e00f355@canb.auug.org.au>
In-Reply-To: <20250708192038.6b0fd31d@canb.auug.org.au>
References: <20250708192038.6b0fd31d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YEita2wiN.0ABjIrOGUKkji";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YEita2wiN.0ABjIrOGUKkji
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Jul 2025 19:20:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-msm tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> drivers/gpu/drm/drm_gpuvm.c:2445: ERROR: Unexpected indentation. [docutil=
s]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2447: WARNING: =
Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2451: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2452: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2456: ERROR: Un=
expected indentation. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2457: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2458: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2459: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
>=20
> Introduced by commit
>=20
>   471920ce25d5 ("drm/gpuvm: Add locking helpers")

I am still seeing those warnings.  That commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YEita2wiN.0ABjIrOGUKkji
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiMRTAACgkQAVBC80lX
0GzVFQf9HrAOQ3YOJaQSCXdGcCiPfOYtQ/+NY6pGOu6ezc8sZANzKCGln30SeCho
TxJpr696f8b+r5mG8TiwI3wWYD9gQauuvWqnS6MumyNiXLvtAVhPrWhCAPbyO/7n
ehaQxkVMIXdkUemGceJKT36X1u97yL1xkCHFnuhZ4K/hQehr1Cwugbj2EL6Il7QV
iOrWcVQO7MT08kny7CnoZxgDDMcnI/qt9noJvJmQbIvlS7luIK2xSLCXO3fwGIRX
WIDyZyFU/xs1sYvM9UexHegWjNBRiwOd/UrlMfumaop96ygTnzIfdjvdhakMvtSX
XuMe6Mt6xVzgfGsKFniugf2i5W4cwQ==
=5Mf/
-----END PGP SIGNATURE-----

--Sig_/YEita2wiN.0ABjIrOGUKkji--

