Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979F82F0B8A
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 04:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbhAKDnM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 22:43:12 -0500
Received: from ozlabs.org ([203.11.71.1]:51469 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725824AbhAKDnM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Jan 2021 22:43:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DDffY2D1vz9sVy;
        Mon, 11 Jan 2021 14:42:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610336550;
        bh=jodTbF+KOi1kXgKsBSr5oI9UKFK1ngnUyj+ko0kn8Vs=;
        h=Date:From:To:Cc:Subject:From;
        b=bziyIffip1o1PM0RM9DVkmtIs7aiAb7mXwRgy+fhidR4kSk2fD+1iQ4r6jBs1d296
         3Gm22jya7wwa+px6bLM8bCXW4UJRAfR0+hpbVriPv/W1mgzATzbVS/In+xBlFJ51Kt
         ZQq6KC3H9SIPd/e/6OYC0loTyVEC3yNqU98390q2N4UvnYFhjmFpuNisiVcKUR6iD9
         RtOsWRwuRjkyHPHHfL3f7RFA4li4Rzlt6v48XOQsn4s36qvZ2oY13wpqn9W6Nyuv/h
         PwlPKVkiZPhnv3T7POHBuwU21tm3SJW7R9XWrLlrXA+Jqwa/on4mvz/8d3rMQ9nygy
         5JN0tRgsLLMMw==
Date:   Mon, 11 Jan 2021 14:42:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Matthew Gerlach <matthew.gerlach@linux.intel.com>,
        Moritz Fischer <mdf@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the char-misc tree
Message-ID: <20210111144228.7d8bbb96@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CT+aXbuL5T3W5/b+dTgRc7Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CT+aXbuL5T3W5/b+dTgRc7Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/fpga/dfl.rst:505: WARNING: Title underline too short.

Location of DFLs on a PCI Device
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Documentation/fpga/dfl.rst:505: WARNING: Title underline too short.

Location of DFLs on a PCI Device
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Documentation/fpga/dfl.rst:523: WARNING: Unexpected indentation.
Documentation/fpga/dfl.rst:523: WARNING: Blank line required after table.
Documentation/fpga/dfl.rst:524: WARNING: Block quote ends without a blank l=
ine; unexpected unindent.

Introduced by commit

  fa41d10589be ("fpga: dfl-pci: locate DFLs by PCIe vendor specific capabil=
ity")

--=20
Cheers,
Stephen Rothwell

--Sig_/CT+aXbuL5T3W5/b+dTgRc7Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/7ySQACgkQAVBC80lX
0GwB5wf/awBEELLKipGDWFtIrhC/oDYltW8zhGjVg/vb6qUdEu/A3Vntzi0+n/Oo
W6zJMC7GfE2FAm0GDqcTOI16rUgxH+mMIPpMCtfSuI6gXdzyHTuL+nYU5Q5Z2Y6d
U/b1CirDbnYxUx+yZ6MVMzp/iAjxFHdUvK9cDrH990yQ/dCy0dE2r/A846jxLfac
YVAODQP6K/8jWSv4vOhVSunyixjusP57IEUY5U3FcU/9ucgsTx8inrEzZImSgfmz
RhlPuh3MpRTeiBsPEpGA4zp1RGSxddO0CH4t4BSqEY1nsVs4UYhhehaPX3AqV/bI
F52Rhpb+3WKqsx69prYmmVINuVtnxg==
=rQM3
-----END PGP SIGNATURE-----

--Sig_/CT+aXbuL5T3W5/b+dTgRc7Q--
