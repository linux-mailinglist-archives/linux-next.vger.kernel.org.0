Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A31DE1365EA
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 04:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731136AbgAJD5G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jan 2020 22:57:06 -0500
Received: from ozlabs.org ([203.11.71.1]:44825 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731090AbgAJD5G (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Jan 2020 22:57:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47v8Lm07x3z9sR4;
        Fri, 10 Jan 2020 14:57:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578628624;
        bh=fVJh7y4ZkIW9AhJZVkctyboaiZVD6/zRll0aHnhEBkY=;
        h=Date:From:To:Cc:Subject:From;
        b=f3KLumC545hbRofBA8f5JPr5t+EYyYBxnATFDa6w9IBE+sXPvxAOO5buuBLMsdXYO
         Rb/Su8C+839VqEUo9aR66PpzegTpos+Yg/giLHPknU0BuUkNfMjkdbycW9g5NJCDjR
         UTkssiiOOODu1iBr2KUdmlxnrnhG+rGXf5D5EVbEKCjSWAXNT6U5bkQHAwjt2XpxRY
         kJxZvBYXcRn+/6o36tsDjG8aCg7CxaDq+45ZdvljJPfIi7FKWR0j9Op7ClQk2rDNEw
         3XpNmYGkeUklHgudFp/YoNuzAHyl49dwipLDBeY8vxVYnY20g/3Irqs2CAxJLkOkDX
         jLX7tajTf6z6w==
Date:   Fri, 10 Jan 2020 14:57:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the drivers-x86 tree
Message-ID: <20200110145703.59a89bac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d6q4GECe/6gci/PvNohjh=9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/d6q4GECe/6gci/PvNohjh=9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/platform/x86/intel_telemetry_pltdrv.c: In function 'telemetry_pltdr=
v_probe':
drivers/platform/x86/intel_telemetry_pltdrv.c:1121:6: warning: unused varia=
ble 'size' [-Wunused-variable]
 1121 |  int size, ret =3D -ENOMEM;
      |      ^~~~

Introduced by commit

  ebc28a8e59ca ("platform/x86: intel_telemetry_pltdrv: use devm_platform_io=
remap_resource()")

--=20
Cheers,
Stephen Rothwell

--Sig_/d6q4GECe/6gci/PvNohjh=9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4X9g8ACgkQAVBC80lX
0GxD2Qf/fafS7zJhOrSoodnKF5B1SoU0Srtm1fXQ8+te5MiD0jzhwKVxTskX8OxL
Q4yZLdnwjq3ts0N1BsndI865doNwMgHl8Y0WRBeV5aWbBEF4PkNxOPciNSfc0hlM
j6ZLEw/6m6yc9XijE0xVziwR5u1BbfpfhZ7lqI6aZLMZ5XEPSvAibCo4Bc6qiy7b
Gr/lw6JPePqvGt+qhQz7NihikEhrt69HYPg3k3TB8zN+HO2fzay1wpOD8DqKYI8w
K/iJ7c/ptz6rAu0tH8LHSnu3ej0avHpRgqGhQhitCpgxUdeVW1qgUCaPybCQkAQn
aWNjHMuo6w0v90yec2hNKN9ntiKorw==
=1cwy
-----END PGP SIGNATURE-----

--Sig_/d6q4GECe/6gci/PvNohjh=9--
