Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9187E1AD39C
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 02:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgDQAWf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 20:22:35 -0400
Received: from ozlabs.org ([203.11.71.1]:41409 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727868AbgDQAWe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 20:22:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 493Gxz1L00z9sP7;
        Fri, 17 Apr 2020 10:22:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587082952;
        bh=K6Xz+b9ZpZaZKBy7AHX1iqW7FO9UPJmIgqGhaDRM/Kg=;
        h=Date:From:To:Cc:Subject:From;
        b=YDau4vmbX6UrTN9zPZxmLBSqeCYXlpyJCxxYfRoDteVZIp/Hg9z48rzu3+ekmQTJK
         dV+0zXgBKxtnMfm1PHG0jKHQwBzXtjjEDrmKbzZLsUK6mlQy+qHGWVCQgEYDbn1lSc
         R2sbVOiEiPYJhl+9MW7EpbKXQA3LJ3Gjqaqany0eGfrW9IU0E+1Xtr3QzGGJbF97Pd
         pdWLxww8Y0e5Gk71Yz8RSIBil+1oxBYVkVxx+uIIfUNsnzFPFuA3T2S5NNvzehsAuX
         bO3RKfc9jTfO8X0FQ0FtihOwPm3COf4SFZOZr6sIRtD0zSQGjc+fbDT+8QuyZD4BXA
         Mjzdnul2KArqA==
Date:   Fri, 17 Apr 2020 10:22:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20200417102226.11d54815@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jsndi7otJSHTGKvA8SoCyAg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Jsndi7otJSHTGKvA8SoCyAg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

WARNING: unmet direct dependencies detected for MEDIA_CONTROLLER_REQUEST_API
  Depends on [n]: MEDIA_SUPPORT [=3Dm] && MEDIA_CONTROLLER [=3Dy] && STAGIN=
G_MEDIA [=3Dn]
  Selected by [m]:
  - VIDEO_VIVID [=3Dm] && MEDIA_SUPPORT [=3Dm] && MEDIA_TEST_SUPPORT [=3Dy]=
 && V4L_TEST_DRIVERS [=3Dy] && VIDEO_DEV [=3Dm] && VIDEO_V4L2 [=3Dm] && !SP=
ARC32 && !SPARC64 && FB [=3Dy] && HAS_DMA [=3Dy]

--=20
Cheers,
Stephen Rothwell

--Sig_/Jsndi7otJSHTGKvA8SoCyAg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Y9sIACgkQAVBC80lX
0GyKiAf/XBZ6ambuIbtvf1vD27TjYiaC4YS5vgKm4E8PjUXGkz8+er0wOjlE1XCr
pzV40WvVlufWm441vnFnwQm3ViZoQhUp8nth3pJcWkcKN9BX4L8uEmgdPYViKPGs
zYTCiRZWxhlkSTI+KhVzW9mzpHiNurwuCicXV1/Rd9Wu42rsAbKo+oZcFsrcZtRg
Vc9/dXBL8wF8aHUzKQ+x3J2Fu1FyKv16f1vbanm7AM1bP2OHgfXNfcVQKVQaJmu0
v5oDEkTsgXDazMWs6c65eVp9I7wF8uIPRMnIorJ6sLA5oJ7q1bDNAF7ODUC5DICC
OyWU+k1d44xZeRB8EhUzkNnsAbhAGg==
=GCDb
-----END PGP SIGNATURE-----

--Sig_/Jsndi7otJSHTGKvA8SoCyAg--
