Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E783B40EA
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 11:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhFYJy6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 05:54:58 -0400
Received: from ozlabs.org ([203.11.71.1]:54543 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230112AbhFYJy4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Jun 2021 05:54:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GBC3P5fVkz9sTD;
        Fri, 25 Jun 2021 19:52:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624614754;
        bh=q+L2fxim45gbte/rCqUGreg6lMtkcnRAINZG0qnlTTs=;
        h=Date:From:To:Cc:Subject:From;
        b=EHrc9/ZXUlHPR5KboRdMTuwDJ3IpvzZfjYZIOu6zc2osvMwGMxRPC4el/q0z6jxcU
         QeZO5n0COScifHL9DisX2s6BCNJTLFIJIQjI3Ek+z93712BexlBkDz28d6I4cJkcBC
         ZIIGWBJNCLOuEmaM3naHFEmpGWjQh7Ppv4IEr49VzGo0IPOF57mb3Q8kzbcCIjqf6y
         jLGH5WQ8Cv5whgLFnYRP6exybdUecwoditCnjhewCpnVKMxlAjYLSilUMAOOcLw4ox
         baCn/IQJrmCA8G1yD5qkl3SArEhTq8TYIX+j2L0SsGR3EqGhUl5encOT6odWCkUNDU
         NndA0B11nxGHQ==
Date:   Fri, 25 Jun 2021 19:52:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Daniel Latypov <dlatypov@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kunit-fixes tree
Message-ID: <20210625195232.3a307e53@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_bBY5QRfKm3oFvRtoxV/BXN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_bBY5QRfKm3oFvRtoxV/BXN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kunit-fixes tree, today's linux-next build (powerpc
allyesconfig) failed like this:

lib/kunit/executor.c:26:1: error: expected identifier or '(' before '+' tok=
en
   26 | +kunit_filter_subsuite(struct kunit_suite * const * const subsuite,
      | ^
lib/kunit/executor.c: At top level:
lib/kunit/executor.c:140:10: fatal error: executor_test.c: No such file or =
directory
  140 | #include "executor_test.c"
      |          ^~~~~~~~~~~~~~~~~

Caused by commit

  c9d80ffc5a0a ("kunit: add unit test for filtering suites by names")

--=20
Cheers,
Stephen Rothwell

--Sig_/_bBY5QRfKm3oFvRtoxV/BXN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDVp2AACgkQAVBC80lX
0GzTnwf7B2OUW9LvXbFpX13iUUYzS8Wmt64qtMPqO3thh0OyUriux4mzfZpHyO9b
ZRPMqK0NuLvO6O6fHB4Q+FTcmhA+X76i3jAAgFYPZHZDoZYYUBFcCaXMQ2v+6802
AYJFtA6U58bqVY5GCTFj+vSkCCNMFIN4f8DmXZMkKYMGk2Bez+DRnZo1Uxh5VYtA
IadOJhLzSBETAh8uwBuTqX7TTxJIdyBbY0FTmkCrPvOc/N5auGmKRNFZk1swQTpP
yACfMLcbpMPX8gub2sVwmaLDM3LdvECTIee3WXgARX/VIZYnbeJuk2F4eCK3A55C
5T/vn39z53F7qV2IzRCqIztE0hJ3Fw==
=1hOx
-----END PGP SIGNATURE-----

--Sig_/_bBY5QRfKm3oFvRtoxV/BXN--
