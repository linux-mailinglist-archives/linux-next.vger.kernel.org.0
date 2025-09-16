Return-Path: <linux-next+bounces-8327-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76867B5950D
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 13:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38D2B1BC7CDB
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 11:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727E92D781E;
	Tue, 16 Sep 2025 11:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKqMrsf2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B21B2D7809;
	Tue, 16 Sep 2025 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758021809; cv=none; b=AzEWxpoAc/siq4Cz+HRB1TnhnuTc2AHkTJSIG+mzQ0EICktk2lkaowILfRxoQL6utnf7y6/Gjcwgjs4hscaOlUq4bOxJTIOTNO/+ysWCJZt4LLptze/lKuq1sBpb7Rn/zasPXvLx/sdljpIAI/QO8jKM5jz/Cg6gRLkTc0UW6Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758021809; c=relaxed/simple;
	bh=6tDrpdhPLTEfuY+tV0i58JvkH2Dlan4wPPgWzmqyBvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ds86F6YJyOCM3FMPPwRa/h4sU+dtUsXCFLWQfW8dLs9wWtFdRUE3dUA9ABLaclsbHPxuphAJ9pspJZUo7wlWaU/3j3XxJ2f5hkaUBLup+XjNwtFWrf/xdrj9zIC83bF0fiIE7xK3ZLba4IyriMAVL3PU03UvYtr3hzGX5dxdrwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKqMrsf2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFE0C4CEEB;
	Tue, 16 Sep 2025 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758021808;
	bh=6tDrpdhPLTEfuY+tV0i58JvkH2Dlan4wPPgWzmqyBvU=;
	h=Date:From:To:Cc:Subject:From;
	b=RKqMrsf2UHNrYUJa3kUsw13jc5n3l0wOhHOirYn6aHGO0INzIoHYZFN3WIA6+zaZT
	 hU3Opd2paY8RkS8aKnH4pcTMCBuwQrjJUe32wi8kfhD66r2CaXkvBIvIhyFelTtXgo
	 huuCsdtNvjY+eUxaEQc1yZbZgnM4P3Ea6WYaB0TKW/Ko4EZl27qXSI3Lmc686qL+7F
	 hIWkbwb8wW58CxAA2zP/z7EBQ0MNirsV3W7eUbsBC/KCaAfzCkqCBRpKZ1py32UDq4
	 sJMfieQxK1bfvR8MLH948NVyZtyRqOTRCB2ccYYhgcjcRXXifk8rRJqWIno2XH+Wt7
	 Vz+YijDzI4ZYw==
Date: Tue, 16 Sep 2025 12:23:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iwlwifi-next tree with the origin
 tree
Message-ID: <aMlIrHaHOu0a8WGG@sirena.org.uk>
Mail-Followup-To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Johannes Berg <johannes.berg@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u1cxLif8y03RwBjd"
Content-Disposition: inline


--u1cxLif8y03RwBjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iwlwifi-next tree got a conflict in:

  drivers/net/wireless/intel/iwlwifi/fw/runtime.h

between commit:

  7bf2dfccc2dd7 ("wifi: iwlwifi: acpi: check DSM func validity")

=66rom the origin tree and commit:

  db29d6fd9cac3 ("wifi: iwlwifi: fix remaining kernel-doc warnings")

=66rom the iwlwifi-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/net/wireless/intel/iwlwifi/fw/runtime.h
index 806f9bcdf4f50,8e858e6b3ce38..0000000000000
--- a/drivers/net/wireless/intel/iwlwifi/fw/runtime.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/runtime.h
@@@ -113,10 -116,23 +116,27 @@@ struct iwl_txf_iter_data=20
   * @phy_filters: specific phy filters as read from WPFC BIOS table
   * @ppag_bios_rev: PPAG BIOS revision
   * @ppag_bios_source: see &enum bios_source
 + * @acpi_dsm_funcs_valid: bitmap indicating which DSM values are valid,
 + *	zero (default initialization) means it hasn't been read yet,
 + *	and BIT(0) is set when it has since function 0 also has this
 + *	bitmap and is always supported
+  * @geo_enabled: WGDS table is present
+  * @geo_num_profiles: number of geo profiles
+  * @geo_rev: geo profiles table revision
+  * @ppag_chains: PPAG table data
+  * @ppag_flags: PPAG flags
+  * @reduced_power_flags: reduced power flags
+  * @sanitize_ctx: context for dump sanitizer
+  * @sanitize_ops: dump sanitizer ops
+  * @sar_chain_a_profile: SAR chain A profile
+  * @sar_chain_b_profile: SAR chain B profile
+  * @sgom_enabled: SGOM enabled
+  * @sgom_table: SGOM table
+  * @timestamp: timestamp marker data
+  * @timestamp.wk: timestamp marking worker
+  * @timestamp.seq: timestamp marking sequence
+  * @timestamp.delay: timestamp marking worker delay
+  * @tpc_enabled: TPC enabled
   */
  struct iwl_fw_runtime {
  	struct iwl_trans *trans;

--u1cxLif8y03RwBjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJSKwACgkQJNaLcl1U
h9Aqdwf/fkqvy0MGEnRLjOw5oad2gk8H8TATmA+At6PlMbCgyylhMvMlAopzm3S/
Y9wGyeQszNsp8e4HGmUGPfKW3oIuTr8NbDpmo9XrX/EGrnFvS/l7gystMnc/EHIn
TbmpaF/wCBbjWjLSnmSetjZN4L+eHOxatMLcSOFyyBsB1Vq2dFJYejOaTbqHFl0d
3UJG/yMn1XHw7zggzGZjYE9ZCuuNifosxctkdCt2pSw0GFK6mOrzdOFVUeSiO26q
IFaY4C8wEv5xNTH+fYXDOete3sjb2t0F0kvbPiUpucKHiKDQuOpoEGVuIOO3Zzvq
ER3wotbMxZa+Z17gn+dPsYelwv3DgA==
=L47/
-----END PGP SIGNATURE-----

--u1cxLif8y03RwBjd--

