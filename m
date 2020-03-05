Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9A6F179F9F
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 06:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgCEFuu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 00:50:50 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41845 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgCEFuu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Mar 2020 00:50:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Y0Gc0zV8z9sQx;
        Thu,  5 Mar 2020 16:50:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583387448;
        bh=HIjreBzySCUIEeSuzsf//lPHRyDfWa5LHfVrm9KtDe4=;
        h=Date:From:To:Cc:Subject:From;
        b=FetoxYDyI8llhhNu/cO6NFR/xmg8Nx71iNmUUZGG2pUhTGqMq/N/P46dsEAJbdOp6
         e4He9ia3XUEQSMhxPOsEVYQvcDqh5B5k+D/TXrnrlDNHF1UTOq+ae68TBcSCGhMi1W
         ggnQV/ZK/JyqD6EDcFEuaEDwZbgvYxc2YAZqlEKJO39SFLQaqWlFbMdhcMcg5YudiI
         eMMepFyA/sXmB6j9rdWLm0ouB1M4hLM5Tdn90mF18yYlN9Y+sid7zXzB0v4AYD8Wl3
         Vy1PQo7I3tQ/pZf9uUE9uRREJXTG0YJr4nAZkv+yW6rFXjucHdIJd6IddSAN9TX310
         jzsTkoLtc95vQ==
Date:   Thu, 5 Mar 2020 16:50:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm tree with the arm64 tree
Message-ID: <20200305165046.42e62969@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y0C2FS1i35Qy6f.w0Srhio3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/y0C2FS1i35Qy6f.w0Srhio3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/arm64/mm/mmu.c

between commit:

  bbd6ec605c0f ("arm64/mm: Enable memory hot remove")

from the arm64 tree and patch:

  37be0f08b1cc ("arm64/mm: implement unmap_hotplug_p4d_range")

from the akpm tree.

I fixed it up (I just dropped the latter (and its followup fix) for today)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/y0C2FS1i35Qy6f.w0Srhio3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5gkzYACgkQAVBC80lX
0Gxg0wgAm8DDZt6CLQjeJJbqvceZ1BDeCuM+74tqQx2JzHgmTgJimDgXQdOnhIRO
huNUayfzgSmE8XK0waaj2M9tfhJZpqKOwt2zh1xFud1/ahkBOhpv9j7Q0MBA7QTY
SFD7CsSiUeKHQv1a57N82ikPSUUrG9QmbE9EydTu3meJU6nRHUR9hAHP70I3fETY
DiXxaLJEsgdkMPrMgMYUSAElSFvUxDXhb8Uvml9hlHixacXagJSI+XbKn2UaQFpH
w/1WdSrrc51p53JZ0g1eRGjY5D1Tvsek1yU2Q9Qsp4ubPOldZUEfP5B4QO1R4Eer
1IZnrwG28U9aCV3mFkYhjerYfa4LSA==
=OWEV
-----END PGP SIGNATURE-----

--Sig_/y0C2FS1i35Qy6f.w0Srhio3--
