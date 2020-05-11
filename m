Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69411CCEF1
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 02:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbgEKA4G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 20:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729095AbgEKA4G (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 May 2020 20:56:06 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C75C061A0C;
        Sun, 10 May 2020 17:56:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49L2YY2gCjz9sNH;
        Mon, 11 May 2020 10:56:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589158561;
        bh=3eiYwrwq+UWNv2DKt0WWMmUdAScaJYefS/hMcV+xq4g=;
        h=Date:From:To:Cc:Subject:From;
        b=cYCKPTpOw/paT+agieYDU/PlDCtF1xL/9aq4++AARniWGUeHRRHFOlqLw3TMvfUvd
         H/OdQiX8IGZxhmkRkSE5oAe9P7Tqlo8SVVaFhYUJ0ADn4Y4bHWw0Qh2JYwq2oQS3CK
         5KYSK3iWWuRtkxZ9Cm06dZFLHp9xqCz8DT3jaF3KxBs1XfI+6egnaFFD/bYYrneFEQ
         Qs3Z7AGD5XcpCLjAPXe4j3InKPDifbugoV0eJ7xs/mB7BSyMieNiDxEZtyUartW1vW
         8zN6f3KXLUbkyhFUfOwzZ7UWtM3UjNOmjMbgrR8smlIVpYKBUItSXHHjnbQs40Jlj6
         iHCe4x0qRa4MQ==
Date:   Mon, 11 May 2020 10:55:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the clk tree
Message-ID: <20200511105556.5b13a4b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_8F7eZl6XC3Oi.wb+VaUsJD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_8F7eZl6XC3Oi.wb+VaUsJD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/mach-mmp/time.c:37:10: fatal error: clock.h: No such file or direc=
tory
   37 | #include "clock.h"
      |          ^~~~~~~~~

Caused by commit

  e4d1fdf89751 ("ARM: mmp: Remove legacy clk code")

I have disabled CONFIG_ARCH_MPP for today.  (For some reason, this
build error did not show up until several more trees had been merged
...)

--=20
Cheers,
Stephen Rothwell

--Sig_/_8F7eZl6XC3Oi.wb+VaUsJD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64op0ACgkQAVBC80lX
0GwfnAf+PApJ44F0QjPlqZzAffsJyAKvuB+mRtlS864kFScZd3LsVjKEC5oew9QJ
CgzYZIIWARUYgJtlIVFcMTXuJ8yRC6kAwpREsZXiRy772kOz6ezrE8507DtUMttc
FrONrwpFjLHzz79yeMiB7oKI+DuOIjc1ICS93MQO1NYtiBfpqJXpTp7XqV9ayUtf
hNLZU2hdi3IPS732dJoFtwK0EfUu5a5Rd1UgH0AlEgtqMAbjLmM+KxXUV6Xhw1cA
o4/7NpiUaZJIXBSMiL1i2Z3xSN6vle03JyK+aS+X10g6mrSD9ECYJvYkZBjJM9I/
+K1KN+Og1Oibclv5DL7kIM5jjDVKYQ==
=ruyD
-----END PGP SIGNATURE-----

--Sig_/_8F7eZl6XC3Oi.wb+VaUsJD--
