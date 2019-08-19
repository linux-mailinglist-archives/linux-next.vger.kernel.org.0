Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E66491C2E
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 06:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbfHSEwM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Aug 2019 00:52:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46993 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbfHSEwM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Aug 2019 00:52:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46BhNl3s12z9sND;
        Mon, 19 Aug 2019 14:52:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566190328;
        bh=iWNnxoFNjgoQnAVEpxvD84ZcliwzJavYH6jwkekHNcs=;
        h=Date:From:To:Cc:Subject:From;
        b=eio8kz7xBtCwkCiCN8jC4w9W/rMNbx59rgyTWQidFJxXzfUL0lHmaJ6ZTyyhtQ/EP
         JK6KEZqwYT4M4t6osRf6AklaT007ZRCl6Zpm5p3ULFsgQfBZzp7o3WChZU8CxD4AGn
         sWi0TRaolM2UKDkl0L/fms6opXLZou7wdg6G2OjHFXXa0yMaUerdw4hBUmQCT+i6e9
         RbNNPod9sKW+sP+ab6ia3f6PvCBNRH+u82TWX/VeZt2j8BZjXY6GTwArgBt/BJFbhM
         KdHCmNlIkTI66wbNZSbiB4+FqdhMKY9+iacajpWP5+FavpEnV/UmjQ+VwJdlLOIA9u
         Lu7EuQV83cr4g==
Date:   Mon, 19 Aug 2019 14:52:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Luck, Tony" <tony.luck@intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: manual merge of the tip tree with the ia64 tree
Message-ID: <20190819145207.6646acd9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qniaATTba5js6G85Ubd=ZnE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qniaATTba5js6G85Ubd=ZnE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/ia64/include/asm/sn/sn_sal.h

between commit:

  cf07cb1ff4ea ("ia64: remove support for the SGI SN2 platform")

from the ia64 tree and commit:

  5828efb95bc4 ("efi: ia64: move SAL systab handling out of generic EFI cod=
e")

from the tip tree.

I fixed it up (the former removed the code updated by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/qniaATTba5js6G85Ubd=ZnE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1aKvcACgkQAVBC80lX
0Gyiggf/TN3EQwSHZ+RQM9y5fRk02QYRIzjkzvpR5SlAD/R8SwlArjwx4HiwAwuj
/XgBQPf5ROA9X/COmUerMHUF+jbHRrh2TFQr16P/Oy1AX2pqPUn6k2oavp43/J37
oiQbWp9gcPW/Gz28NDiils7Ea4QSdWpKNR7gD2TtfvkIMu2H9GE1pMJa/3MayiuC
HHv80Iq4WTujNMT+5v9bSMxtvPR1hY/O24nACBUBnUWQqxgnDiYPjRWg4QC2wNij
hWakLgo4QNUCplSZF40BsybIAADa0kV6dUY9/FrKDcb0TbwukytXEINevhIpH9YB
36MA0U3IB7lE2KjEQBafHYpbwfUoDA==
=fkc5
-----END PGP SIGNATURE-----

--Sig_/qniaATTba5js6G85Ubd=ZnE--
