Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD51F10C108
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 01:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbfK1Ala (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Nov 2019 19:41:30 -0500
Received: from ozlabs.org ([203.11.71.1]:54779 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726947AbfK1Ala (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Nov 2019 19:41:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Nf2v6CWVz9sSJ;
        Thu, 28 Nov 2019 11:41:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574901688;
        bh=sd4/QC2DtC86zW3ryXuf/Oon6IKrF+GBxFj+ksxiPzU=;
        h=Date:From:To:Cc:Subject:From;
        b=fHFOawqRPSe3cfV+gZ6WApii2EeCLFqIAKnHWo3p75dEJM96a377VobIZcBm6xUIf
         0EsZdMtnvCx4/cLvj2gXbQYPa+BlcOWzxdkRpuMjDYqSFD7WImwjlFwp8YA/i/jAvz
         scXny0khhEuCI/0hPKuT+y+CmDb0HmAOFicXumir1BkvbsmUJMvULjB0q0fk+5TZGf
         uzxsyyEmpy+IJNH0Am5W0GhXLk+NJ5SlCa/PnHMF2aIvQP23prlyCqiUuwXLBg+cQP
         4IO9g15puXssuH+a6HCTnt7X6xFDJMenVNgevbLGMEbzIftHciWhFoGWcLH9SkV8Nt
         nMKDVGlFIhXAw==
Date:   Thu, 28 Nov 2019 11:41:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jassi Brar <jaswinder.singh@linaro.org>,
        Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Fabien Dessenne <fabien.dessenne@st.com>
Subject: linux-next: manual merge of the mailbox tree with the devicetree
 tree
Message-ID: <20191128114127.0f1e3b06@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SuKzyasq5wvNffpko8PqMji";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SuKzyasq5wvNffpko8PqMji
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mailbox tree got a conflict in:

  Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt

between commit:

  4360bf724483 ("dt-bindings: mailbox: convert stm32-ipcc to json-schema")

from the devicetree tree and commit:

  9b2cfd3fb09e ("dt-bindings: mailbox: stm32-ipcc: Updates for wakeup manag=
ement")

from the mailbox tree.

I fixed it up (I just deleted the file - presumably there will need to be
followup fixes to the json file) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/SuKzyasq5wvNffpko8PqMji
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3fF7cACgkQAVBC80lX
0GwLYQf/emideZaY5M6Jnfk8OIRnEQAB6SNldtdMGUjBgHzw+z6NDiKLe2vsP0c4
+NdFaTx6+FfP/gua8ZbvDZhmIqcci0Hht1cHEM1FdIQcG7xCkjItnvqkt8jyvUuF
qRC8n6yR/mRaTNK+Jf/t3QX0nQcn8l3m1cOJsuEssqdJoLU4dEoVzvL+j6AINJgu
KlpUgXsr/KuRF4ZInIsbvUK7Nl++EO5RcM9q6PQJmk3ViYOPsheV5XCHfC7DGk8y
ao2V3kB1gbK+PGdKpoYfxgzC93d1/TbXaCWeF+Y9rBPJ7fahGNmzxeL/b7pM+cW0
mKiqXfHQ4FgE7llu1nxb8NFIDiE0gg==
=x9/m
-----END PGP SIGNATURE-----

--Sig_/SuKzyasq5wvNffpko8PqMji--
