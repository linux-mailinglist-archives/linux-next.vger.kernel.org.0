Return-Path: <linux-next+bounces-4655-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597259C024C
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 11:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B39F1C214C6
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 10:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294191EC00D;
	Thu,  7 Nov 2024 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fnb9DGjp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864A18A95A;
	Thu,  7 Nov 2024 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975215; cv=none; b=Mva/FWgdME5Gf13/V75w1s4sJt9Xt8izGXztwdxJlHGeEqDQQ07PJOxEyedLhEdfyDHmV8yecEUBpMGLspJOiflDx28iIPB6wFUfHlO7cXQFlLPyddC7JOeAR8O95rPKTxl+cz9LxWrejG4cCPRLth+CUL0pm2cpJoiDlziQBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975215; c=relaxed/simple;
	bh=Nmr7/wo4+pDuXfEGjh2V9jGELY2fQQwbEl6oZRb5YO0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/NDMXBAzo2zCOQdrPa8M2BxUcGTOFu5Z7oEgBEEMbIU/v/CEAdO4xIA2f7MDabXEl7PJLBX+TEFlqrp8ZjBPNnEP4JVcqlrH3FHu85+Dn/EMQr+nSaUTj8RVvRqn7g2aDrpnVt33ANiwMlBA8R620gDi4Gs1cDsM1JvManSK2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fnb9DGjp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730975206;
	bh=5QgSf7hVK1dumtikivz4wSJLUDbjZjZ3l79lbSa7CDc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fnb9DGjp2DDJMjWCcsPrP4PrIE/3Y8lDWP6Cgdrit4o+mMyW1etk/4aSArbTTEMtg
	 FD9p9iLyDs5isFenPQmRpu1k5PwFefmWePqnyfhaZ3lJF1eU+2qSaXOVsezC4/2mbX
	 4Br+oKENqhdyFcqvjn2J/f6oAd1r4wsw/Mu//qo+dg1lgX0X358gSluhDDmqSXPWP0
	 V8Lv5S7WQBgkbgcOMeDDhC/HWRZGavgQQuBOuNl4odnjfviNi0HWiqBrN93uamrcDs
	 3gOUKUsW0vyAi0jt/9rCikyTfkicoY/8lfNNTPyW9xCMwcwePXM4DFDjtZbjO9U6jk
	 ubBZlxkklCk8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkdXh4D1bz4wxx;
	Thu,  7 Nov 2024 21:26:44 +1100 (AEDT)
Date: Thu, 7 Nov 2024 21:26:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Hans de Goede <hdegoede@redhat.com>, Mark
 Gross <markgross@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ilpo =?UTF-8?B?SsOk?=
 =?UTF-8?B?cnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Suma Hegde <suma.hegde@amd.com>, Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drivers-x86 tree
Message-ID: <20241107212645.41252436@canb.auug.org.au>
In-Reply-To: <20241107194007.1d247bde@canb.auug.org.au>
References: <20241107194007.1d247bde@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2jasR_IukKyZVKSeoCS0q=_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2jasR_IukKyZVKSeoCS0q=_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 7 Nov 2024 19:40:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   drivers/platform/x86/amd/hsmp.c
>=20
> between commit:
>=20
>   9df193087b9e ("platform/x86/amd/hsmp: Create hsmp/ directory")
>=20
> from the drivers-x86 tree and commit:
>=20
>   b626816fdd7f ("sysfs: treewide: constify attribute callback of bin_is_v=
isible()")
>=20
> from the driver-core tree.
>=20
> I fixed it up (I deleted the file and applied the following patch) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 7 Nov 2024 19:36:12 +1100
> Subject: [PATCH] fix up for "sysfs: treewide: constify attribute callback=
 of
>  bin_is_visible()"
>=20
> interacting with "platform/x86/amd/hsmp: Create hsmp/ directory" from
> the drivers-x86 tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/platform/x86/amd/hsmp/plat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/=
amd/hsmp/plat.c
> index f8e74c0392ba..748bbc356484 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -75,7 +75,7 @@ static ssize_t hsmp_metric_tbl_plat_read(struct file *f=
ilp, struct kobject *kobj
>  }
> =20
>  static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -					 struct bin_attribute *battr, int id)
> +					 const struct bin_attribute *battr, int id)
>  {
>  	u16 sock_ind;
> =20
> --=20
> 2.45.2

It also required this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 7 Nov 2024 19:57:41 +1100
Subject: [PATCH] another fix for "sysfs: treewide: constify attribute callb=
ack
 of bin_is_visible()"

interacting with "platform/x86/amd/hsmp: Create hsmp/ directory" from
the drivers-x86 tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/am=
d/hsmp/acpi.c
index 4aa4d66f491a..dd5b5773328a 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -236,7 +236,7 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *f=
ilp, struct kobject *kobj
 }
=20
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-					 struct bin_attribute *battr, int id)
+					 const struct bin_attribute *battr, int id)
 {
 	if (hsmp_pdev->proto_ver =3D=3D HSMP_PROTO_VER6)
 		return battr->attr.mode;
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/2jasR_IukKyZVKSeoCS0q=_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcsleUACgkQAVBC80lX
0GwjUgf9Fm9HZW854/9N+ubcQx/0ShJoQiIR8e1PkwUJjLGGG26RJON1gy5w59Ct
zT/qHbXQdlJwEgQ0X1GXh+8ASTpAtfkjYL+HF4lE6w0RIxuKvPwPvqfhT+/mGlYR
n7vnGkQIhzPx+2zIVEvfkUjb1VFDpQfAc56fCwyDxco1gfVCmoNUKPWQ7fxmuvUs
/9RKHdPDGQ0rTeZSF9X8gLi4nEr1LSVp8TThfzjR2dOQDbQXUO26yO/sA4ytAf+F
+QwA0m70mPU1BcSOFg8N9s9Oj1GRfRx8AsyozibHd4gZtBIaD4CRjFncdAJwhlAY
QwUHTPw4GHLJlYWFIgIKuEAX0Mu0PA==
=O6My
-----END PGP SIGNATURE-----

--Sig_/2jasR_IukKyZVKSeoCS0q=_--

