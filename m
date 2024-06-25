Return-Path: <linux-next+bounces-2664-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1FE916650
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 13:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD57A1C232B8
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 11:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEE1149C6A;
	Tue, 25 Jun 2024 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrA57u0v"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848F47A64;
	Tue, 25 Jun 2024 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719315408; cv=none; b=dHwfWv1griRaOf3l5sHNruorUzyzFSKMXN2sSTgxzWKWEtgL5IMCZQYeBPk7wmbvfIAqezFLdlc5qv3HaqUsY/KyGt4GuU1qBmAnxVx5VkQBY6SEucqltEFyIJ2zpVfPyhdkn0ctG4SimX8SkFCyR0nJfR/Fu1/zQBuWAE/Nu9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719315408; c=relaxed/simple;
	bh=1vayWtGsXIHmbim6YmAINiLiTe7ksyVQW9xad6dS01k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XAnfJZ8SxRakHkXmUKRqX9T+UUcKpx9F3pg3xhGhuBEBv+z8E37O/j9bqQRbinN395iSCO8Hogj7ua6nAnMd0AetQ1zjn6QSntwhStBTnifU72401++4CQaIcjXQNfjpZKdFcKYdn6l4M9/Z9G+4abvzUCjAbf8iIeUgadWIzRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrA57u0v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404AEC32781;
	Tue, 25 Jun 2024 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719315408;
	bh=1vayWtGsXIHmbim6YmAINiLiTe7ksyVQW9xad6dS01k=;
	h=Date:From:To:Cc:Subject:From;
	b=CrA57u0v4Y/kUKlUe1VEkVEUoFeaOhe0R8SQ4rmLolFt3CRADOoXvTVjFJL2S6xXI
	 V7A0gatEmMvTAeFZkCt5exjMHN9dlFluURiokb2Fn5sXnM7ynNMkBW3E+I4PNmfM/1
	 KLvBQSwAJ5g9GGFT6DWqC7XouO79eKF3tUzj/mkj8x8ynJZdWdu8ebdub9S2jn7qAn
	 yXbP3rMLAEK+Z2UVviWeASSbfJZ8E2SHrJtHdSGVTmtspFu5nSTxGtK8Du+qFHhoJp
	 +75gQ9DrKrQJ2nYrxa1zdIzstaLi5ZFIETRAtC9PPMzb3JFiLJndQl1TF44m6B0hjC
	 i9aBbzu228bCw==
Date: Tue, 25 Jun 2024 12:36:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the qcom tree
Message-ID: <ZnqrzC35XKH3XNVg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N7PPyFVAYBxZFVrB"
Content-Disposition: inline


--N7PPyFVAYBxZFVrB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the qcom tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: modpost: "__auxiliary_driver_register" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
ERROR: modpost: "servreg_loc_pfr_resp_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
ERROR: modpost: "auxiliary_driver_unregister" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
ERROR: modpost: "servreg_get_domain_list_resp_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
ERROR: modpost: "servreg_get_domain_list_req_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!
ERROR: modpost: "servreg_loc_pfr_req_ei" [drivers/soc/qcom/qcom_pd_mapper.ko] undefined!

Caused by commit

  1ebcde047c547134e ("soc: qcom: add pd-mapper implementation")

I have used the tree from 20240624 instead.

--N7PPyFVAYBxZFVrB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ6q8sACgkQJNaLcl1U
h9B2Lwf8CimZgqYQ8B1E4t+tkB1pWP/1x7+sBeCS3tumdwb5XCCbpC8wkZ8bU58+
gkzL1clpaflsGFr2U1mPoptSGHrPoM46w+VjfJEZ/fw+XudkABVR6oymh4PCbTUj
/8hUitY/OKUdB7gEidEdJmNG9eU/YBS+YwPW7G1ST+05LF+bDM/0Yfllq9xKcldK
lDTTDdJsPZyDGI+ahkQ9qa6bt4pKXb4FpPGn2Q38osnn2dJnZl1Ym+MiXGDcrb7T
1R8OBtkuj/68GDHn+V+yb/FhIgte5aUuratXspVj5KjzPsLjQInH8JLR8JAMRh1F
LdG+yuITp84RbcgekGdurNymTujw0w==
=7/LJ
-----END PGP SIGNATURE-----

--N7PPyFVAYBxZFVrB--

