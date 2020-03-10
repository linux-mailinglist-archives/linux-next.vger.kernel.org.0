Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E070217F15C
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 09:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgCJICS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 04:02:18 -0400
Received: from ozlabs.org ([203.11.71.1]:32947 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgCJICS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 04:02:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48c6xy0mz6z9sPF;
        Tue, 10 Mar 2020 19:02:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583827335;
        bh=aMJHHEyENsZl87/r2ZJRugO9+TZPdfQT3JlSpCuYIao=;
        h=Date:From:To:Cc:Subject:From;
        b=tu+rIegZQ83tGYwnL75Ey+AsxqAhQda2PAhxflEREV/vmvRUDFm+/KbE/0pqohKLE
         WtoXYt1kAbFGHlw583fd9AjB72I32FW8jnjKklDCmg2kGnu0bFJTJEHgiF3wod33Ea
         liuG1iUZzdsfpNF9PKeNq/XHUPgzwxZOpp41VoNCcJJaHLx6PtspCnJ2fq/ZI8SmbM
         BGvpwWEycK4XScRVYK1xiKcUuTnXeSuIe3/EPw+sJiEnGdjDAgTGzwBTydj76ejDMS
         ootfLtdV9s5dDf9aZLGrG4h6jqZ8FmUSYGVenY+G0bv+sY9ZI9+2YdG+H8CTznqM9+
         /62AUuj83YaNQ==
Date:   Tue, 10 Mar 2020 19:02:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>
Subject: linux-next: manual merge of the akpm-current tree with the vhost
 tree
Message-ID: <20200310190205.7c152ef9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=r6dahv_exMUQNhFiy4ztKK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=r6dahv_exMUQNhFiy4ztKK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/virtio/virtio_balloon.c

between commit:

  b5769cdc14fc ("virtio-balloon: Switch back to OOM handler for VIRTIO_BALL=
OON_F_DEFLATE_ON_OOM")

from the vhost tree and commits:

  b64c4d5bea98 ("virtio-balloon: pull page poisoning config out of free pag=
e hinting")
  80c03575431c ("virtio-balloon: add support for providing free page report=
s to host")

from the akpm-current tree.

I looked at the conflict for a while but could not easily see how to
reconcile it, so I decided to revert the vhost tree commit for today.
Some advice would be appreciated.

--=20
Cheers,
Stephen Rothwell

--Sig_/=r6dahv_exMUQNhFiy4ztKK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5nSX0ACgkQAVBC80lX
0GzZKggAnGNccWdEzs0YfK/+WMBdNyEPGVl4YCnYaOsyvyMNzLr6BG9Q+q3gylXk
DVHqkyioJrrZwuBVWMTGQzCfCKsPC/bHvG29IodU5Hjej8mcL2zCw8PhFq1HXKmb
1cYeTHjMycONT5BQFeocwsC86T6+wZzOKGtwv5wo6XE6xnSPJQMd5uEyeKKouclX
0yIhjthqyH0e0GTC9g2TDALzwbubh9bsJonydHyv8V3scrOZUGtklF/yp1VP3d4c
/wwiySsJxQJzabQomAEUu2WvGYp9AKiXBSG1cjhO+Tgp3d8WUJ12Ln846fWdfPN7
PhesQKsNLwMdDmW3eaR3yWbwj7t99A==
=tVY+
-----END PGP SIGNATURE-----

--Sig_/=r6dahv_exMUQNhFiy4ztKK--
