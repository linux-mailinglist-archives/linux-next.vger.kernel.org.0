Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1397E2FCAC3
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 06:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbhATFcg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 00:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730904AbhATF0D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jan 2021 00:26:03 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F10C061575;
        Tue, 19 Jan 2021 21:25:23 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLDW35dW5z9sVS;
        Wed, 20 Jan 2021 16:25:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611120320;
        bh=3fmoWrCiODnUVIqEnSfXQss7FvL1AU0Y2ucwsVjjDvA=;
        h=Date:From:To:Cc:Subject:From;
        b=Mv21QEJ0nr5v0bRfHEOFLaRfkx+hQmkFyNGAdCV6yrpOLfexoxBNYgwoXpR4K0HzJ
         4Q0FTJRyw8fVlZc8PEQX7CvW3fjSPklh0XKYcSLgjJokhtnFhurhmzw9j9thuFqRjF
         R6BbcNuxfU7h7xcLd36UtDemze2QhEV0k31xMYYkVDMM9v7RwNHnJ0WJ3U4r9UsHTK
         BxCx5w17XEvySCpzH28HIHmyC1fpMeAKzCI4rjXb3SJipw0S249xFng1D+avqK3l/Z
         eHoIdG2v8NkJ7yseks+wwy5wO71E1wsAuNZq/XKazZtghxHuRh2WmnMwg1GKHptXoK
         J3isXx1wKvLtg==
Date:   Wed, 20 Jan 2021 16:25:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210120162518.4fdc8f00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sOXn9Uh9a4kO=yO2c8gosL0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sOXn9Uh9a4kO=yO2c8gosL0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

mm/memory_hotplug.c: In function 'move_pfn_range_to_zone':
mm/memory_hotplug.c:772:24: error: 'ZONE_DEVICE' undeclared (first use in t=
his function)
  772 |  if (zone_idx(zone) =3D=3D ZONE_DEVICE) {
      |                        ^~~~~~~~~~~

Caused by commit

  e821cf25cfee ("mm: teach pfn_to_online_page() about ZONE_DEVICE section c=
ollisions")

I applied the patch from Randy Dunlap for today.

That, however, lead to this warning:

mm/memory_hotplug.c:730:13: warning: 'section_taint_zone_device' defined bu=
t not used [-Wunused-function]
  730 | static void section_taint_zone_device(unsigned long pfn)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~

--=20
Cheers,
Stephen Rothwell

--Sig_/sOXn9Uh9a4kO=yO2c8gosL0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAHvr4ACgkQAVBC80lX
0Gz+7gf+LEVA2NqXPy58USpds4NduO8tBSr/mxUHTue4D9Za8Yu9GzRbiWZ7pMbD
a+CX4Vz8EB64gvYs+WII9wnEkezhapY8wqoxvFQalkAL+K1fYf5WPSb+GScMDbiV
KdLXcSr8Yz7S5GOJEEqR0Ko9HexponjJp100hNfmlwZRwlRGWiDvj/VDnOzIga4f
n+OUlhfie8PxQNgcbQSJtYtVH83dJ68i3GdMicKymJry1ptWQglHWXLrfBRo0oW5
+T9nzGup+F9qd0RN60DF4dbpKDO8Q5pPImHqyQH9WxCyCyJM5YYzJeSnnqE/GpUD
c8ZiETKMGVtR1EJSke+ZuvodVJNc3Q==
=x9jb
-----END PGP SIGNATURE-----

--Sig_/sOXn9Uh9a4kO=yO2c8gosL0--
