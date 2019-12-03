Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A79D710F4D1
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 03:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfLCCK3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Dec 2019 21:10:29 -0500
Received: from ozlabs.org ([203.11.71.1]:41293 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbfLCCK3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Dec 2019 21:10:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47RlnF26S7z9sNx;
        Tue,  3 Dec 2019 13:10:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575339026;
        bh=YgcDAJU+dAXcVcKor05ORh+eCp3gCcuIT41op239Ii8=;
        h=Date:From:To:Cc:Subject:From;
        b=JgDA7lsLGYWxnZ8IrZuXuUHj9aN6zGwNnE5fFNnpAD9FaXRu5OXHINwyBUBEcT7IY
         fua3YObcn7+lyLyBWc4LJPgMLKtIN2AdoRiC8U/0lYg5ZepawrZGodg4WChgOWk8Pr
         VASfdce3iZp26XHw76uHT2eRau8tTlkLrZl0k5c3/xRACYRjTBBlRet8e/u52cPWbi
         LzeYrPu+dSCzLiSrTlgdxE5caap42BKJLH1z+ABly4jhOVuDe9g0cG6FXWl5+mz0ps
         aQPzToGDhapivXh+wGFY5iVBGpF74p2NZsY1padEFunva6IkvuQviIu2/iEvaSzrjP
         IHlg7akyozV+w==
Date:   Tue, 3 Dec 2019 13:10:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20191203131024.6e36ed88@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Iw0oD_JRGIMABYG.cHlotR/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Iw0oD_JRGIMABYG.cHlotR/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/mm/pat_interval.c

between commit:

  91298f1a302d ("x86/mm/pat: Fix off-by-one bugs in interval tree search")

from Linus' tree and commits:

  70bfed57a6de ("x86/mm/pat: Move the memtype related files to arch/x86/mm/=
pat/")

from the tip tree.

I fixed it up (I just removed the file - there may be further updates
required) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Iw0oD_JRGIMABYG.cHlotR/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3lxBAACgkQAVBC80lX
0Gy66Qf/RmH+e2BtBBPMDAJDBa7wpxKvZ7tjFcrVOgLOco6herukWwpeac4lDoLy
OkXiW3KN3wiDJcm8O8yGIy7R0o3EBSWPADh9fNhV9Q4kgEr6ZnJOyA7C+c3vM/uQ
19f0Cl0fZTNPndVaQZwvMkJFxeP75f7UI+vP5RvxtIwRUDtKqHy9TS2E1oYjHBlW
H6Vmw1gLR/MckawJWrA30b/EjLb8H2QE/yI6vOaxltRNOFD855qkutYj5ePAgPMp
Sj2pFIiJVx37RCATrn2ew6VoG76cb1nvMcAkP84jjPNl1Ku/Ry29dXPIeiyu3kvH
ZjtsAZHoQnG384JPS+H6THV0ZKA4Mw==
=6FUs
-----END PGP SIGNATURE-----

--Sig_/Iw0oD_JRGIMABYG.cHlotR/--
