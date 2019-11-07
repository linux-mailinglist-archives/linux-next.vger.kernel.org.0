Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8FEF262B
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 05:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733026AbfKGEBa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 23:01:30 -0500
Received: from ozlabs.org ([203.11.71.1]:44885 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727279AbfKGEBa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 23:01:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 477qTL4DFsz9sR3;
        Thu,  7 Nov 2019 15:01:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573099287;
        bh=ZkjztmTuOdqEDx/B5InDVQPntONR40/RXou+29jYrHM=;
        h=Date:From:To:Cc:Subject:From;
        b=WPK4hB4oFHVU4FmONb/Oyiez6NFoYsjl0jAj1X/7swN8s1dfpxGoQKuNbEv2O0zfW
         1p8R3rJ4L8aBQsyRJxbWOF6eihCwWWRmBmPdxakZVnhwIeWmQ4OOlRAdKYnF8DeVof
         Setfa3wP8/JmmLOccPKrqQ68/POAfuaECAftFL45SvhTMepM5xqDDjdkpY+mc0HACg
         0v6Utnvd+itzHPi8E5cjsstP0RC0aSavdO7LPbSczh7VaR8SwmRJ1A3aSMTfkTzhT6
         40nSN+/mS5ivqoSgXAKd3G5ydZVh2m+Mkqg3m6DI+V3XmDtE9ZtcxOq+OMlrCBQIe8
         KaRFap6Aq1slQ==
Date:   Thu, 7 Nov 2019 15:01:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        James Smart <jsmart2021@gmail.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>
Subject: linux-next: build warning after merge of the scsi tree
Message-ID: <20191107145523.1792cafb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bgX3.mYz/YLz1Iri_cSeN.I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bgX3.mYz/YLz1Iri_cSeN.I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/scsi/lpfc/lpfc_init.c: In function 'lpfc_cpumask_of_node_init':
drivers/scsi/lpfc/lpfc_init.c:6020:6: warning: the address of 'cpu_all_bits=
' will always evaluate as 'true' [-Waddress]
 6020 |  if (!cpumask_of_node(numa_node))
      |      ^

Introduced by commit

  dcaa21367938 ("scsi: lpfc: Change default IRQ model on AMD architectures")

--=20
Cheers,
Stephen Rothwell

--Sig_/bgX3.mYz/YLz1Iri_cSeN.I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3DlxMACgkQAVBC80lX
0GyMBgf+MTvhlwTtGAP7Nvjrtexn1tRvM1SnvLMSouD/2kqNejkmyjkH1u+PEiGK
UyFH48OLVPha1inAIFWcaqilD8JaQ2qWjR64+pDIRsirCiaf7NQ/zQM9EF8KyKjv
Tejb1xu6UGko6rNzRNt/fSdZaSjcl2ZB9wXO35IqKKiNvpU1LBBR5k5MBZ7fg9to
HjskRB9digUnuOR4W6l8eR87P24fYuyXe/yVE+bi9QyKFnmqdwomMg+EfRwHOMR3
HCaca5pvWkHrk4bAN+NmpzImlbzp8CtMNc+YhREsd1swg0KkfcqAcBxNGlbvgNMm
SAXr5lFfD7uDtBnOh8FX8OD63WzueQ==
=MGMv
-----END PGP SIGNATURE-----

--Sig_/bgX3.mYz/YLz1Iri_cSeN.I--
