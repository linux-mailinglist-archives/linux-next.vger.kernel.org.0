Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0506432362F
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 04:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbhBXDrV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 22:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233036AbhBXDrS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Feb 2021 22:47:18 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A115C06174A;
        Tue, 23 Feb 2021 19:46:38 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dlhg04Bqxz9sBy;
        Wed, 24 Feb 2021 14:46:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614138396;
        bh=mKqH7eShDbcsdhGhGHni+l4r7Ae9Jmf0pqGXDSX92JY=;
        h=Date:From:To:Cc:Subject:From;
        b=kpJJeuqg69klCkppGZVZ4DV+dZo0iM/tBciNMtWUtbE5d1JZ690YdX7jVOK47R/wc
         Hu3bwuOgDHNTld8T1Fbmb3oUz1t8RzOp/IkWxQyJrEFgJJADQQTlvlzHia9pFujAPo
         PYXsGu2bv44vzH2iVBcj8gZR75xpJgdibl02ktYKzzw2xkwcjce667Iz3UjDhszj8P
         EXATEQrtIP3f7Enf4vU2UrCf8Wq28S+Qgu5m7Bwt4j/qVUDNSM4/vS9rBeXmeHGPJ8
         fG6B11pTt6frnCMzgwTBKtMD8TKYfyb6mOpZGWYTdbzJThJK9ffG7bJXPnv2iP60ky
         CT0Ul5DwcbAhA==
Date:   Wed, 24 Feb 2021 14:46:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kbuild tree
Message-ID: <20210224144635.45d68aec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fQ1l0XxDzPcJRWSuxJB9iln";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fQ1l0XxDzPcJRWSuxJB9iln
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  67cbb9c55759 ("Makefile: reuse CC_VERSION_TEXT")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/fQ1l0XxDzPcJRWSuxJB9iln
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA1zBsACgkQAVBC80lX
0GwHTAf/YoBZc09yxFEzXo1g2/4j2YarMNQyQDhGmYeng4azqjvH5GlCrNDI4XmO
bvx3aPenl/Z8TPuueNH1xGsj5WNHb/nA1YZXcseWy8YAd3o1j44I2y5c6z7owylt
wYBRD7GU6k71hHC8nYw7VcxuGG9+YU7LwfJqsNadjcGRip1qcuxzcC9sOisPdRRa
yeMQLqwCkexru9HYk/JraAw12AZAn2d06lLZP6iI0eV1/dwpUfFGyN2fhaWTaKoF
iOlimajSh7qqbWJK4d9tIAvFwuZXfjETb0NUUFOgwlLzMZalQkrQIBIAU8SisPqe
3LTUcr9vvQwzI7nTFC4yip91FNikLg==
=8ou9
-----END PGP SIGNATURE-----

--Sig_/fQ1l0XxDzPcJRWSuxJB9iln--
