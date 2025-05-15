Return-Path: <linux-next+bounces-6797-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA59AB8645
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 14:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5C314E67C6
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 12:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33D129993C;
	Thu, 15 May 2025 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gakFwMiP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A253A225A2C;
	Thu, 15 May 2025 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311575; cv=none; b=aHon8dVinMUbs8s8jw5/BzNv/my9y19mRuRWKKFbWf4C3IcX97x41MG/rDWTl8w2FtoBR9e5zzQ4la7Q3kdP0tBBM8kEyrvq41q+Fl3UJs8ztCr8Xpmu4TBuni79GLX8Qa4kt8xmQTUa5uuFQvM+nQFMpSN+q+OaG0Rfcbr78cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311575; c=relaxed/simple;
	bh=RZm0zMxQ7gP92G8rr2X9Vr4uXKpTObH8UjOLouXo/CY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwWb94QRHjYC62v8PdIAEx+AL51JBK/0711LriWyVnZXwfMd/aO9JdGRGfSsHn1Zs5Eg8/Udroweop7QvRrxO/Q+nWV4bHkCnmY0u/mKdARyacCOsAfCP+S0rE+rl7ybg2wYeBIJ+1cjTjoeSq27cqqi0wsW991q7vK4W4OHFPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gakFwMiP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747311570;
	bh=CC6SoWusLceviJgSwfEfgIz16XETIXeZWJyX89YKRgk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gakFwMiPqaxokkmnHOh05gVqUuC3Mdest/AHVrRM2+7kupfTaobAcSHSblNi1XZyU
	 ekM2CG6FDMjixDllnVWuwhNQD4cmK/WGAjDj8Degp7djwkfPTs6nav7aNckC87UIWV
	 S3PlQYF8jBpZD45iTV/TkKhmQRf58wyfuIXc18MJXCEzbTUtI4i9hLVw0aPTgOyekd
	 9LTT/p7pyW+Nt+IkSllbyD1sgiarPxukdqq5peoetyjPhoVfnxBCe5qbRPLeeE2XzT
	 PVlF/U7Eb8oDzw6VEUVkeoR+CAHvqJgI1OWO0CisvGwXvsqJzofYxO7UxSbcYS9nEp
	 a9I1ULycVu71g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zyq5Z1m9Fz4wbX;
	Thu, 15 May 2025 22:19:30 +1000 (AEST)
Date: Thu, 15 May 2025 22:19:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, PDx86 ML
 <platform-driver-x86@vger.kernel.org>, Suma Hegde <suma.hegde@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, x86@kernel.org, Thomas Gleixner
 <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <20250515221929.3d646dab@canb.auug.org.au>
In-Reply-To: <aCWyatvDQEG5l6NV@gmail.com>
References: <20250515164620.071d70e3@canb.auug.org.au>
	<bce51c8f-56c2-3a44-b590-149627398b7a@linux.intel.com>
	<aCWyatvDQEG5l6NV@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UkyIEVRKfR_y+/iaNC/pQ0m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UkyIEVRKfR_y+/iaNC/pQ0m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Thu, 15 May 2025 11:22:50 +0200 Ingo Molnar <mingo@kernel.org> wrote:
>
> I'm not sure that's needed, the above build failure is not really a=20
> build failure caused by the platform-drivers-x86.git tree, it is a=20
> semantic merge conflict that should be resolved at the linux-next level=20
> I think. (And which conflict should be mentioned to Linus by whoever=20
> sends their tree second.)
>=20
> Stephen, could you apply the patch below perhaps?

Thanks for the fix.  Applied from tomorrow.

>  drivers/platform/x86/amd/hsmp/hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/hwmon.c b/drivers/platform/x86=
/amd/hsmp/hwmon.c
> index 7ffb61e0ef62..0cc9a742497f 100644
> --- a/drivers/platform/x86/amd/hsmp/hwmon.c
> +++ b/drivers/platform/x86/amd/hsmp/hwmon.c
> @@ -7,7 +7,7 @@
>   * This file provides hwmon implementation for HSMP interface.
>   */
> =20
> -#include <asm/amd_hsmp.h>
> +#include <asm/amd/hsmp.h>
> =20
>  #include <linux/device.h>
>  #include <linux/err.h>

--=20
Cheers,
Stephen Rothwell

--Sig_/UkyIEVRKfR_y+/iaNC/pQ0m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgl29EACgkQAVBC80lX
0GzNpAf+KHmH6HV4a1K7x2ZV47INKRYARP2K+hb39kaoOqUv8Xs0aWZXA4e+Ds+f
bJoN4EQrrX5+hNsCR+dDiGEBXtp4LgotYS0MlOPC79sc6jDdeugUWvWrTNviWWuT
dhNMr7ky9VY3BMrWbcj97VRMVibC6gEW9NqRmuuBfEMNhCDmyeAnloHWtdEhminy
mkkebu94775OKahlUzyOI3R0Z0l6fx/QMVB1UzkocROu/v+spVAB9A9ovL1WIlM9
HCaID3doIayx5kkl0uD95qQX0hK0Rj8goUh4qmy5jPd+NvBRIxuk5DmJgFEufVPl
XGbtcqXBB3ieZbz9FLP1QLwKiRLkvQ==
=ZXva
-----END PGP SIGNATURE-----

--Sig_/UkyIEVRKfR_y+/iaNC/pQ0m--

