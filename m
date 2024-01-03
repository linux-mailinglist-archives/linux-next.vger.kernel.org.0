Return-Path: <linux-next+bounces-587-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8882267B
	for <lists+linux-next@lfdr.de>; Wed,  3 Jan 2024 02:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91384B214AE
	for <lists+linux-next@lfdr.de>; Wed,  3 Jan 2024 01:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1254ED3;
	Wed,  3 Jan 2024 01:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kKzEWp4c"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68144EC5;
	Wed,  3 Jan 2024 01:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1704244754;
	bh=urPXJ9CAYT+AG+LKifc8d+LB3sczHO2f6I4c8ea4VpE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kKzEWp4cchQIXLs1cN6l3dUvIQqDcqdefD9ABjxbRlSwO7w7ofFZo9Q8auORLv1Pp
	 FU1zKJQSuJUkW4ToO/6/fR5L+HTLpBSZzyiUcXq1jX6HF3CkRdwgSq1+zTEupwn/sX
	 TbdHdtavH50jiQ8qgfCPwGUltxZSmrRPH0OHcoyTkbDARPli9Cuaei3uLKEpTIBqHx
	 NHINDOF2OrvRr1AgHubajbM9NtEet7sHAlLni3Ta7l1fYiuQnjuwVucskrO624h6AH
	 veY4DliHpXo3//LEy+PtyviPM3DFnC63TlLUjrOKEznLZmhicpR853YvOCHxEIN8yD
	 170kI47eTCg6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4X1Z0Lj2z4wcc;
	Wed,  3 Jan 2024 12:19:14 +1100 (AEDT)
Date: Wed, 3 Jan 2024 12:19:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20240103121911.4ec8f237@canb.auug.org.au>
In-Reply-To: <20240102111222.2db11208@canb.auug.org.au>
References: <20240102111222.2db11208@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s+4cTGjQsACLBK52RwMBU/+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s+4cTGjQsACLBK52RwMBU/+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 2 Jan 2024 11:12:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>=20
> In file included from include/drm/drm_mm.h:51,
>                  from drivers/gpu/drm/xe/xe_bo_types.h:11,
>                  from drivers/gpu/drm/xe/xe_bo.h:11,
>                  from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem=
_object.h:11,
>                  from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:1=
5,
>                  from drivers/gpu/drm/i915/display/intel_display_power.c:=
8:
> drivers/gpu/drm/i915/display/intel_display_power.c: In function 'print_as=
ync_put_domains_state':
> drivers/gpu/drm/i915/display/intel_display_power.c:408:29: warning: forma=
t '%lu' expects argument of type 'long unsigned int', but argument 5 has ty=
pe 'int' [-Wformat=3D]
>   408 |         drm_dbg(&i915->drm, "async_put_wakeref %lu\n",
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
>   409 |                 power_domains->async_put_wakeref);
>       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                              |
>       |                              int
>=20
> Introduced by commit
>=20
>   b49e894c3fd8 ("drm/i915: Replace custom intel runtime_pm tracker with r=
ef_tracker library")
>=20
> This would be an error except that I am building with CONFIG_WERROR=3Dn

OK, so I have turned off CONFIG_WERROR=3Dn in the run up to the merge
window opening and so this is now a build failure.  I have tried
applying the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Jan 2024 11:40:26 +1100
Subject: [PATCH] fix up for "drm/i915: Replace custom intel runtime_pm trac=
ker
 with ref_tracker library"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/g=
pu/drm/i915/display/intel_display_power.c
index 5f091502719b..f23080a4368d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -405,7 +405,7 @@ print_async_put_domains_state(struct i915_power_domains=
 *power_domains)
 						     struct drm_i915_private,
 						     display.power.domains);
=20
-	drm_dbg(&i915->drm, "async_put_wakeref %lu\n",
+	drm_dbg(&i915->drm, "async_put_wakeref %u\n",
 		power_domains->async_put_wakeref);
=20
 	print_power_domains(power_domains, "async_put_domains[0]",
--=20
2.43.0

but that produces this failure:

In file included from include/drm/ttm/ttm_resource.h:34,
                 from include/drm/ttm/ttm_device.h:30,
                 from drivers/gpu/drm/i915/i915_drv.h:37,
                 from drivers/gpu/drm/i915/display/intel_display_power.c:8:=
 =20
drivers/gpu/drm/i915/display/intel_display_power.c: In function 'print_asyn=
c_put_domains_state':
drivers/gpu/drm/i915/display/intel_display_power.c:408:29: error: format '%=
u' expects argument of type 'unsigned int', but argument 5 has type 'intel_=
wakeref_t' {aka 'long unsigned int'} [-Werror=3Dformat=3D]
  408 |         drm_dbg(&i915->drm, "async_put_wakeref %u\n",
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~
  409 |                 power_domains->async_put_wakeref);
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                              |
      |                              intel_wakeref_t {aka long unsigned int}

I don't understand how the above patch can change the compilation like
that.  I must be missing something obvious.  Maybe my compiler is
strangely broken?  I have applied the following instead (which at least
builds):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Jan 2024 11:40:26 +1100
Subject: [PATCH] fix up for "drm/i915: Replace custom intel runtime_pm trac=
ker
 with ref_tracker library"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/g=
pu/drm/i915/display/intel_display_power.c
index 5f091502719b..6253ce061d20 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -406,7 +406,7 @@ print_async_put_domains_state(struct i915_power_domains=
 *power_domains)
 						     display.power.domains);
=20
 	drm_dbg(&i915->drm, "async_put_wakeref %lu\n",
-		power_domains->async_put_wakeref);
+		(unsigned long int)power_domains->async_put_wakeref);
=20
 	print_power_domains(power_domains, "async_put_domains[0]",
 			    &power_domains->async_put_domains[0]);
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/s+4cTGjQsACLBK52RwMBU/+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWUtg8ACgkQAVBC80lX
0Gw4XAf/SsBTSacexMHcgjpPAfhFCyCSKx7Hj9djfVTEPpclTByCq0TFzqw1cZwb
mm/uqwWRxtMyoHFvPQaZGQE8vWp1pN+r5w8oXTr2SZYAftR7MNMvQDzRJG8lBcUW
lSmGcerxuyvbK04KfugYSZbCe8ePdQIXW47fe8W+k63ri5Du8XvxoGcUGMd5R6+m
bRP/nZ0LX/+OTw1ycd3ZPpmQOmyqa8DZpqiDRVx1pa/BjxYQhub2tjSlxlJoQUUF
ZVjYg9+pjzqV0g3q53kWKw/lbjxpoPT/yXlg01Nqtt1GdcSYQFC7J6WClBn2O4nX
MWI4OBNfOFMlsgPeZxbVOLuZqvRdVQ==
=/R/y
-----END PGP SIGNATURE-----

--Sig_/s+4cTGjQsACLBK52RwMBU/+--

