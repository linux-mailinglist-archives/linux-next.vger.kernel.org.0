Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1779B31B5EF
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 09:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhBOIfB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 03:35:01 -0500
Received: from ozlabs.org ([203.11.71.1]:45189 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229916AbhBOIfA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Feb 2021 03:35:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DfHT63WKCz9sBJ;
        Mon, 15 Feb 2021 19:34:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613378058;
        bh=VRxtKbv9UpspCX3T3/0clEZiSlEKZNnaUW43DNVBLEA=;
        h=Date:From:To:Cc:Subject:From;
        b=rNsl+K6cY5ZcFk0l7g2zl6/Ehnqcqvv3PJQGMgzfSJkV9mduBEUZCbC5yOeqWGKge
         AnhQlEEK8j1wySDIJd7EZh6y9vcuCtBDtcATYxdjJl8I7xXxYhu6Git+mL3u1yZuVj
         U1EW0jGjDrvhLMk7eD4fvNHntNkv50flgfzl/AYRUvs4F3B0bIvY8IEjbfNIhpM9o5
         8eTHvc7SrGnEoIwJFvqAzDugjoLt4mLIy9J6rWvustXGbjm8PmFNHwKZgpvreKHrY7
         Ef2R6Ie6NKBrKuSttyPFGxvuUwH6ydAW289E0VM9Y7wtZL3o+Ync57faqiMLo12g9I
         +RZYGBnhvvwnA==
Date:   Mon, 15 Feb 2021 19:34:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Ben Widawsky <ben.widawsky@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the nvdimm tree
Message-ID: <20210215193417.1d7af954@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kJ0Q3rH6FO2wStuWMS15x5K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kJ0Q3rH6FO2wStuWMS15x5K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nvdimm tree, today's linux-next build (htmldocs)
produced these warnings:

include/uapi/linux/cxl_mem.h:168: warning: Function parameter or member 'in=
' not described in 'cxl_send_command'
include/uapi/linux/cxl_mem.h:168: warning: Function parameter or member 'ou=
t' not described in 'cxl_send_command'

Introduced by commit

  7e20cad0a205 ("cxl/mem: Add basic IOCTL interface")

--=20
Cheers,
Stephen Rothwell

--Sig_/kJ0Q3rH6FO2wStuWMS15x5K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAqMgkACgkQAVBC80lX
0GzHHgf/XznDpjd/+zgf3uVxepw18PxRkKL0kmGBH+N8HO43yHpF31KaubdW3E9G
fGKjmOPSZ+S4Xj58A0n7WdeJbUcTyoNaeLafIs6/a/IyEBGycH+LPFyJ+cCuqA7p
xzGu5CLNgau1BKbFD7SevKRTkb2kd2ogVnQJUPonIWF5yPMAxGGZz4T762tOtJq6
BCJgIwMXEHeTTemEyJzV3TYZ1xcoFw8YPfap3ajKNxlHaslXMa+bAWbsivrd3yr9
H5eJxy8A9fKuMWlCoqklqYKI7wgnqXI8IEXGmTDgs43kCGMQDx4qWA+y3jOUzW17
PXN7EhGwDR6PANFWCkeWClChL4GT5A==
=sIp3
-----END PGP SIGNATURE-----

--Sig_/kJ0Q3rH6FO2wStuWMS15x5K--
