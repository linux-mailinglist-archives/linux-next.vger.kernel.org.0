Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247381CA24D
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 06:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgEHEfF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 00:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgEHEfF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2020 00:35:05 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEA9C05BD43;
        Thu,  7 May 2020 21:35:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JHYb2wD7z9sRf;
        Fri,  8 May 2020 14:34:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588912500;
        bh=tIayYZxVueV+PR3VYq1LmKUkTO9OK0vuZy2l55/pReI=;
        h=Date:From:To:Cc:Subject:From;
        b=NqxOz9zXfs6XrkfaBiIkkJUVvji+AJ3EWeOZGv3z1vo6D1eCEYYCLrk+ff/8A+r23
         Iu8/rYjHkmnjwZoZ4XcwFpDOctEqB1/rjwWz5iSDVIOF52IPHW9lL04jFH8LVlKbrz
         YgaNaHBEFd6yRzXr6REvd4MWvGphiFrkOaPWxqXEXalAdumPmvZUGSP1qJWO6Qish3
         3gllKYZ4g4Xuvaj5SGyUKk8mZS9zXXQ3DghSdDCNBBm/3m+xYfZCo66efJPphrdKHW
         n7ikEfghdPetED3khTChQtiEat5YRlLD/Tjlh0FrF51Rkufj5+Q7ozt0or/W0KAU6h
         RYZri5aiMgp/w==
Date:   Fri, 8 May 2020 14:34:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with the pm tree
Message-ID: <20200508143457.14acfc46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IC6dXXmr.J0j.0CdRqEFiwh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IC6dXXmr.J0j.0CdRqEFiwh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c

between commit:

  e07515563d01 ("PM: sleep: core: Rename DPM_FLAG_NEVER_SKIP")

from the pm tree and commit:

  500bd19a7e5d ("drm/amdgpu: only set DPM_FLAG_NEVER_SKIP for legacy ATPX B=
OCO")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index c201bc827389,4e4c9550dcf8..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@@ -189,10 -188,12 +188,12 @@@ int amdgpu_driver_load_kms(struct drm_d
  		dev_dbg(&dev->pdev->dev, "Error during ACPI methods call\n");
 =20
  	if (adev->runpm) {
- 		dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NO_DIRECT_COMPLETE);
+ 		/* only need to skip on ATPX */
+ 		if (amdgpu_device_supports_boco(dev) &&
+ 		    !amdgpu_is_atpx_hybrid())
 -			dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NEVER_SKIP);
++			dev_pm_set_driver_flags(dev->dev, DPM_FLAG_NO_DIRECT_COMPLETE);
  		pm_runtime_use_autosuspend(dev->dev);
  		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
- 		pm_runtime_set_active(dev->dev);
  		pm_runtime_allow(dev->dev);
  		pm_runtime_mark_last_busy(dev->dev);
  		pm_runtime_put_autosuspend(dev->dev);

--Sig_/IC6dXXmr.J0j.0CdRqEFiwh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl604XEACgkQAVBC80lX
0GxkRgf+P9we/5HxF6t1TApXGo0ooTk5FGWPYEpRZPAgF4BRJqOteGp+iQkDGUjL
sgEjUnz9EryYLCy1OXtLuf9eOQL/HuvJvL2V36g7VzO3CW+pUm9lMwGpjujm7DQZ
ZpjegyvDwQb0ouwV+5R8CKW2dSWDmiZ291FgTOmBy9G1bsn4XZPr9c9nlTZQW5si
Gyc5M78YgEaFh4F/5iR8BNJ8/Z52H9cQ3JkTE/sHYA1AJTUmbBGNOmzfbw6rRxQz
w1mbkRo38L8/ysrmipx8zdwjQwgm81JZKlvyy4CPJAcoETABeK1ki1usWAw0/eIz
pvFYwCB3XAFi2dt8oFf/JLnmHzeNMQ==
=U9dg
-----END PGP SIGNATURE-----

--Sig_/IC6dXXmr.J0j.0CdRqEFiwh--
