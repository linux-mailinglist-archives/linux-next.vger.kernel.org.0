Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360B71AD297
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 00:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbgDPWLd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 18:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727907AbgDPWLc (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 18:11:32 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 843DCC061A0C;
        Thu, 16 Apr 2020 15:11:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 493D2n0WrDz9sRN;
        Fri, 17 Apr 2020 08:11:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587075089;
        bh=VJQOIPeZ81lNy7b0NapTCZmWfQv490gF0GlRsKb4sxU=;
        h=Date:From:To:Cc:Subject:From;
        b=f0wYM3NpK0wwg14iVvI27NoxVuEqNyxVotL5UIqCFVaRAAdVKp7nfaLP+VJ96gQL6
         VRSMYu9OnqAtgFFWJsNgHFLawWF7MpA0VjtWHGLv6GSwQffNB4SUK7fDFxPZlln1HO
         qPzveMpS6X2f+Vl6RuQyWSWtyR4d6Uh4QnpQ5DcDe/VVCA6k8xU9LaBZQj6BHKWmLo
         iap/a9/O8lWMJPGkaNXN+kOcXMrrchiL3XcWOfe0/U+YgAQwNclx9jQBM2UZqF2BhC
         yGDqu8SlFIjbFwfrCLbBi8cS8QTFToxJ9+wCdH73L4p257YrsmJCo85qzPt3hvRpjO
         maTGgTPjtWMIA==
Date:   Fri, 17 Apr 2020 08:11:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandru Tachici <alexandru.tachici@analog.com>
Subject: linux-next: Fixes tag needs some work in the devicetree-fixes tree
Message-ID: <20200417081122.59d9a417@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ktjri6D2Sa0tO3JW4t=H.Mq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ktjri6D2Sa0tO3JW4t=H.Mq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  acca9cd4a084 ("dt-bindings: iio: dac: AD5570R fix bindings errors")

Fixes tag

  Fixes: ea52c21268e6 ("iio: dac: ad5770r: Add AD5770R support")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Did you mean

Fixes: ea52c21268e6 ("dt-bindings: iio: dac: Add docs for AD5770R DAC")

or

Fixes: cbbb819837f6 ("iio: dac: ad5770r: Add AD5770R support")

--=20
Cheers,
Stephen Rothwell

--Sig_/ktjri6D2Sa0tO3JW4t=H.Mq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Y2AoACgkQAVBC80lX
0GzbhAf+MRFSvrA/kgQ0RYPgajc5ZPzd9XfNevRpCqmliTISzHErrgA2RJGc2YpI
q3Q1zWMdNOee6VJZrCMQ6rNbx0wJI4vXQSSHH78E0+eYHh+Mb1AHoK32fHrN/crn
vzsLt0VgRBzyOI3RvIK65UPrVAeDqfGUWnU1g2W2FZL1GFuGjY5cvRwBcydymvru
JjpeQ77wiSWKF6wPjM5S6LYRWOAH81y8Gg1lt9V6OvY9Eju1ZA/K2CY+zuTV0C7C
T0//lC/eJzIG73yIcSO5r8N2c/J58MwxEikanj6TC6MiB/XP8SG5IAlsNq/I2LXj
FetPyqR96ZAhxnzC0UXuv1L1xWobTw==
=EYYg
-----END PGP SIGNATURE-----

--Sig_/ktjri6D2Sa0tO3JW4t=H.Mq--
