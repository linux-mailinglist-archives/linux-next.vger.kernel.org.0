Return-Path: <linux-next+bounces-4818-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DF49D3250
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 03:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 081E1B2310A
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 02:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B82446A1;
	Wed, 20 Nov 2024 02:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uybYeJe9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936420B22;
	Wed, 20 Nov 2024 02:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732071444; cv=none; b=gsrSSnOqolVHERkNO2V+XfSTpJ3R0ImBMCvo3XjcYc7DcYiPCCqAHTFz/ChJ1KYaveHuf+XdI/JkKNhagbFnD3KuRwossdN3+aZx9yGJ4hoRp8EU57qmd3BfgMXm6gBWW0VRbAr9/DSXxbhpHBy395DYgbwvxQHG+Zt6O8+3ru0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732071444; c=relaxed/simple;
	bh=G10UPaBnUBavmugrnHhPQkyktEYU71RIp6L8EISqH5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VmNwY6MwW5ZhPkuu0Hbg2Q96/a3SsDm8TVUYuCIO5VaNfCkZv2nAIRxuUSmp0siTh8UCGSlTetaUhjX8CakgkWr3uIOw0e271A36lBlOTxBtUVk1PmVeI5RTQYRAMf0DPTIILlzi5ZjZzGnmc1A1q170gPd9KEVuHvwxZy3TvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uybYeJe9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732071436;
	bh=+i614AaB++4PFOr4rkVDfFFlj6DDy3/1nHoYC9M2bVM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uybYeJe9BipUN6W8ZuN4jix/7gDo8TiuYupt96X8bXeyEzqzuh0SlsoEVYePDX8U4
	 FZPlkUuAyk57dDUavpO7kk1q30sjb2cDKTX29Cu6a+mu0RSbxdlT+CQTuA6jLSRq7k
	 faPLLgnX3af4KXxR7gGpgmVqE1T7l9XQJW35RFTbdOzmKHYXS0hRTGqZNg6VixMxsc
	 zxBeOn7VDcFrNd5EDePve1nqHuofKQmqt6qIsi+uWm/HEdMpCLlL54JAjG9XuYw5Lv
	 U5xd4r1wZNe2n6uCUnCOXlTcNNZpY7de7j9OhPKlwiXmMSfEHIJ7ECvl443hrF1aWg
	 m2AU7NUsEtV3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtQy424gGz4xgn;
	Wed, 20 Nov 2024 13:57:16 +1100 (AEDT)
Date: Wed, 20 Nov 2024 13:57:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm tree
Message-ID: <20241120135717.2be629ee@canb.auug.org.au>
In-Reply-To: <CAJuCfpGNKzBadFix9WpN-PQMr2Mwj1NjawzSk8ycBST9USKpcA@mail.gmail.com>
References: <20241028111058.4419a9ed@canb.auug.org.au>
	<20241120120124.03f09ac5@canb.auug.org.au>
	<CAJuCfpGNKzBadFix9WpN-PQMr2Mwj1NjawzSk8ycBST9USKpcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xNL10=yQuMtDeGbs1e6_n39";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xNL10=yQuMtDeGbs1e6_n39
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Suren,

On Tue, 19 Nov 2024 17:09:46 -0800 Suren Baghdasaryan <surenb@google.com> w=
rote:
>
> Let me try to manually apply it to Linus' ToT and will send a replacement=
 patch.

Please don't.  Andrew will tell Linus about the conflict (he has done,
I think) and Linus will just fix it up when he merges the mm-stable
tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/xNL10=yQuMtDeGbs1e6_n39
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc9UA0ACgkQAVBC80lX
0Gy9MQgAo+0peXQ+g+4RbfUQqVzA8U7iW/Tbvw4lQ11bb755gQB/XFCZC+TlW+2r
IEPzDOYWvJ+7ULaogyZq6+I5CDQvwx4Ksv7x/Z8qi9cO4GM2e2OIWiHm3O3XXvjr
TE64Bnu2sWAEkCQXcOZ3vSeVX2FZ6bLpeqWFN7M/AV7oYDQAn4ftDQwhmPtF0wlP
2ZNbhPd3tc4COT8XpWf4y4WC3ZZ6meIFuXYsVYJOr7LcUktNYmKeUG41zZ8PMMDj
Bza866l8zXSuTn8rMNsgD+R0I1btqAxHErIM+J4NwzWG9kSKI2qYcLVp67ISz53m
YoLkQWygRbR6K0OmArvei5ZNilMuEw==
=LRaN
-----END PGP SIGNATURE-----

--Sig_/xNL10=yQuMtDeGbs1e6_n39--

