Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA34A28ECAA
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 07:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgJOFbB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 01:31:01 -0400
Received: from ozlabs.org ([203.11.71.1]:60057 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbgJOFbB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 01:31:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBdDK6lj7z9sTK;
        Thu, 15 Oct 2020 16:30:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602739858;
        bh=6XjoihXamGwMpFOxHPeEL5mGgZsr5AN5KAvw5E5fVJc=;
        h=Date:From:To:Cc:Subject:From;
        b=i64oOYojMhqPe+O/soumICNFh8MVePo9b1PR/FaP/aIRgmTU50heUtOFQ8Xp7TCnv
         HMXX+IC86xKu2rZ9p7i0jmKsAoG1GRXVkQ8Vd5zUtnrvn7m4jiB/MPTKHIWDRqLv1y
         /xEC4gGvvfH3mYxc7uTLWGJUtIae84UAJ0W7FwxvMN/RcDE1hKSYeGG8opuz12trsL
         l02KaMTZIw9FbTskA7N1SGkmh7iilpiRn7DA7mYIxFE9YYT6nn6NasWW/YDlbrvhZj
         M7aM4ZWMxonopUmjqCBAM3W2pW3d3ln57qeyDUYGQyvD1MZqLOII/ZOiSG9RcFbcFU
         h4ylOoBirg4Ug==
Date:   Thu, 15 Oct 2020 16:30:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Vitor Massaru Iha <vitor@massaru.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the kunit-next tree
Message-ID: <20201015163056.56fcc835@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uxRZX2wYv3FrujgAK1vr0pB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uxRZX2wYv3FrujgAK1vr0pB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kunit-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

lib/bitfield_kunit.c: In function 'test_bitfields_compile':
lib/bitfield_kunit.c:136:21: warning: unsigned conversion from 'int' to 'u1=
6' {aka 'short unsigned int'} changes value from '393216' to '0' [-Woverflo=
w]
  136 |  u16_encode_bits(0, 0x60000);
      |                     ^~~~~~~
At top level:
lib/bitfield_kunit.c:129:20: warning: 'test_bitfields_compile' defined but =
not used [-Wunused-function]
  129 | static void __init test_bitfields_compile(struct kunit *context)
      |                    ^~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  d2585f5164c2 ("lib: kunit: add bitfield test conversion to KUnit")

--=20
Cheers,
Stephen Rothwell

--Sig_/uxRZX2wYv3FrujgAK1vr0pB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+H3pEACgkQAVBC80lX
0GyjnAf+I94zjO8B58HSHDRVEUZ0+tINq/CF7jB9nXKT0kA8ipwR5HxTyWOgWbDk
NaRx+I6v7RwJRWdWjlyGU+nHEGYgTXHolDSb0m4N/VhyjNDOoS2nePI7q+j2acon
iwfmF4wTOZIwQByipSkLBzqkn+tTNHGVWrq590HqcSozdnC+N8Do1adDEEKtKMQ9
Uc1XlLCIxXwMlQQwdcTIxRYuHuCzH5mWbxAvk/NKb6wH7yyjOaEe2JaYD+BCWOwA
pr4NEGLXONzM3hktLkSMticMNMZ2+27sODYWJ8ydN41EGqEX8pfGJDPBdlxB54xT
M1iH3JSI6v9czM8vDqPWnui42aWYcA==
=7KlZ
-----END PGP SIGNATURE-----

--Sig_/uxRZX2wYv3FrujgAK1vr0pB--
