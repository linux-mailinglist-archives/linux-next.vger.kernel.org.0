Return-Path: <linux-next+bounces-6905-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACA0AC19E2
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 04:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676831C03257
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 02:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A610156F45;
	Fri, 23 May 2025 02:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tv1JAM1/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C68A2DCBE6;
	Fri, 23 May 2025 02:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747965834; cv=none; b=QhWYtFnsHuWMN0v8dkSI/qLot52qiEPglN3Zux0oCixJdpJVe+PcPQojo/HwWsTK/aADS7BPn9cPR4OLAGN32s4xZcxxaWpBYb69wGErpKksy40d6VXB/nxn9GN3jtgsiCCExe8IpmdWP0Dl99ZvycDUS0AVBed4WkxHoNtViJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747965834; c=relaxed/simple;
	bh=23kdCtMSdu9j9J5Z3D7oyjrshZgGoHj8VBf0i+9+dZg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u08xccMfsY/Zx4qmkNCFTsJyJOIZlFxB13ZCfyYXug0BB3XIZ2B32Y+1nrWyLnIfgE7RHMfrxamrWgXFyUoB5tpOFjrEvyLJKGQ2SMgzHmpk8FLnlOXnK8s/sD8eyFRNeP+UN6auSl7qTiHbxFCahIvwWIW5pzVDzKoe5cn9QUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Tv1JAM1/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747965829;
	bh=TxOIBn/9xfvnI3IlWBgVl/mDgJKHg7NhDetZFRiZ95A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tv1JAM1//JGVV6ZMGNtBrM3dJivYl+3y0l70WyL5yHcPrFo2bOEGcMrK+ItfQsqfm
	 +cI/m1r/6agLyh2AGJ6jxZmM0hhg0PZtx0j7mAT+KFGNZIakQ1alDIoptmChbMII84
	 s4ouWT7FrWVIdZEXZXpYmUTAdG6zXCiEILMk/aHlTEPhuN7lTndYvUbbWHFhpO9hTy
	 7wkIqzXfMdmPbX7Y1FBEHWNqYd0lslZWCHnWQ56jT13RUhuX+mRuel/1WIJo1Tuq9G
	 j606A/2J3MWmSuycY9tFFvvhXb9NyU87Hdzq1716D7YWdfUWjjBmBALLUpPEzAAqFk
	 pPMQqrjPxAdRw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b3T3T5WMzz4x7G;
	Fri, 23 May 2025 12:03:49 +1000 (AEST)
Date: Fri, 23 May 2025 12:03:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the cpufreq-arm tree with the
 configfs tree
Message-ID: <20250523120349.2ab6ef8f@canb.auug.org.au>
In-Reply-To: <20250513120342.10988bf5@canb.auug.org.au>
References: <20250513120342.10988bf5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EQo+IfNubxbk=ACxR1vfTTj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EQo+IfNubxbk=ACxR1vfTTj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 13 May 2025 12:03:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the cpufreq-arm tree got conflicts in:
>=20
>   rust/bindings/bindings_helper.h
>   rust/kernel/lib.rs
>=20
> between commit:
>=20
>   446cafc295bf ("rust: configfs: introduce rust support for configfs")
>=20
> from the configfs tree and commits:
>=20
>   6fa5ce832520 ("rust: cpumask: Add initial abstractions")
>   5feb286e16f4 ("rust: clk: Add helpers for Rust code")
>   3044627e1494 ("rust: cpu: Add from_cpu()")
>   254df142ab42 ("rust: cpufreq: Add initial abstractions for cpufreq fram=
ework")
>=20
> from the cpufreq-arm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc rust/bindings/bindings_helper.h
> index 1a532b83a9af,7c1d78f68076..000000000000
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@@ -10,7 -10,9 +10,10 @@@
>   #include <linux/blk-mq.h>
>   #include <linux/blk_types.h>
>   #include <linux/blkdev.h>
> + #include <linux/clk.h>
>  +#include <linux/configfs.h>
> + #include <linux/cpu.h>
> + #include <linux/cpufreq.h>
>   #include <linux/cpumask.h>
>   #include <linux/cred.h>
>   #include <linux/device/faux.h>
> diff --cc rust/kernel/lib.rs
> index 354eb1605194,871fcdc09b35..000000000000
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@@ -42,8 -42,12 +42,14 @@@ pub mod alloc
>   pub mod block;
>   #[doc(hidden)]
>   pub mod build_assert;
> + #[cfg(CONFIG_COMMON_CLK)]
> + pub mod clk;
>  +#[cfg(CONFIG_CONFIGFS_FS)]
>  +pub mod configfs;
> + pub mod cpu;
> + #[cfg(CONFIG_CPU_FREQ)]
> + pub mod cpufreq;
> + pub mod cpumask;
>   pub mod cred;
>   pub mod device;
>   pub mod device_id;

This is now a conflict between the pm tree and the configfs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EQo+IfNubxbk=ACxR1vfTTj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgv14UACgkQAVBC80lX
0Gz2Igf/Yw4gD2hO6T8LgQMK+I/oDVnBH9Y+m2fPzehxhmAAs3qEgybSjbagpIwD
s2S7zsskUQKFM98hzA0o0cRZV2Gv+k6osPeoM7q6cdFLFrB1mxVHiYPBY89OzSyM
Z42Wbhymc2NnyqGJY7ZgwcRa3+PLcWupQSyzNh9TuQt+BAP671fDevM9wCQykS3B
v84HLTpK/iwBOB2uvNfLF58jEOru7HDP3MFddabRtERNH1zzyTslZeBVhGVJ5mjo
T3yXu/WxStn0FkaNb+kC7fSF5svrlAaXUOTHgLHLyim8bfg3hht7kAkor6WXlmbh
7RdkBDoasQ2zwfXc8iMPmkqy/A1j+A==
=jKJn
-----END PGP SIGNATURE-----

--Sig_/EQo+IfNubxbk=ACxR1vfTTj--

