Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A433A7C99
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 13:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbhFOLDu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 07:03:50 -0400
Received: from ozlabs.org ([203.11.71.1]:42579 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231480AbhFOLDt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 07:03:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G453q6gmjz9sW4;
        Tue, 15 Jun 2021 21:01:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623754904;
        bh=thdoV5dQe5dkPNK9RiifiRygAkRjueYxj0jdsrWgCag=;
        h=Date:From:To:Cc:Subject:From;
        b=kfJUVAkAITLRd5jo/Y6DQlk24r38uadA99qsO9+TR9g5frZyCQKY3LxIyXyT0Hcto
         E5boUqIQvDo+LFsSNkW/Yyj2zDC1Mom4eYxz+LGTz6Jr+iogw1WOIu96lGwyluvh1L
         MtpZuaNONPesKPvGEushhOdO8iARSvrloQC3NtMaziQVf4HhVFaaMVEVG4ub21WOoc
         lH0o5Qs/GNVF+ZsmUcHupk1U5zi4pDsjqNDew32rlX/bOqgSsMpN/7goXDDtKxYzB6
         HSKgMKsnm/+4H3eHFfoImYGZMdy6RUECmWm4S39RnGe63Qo2fcPPm/Ad0N3hAQQqaQ
         BSYeDPxt4Zomw==
Date:   Tue, 15 Jun 2021 21:01:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the irqchip tree
Message-ID: <20210615210143.2e00d851@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3yMV0lefu8ZFHFnSHLxjiY4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3yMV0lefu8ZFHFnSHLxjiY4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the irqchip tree, today's linux-next build (htmldocs)
produced this warning:

kernel/irq/irqdesc.c:692: warning: Excess function parameter 'lookup' descr=
iption in 'handle_domain_irq'

Introduced by commit

  e1c054918c6c ("genirq: Move non-irqdomain handle_domain_irq() handling in=
to ARM's handle_IRQ()")

--=20
Cheers,
Stephen Rothwell

--Sig_/3yMV0lefu8ZFHFnSHLxjiY4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDIiJcACgkQAVBC80lX
0GwnWwgAhF83FoBxbKd18FglhZYE4BfM0LmA6KykaA52Dm/Ii1RUtq9pOxCGnuAi
4XwLwFcXoEU4D8KmDPepheUvtGOu+QuBjZhm99JCaSIpPazEZYQdsA0m4NfRoh4X
CpD2CiXy2r2x5EWJHVy3/0G4fIls+mnvpk5FWtyCZVrybDWuqp/hb2yNCcZ8gkV6
6EY0TVRJtvCvXRtvPDyPA1Ar7VVQsAb7CMBHD4z3NtIiPJ9rX0R1Q3a5KYe1CEQy
JX6CJxuQ6zWEEdeO631bWVzUDNoNBTE8qFIO0kvI3ctx4b7g8tZsPhULnNXFO3X6
X6lKvS560JkGj66kVozspQfaNr/oYw==
=LEAK
-----END PGP SIGNATURE-----

--Sig_/3yMV0lefu8ZFHFnSHLxjiY4--
