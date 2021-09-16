Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1A340ECBB
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 23:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhIPVku (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 17:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbhIPVkt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 17:40:49 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF0CC061574;
        Thu, 16 Sep 2021 14:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631828360;
        bh=k+p/4hGDgm5K+z7CnvZZURub58LrzLwa4ARYzEzDcMI=;
        h=Date:From:To:Cc:Subject:From;
        b=XyepaZxRZpJ5o03i+IcP2iMIOzpCFgcYUDrFCUY6p/3NjwRfxJbVulBcCNCENGgjk
         pjwuj1CUTY/jQdlO0TSYwyXlVb7QD/vT2Wrq4Tq5KKOvgYYtaQJlSdwPkMGf4M1gcG
         CGPM52IEJosxbBaOE0qrIO52sO9YtTc3V3d+CAerlPULWF0l5vCr72nr5dyBnm1LeF
         biCAlG4JD58P7ryCcrU8OS82PPM6oM/d4uf+gJ7+RIOQ+mMj1d7pjRE/RcaryF83Zm
         TZcoimO0ZXqxXPfI7H8h0DBTTwTjgsuMfmGVRAU8LcoE7ONVtov29GWx105UcZDfbz
         3CFOcIP75ziPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H9Vpc027jz9sVw;
        Fri, 17 Sep 2021 07:39:19 +1000 (AEST)
Date:   Fri, 17 Sep 2021 07:39:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Vadim Pasternak <vadimp@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the hwmon-fixes tree
Message-ID: <20210917073918.1213288f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NpIlKwZMMj11h83EYNrAJAH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NpIlKwZMMj11h83EYNrAJAH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d74057b1a5bc ("hwmon: (mlxreg-fan) Return non-zero value when fan current=
 state is enforced from sysfs")

Fixes tag

  Fixes: 65afb4c8e7e4: (hwmon: (mlxreg-fan) Add support for Mellanox FAN dr=
iver)

has these problem(s):

  - missing space between the SHA1 and the subject
  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/NpIlKwZMMj11h83EYNrAJAH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFDuYYACgkQAVBC80lX
0GxiQwgAkUDYaOj060f2OYCh9LvirPz/abuc6KA4JqcIxCEfe2/wHw652vNWUdN3
qi4EK8+D9I8Eq2bl4IBfgk6Ia0q54LpeM5u6cePZQP/IqjtFwLUHCpwy/VwbuhTk
tCAHrvMN9/xJLBNR/hkUWkHAJAdNQC2jCdlmwWgiInBt7RE42A0ZbsCX3XPTetMT
DAW97zk6O0j3nktYWK+KwhatPWtdSgo8WOgy1HZsM+aSIErrmOoEwzg8wWsqg6Wb
2deELvKZwMsg+RXyusGo0zOXSvsUwxTy5wkYYsXS/bx3gWwoFzId7A/8zRmkmcE8
72fgSXClAziMevlz4RWMUvdoQKQkgg==
=vq1M
-----END PGP SIGNATURE-----

--Sig_/NpIlKwZMMj11h83EYNrAJAH--
