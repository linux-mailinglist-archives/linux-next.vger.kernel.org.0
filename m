Return-Path: <linux-next+bounces-2781-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A391EB4F
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 01:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186E21F2226D
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 23:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9188E172BDB;
	Mon,  1 Jul 2024 23:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b="dqNO2QEQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.rothwell.id.au (gimli.rothwell.id.au [103.230.158.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE1685C74;
	Mon,  1 Jul 2024 23:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.230.158.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719875966; cv=none; b=bpJGFOxKAtrH5vjAQXAHigtx2AHHCUrVGJyii2s1Wr0N4LJE/tf71DgMSYGJvYEMci297isvmkw70akAq8N/TQ99W0fCPNLtQ/glfkWAbXA3L/UyWuO9W6dgtgW4hmUg+Ch0ERg8IuLWQCO7+q0f8pB+qbAg7J92YyxdpuvWmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719875966; c=relaxed/simple;
	bh=6/tUiMxEEZVfdLohUSs/3BaOuf1zNln8q9fpCuM06Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pkKRlopvzuCOLX9lpgCwR3Kr/6/gs+tUKkKu5RT3gDruWOenoJbTJ4ljOg2ecPtnl1cXvCXnYcy/GnbWyHkgGL0RW4eUATJNFrNtIiXCF9FoODx93oB4WTNxUv7Z7kQWzLrpits9A+ksKPUXhKFGE0UoXoubugbuHgHCd6mDTHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au; spf=pass smtp.mailfrom=rothwell.id.au; dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b=dqNO2QEQ; arc=none smtp.client-ip=103.230.158.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rothwell.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
	s=201702; t=1719875636;
	bh=6/tUiMxEEZVfdLohUSs/3BaOuf1zNln8q9fpCuM06Kc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dqNO2QEQ4wU6DQb9b2r7VC7wPGiDRGBYueYdsaREgmgwaMXn7znvSIOVcDOUs3THG
	 7T7+x3VxUSQCVF2ac1OxY9DMMU0CPIZPTyhfeHyJp0nfqoSmv0tiDa2FtopPbah46r
	 4ei8AhhdNNHbqqWNvTgxY92mLl3+8juShENlQDrMOSfEYylYAOThhS5fL/pk/pcfG5
	 W+O14L61Dxr8b+A5xOrHnVi5VXQEA6aZK/lpv1RkF2dkgSsD19iu5n+Cqy7tfunM8n
	 DvrHUE5AZMOBoPOBnUENBcaqZ27shGCMuuZUKNSi5HhBlZuT8ua2dyj/GUexDs4e7p
	 zOtjyjP4cIgsQ==
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.rothwell.id.au (Postfix) with ESMTPSA id 4WChgR6p5vz3m;
	Tue,  2 Jul 2024 09:13:55 +1000 (AEST)
Date: Tue, 2 Jul 2024 09:13:54 +1000
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown
 <broonie@kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20240702091354.368f4d0f@oak>
In-Reply-To: <78644a85-9e42-8af7-778a-80383bc7c0f4@foss.st.com>
References: <Zn8TKYDCOCtbbNH8@sirena.org.uk>
	<2024063022-trapping-affidavit-56fd@gregkh>
	<78644a85-9e42-8af7-778a-80383bc7c0f4@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IwlIge1b6sSr2u3Tklnf5m=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IwlIge1b6sSr2u3Tklnf5m=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Mon, 1 Jul 2024 11:41:09 +0200 Philippe CORNU <philippe.cornu@foss.st.co=
m> wrote:
>
> Many thanks for this fix and all my apologies for having creating this is=
sue.
> What's next and how can I help?
> Philippe :-)
> ps: On my side, I am still trying to understand why I did not "catch" thi=
s issue that looks "pretty big".

There is nothing for you to do, this fails only when the drm tree is
merged with the driver-core tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/IwlIge1b6sSr2u3Tklnf5m=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaDODIACgkQAVBC80lX
0GxiYggAmNrd01vETqF3Cl//OxwLwb6AzwOKeSHv6DAX6EBTiYTZNejf9wqYXO5J
abhhwJmcJKluKeyRsHuyO58EkYiz8BcPIcJs6/Qhnqjvbh2YEy4+JFPpXQpeCINl
cQ5muInxTCTvB2l3YuKTiHCH+Lh6KUs2/BgNh7BV5epduwumLqOEFjFriZCtEn4g
SXXHLNiMm2HviSva7lsihxVwKLho69OPsXdG9oMPjmQIhDJO5J44az3U8zHjrBu5
hcZMfVS5TJk3yAeDsqTSSjdPpXOkAtJT9fm5aYVT9IdXCkJ3dsuyyyGWSMKJWifm
Go4+Q0+p7Wnww97PIt3OlQuTR/D50A==
=1gey
-----END PGP SIGNATURE-----

--Sig_/IwlIge1b6sSr2u3Tklnf5m=--

