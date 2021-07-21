Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D683D09C9
	for <lists+linux-next@lfdr.de>; Wed, 21 Jul 2021 09:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235400AbhGUGyB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jul 2021 02:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235139AbhGUGyA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jul 2021 02:54:00 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF17C0613DD;
        Wed, 21 Jul 2021 00:34:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GV6m92kNTz9sS8;
        Wed, 21 Jul 2021 17:34:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626852873;
        bh=iZE1aoo2ykGBy00HnN5TSkHo2+Wp5d/X8DzN/i6GhmE=;
        h=Date:From:To:Cc:Subject:From;
        b=Wv68gGvH0LLBohwuP/hte0Hwt87TOs/nZVFGZ7HPotaXt29yFN4cu/Eh94332KY+C
         rDqWOxlbkJW2xfQ3Wx4Wbu2VcOz2boBY9HkGVWffzTtLYxgfg3Z6mO/V3Ywp7M34Bg
         hihWjPw0KxEqRCEQuiBuxa14F8zZdVM5k6iwEgxvWkUpEkqizLkBAKdBAZD/55CqiA
         J6xRd7L5CJPfkt9gJ0RrIqEB50x6r60QpJwQ5/XaRR79sVHyHzWRuQFXg0pHapMLUW
         oP+tpaAQDK5hHwc6R2FMcThi75RfQ4I1WP/rn3M/f/z/C7E2+9hKLjDwAG4l2oeaag
         Ujywr/aoxVv2Q==
Date:   Wed, 21 Jul 2021 17:34:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Tushar Sugandhi <tusharsu@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the device-mapper tree
Message-ID: <20210721173432.3dce9ce3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/US1OXWahu.d5.uRW5gzMGMs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/US1OXWahu.d5.uRW5gzMGMs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/admin-guide/device-mapper/dm-ima.rst:29: WARNING: Unexpected =
indentation.
Documentation/admin-guide/device-mapper/dm-ima.rst:52: WARNING: Definition =
list ends without a blank line; unexpected unindent.
Documentation/admin-guide/device-mapper/dm-ima.rst:109: WARNING: Unexpected=
 indentation.
Documentation/admin-guide/device-mapper/dm-ima.rst:129: WARNING: Unexpected=
 indentation.

Introduced by commit

  e820ba87f9d1 ("dm: add documentation for IMA measurement support")

--=20
Cheers,
Stephen Rothwell

--Sig_/US1OXWahu.d5.uRW5gzMGMs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD3zggACgkQAVBC80lX
0GxDVggAgqtvJZddwin/HDM7uKe6qqIT1KoePkACauBzwYYmt4+HO/uuvTLOZ09w
fH3sfMlo8P5Oc2s9sp7/0oxWCqySk1vco0/N2MQ9udIt6e3+r0spUCBnmwfEuMZa
F1eYuwrlUTbtTck0Qb1owQfjncR5IAHWDtoBWqy9HTV+kj/DHLa+48e7Yub8B/DU
3QyVIAZqcZPf+mvOlyi9kjPsjZVR4URqqKtiAcx2Ms2OD2C+sMZeIOry/qrAHI7/
6ntc4yfB7TpNDuApdSZ/jiY9LFzatHiQcjpOaTRb/EIc8TF+es+kVTX2UJledu1w
c5W+62XQKmKpK0KUPCUJB5nxcGx3bg==
=jjou
-----END PGP SIGNATURE-----

--Sig_/US1OXWahu.d5.uRW5gzMGMs--
