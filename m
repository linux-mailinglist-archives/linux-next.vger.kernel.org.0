Return-Path: <linux-next+bounces-8664-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83912BF3E00
	for <lists+linux-next@lfdr.de>; Tue, 21 Oct 2025 00:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C2274846AD
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 22:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17322F0692;
	Mon, 20 Oct 2025 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NZHj+G+L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FA1226D16;
	Mon, 20 Oct 2025 22:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760998812; cv=none; b=bPZRAwW5t4CVqdRqJ+3dce89pi3T+eCPoR/vFPnk0e9WiPeL5l3MjhWo5bFSwV2/PIGQlcBXuI8xJdMnMhoi999Tm2ZMnbM/eI67JlAfI7Hs211EHtIQxy9qQ1DP0fRqfDVfHhVrlWnX5Ar3w7wmi/yiS7x9x1+zSi/31zldkYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760998812; c=relaxed/simple;
	bh=EdMGs+gLjfXh5G/SdgdBE2zJUIvMRuatOcY8AUK7rU4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6mXdAk/fW84Rg7vuYqQxWhPCJBU7ct+fxcHeCjH230+RkP65blY+c1rcMIdOCJjUsfaMokZIVlQRSj/T4VM7PMEB1QwFo7be/leQPVL4yFxQPV3oymP3Roy/M0kBLguAOeTO7nZO2oQ6CzWDyvMqSjHo+CAyrZkLpGa0pl3gn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NZHj+G+L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760998802;
	bh=p/n/h4oBr0yZKKrAd4vDFRw29PGPvcFw0Y/tzEl7VXE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NZHj+G+Lg5sECSN0sR9l9K59vcEwKoOQmshkvMFn42ON3lswKvxfTmlRQGVNMzZx7
	 TzLGfrYQXjXfoRrZIqHK49ZFP2/FwTddh1YAddYVtpbnpnUau1HwA7E2vftlCV31pl
	 yq1Tg42UvBTWIIYRPLWtI/Bc9Kw7q8g4tgOLdvvMVKUttJicKGNDRKLWMo1iYrnARG
	 zpg8iunqa29So8Z9g3ZUkLjX8SUC/ITWh2J4Ia4SGZs92Q/s4Dz91t34nozJI29bC7
	 axBeHHf3uzwPj4mIt2vMp02XTzxX+ZxzuPMcjbxy/A53LLXipnhtvTjbneKT2WWpRU
	 k2NYM/033zpfQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cr8xZ1dB3z4wBD;
	Tue, 21 Oct 2025 09:20:02 +1100 (AEDT)
Date: Tue, 21 Oct 2025 09:20:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Johannes
 Berg <johannes@sipsolutions.net>
Cc: Mark Brown <broonie@kernel.org>, Johannes Berg
 <johannes.berg@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the iwlwifi-next tree with the
 origin tree
Message-ID: <20251021092001.6ebae622@canb.auug.org.au>
In-Reply-To: <aMlIrHaHOu0a8WGG@sirena.org.uk>
References: <aMlIrHaHOu0a8WGG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p/MHfA/NjXlWYSQB5cM3qlk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/p/MHfA/NjXlWYSQB5cM3qlk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 16 Sep 2025 12:23:24 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the iwlwifi-next tree got a conflict in:
>=20
>   drivers/net/wireless/intel/iwlwifi/fw/runtime.h
>=20
> between commit:
>=20
>   7bf2dfccc2dd7 ("wifi: iwlwifi: acpi: check DSM func validity")
>=20
> from the origin tree and commit:
>=20
>   db29d6fd9cac3 ("wifi: iwlwifi: fix remaining kernel-doc warnings")
>=20
> from the iwlwifi-next tree.
>=20
>=20
> diff --cc drivers/net/wireless/intel/iwlwifi/fw/runtime.h
> index 806f9bcdf4f50,8e858e6b3ce38..0000000000000
> --- a/drivers/net/wireless/intel/iwlwifi/fw/runtime.h
> +++ b/drivers/net/wireless/intel/iwlwifi/fw/runtime.h
> @@@ -113,10 -116,23 +116,27 @@@ struct iwl_txf_iter_data=20
>    * @phy_filters: specific phy filters as read from WPFC BIOS table
>    * @ppag_bios_rev: PPAG BIOS revision
>    * @ppag_bios_source: see &enum bios_source
>  + * @acpi_dsm_funcs_valid: bitmap indicating which DSM values are valid,
>  + *	zero (default initialization) means it hasn't been read yet,
>  + *	and BIT(0) is set when it has since function 0 also has this
>  + *	bitmap and is always supported
> +  * @geo_enabled: WGDS table is present
> +  * @geo_num_profiles: number of geo profiles
> +  * @geo_rev: geo profiles table revision
> +  * @ppag_chains: PPAG table data
> +  * @ppag_flags: PPAG flags
> +  * @reduced_power_flags: reduced power flags
> +  * @sanitize_ctx: context for dump sanitizer
> +  * @sanitize_ops: dump sanitizer ops
> +  * @sar_chain_a_profile: SAR chain A profile
> +  * @sar_chain_b_profile: SAR chain B profile
> +  * @sgom_enabled: SGOM enabled
> +  * @sgom_table: SGOM table
> +  * @timestamp: timestamp marker data
> +  * @timestamp.wk: timestamp marking worker
> +  * @timestamp.seq: timestamp marking sequence
> +  * @timestamp.delay: timestamp marking worker delay
> +  * @tpc_enabled: TPC enabled
>    */
>   struct iwl_fw_runtime {
>   	struct iwl_trans *trans;

This is now a conflict between the iwlwifi tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/p/MHfA/NjXlWYSQB5cM3qlk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj2tZEACgkQAVBC80lX
0GyKFAf/YiGALghSl4RiJdULy3cXPrxrvi2Gakxzok4PrOwPFrIrw5FAXHHTaHUH
2Bc19J8FlPqYTTYGQcOal7ZIlx1V8CJesw27On3+iqTeTL5HGqXit4P6QitD5a4B
mIypq0XO97a43j5wFU6mTx0TQ1MY/J81WtZP9BvaKX7GIpLLk12IzzSQ+4EAZVI1
8QpStGHKggDjbHJc/G5RGbOnexMk20Y2pHdSWv1Pr+3kk0EUcfzI6+tTOQ46+hov
2yGh2shYlDbEjHAt0dHylm6OWc2jEl0utyd/I/35wSmJ6qbxCVBpxWOiSOuNXbcT
L3y/8Bq4389P1k8c5ILGCOKwT3HxOA==
=LYK3
-----END PGP SIGNATURE-----

--Sig_/p/MHfA/NjXlWYSQB5cM3qlk--

