Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7EF280F0C
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 10:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgJBIg7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 04:36:59 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725961AbgJBIg7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 2 Oct 2020 04:36:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C2jyw2Mtrz9sSn;
        Fri,  2 Oct 2020 18:36:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601627816;
        bh=aT6kASu8PU8K5QlSgosl5J3asF6w7hR4XHWzKbGF+l0=;
        h=Date:From:To:Cc:Subject:From;
        b=W1Kldw2ZOYJXq/pyfbIHhOS8ipSXREmRNaRAgN3bQ/6R1JryBMc5WncRp3LX38grH
         rQlspK1bI2TMKQtjSBsuW7Q3mJ2vsag/IiKa2nS8E0imsh1dP7TyWIaspCaH1514CA
         9IIt9ZHABHQkqpJk4p07c8x0MPszhGC+GNjg5rToYq1gj5nT/fP+rYoL+3mcPDZdG/
         dp55hupwLuiCalZZ+OmvVJuOKKWhc5/5540pwDIAvab6KW1maE6T5CYNImgNj6FgcW
         QaW66MV+uuQaT05mNjX7THmvF/XBwFLjGWXgHSZ7Y78N++69JUFw+OMwyDWqL71Kai
         KrZFD7XDVHXCg==
Date:   Fri, 2 Oct 2020 18:36:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the gpio tree
Message-ID: <20201002183655.78d25c5d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//Y3dGG.C.1F=B9ZI/9FOlhQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//Y3dGG.C.1F=B9ZI/9FOlhQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/gpio/gpio-mockup.rst: WARNING: document isn't inc=
luded in any toctree

Introduced by commit

  2fd1abe99e5f ("Documentation: gpio: add documentation for gpio-mockup")

--=20
Cheers,
Stephen Rothwell

--Sig_//Y3dGG.C.1F=B9ZI/9FOlhQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl925qcACgkQAVBC80lX
0GyRjAf/dS/YRbsslH7h+ImoAYIEuhZvjN23XAfPq9MPAULSigtBoudFz2/qGmKZ
kfrPyl3xJuW/M4SVGAsGHCb8RBi7dNTCVUFCA4pc0uo4O8sO2rgywREkhkqvQxIA
6iLGxm9oOG5ZvjiI81ivrXBQ763rwt+uMnbhnZriPNmiCqL61DQKTXh1dlNzwcdK
V7sAn26A0NYhFQqu5JSSHT1qEtwqllOx3QheHHa6nPm8P22HzaQ9mFH9rdzUjUdA
zHX1RM2JbyiSrWkxDD/Q0BdNqd/nFICULEQIVccEpgNqudII6v1V2bqItQscbZqd
PXVLNrk44kwummSIBxkzTdzenj5nNA==
=TPxP
-----END PGP SIGNATURE-----

--Sig_//Y3dGG.C.1F=B9ZI/9FOlhQ--
