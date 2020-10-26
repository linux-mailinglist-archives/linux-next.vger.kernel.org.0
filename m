Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D1F29900F
	for <lists+linux-next@lfdr.de>; Mon, 26 Oct 2020 15:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782246AbgJZOyF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 10:54:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50231 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1782248AbgJZOyE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 10:54:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKdBv6866z9sW8;
        Tue, 27 Oct 2020 01:53:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603724041;
        bh=I0fh7Zig+VPoSiAcYQM43HP/hbMQ/URtRoE+VlJUi5Y=;
        h=Date:From:To:Cc:Subject:From;
        b=koASjz07wz6FiLehNVYl4GCvVs6nbjSz+am7/SZeNetM1EsMWniP5n7wkMaihfcHW
         JX5tX3JMsPVUnWzhQdv4U6nX4GHhQc7/HU5aRzK4bKowf+9kuXByvape0uHt/2p4/r
         MhtytMMtZDfxcdJXkrKfjzJWRWrqKApyRrOpQeuIM0384IrWMU6VxKotA0iZEgs/eB
         xHHetl34vYQpwwOTrm2k6KYno7gP3VZr1yvA+UJjj/TOUCLKwLiTQXcDg0JGuQmtKD
         dnxmV+rHdaMwoMD3lA7R2BT1b5kbS7pgInoXyOEuXSaOjg5eUxHOTpmqCypn81CXJS
         iUPgjRJnke+wg==
Date:   Tue, 27 Oct 2020 01:53:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: the uniphier trees
Message-ID: <20201027015310.1450413b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7jru.851EsrkeKMdbpPVU6h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7jru.851EsrkeKMdbpPVU6h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

I noticed this commit in arm-soc-fixes:

  6d7fe8aa4503 ("MAINTAINERS: step down as maintainer of UniPhier SoCs and =
Denali driver")

I assume that the correct thing for me to do is drop the uniphier and
uniphier-fixes trees from linux-next?

--=20
Cheers,
Stephen Rothwell

--Sig_/7jru.851EsrkeKMdbpPVU6h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+W4tYACgkQAVBC80lX
0Gwguwf/SAPuphscNHf5Jx61SAs959HFsJXITvv8pooJVic++eaWKw7YS4wrtxJ3
SMe7JX3CMY5btxhSA5O+TaVWk7KXJYol9IU31PWgUlMcoddolnPZ6zxEQFfXkFnu
Z/Fiz0A/S3Tyt+IPQzEOATS0+V0idtM9BcImGanxyGAGfKk8/BNYlNAup18WbKpk
TSP3FwE9xCP6YMTrPmfp1ghPXmr7FVLe0kbgYmgEkPTvD4qEmj9jUL5w9YnHuyCh
oGVa86gDC6u3dSV+EVGZhYyY2wVELi+XhQQAgNc4lw16qhzH2FhHXjez+RucnvJu
RIeslKYYfrb6kuKHoZ8D7XX43OegDA==
=QLiB
-----END PGP SIGNATURE-----

--Sig_/7jru.851EsrkeKMdbpPVU6h--
