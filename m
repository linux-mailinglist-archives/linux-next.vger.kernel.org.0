Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD2442EE30
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 11:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233073AbhJOJ4b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 05:56:31 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33119 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhJOJ4b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 05:56:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HW1nq3xnZz4xb7;
        Fri, 15 Oct 2021 20:54:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634291663;
        bh=fH/iUFpKArXnJZg8GEmnNwn61nFEq092yO5VLs7T8QE=;
        h=Date:From:To:Cc:Subject:From;
        b=hZpNYUveYvR7vxI3N26GiqQW+8z21j9n547kDHUPsHL+L5Dkp2uDAgeFH/IjM+iyb
         xxv/4FEWUGLdyhuAAfxa+TPSDsUMjjX6O/3GVL31j1u0BMvtNssFM/MxTnEybriO/T
         XECcAImSh/btaW2geEg2vkRIlnbQ9qSZY3y6KC8GjsIuLwdQpt921h+amcCxMdSfNy
         vN8EVKbaSNuaaM8AcWEj3JmYNI+i3GR2uuiQs36AXd1GYFoprXIrLPJ3JZGvUUST8C
         3kwpxygqsk+OQqlpDSu0jVu4cAHf4pbNyvpu374qriWYikb9lSTQrRVdz5yIh3FEYX
         9xrjWUhQ/4lLQ==
Date:   Fri, 15 Oct 2021 20:54:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20211015205422.53bec93d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KAIDcOsgZ/6t8hBKe4HoQDW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KAIDcOsgZ/6t8hBKe4HoQDW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/drm-kms-helpers:451: /home/sfr/next/next/drivers/gpu/drm/=
drm_privacy_screen.c:270: WARNING: Inline emphasis start-string without end=
-string.

Introduced by commit

  8a12b170558a ("drm/privacy-screen: Add notifier support (v2)")

--=20
Cheers,
Stephen Rothwell

--Sig_/KAIDcOsgZ/6t8hBKe4HoQDW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFpT84ACgkQAVBC80lX
0Gwy8AgAi+lgVPrX+iClIYXBX4/hSyYmGvNwbFgQJizTkc+bmM+0diQVG5GE6tDd
N+46f+1b9R8g2SvM2xwQB4cRR/lWCZ0Vy3evTJJedO2k9CNxz06AYnD44tVGqmdM
8h27h3ppGdZM9Pcqr/Cpqoj6BkCt6a8TDIGtqgXWKouMNKJtOPrfim93sUhs6tvI
nfr6XrT9a7YLcNTMuv9ac/AU/f3aZ62kocpLTzFb+jolNQQmu6Y2EzJu9B1q5h67
7phra85nkpSmXDWt8mnbR32JfcVLQFOLhWYmM/rmq4yW5a/+4uC6t6Vu0bRsXN7B
skwLabSNOaRpwnZrKxhc4aHDxRhyDg==
=MaWX
-----END PGP SIGNATURE-----

--Sig_/KAIDcOsgZ/6t8hBKe4HoQDW--
