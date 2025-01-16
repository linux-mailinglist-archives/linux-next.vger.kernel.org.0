Return-Path: <linux-next+bounces-5226-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C20A132F1
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 07:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B696F1889808
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 06:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5ADD1459F6;
	Thu, 16 Jan 2025 06:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R1cdnY09"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569784414;
	Thu, 16 Jan 2025 06:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737007686; cv=none; b=gESpiPjySKFOIgHiA1Sbv4xw/ggYCCjKyMh4AcKX6pUpiCxfOfXf58sElmOtM0lsL/Kjewqd/kwMKraROSQaCPuqhOKOAKEIqOsrWWiS3aCSiS1SXOB0YCer5Tzkb/iq22uGEo8+J3Sm8QSQb1pnjzY+FA4aCQn4WLEmF7iH2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737007686; c=relaxed/simple;
	bh=aozlfBMeNaXfWzZexMAo2jBOKqIjFw1qA5JP0zuzQLc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lFWhzMWwmeXP1+upThsVnLB8P5BkN05pujhI+tzGcSVCDA+yaVLyZmUAkMDh5UKeTml5R+Db74ulLBF/9NVvWX4rU0OFZqTNlS9GTq24jqXx3I8aKUgyAeWrKecUoyGb+YzS6m6PshdXRKg46NsFhDCa8fwyI3RFACnQRBlNaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R1cdnY09; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737007675;
	bh=TeaJjQclXiieRyqczNSx5oWONLO6v9jhRcEroFf1LCE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R1cdnY09MYX+UpNlwA1o0i0vlqmNewhR3DWcO4Azbx6+/wmn6XCY39LihFn3DdbrF
	 8CUWzITx/QSzMpM5GODpdJvTSDRmb+t8nzKywos7uYo8bB3juYmqyaMt6usRhNh79E
	 i0LxTNAnigbIc3S+J9eov0zrKQLYD2nDPjNBPyNN0hzHHfHxOkLfu6qhqIJ5GShJ1U
	 4cNO6P/p53eoUd4J3I8e+kv/isOmfitHFto0VC6cAKDUetkHg652TfX4fsI4WhSGR1
	 vkdNW8+rJ9Mf1JSap/ktMtb9KYGEUjPE6GmIb5gQP+LjFboIRyoRYhe1cZhWZRAILe
	 OuPzS2mcJFZnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYXTk527Wz4wy9;
	Thu, 16 Jan 2025 17:07:54 +1100 (AEDT)
Date: Thu, 16 Jan 2025 17:08:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Kun Liu <Kun.Liu2@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"DRI <dri-devel"@lists.freedesktop.org
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250116170801.7ee67a21@canb.auug.org.au>
In-Reply-To: <20250113155423.3be0e78a@canb.auug.org.au>
References: <20250113155423.3be0e78a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/whifXz+u.ftTh4z74Ip5QEX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/whifXz+u.ftTh4z74Ip5QEX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 Jan 2025 15:54:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/include/amd_shared.h:352: warning: Enum value 'DC_DIS=
ABLE_HDMI_CEC' not described in enum 'DC_DEBUG_MASK'
>=20
> Introduced by commit
>=20
>   7594874227e1 ("drm/amd/display: add CEC notifier to amdgpu driver")

I am still seeing this warning.  That commit is now in the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/whifXz+u.ftTh4z74Ip5QEX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeIokEACgkQAVBC80lX
0GylsAf8DPauo+P9yu3APjl/MgDIH4dLnydm4usscwdfn/Afbi0/iFq/BFS/VlFH
IPbhUJKWE/aeszMx2PkScrX3DooXLm6E4Rcp+s6djH3FVaofk85/xaMnqO1rF0uc
lxMS56ZFrg5kNNNUo9fm41IMDvLuzOiHdJD5JZKjPYWKnW/7wdZS1YCzu5NXOQP/
AHTpiNxhWr0F+K+k7XrAkNLExZuWA4Y/JL9IxhOCfRN1iLiJlB4H8MIWTw5+0qBk
OhgoSg3J9X9ZN/s9eNuABsreZb+PThwHPJOtmhNhHVRlAKaOKUcdx6RN78dthQba
SIhCVYO8aGUXpa2QLIW20NlBpa8SVQ==
=uDT3
-----END PGP SIGNATURE-----

--Sig_/whifXz+u.ftTh4z74Ip5QEX--

