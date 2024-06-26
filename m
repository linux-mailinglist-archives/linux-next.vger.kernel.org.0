Return-Path: <linux-next+bounces-2683-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED15918EC0
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 20:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC0E62824F9
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 18:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7956C190680;
	Wed, 26 Jun 2024 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxB+KB3X"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C57019049F;
	Wed, 26 Jun 2024 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719427469; cv=none; b=KCHwHd5SF9ZUmQI12YwQnX7mUJ0K/SOMuWW2MM1WTju1YqjCa8ZWlVLL/cgc6XzYRSTuVPJWIR2Zc7W54olTPO7owZ+b6zY6/2Bdp4ELpF3tV5L5avpHixPYNNsXa7ptMurN+qawFqhVMSbRMDrS/eO2H1tNSnSg67UD3zxExNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719427469; c=relaxed/simple;
	bh=6iYyaVtP6IDlOUokcolHOy/Z5v0Cd48VY8a4wi8+nNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fZ8+3ziTtSYDXqJ9DfCWGN/RfhEceIvVKXSkFf9BcJ6uqg5UL287d6xuvwBW5M1eDJN2XMfsgHdug8JOT3yO/8BRGRjeoSIa7Uu724uRxY7z3niydgsj1lp7zuyLb3cng0kDfPRVOI7PFZDzEXqg5tRyx0rma77wxc+SG2HXfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxB+KB3X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28053C116B1;
	Wed, 26 Jun 2024 18:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719427468;
	bh=6iYyaVtP6IDlOUokcolHOy/Z5v0Cd48VY8a4wi8+nNk=;
	h=Date:From:To:Cc:Subject:From;
	b=nxB+KB3XZd7QnqV5EHcwO0UehMoDDXPD55xaHtbm33p0qVbYMvhR6k9B4Og+GfI1C
	 TW+ZfdqytmtoIs7YWheaDa60OUGRpfA+/T3JGh17sEJPX429RaxLTMNMmtdvuW1Vl2
	 vGrOV6RHEoY6QYkWNg4RkO9cCBnsSWFr2Kho1LClESaKGQ9Mhqkn+t/PHnhfcqRmYj
	 WdNWtd13bxqB7whP1QfP0hVZnpUSsWMqs/0Ec2XYZFx/dz1jFbPlce+7wDnVjKhYor
	 /tFbBigaU6VB4B5w3bIOfO+DdEHkIIJPrQSBkjKHtz8/Yd+Mq0YtwapvOJWri7IR39
	 yba8LfwjKHvnQ==
Date: Wed, 26 Jun 2024 19:44:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Steev Klimaszewski <steev@kali.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rpmsg tree
Message-ID: <ZnxhiKAYvoqNIywH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sFOidLIdGbQqZVzr"
Content-Disposition: inline


--sFOidLIdGbQqZVzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the rpmsg tree, today's linux-next build (KCONFIG_NAME)
failed like this:

ERROR: modpost: "__auxiliary_driver_register" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
ERROR: modpost: "servreg_loc_pfr_resp_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
ERROR: modpost: "auxiliary_driver_unregister" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
ERROR: modpost: "servreg_get_domain_list_resp_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
ERROR: modpost: "servreg_get_domain_list_req_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
ERROR: modpost: "servreg_loc_pfr_req_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
ERROR: modpost: "auxiliary_device_init" [drivers/remoteproc/qcom_common.ko] undefined!
ERROR: modpost: "__auxiliary_device_add" [drivers/remoteproc/qcom_common.ko] undefined!

Caused by commit

  5b9f51b200dcb2c3924 ("remoteproc: qcom: enable in-kernel PD mapper")

and likely others, I didn't look too hard.  I have used the tree from
20240625 instead.

--sFOidLIdGbQqZVzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ8YYcACgkQJNaLcl1U
h9CKWwf/XsQJ2e/RIFzXBEAqmVl3wZ/nkq2CLCqFjCzDsCBKw0/z7XPOjdAr+ndW
KnwZhBQS4enuwkhRoxm6zmWCYXMN/ZFHNViDVyNOiLCTdIKpjWLjDbLHcsdBJ7MH
tWiy3WnAXrSmWrn//F0uY0I3ywK1WdASvogTgbEuBBQgSElE1ViBfYS0JCWhGdnD
sLi9Bnd6k8wARM1c+0DuP0QnlnSaijlYKeHgIlsWCf+DZp/rvkAD07OHp1MX6ffP
/1ZRuzDhireLZpm9PV85Q0eHUwJT0vaetiFbfX/49IgL2LfU+GPtpcO0wAFRxnqy
kEtBVhtvPZ2ErYKpVGz07d+5XWip5A==
=bNFO
-----END PGP SIGNATURE-----

--sFOidLIdGbQqZVzr--

