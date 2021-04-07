Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E369356B30
	for <lists+linux-next@lfdr.de>; Wed,  7 Apr 2021 13:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343594AbhDGL2Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 07:28:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53581 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243155AbhDGL2Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Apr 2021 07:28:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FFhwF1Gpsz9sPf;
        Wed,  7 Apr 2021 21:28:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617794893;
        bh=EqT9NAfluZo0Vs2ov06W0aDuKLUybgmiOWAdPKvI7aA=;
        h=Date:From:To:Cc:Subject:From;
        b=K3mUV1Jf8FaOh8ufw8vZrHbtPz+QKnfBdxGF2ubmGwZv5tI49VkbZY7vNwjmc3A+p
         +jU7ABVGts6I1Rmo7Y5fjb4vPr4PPbpX5Wddt2IYKbH8S6OCQa1S+oDejsFv5oBpFx
         H+d17aI1b5e1Qpox6Gjkm2Jzj3RzPZ1sLa1T904g4DontjbpOM9o97luVfnxFRXkMg
         usGr2uNovAZp4PZqGGkSAXy0lGRjlsuQBUr3jFPNVuk4HlozY1g1JNyww3Z2eNhU+P
         XXdlRahwDLymcAXD0UbUeoJ1EJaI1Cx5WATkli+e7Q6OZN/DdLp+dMJCHjCfSLjICd
         YlT+QkhNJtZyQ==
Date:   Wed, 7 Apr 2021 21:28:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Frank Rowand <frank.rowand@sony.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the devicetree-fixes tree
Message-ID: <20210407212522.6cd49dc0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vq/cR+aSPR6Yy1+eRkWJAm3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Vq/cR+aSPR6Yy1+eRkWJAm3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f2ce9e97cf07 ("of: properly check for error returned by fdt_get_name()")

Fixes tag

  Fixes: commit 79edff12060f ("scripts/dtc: Update to upstream version v1.6=
.0-51-g183df9e9c2b9")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/Vq/cR+aSPR6Yy1+eRkWJAm3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBtl0wACgkQAVBC80lX
0GzFNAf+PLFO1raKsV3ltTD8XPCoCuZsXivHwIrkDCqmoUUMBcZG5ufwiWU4pm6I
7B4wTXhpUw6My1HRSy4wPJ/P5YhZLNqDf+hXUG9LdTPrvCan512LTWWxzPZ2wsH6
MX4arGZ9BEQ1UTn8tDcpKBMWuImB+r/s9RI+L74Y0FUygduxPhWNBys+h7N8Mb4I
CmpUwNNhN7ygghiuEx7J4hu6mPXlzPSAcx7QHA5go2JmYAyPYZCQp6pXI/4aM25j
8/+9dEPPBmEgMEdqMoEe9/xztDNsS9fDhQi5Ifb4ZBMfOhxvWpBTcKdyqLe19+hk
nctWcuk6i3TgJyLqO+FE7uYXLbXgUw==
=Tc34
-----END PGP SIGNATURE-----

--Sig_/Vq/cR+aSPR6Yy1+eRkWJAm3--
