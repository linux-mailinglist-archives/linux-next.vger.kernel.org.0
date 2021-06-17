Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F51F3ABEDB
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 00:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbhFQWZT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 18:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbhFQWZT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 18:25:19 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAE6C061574;
        Thu, 17 Jun 2021 15:23:10 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5c571c50z9s24;
        Fri, 18 Jun 2021 08:23:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623968587;
        bh=dCklCa9mOSpjPfIqXbQ4uTruw1F8/z9QF6zfSmMAfic=;
        h=Date:From:To:Cc:Subject:From;
        b=pGPHHyC3GGss7WA3cZu9oWws+6ubtV/RJPWOCFj38uLKqeTtFNZqe7YasFnwfAsT/
         cUiyhDfnuSQhnKBwkK+8wMnTCc57ztzqIjLpRgOdPBHTxa3juoenvUMSxcaJuT06mD
         Ufpp82o049FJS1+Dwbircj8455Xnbu5lSd0xhv6jY6Un//iOK+xKKsYvfjPGnOHSgO
         ApJharUkxb9HRzEvA4hbbIOZLdYnfLhGDG3L7TPLlHmvrQbbFM0+C5fUtBjKjbufl/
         LifnPlhsUNJIQf3Rmm9/A5mbvNhmrReRWPlTRrw8ApWfUxThkULeCII205/6SANzvg
         mSzmzKu/qcJzg==
Date:   Fri, 18 Jun 2021 08:23:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pci-current
 tree
Message-ID: <20210618082303.58fc5edc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IFOfS=dKkj.M6K3rw0eW4pR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IFOfS=dKkj.M6K3rw0eW4pR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  d19b0ea16f45 ("PCI: aardvark: Fix kernel panic during PIO transfer")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/IFOfS=dKkj.M6K3rw0eW4pR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDLy0cACgkQAVBC80lX
0Gzk6Af+I9XlDY3e8K5riUCzKP7ggZ8zurJKZtmkQQR/W2NXudiF/26Vlmj+BIWd
DIw4HzbUH5i8M2tqaX2IJyncvWlhsQ4alQj8ShkQiValxPlCBJkPOKpdE8jGDDFj
4GN8KZkY/z0ec+nHkcjoZv8ItdqOrVuFCYS8Gb8/7tpc62L64XdUWIDfHAx9Qgel
wVbwcrLqGVPN4/xz8/r964sjPOySZK7bJh6wBjITjWpCdhWNemXqQCv0MUUh3TRf
XMB2EOEoDuiXQ2ig6wkQAsraKvAVD/U2Nnx6h5GZDh3oLm3JBY6v2uubrVsihJuF
2nKoK/eHZ0QPoImRvSaS4OzhQ6Qi2A==
=nxq4
-----END PGP SIGNATURE-----

--Sig_/IFOfS=dKkj.M6K3rw0eW4pR--
