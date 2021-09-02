Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD993FE718
	for <lists+linux-next@lfdr.de>; Thu,  2 Sep 2021 03:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232807AbhIBBXM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Sep 2021 21:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbhIBBXL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Sep 2021 21:23:11 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA8CC061575;
        Wed,  1 Sep 2021 18:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630545730;
        bh=Jjfp2BOMwhq1pI5Os943vhnopp7uJ4qbE8EY55mgNQ8=;
        h=Date:From:To:Cc:Subject:From;
        b=awaYE+xSqySJjIxJYdXd7/0MYN+GbZs6zvQcvn6ZPaVDOV0jXJyYDuF9d7LLL1zKe
         Gn//juU9HLqlz+zD8yfL/NuGcAwkvFvJql4IiwgOao7SSWdEYqXKCO7kFFhbdj0HGM
         8E0cFW0H6MTa6SWEnbJJBirqtvLI6gdwz9mpdPUvtX1lAKsHvNE+qHRMN+NwH8Yr4G
         fNaGRcuw3ECP0ZO85TO66AqCYd8BXX21eWoPIAuJXRp4fzL6ewGgaQl1dxBoyT4tI3
         j+73b5NUDTQ5QfgZavj9hgGD5MP/5wPDn5fyNwb3hBgywSTZhjLiRiax/MMLqMt1F9
         VLzL4mOeSg8BQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H0NSf5Phpz9sCD;
        Thu,  2 Sep 2021 11:22:10 +1000 (AEST)
Date:   Thu, 2 Sep 2021 11:22:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Luben Tuikov <luben.tuikov@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20210902112208.23c226c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VV4XMlcNaFFRqCH4Ur9s2EG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VV4XMlcNaFFRqCH4Ur9s2EG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c

between commit:

  477f70cd2a67 ("Merge tag 'drm-next-2021-08-31-1' of git://anongit.freedes=
ktop.org/drm/drm")

from Linus' tree and commit:

  cc947bf91bad ("drm/amdgpu: Process any VBIOS RAS EEPROM address")

from the amdgpu tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/VV4XMlcNaFFRqCH4Ur9s2EG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEwJ0AACgkQAVBC80lX
0Gwwmwf9EkdR6lj4JZLkxg2OLb63lSCqP12mm8H+AZKlA9Jmco2S7kC0pJYsOKoj
c/5YpbbCErnJ1RBpOnTpp1N8exEj5qOjwYI8mcuPkOGCdzw9FMHNRgpAzG2ccS+p
JWHpZ5s4QV7fqi4qBuV1YjoLWTr6lKk7KGCaqJtlJvGL2ghKVNWX7bcSQjsKq1hv
IzmZxRoC0QAi2WuwF21UW6YrxJmTwbeDfYzoSUVF4b3oxJygKsvLehHdpf7KNATD
xuTgS5poZdPHX4Oc5vVS3L05D5G8rkdOkIxqOI4idElhGQ+Ka7/PWVHMfMH8pdRz
9ANspTh80REybkO6ZRQaHnmBM89qVA==
=A1C4
-----END PGP SIGNATURE-----

--Sig_/VV4XMlcNaFFRqCH4Ur9s2EG--
