Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B0D29D662
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 23:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731112AbgJ1WNy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 18:13:54 -0400
Received: from ozlabs.org ([203.11.71.1]:53829 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731102AbgJ1WNu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Oct 2020 18:13:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLYtf3DXRz9sVm;
        Wed, 28 Oct 2020 14:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603855690;
        bh=x8iEWXpX3VRcXzbHeP1/0YLkUBA0/p+ybf5B8oj75dg=;
        h=Date:From:To:Cc:Subject:From;
        b=j9aBfHGJfd40R9ZZU8fv1cW1wH6aNuBKxttOq5WB7T+g+frMSpb3zoHU7q5dSynsb
         twuUc9Tw5jab1Nq0I09PJQLLq7olzGWguBuJzUoCu21t18klNhBUN/Oehwopef4Nt0
         sGCP5lPgMkc2IDjLO9+YARhUPITiQZbA2f7L5dWeyaRo4OR/awv9McrWCxEhAeF/JF
         GUVicvL1+e186JY1xRrIF+s7iTezVoEqRZpQ8vv89B5PiMIkPNz+C6D/IKFZ4roFru
         TXUKG6L3P3+hntOMF3nWu9BYbsRiZwbYBy8idBHk/wLsAO2ErIExwkmHKircmqPa/F
         PEZqO81GH65GA==
Date:   Wed, 28 Oct 2020 14:28:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Micah Morton <mortonm@chromium.org>
Cc:     Thomas Cedeno <thomascedeno@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20201028142809.09f7f4b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qCP4iW3wX/8x6tq_IXpp.0w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qCP4iW3wX/8x6tq_IXpp.0w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In Linus' tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/LSM/SafeSetID.rst:110: WARNING: Title underline t=
oo short.

Introduced by commit

  5294bac97e12 ("LSM: SafeSetID: Add GID security policy handling")

--=20
Cheers,
Stephen Rothwell

--Sig_/qCP4iW3wX/8x6tq_IXpp.0w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Y5UkACgkQAVBC80lX
0Gxlrwf/Zdp5m6WnKB7xlIfXbB0VShqy4VmTvCJzCeuCkxBIgk1spfSW6vbkEbma
OCqlutwnghdH/dsFpPWMOU4Ep17jFqguQiwcw22bn7xN6WNHn+5leG8GTUUD8H76
bCzdR9iQGLV7mspLAhOU7dTyVHssVlqO99vfPexdFMKTWYy8UpNLZb+IGO3KjFcs
NVGSjLjfZ4HzOkuDl6doel60f0aUb6ZYzhEXhRifHZ1rMKAlvZ2QmE8ESkNG/xFO
PJMdW+9PZyl+rzj/R6Hk3kweDUYsr7n8SN9AZ8e6wnbk25pc8E3mJ5VvDWteoj53
i+EDILhLNdbJ0KgA0SwQlviWc0Knpg==
=2z7s
-----END PGP SIGNATURE-----

--Sig_/qCP4iW3wX/8x6tq_IXpp.0w--
