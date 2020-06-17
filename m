Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFFA1FC56E
	for <lists+linux-next@lfdr.de>; Wed, 17 Jun 2020 06:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgFQE4K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Jun 2020 00:56:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45553 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgFQE4I (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Jun 2020 00:56:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49mt7V1sHFz9s1x;
        Wed, 17 Jun 2020 14:56:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592369766;
        bh=1gdm9ZrSKsjKBYEwem8jcpdmVCouRwYdbuLtL4gYPjI=;
        h=Date:From:To:Cc:Subject:From;
        b=XbJV2lmWmbuHe+BlQLSY/zVbVXWu/k68Kta20s7fqZwjLUBgrGrPAmCgs6uSGyKFl
         W4WTf59UyVjQyePVQEnks1/WOR2NPUfIftXVQurGHfuQJzkQT1u/StxnxJIzdRYCpS
         CX2/hugohJXuvw0/g46elAcuZzrmVuzVkq2s/Tp35ZbL4lpy4obN8kUn7CSZgP3kku
         KjGJ8QvQShhhMFxGt0eX9m0/a7B5olwwaJh0ET97TN9iQ7K/GTxpOOYw9dNClKIbhf
         x9H/peqLznjd5sX0MyijRcLiu3fV7H4npAqBNSYbmKLhvId2alrLyQc8vMR67Q3DWe
         aNu9C7oNi93dw==
Date:   Wed, 17 Jun 2020 14:56:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tpmdd tree
Message-ID: <20200617145605.726f0885@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kRCB5HOX0rq+DXSB7y/_sC3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kRCB5HOX0rq+DXSB7y/_sC3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b4988ccd41f4 ("tpm: Make read{16, 32}() and write32() in tpm_tis_phy_ops =
optional")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/kRCB5HOX0rq+DXSB7y/_sC3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7pomUACgkQAVBC80lX
0Gxl2wf/W6Shz3LTwnTEtise0I5wRd4+r3l06prbkIh2PVC1ELPdj0ffr8hNDlMj
3oGY5Byrhja4lFAPFb2LonIlcVks/GycZuoaIvclJ7Tg5ghDpl9Z16bB/0aUnJzS
2BsRaWY6iKhtkf2R3+QuJ6CPX8eOLMFMc9WdTWkMcF/fibzlO9MjznRALhabAm84
w9vh0Uc0Jqj90iyc4nOrzRN3PlZIwRQQXk4PpqoinWgI0KalbYxcVnedyiJo2yZp
RmT9BR5AUZy5ui8kDXUjiev2iuCGNdHMwetoXPObqa35Lk5Y9y1CywGJ+rs6tKjV
ijahXBmwbgZ6sC+SxT2k57uaSUrRjQ==
=ax8Q
-----END PGP SIGNATURE-----

--Sig_/kRCB5HOX0rq+DXSB7y/_sC3--
