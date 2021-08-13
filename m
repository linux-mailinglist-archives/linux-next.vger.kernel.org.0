Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AADD3EB37C
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 11:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238856AbhHMJp2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Aug 2021 05:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238807AbhHMJp2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Aug 2021 05:45:28 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A9FC061756;
        Fri, 13 Aug 2021 02:45:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GmJZ24wlzz9sPf;
        Fri, 13 Aug 2021 19:44:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628847899;
        bh=8X6LgnuMw2xZ9R6aXbGDuvdrA67fJ95JyS2i8kkOhwg=;
        h=Date:From:To:Cc:Subject:From;
        b=Ey3nieQjhifAemuB5wGoqGyRDFb1llIp1KujqwoPOWa9IBtECA6M+vn2eun8k9jpQ
         coAdiXHKcciQ7t2R2wz6I17Q6VkbddjpJCiy0mZN5yVkI7CIPO7+wIQk8Q4p3/HazO
         6YIm8pwKOpEiJiR4sc2pKtL8j4bMwoz4ERY7TAAHPo3GIqHZtaLpS5xnbob+8/Ic0b
         ttZLUCJD7OHWhkjb48d/VQ5EnoBleNEBt1a4c+KYNZ7NIXdNgIFXIU1xh3CjCa0VTm
         sHGVLeFnyj43a8b+mufzV/6BtGMAQ+4YC6x6iXGFjXXtI2C/hg4zZKUlLpqMUkKoro
         v3am/Je1pd+aQ==
Date:   Fri, 13 Aug 2021 19:44:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the irqchip tree
Message-ID: <20210813194457.445205e6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CFo+XUE5e+ht3lSDq2C7qur";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CFo+XUE5e+ht3lSDq2C7qur
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the irqchip tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/core-api/irq/irq-domain.rst:178: WARNING: Inline emphasis sta=
rt-string without end-string.

Introduced by commit

  991007ba6cca ("Documentation: Update irq_domain.rst with new lookup APIs")

--=20
Cheers,
Stephen Rothwell

--Sig_/CFo+XUE5e+ht3lSDq2C7qur
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEWPxkACgkQAVBC80lX
0GwPuwf8DBJf9i0/fB83IdajHOg3UWXQxz8LipBfMkdlLfZcRxTVmh/UF91lhN51
fsQl2i8zJ4cu6gL+suYsKX2sZk6RRwCIgNvDrDRcEXtFYwOyoOMH+okk5ZGy1CmH
oOfLZtMFu6MWaWgRgT34yleE3QveUNmtfsScqVK7hYOirNs2zLww/0hE0cDMkeXw
WjNQ48SGLjxoBkQx8Ww1Po72XWp8DAlIEVosPNwNPuyfqOFqkEvzJ5v6oINelr4n
uVSpKzOmVuGOpSTyt4cOZZHHGuk/ay6owNRiVJ0DVtX4Vcq3hemaO0Yv/QV/7ruM
EOj4mS2x0RMdoAW047WCCetwFGfepQ==
=OnIS
-----END PGP SIGNATURE-----

--Sig_/CFo+XUE5e+ht3lSDq2C7qur--
