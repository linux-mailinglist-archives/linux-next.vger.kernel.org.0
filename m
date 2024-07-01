Return-Path: <linux-next+bounces-2746-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB491D8E4
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 09:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65A7B1C212E6
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 07:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701A761FC4;
	Mon,  1 Jul 2024 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BLpHAa/E"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A637F1B809;
	Mon,  1 Jul 2024 07:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719818823; cv=none; b=PvfnUxxMDFf2kGBHfIXPAvdhotN2WuYwaHmwuCVc96cfAsl5kyIPJ/eMq3CSQMlxXKh7tm0e4s//sGTYhhUGdsl7shOAIKBryUj0NKtUydeO+RRQgUqiGZEuQjOHOuZQjviqtS9jz6naTd5lo0UmRVv9tn/Vn74/x3d6ZkRyZhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719818823; c=relaxed/simple;
	bh=IjM158RGboPPOQCeDxcAKHL0YMk6767fMxMahPPa5AE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=awl2hxqDRfOq61nonvx9+hI3ZQm7PWSxISHD/tKRYIlxR6bAE/vzO7tWOmpviU+QAQl+lZ0XRivsJluY7cdpxRi9kOFWk4FUlI1irS3TGAzse+9Md5Sz2/tCoVtZOKRZO5EDp/edn5p2VdlLcOV4uz12+fBe84BWeui2AVO6otI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BLpHAa/E; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719818817;
	bh=3s3GOYGnn9c6E94kTyUMZcyHysLRns/RZ7yO2LN9vI8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BLpHAa/EeydkNYG4+TzHyYfnzIXhWW7bL97PPbnncY27yLAPzx8soiaYDFmsLXy4w
	 PGKEwaApCRAY2gCq1Jg5lQIKndJqn/adFRECusI14UK56IaDVTd/smtIQD0RCcwpDR
	 JL8fqcfVvRQoK+phtdoZnp46/DPYNOiKdpISnUZcXg82M4jOjur4FgeUaflhPnxP4q
	 5oNbuJcQfxxziJpLWSruNLv23X8bArapUQeDjTU5YJkPzEC4Rghxm2cPA0/1EU+a+l
	 00tuZE2QP0WyCytLu234jlnysrUncMI/Gpwb4vpyUhlc6v2kCGjopTqCM56FDaptTI
	 N5KJ0iVEOz15g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCHfn1GB0z4wc1;
	Mon,  1 Jul 2024 17:26:57 +1000 (AEST)
Date: Mon, 1 Jul 2024 17:26:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
 Steev Klimaszewski <steev@kali.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rpmsg tree
Message-ID: <20240701172655.3db48d51@canb.auug.org.au>
In-Reply-To: <ZnxhiKAYvoqNIywH@sirena.org.uk>
References: <ZnxhiKAYvoqNIywH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cfQbcrVmOLpIqD7lRdyQ8SO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cfQbcrVmOLpIqD7lRdyQ8SO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, 26 Jun 2024 19:44:24 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>=20
> After merging the rpmsg tree, today's linux-next build (KCONFIG_NAME)
> failed like this:
>=20
> ERROR: modpost: "__auxiliary_driver_register" [drivers/soc/qcom/qcom_pd_m=
apper.ko] undefined!
> ERROR: modpost: "servreg_loc_pfr_resp_ei" [drivers/soc/qcom/qcom_pd_mappe=
r.ko] undefined!
> ERROR: modpost: "auxiliary_driver_unregister" [drivers/soc/qcom/qcom_pd_m=
apper.ko] undefined!
> ERROR: modpost: "servreg_get_domain_list_resp_ei" [drivers/soc/qcom/qcom_=
pd_mapper.ko] undefined!
> ERROR: modpost: "servreg_get_domain_list_req_ei" [drivers/soc/qcom/qcom_p=
d_mapper.ko] undefined!
> ERROR: modpost: "servreg_loc_pfr_req_ei" [drivers/soc/qcom/qcom_pd_mapper=
.ko] undefined!
> ERROR: modpost: "auxiliary_device_init" [drivers/remoteproc/qcom_common.k=
o] undefined!
> ERROR: modpost: "__auxiliary_device_add" [drivers/remoteproc/qcom_common.=
ko] undefined!
>=20
> Caused by commit
>=20
>   5b9f51b200dcb2c3924 ("remoteproc: qcom: enable in-kernel PD mapper")
>=20
> and likely others, I didn't look too hard.  I have used the tree from
> 20240625 instead.

I am still seeing this build failure in the arm multi_v7_defconfig build.

--=20
Cheers,
Stephen Rothwell

--Sig_/cfQbcrVmOLpIqD7lRdyQ8SO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCWkAACgkQAVBC80lX
0Gx5Qgf/T838srJ+Qymk46fPuIzdY/jnIwo9sTNxDDTNRvp5T+wNbmpvMjZvgL22
OBbuJvKho70ZMXfZnKcDiVm3TzNtsSWh2gdcbrPpXkTzoaWJPakyQBVLYUF1zOAx
08Cv8RQ2CgQMDiBPloCHsZ+eOIdocxrcGdP0HdOve3suJ5AI7OueDNuyDKOQiGM1
FmqTRYiAbWP+ct56uucrgZo29iwSb8CC8qGhROiEZYGziqmXcp7y7pcyr/5bH4Bb
vky8Si/cYHlkgweyR5uM/e6yx1htlnU+3omXRDeLR1SHYjUNl8L0+A3zG50q6cSL
vnZ74GkAqj4dtT6zEJLF7HTT6VsdKQ==
=KELX
-----END PGP SIGNATURE-----

--Sig_/cfQbcrVmOLpIqD7lRdyQ8SO--

