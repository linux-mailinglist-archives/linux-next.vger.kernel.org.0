Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E575D180BB2
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 23:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgCJWgt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 18:36:49 -0400
Received: from ozlabs.org ([203.11.71.1]:58541 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgCJWgs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 18:36:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48cVM10TXCz9sPR;
        Wed, 11 Mar 2020 09:36:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583879806;
        bh=CLv7hGFjlbOC8UF3UvUUq0ZMzr5+UfHAttKthpqwaOA=;
        h=Date:From:To:Cc:Subject:From;
        b=cMUkKlSmmUhuIdJCuXMEWa+Am3RqCLFahJ8Lpv2IWRdilU/87/+/EHG2mGPLD+hh+
         WDQcNuCnqStPu9B4eKjL63ilPLbd4mPcuu+cmwgdbajJP35QSHU9C/62Qcvskf+Yk6
         UbB5DoHmYaCOQQRCcBMtq+Dwluw+CJvw6b1BlNnHOgmt2rF/vHzGm6mVHiudj1CaKJ
         JKwmh19wOpenkYK6p0gdTFax1gl9dYowph/E3CmW0iHBT2pcWUAQkW7KLpGY1tWhPE
         +NmT/kGJXXgUM4g+aTrqSoYt0FkMCCjMM2cp9qdRPsKXsADM25QDaI2folPCR/NgWd
         n8Pbi4J+vVxRw==
Date:   Wed, 11 Mar 2020 09:36:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: linux-next: Fixes tag needs some work in the iommu tree
Message-ID: <20200311093638.3b442a3d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H8NPKyaDKE3Y1MrDmm5zvzX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H8NPKyaDKE3Y1MrDmm5zvzX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  57744190bf30 ("iommu/vt-d: dmar: replace WARN_TAINT with pr_warn + add_ta=
int")

Fixes tag

  Fixes: fd0c8894893c ("intel-iommu: Set a more specific taint flag for inv=
alid BI

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not truncate Fixes tag lines.

--=20
Cheers,
Stephen Rothwell

--Sig_/H8NPKyaDKE3Y1MrDmm5zvzX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5oFnYACgkQAVBC80lX
0GyELAf/XWOlUEiepjVfgfYIM37l2gBqC02UDPSigZnCoKrX1VwQp5mRxwWqCTU6
6AWdfIovRfc135uPCT904DfU/sBng+JqHFFkd6TAQ53k2mPQ+g7VPP8cAV039Peg
JpNhFU71i5otiYw8rIVN2HkshxbSlI1DO8FJ9Dpfokp/dXdB0f5a+xQ2VWUr5SFI
K3wEo1FYJaSsrFaq6yV690ARDmOMMjLmALq/0BWKRgILDYR1rXZ3Tom5bmML83nO
tKV/MpM6TbSRr/44cc5pYvZTs86EURt/pKLd7ZlW2KKm2k+zFTYKz3FiIeoMrWeF
Jb8IK7iCt2CqCyr6z7EZ4ssDQYi5yA==
=5eaz
-----END PGP SIGNATURE-----

--Sig_/H8NPKyaDKE3Y1MrDmm5zvzX--
