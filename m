Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B9E1D2AFD
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 11:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgENJKn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 05:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725925AbgENJKn (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 05:10:43 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A9FC061A0C;
        Thu, 14 May 2020 02:10:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49N5Nw2w9Pz9sVF;
        Thu, 14 May 2020 19:10:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589447440;
        bh=NhjL9VlUyN/XIGusht/E5VqlC4r+pNqaBxOXnG5nP0A=;
        h=Date:From:To:Cc:Subject:From;
        b=BtrEL7QPo8BtTvUMRtFQUTiqrZXQxXep/mIX9LMcHEHeURAw7O5k5mcYzSIbPHd2i
         iVrLjmmRLIK4m1MuoOMru1uPGRKn88SjY8cro0r7CDjvG9RfIwn0u48hUploD+OTgi
         cEfPYNDuciTPo2Ow56ACba5kLr6str5S9D1uYHdW0cGW/hgRkod+h1ZlhOXmESc2ic
         VP5VXyVNzLT7MtbJliTWrczoECNyN+q35zNc35zXMNNMFMqjpBkQPj6kQrfkkU4LJW
         U+YcrAzBoLpNtlb5yx+wFGuwUlCPbpg01vst28PTJs/okoMNw7m2UX42ICQf5yDX9n
         cO9MLT1x0b0nQ==
Date:   Thu, 14 May 2020 19:10:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the fsinfo tree
Message-ID: <20200514191036.0e7bdcc8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RTHD1.WwJ4n/3j_t4bSOot5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RTHD1.WwJ4n/3j_t4bSOot5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fsinfo tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

samples/vfs/test-fsinfo.c: In function 'dump_fsinfo_generic_statfs':
samples/vfs/test-fsinfo.c:135:30: warning: format '%llu' expects argument o=
f type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
  135 |  printf("\tbsize        : %llu\n", f->f_bsize);
      |                           ~~~^     ~~~~~~~~~~
      |                              |      |
      |                              |      __u64 {aka long unsigned int}
      |                              long long unsigned int
      |                           %lu
samples/vfs/test-fsinfo.c:136:30: warning: format '%llu' expects argument o=
f type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
  136 |  printf("\tfrsize       : %llu\n", f->f_frsize);
      |                           ~~~^     ~~~~~~~~~~~
      |                              |      |
      |                              |      __u64 {aka long unsigned int}
      |                              long long unsigned int
      |                           %lu

Introduced by commit

  1b3979fc0f0c ("fsinfo: Add fsinfo() syscall to query filesystem informati=
on")

--=20
Cheers,
Stephen Rothwell

--Sig_/RTHD1.WwJ4n/3j_t4bSOot5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl69CwwACgkQAVBC80lX
0GyxJAf/bciRnNmkFu5WWPBUbEc8AmrhTxymcewblXtjCjMWbjvt0pf80yMy+4nJ
oH/MHojjO94ivY/xLxUJ4f5UZlLS5uKlewHPSDeyGNq7iWprANgZP/sSoJbVMPMY
Khs8pWKn+Lbpqa6zE23RFtQOrW/y+5Fu1qJhXoN1/e5/kCqUtuBsDP1nRtl318t8
bLjzcc70cxlrJB3LD9V/U9DDJIBjjHzZcYOJW+x/11Azb0eTKbjQiUTcIvJASlVm
zhNASvywmYE9ObfTEUwrK1PYlIR9J0f8U7EZEP1XRoYvQy8Hf2JJpO24ODM/CswV
GzT23JvVWRDtmsEMzvneI7BmKTgNzA==
=Rh7R
-----END PGP SIGNATURE-----

--Sig_/RTHD1.WwJ4n/3j_t4bSOot5--
