Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A26B39D1F0
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 00:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhFFWl7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Jun 2021 18:41:59 -0400
Received: from ozlabs.org ([203.11.71.1]:56509 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230368AbhFFWl7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 6 Jun 2021 18:41:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fyrzr2H1Kz9sRf;
        Mon,  7 Jun 2021 08:40:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623019208;
        bh=mn0noDOVhY2c6b084ZMVxLp74oK4ckJLZgI8Pf9GmoQ=;
        h=Date:From:To:Cc:Subject:From;
        b=dwEoGZJGuN/OfHtt3NPOaUxfd3s6EaoBzxIk/tA4pjNx4XRvbOFmIgV+X9BioWAIK
         lD5ay8uAQg7mMxoFt4T/3bIJEA5PtvvTMj8GPHsroQaZswR1s5lV3Mr8k9WG1recfe
         ku8E+TciSmf3Vl6hFZI+v8K8FQHfZVBhdx25itC20WTB+3sukjw6o/GQV6DHMQ2Beg
         QM+EOW3SbY2MXJylw+piWiEbKU/b24ZcOZG2m4bcWk+/EzVRFWfeMitKXiFrkgL0CT
         PUGJX2GGAYXGUHUODSSC9UqAMwZLXNEMAazNbhuOrdsCvQUTOTLiFyzHpOyC31IqD7
         Lb3gCb8d/C9FA==
Date:   Mon, 7 Jun 2021 08:40:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the irqchip tree
Message-ID: <20210607084007.6aa8aa27@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qyfizYNdZmKTH/2qfK2H5xi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qyfizYNdZmKTH/2qfK2H5xi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  9b8a506983a1 ("fixup! irqdomain: Introduce irq_resolve_mapping()")
  70d49fc8ebd2 ("fixup! irqchip: Bulk conversion to generic_handle_domain_i=
rq()")
  69250ebd068e ("fixup! staging: octeon-hcd: Directly include linux/of.h")
  09816d49a254 ("fixup! irqdomain: Introduce irq_resolve_mapping()")

are missing a Signed-off-by from their author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/qyfizYNdZmKTH/2qfK2H5xi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC9TscACgkQAVBC80lX
0Gwdawf6AvlENEQAyXJIj+k0gxoC4vZi/OLWf3pZPrwIE4LhFeFpoff7vynBJ15W
o19xls8u6TKLprVm6QZP0dMMB8WeAVUXiVgYgYTdF9Di1WPW9y3h6Z9p3lvngwrQ
zaEE+VdSFV4OVzluqIVvac0bZlrptKdsL4y3Qm9opSAY0hsZbWOLNXyUZP5xUEdn
WOFHT5iIR79TwXWdBLQr71s2sga8VeG8DvZMAjoV6e53tiKQzuFVKsSCGxpz7yq6
xtpW/KxWIyxIFNaCWKb8gJ0WN9UWMbG2BHg6MQEcut/ONMVLIhoAmFEh9e/KbDsE
LE1ITKOMgoDdfrxXweTySTaOn5X+eQ==
=cOHA
-----END PGP SIGNATURE-----

--Sig_/qyfizYNdZmKTH/2qfK2H5xi--
