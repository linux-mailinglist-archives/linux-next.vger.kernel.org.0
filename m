Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7951F1E7566
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 07:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgE2F3R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 01:29:17 -0400
Received: from ozlabs.org ([203.11.71.1]:33153 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbgE2F3R (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 01:29:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YCmN5KB3z9sSr;
        Fri, 29 May 2020 15:29:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590730155;
        bh=I9psZwDII1+kXs+/tVFnZiQ1kESgZ2LEUT1Qfqu2z/c=;
        h=Date:From:To:Cc:Subject:From;
        b=adFS1+4egfOrjVIoBXYSKMgubsDU9ISsdioIdNgTXQCgrqWxMeRkSy9u3KdnfZp4A
         ssfCzXM+VDC2m0sUmpIApisWYc9RHzHt1hznWOCM1NVhi9jT8UyQxH2YwN9kCDk2FC
         WikeQs6FdWVl8Bz7jY1iPsz99SA8qrYA0Zj9z5TLxiYvgG9rwh/d04EEDLCSOQTnVj
         2WDy1MZ+9J+vTX9b6VXLybdtaUJfPfb4SVHWwDys0Xc/HU/VEDclj/svsQh9r2NxqQ
         XGEhXBES08+2CE43jE/Iy5/rZRJstD+4rn35J8FCPLl3vpqr4lKsVndSeRwksyVvPL
         yhmri9XCle9pw==
Date:   Fri, 29 May 2020 15:29:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>
Subject: linux-next: manual merge of the tip tree with the arm tree
Message-ID: <20200529152907.2205a298@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J=.PbR7jiTrI6S0cRueU8WK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J=.PbR7jiTrI6S0cRueU8WK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/firmware/efi/libstub/arm32-stub.c

between commit:

  d0f9ca9be11f ("ARM: decompressor: run decompressor in place if loaded via=
 UEFI")

from the arm tree and commit:

  793473c28a4b ("efi/libstub: Move pr_efi/pr_efi_err into efi namespace")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/firmware/efi/libstub/arm32-stub.c
index 0050d811bf20,b038afe2ee7a..000000000000
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@@ -209,10 -215,11 +209,10 @@@ efi_status_t handle_kernel_image(unsign
  	 * base of the kernel image is only partially used at the moment.
  	 * (Up to 5 pages are used for the swapper page tables)
  	 */
 -	kernel_base +=3D TEXT_OFFSET - 5 * PAGE_SIZE;
 -
 -	status =3D reserve_kernel_base(kernel_base, reserve_addr, reserve_size);
 +	status =3D reserve_kernel_base(kernel_base - 5 * PAGE_SIZE, reserve_addr,
 +				     reserve_size);
  	if (status !=3D EFI_SUCCESS) {
- 		pr_efi_err("Unable to allocate memory for uncompressed kernel.\n");
+ 		efi_err("Unable to allocate memory for uncompressed kernel.\n");
  		return status;
  	}
 =20

--Sig_/J=.PbR7jiTrI6S0cRueU8WK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7QnaMACgkQAVBC80lX
0GzvJwf/TuuUrEG/hnobcbRTMkqdLZ+Q1XU4DnHfdp5m4vYAG/7iWPB5auuh7Iby
zPXnPfvXrtMNBJJWC/TfKGyDdyoC8jGVyTa0bGgTq6Gf6SBHxMi4yXaxxHMDror7
S3zu/XYL82NjFk6Mmh+mA9iaSS9sFCyZhSx/4fkn2y29WVJzAAAffGUcnS1m8mgY
4OmhoG821OqZEyZFkTAXK5rZWY6cRBgdNkwcnZAPOI7+5FKFyykW186Wl6yah7H8
MSAnEaPzGxZXGc6qGD7hneSPxQSpu/9V8GRkjmT2nZSCVhVTAcHODyHhz/2SVKRx
guGjrdz9huRajJ3yrbQw3rQwQDY2bA==
=uciv
-----END PGP SIGNATURE-----

--Sig_/J=.PbR7jiTrI6S0cRueU8WK--
