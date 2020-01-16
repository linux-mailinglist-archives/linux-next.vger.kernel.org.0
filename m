Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA70713D402
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 06:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgAPF5Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 00:57:25 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40331 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726933AbgAPF5Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jan 2020 00:57:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47ytkp3hYGz9sPW;
        Thu, 16 Jan 2020 16:57:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579154243;
        bh=TIBTkvq4qX5YeghYiAJQ60HvuvhkHq5DZiUwvOkT5no=;
        h=Date:From:To:Cc:Subject:From;
        b=BmcKpvf4nxsIdgUpsRtWI0b0DvH2vVAMlzGZMtVO4nuuVvkb1BGdwH+QVbe0jP8HA
         TxmOlwNUpcQn6Rzi4PYrjSsi6TWX2nc9N80R8UWOBUyHZghXF5STD/Fi68u9x7jUF1
         IKRKbUVvZeTkoZTPVJifcyPqi40Z19rfj0aPQRlGxiR8XLdj/Xe/zfZ7KNbbWdWP1S
         624QjEFNfXpfH9x8w5OcluJjI5dhzEUm4lWAqGx3JDFjotqu+2dYmFjpCQYqYGhxPe
         q4/9YfXnIKgv/tn7Yo/UzB/gA954SxWp6vKovsRe0fQ32syZj0/2t/Inu/cY6yWDOY
         IAgSJAGfQwqkA==
Date:   Thu, 16 Jan 2020 16:57:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alan Maguire <alan.maguire@oracle.com>
Subject: linux-next: build failure after merge of the kunit-next tree
Message-ID: <20200116165703.4e04be51@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Rw3GuoXIcZBOMK6Di9auPIJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Rw3GuoXIcZBOMK6Di9auPIJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kunit-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

x86_64-linux-gnu-ld: drivers/base/test/property-entry-test.o: in function `=
kunit_test_suites_init':
property-entry-test.c:(.text+0x26): undefined reference to `kunit_run_tests'
x86_64-linux-gnu-ld: drivers/base/test/property-entry-test.o: in function `=
pe_test_reference':
property-entry-test.c:(.text+0x275): undefined reference to `kunit_binary_a=
ssert_format'
x86_64-linux-gnu-ld: property-entry-test.c:(.text+0x2c4): undefined referen=
ce to `kunit_do_assertion'

and lots more ...

Caused by commit

  27f9d7e984d9 ("software node: introduce CONFIG_KUNIT_DRIVER_PE_TEST")

from the pm tree interacting with commit

  35c57fc3f8ea ("kunit: building kunit as a module breaks allmodconfig")

I have disabled CONFIG_KUNIT_DRIVER_PE_TEST for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Rw3GuoXIcZBOMK6Di9auPIJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4f+y8ACgkQAVBC80lX
0Gxnvwf/cClvAMqnOdUDL/t2vAYzPc1Z8B3a6ELAnp+nU0uTkkyUtfssOyvbim+A
5MszgCFPxmSewp8AwmHnlz+zJv7JbvXS5Rubj0EzQHxxRIxvD8Z9Ewe/g71vRKE3
IeAxZGmt1K+rVFilKNOfObP69v2xiC3b2f+MzaHTVgCNmZp5yhNX69GyxT7k5OO2
O8Y3uz4atSnJmX+30WsXHXt4O7Y8kX7tB6JkqoT0i4obg8gv0bq2WXLs/BwXrWTp
hNmm5kenmFXy1+VxE3Hd1P5F5PomTC/NeatLJSOk+9n/bDccESAtF4rEftGvgNf+
VOeHwrcqlQlz9CTZAum7SNo3lv+6Mw==
=V2DI
-----END PGP SIGNATURE-----

--Sig_/Rw3GuoXIcZBOMK6Di9auPIJ--
