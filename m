Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C682626EC
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 07:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgIIF45 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 01:56:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56013 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbgIIF44 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Sep 2020 01:56:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmWVt5XR4z9sT6;
        Wed,  9 Sep 2020 15:56:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599631015;
        bh=vfVKtdmJt6Bf/TTuVd/HT4z/eb0RBFxlPgZxNj8kPrM=;
        h=Date:From:To:Cc:Subject:From;
        b=OGf6NrqMlD7YzsunMXjXN3sxb2/YreD1BsktGjEEYnvLLzeOgTcJjD2V1BllT5wFU
         H7/HN5iEheIOSOBdnH++Y42oP2qu/xwC2vW2eN4IoEua2aaXBflWeP1f3Rdn8whTHY
         ai4rLKxa2C+tie5rNn6e8Vt1niVWXjOFW4mm+WYkfGqhqsFQL3I5Q7FKcOmaV0LZRh
         QTHOOg/qLjJdA4Fib+Lf8RTziDEU/Mdl6CTy7qrxUlt8U3LSEABy038T+OiuI5knf/
         DgbVvUU2eTeqmtujcCIeSGHRuE+zXX2jU8fJAKDLjqjK7ATGoLs7pv7rCK+4iM+Yom
         h9tx+KZjhWb1w==
Date:   Wed, 9 Sep 2020 15:56:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the tty tree
Message-ID: <20200909155654.76fe3bd6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QJLYmG4sIAt=QNG2xrw8Ccl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QJLYmG4sIAt=QNG2xrw8Ccl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tty tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/tty/serial/8250/8250_bcm2835aux.c: In function 'bcm2835aux_serial_p=
robe':
drivers/tty/serial/8250/8250_bcm2835aux.c:154:3: warning: ignoring return v=
alue of 'dev_err_probe' declared with attribute 'warn_unused_result' [-Wunu=
sed-result]
  154 |   dev_err_probe(&pdev->dev, ret, "unable to register 8250 port\n");
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  ea43a60b1548 ("serial: 8250: Simplify with dev_err_probe()")

--=20
Cheers,
Stephen Rothwell

--Sig_/QJLYmG4sIAt=QNG2xrw8Ccl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9YbqYACgkQAVBC80lX
0Gw0bQgAhB5SgV2H2xU273HHGxlI22OTyzpDJ04cq+3ZUKjEOzTJDOW77k+jxotp
4mAWxasrVxzkwxvSk3wlgclJZria7Uo8uELj138IQrZipZRCBsReKszmrOOl3qgs
thTVHoq+0zETUzz02uWrn7ZMpYIRBuxRZyjT944DtiuuLzA+5Jq0Vh1Iguprlbk6
WDq+X8Ea05s2pUrGfQEyiAasBFKYNrQVUlVY5Opt6HsF8sV0n7/7E8/RxisbsRy9
Wqa/OCKZcr+ZL4lH+Fn0hTLkzEX0NzTmcLLXEpI0c21zbZSD6MG4r3QLAT7tjZRR
h8L9KFZRuZ33JBrzTIgW2llKGJfuDA==
=Q0I9
-----END PGP SIGNATURE-----

--Sig_/QJLYmG4sIAt=QNG2xrw8Ccl--
