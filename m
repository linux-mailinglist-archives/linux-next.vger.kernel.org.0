Return-Path: <linux-next+bounces-2585-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E1290D540
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 16:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABBCB28159C
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 14:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B0E14EC62;
	Tue, 18 Jun 2024 14:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSDMnFA3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5270814F122;
	Tue, 18 Jun 2024 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718720164; cv=none; b=P1hFUnMy4xYGiEOHs0Chhrta+mNTTiID6w3CUScrRXo80OR8OuNVNOSV8HhENslOlXGP69U1go1XAyudWldX6o3kXl6w9f7V0rZ4QRQf75snGJKa5dE5APFBjRegkNuOY0oZ/7mXxiPw9FTb4QAgBOqpEa7lFhlqG7X2tYRDOTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718720164; c=relaxed/simple;
	bh=SuKo54mJTp3qn9/E+Pvq3cD3t44QEcfpj08R8YGj75s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ze37AkKcMnnbllztrzbSybJghzblKrX0geeMEpQcBpGdmmZK5RmNTZli24RND8bdCyr306ACOiVk2URcOy8P1MLeJg25fI0KDKtTdyRlWWcH4nPA+8RjYO/BTNAFoKCwmmN4T7Sq8deBnvbXAK8BOKiAaq6mUjk+YAwN/z5bKLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSDMnFA3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C878C4AF1C;
	Tue, 18 Jun 2024 14:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718720163;
	bh=SuKo54mJTp3qn9/E+Pvq3cD3t44QEcfpj08R8YGj75s=;
	h=Date:From:To:Cc:Subject:From;
	b=YSDMnFA3mw9VniGDf1Vqv6aYXlqM8PcWK8k0RY2UZRIp5Q14vaGNNpJ9txWvD1lsy
	 HZhPyCUuKtSLUqgyVkqFvUG8xwoKP82Kj/A8/8mwXyyiXtYend9TpSqUlGs8c+ln1l
	 spWkK5BmrnHe8W6/SRqNVCaRZ6H5iSDPOaD9OMeFwNAiueuA2p57E/ZpZUKbAfQQFe
	 EBmiqt2qOAqEo01nBDw7bWe+JrfbSSq6R/DbslME93q/IBU5nD56pmJjPf4mqkyWVE
	 dzR+kIKnsIoRUmQQukMaWVoCGHi+SP2bgBwNaNO61ltWjr/d2vGN8kzulBHuB++OJj
	 5yVaOZQlfNuSw==
Date: Tue, 18 Jun 2024 15:15:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: linux-next: manual merge of the nvdimm tree with the pm tree
Message-ID: <ZnGWnzrnsyD1j6Nh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p17999IqbySG9Nsr"
Content-Disposition: inline


--p17999IqbySG9Nsr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvdimm tree got a conflict in:

  drivers/acpi/nfit/core.c

between commit:

  4317874eac96f ("ACPI: NFIT: add missing MODULE_DESCRIPTION() macro")

=66rom the pm tree and commit:

  3101daba2b086 ("ACPI: NFIT: add missing MODULE_DESCRIPTION() macro")

=66rom the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/drivers/acpi/nfit/core.c b/drivers/acpi/nfit/core.c
index e8520fb8af4fb..5429ec9ef06f0 100644
--- a/drivers/acpi/nfit/core.c
+++ b/drivers/acpi/nfit/core.c
@@ -3531,6 +3531,6 @@ static __exit void nfit_exit(void)
=20
 module_init(nfit_init);
 module_exit(nfit_exit);
-MODULE_DESCRIPTION("ACPI NVDIMM Firmware Interface Table (NFIT) module");
+MODULE_DESCRIPTION("ACPI NVDIMM Firmware Interface Table (NFIT) driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Intel Corporation");

--p17999IqbySG9Nsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxlp4ACgkQJNaLcl1U
h9AZPwf+LXkGvvO+l0l0+ON8IbbaixD89ZwyEZap3xvR0GZUiwSEBNyxo6YBq7Cb
P/qkRubDLwhssJnucinDdmTxJWCqJYxTdan2lbO56pFQ2XxcjLfWBrIwthyAxoQf
MUmUnUXqdB7Iv7uSlLqEcjMNwY3d1fm+PNIgmib0SQfoM7W1SmneQqnO55AiIJny
BRFDtJNb6jeqD/v8VofQedSHvmJQD/g3YPUuSCr12FohI6BPTinXTMlATlObfgFU
2YRx0GLrdtUSRkDM1AD8HnB/jWEIhwLtR7Z0tTSkHwUMs3f5WjSpcNgacM6fMQug
rh77bSvHBe0uBf8W4SsVVKiMGDkVFA==
=G8GM
-----END PGP SIGNATURE-----

--p17999IqbySG9Nsr--

