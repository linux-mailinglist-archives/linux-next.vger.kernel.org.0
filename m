Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0E13A7C6A
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 12:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbhFOKwX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 06:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbhFOKwX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 06:52:23 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3672C061574;
        Tue, 15 Jun 2021 03:50:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G44pc1wrhz9sW6;
        Tue, 15 Jun 2021 20:50:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623754217;
        bh=kO1C+iwbV2lIeJjjcEexTAXcxADc2F6p643JpBF/YXQ=;
        h=Date:From:To:Cc:Subject:From;
        b=iWDTx5b7ty/cBR7s7zgNJobgs6aoZxYSlMlwaL3lci63n7UMDM4tApFan0LAxa5RV
         +rtzx7Vdcv0EWzczKKpfLLZyrxWOsojyfgxTXX0AAxKZRUGdHBoP9mGIOorTmXKHlF
         qtX40WAElqnLwdXnRdoq1lvt74SENbnDAL+nEzuevvBdoEtbdys33XzOkzNnlpEH8r
         8fmLYjfaBY6o49CXrXtm8BgfoMfuqNz9fsaYPfSYbDNduZUh8piDCJWTrvO+pKcJr+
         zjxRbWFifbuwNyMZFF9LU6TNUlZJYVUDyKly9A3+FYuzuJ832M3jbzqAjkn1DEuzqP
         2ekjR6uxysErw==
Date:   Tue, 15 Jun 2021 20:50:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the akpm-current tree
Message-ID: <20210615205015.62c35978@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yu1Y5hZLN/zdua8pDSzLnfu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yu1Y5hZLN/zdua8pDSzLnfu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (htmldocs)
produced these warnings:

include/linux/kernel.h:1: warning: 'kstrtol' not found
include/linux/kernel.h:1: warning: 'kstrtoul' not found

Introduced by commit

  af137d888395 ("kernel.h: split out kstrtox() and simple_strtox() to a sep=
arate header")

They are referenced in Documentation/core-api/kernel-api.rst.

--=20
Cheers,
Stephen Rothwell

--Sig_/yu1Y5hZLN/zdua8pDSzLnfu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDIhecACgkQAVBC80lX
0GztJwf/ecHPQ64oxX1iE344jdwyAmGTQ5ihtz/PcA56tCcPZVWzxVEyYqQdMUgS
8NQeQoog82wVDNURpGBJVtd1DIj/85lXoKkg+Vfo2e+HPCT2vGkzp+v7vtOnOQ01
YIdptiaT/N5ufOIfA44uIYiXFj8NQCJVL15c5EuwMtQNy5k5CCqLbqizLqPymW9b
bBdy7Bgemch9boytr9tvzGOmg+FquMvVn4YOysu2VO+7oz8zrA0vfCp6hXU8ykL+
M7i729satEwrOz+LKKBm98VyhLBDzul3Ezg8o5u9jnqtPEjfHEbdyRHhfk0C+0eo
FDwFEha7aaudcOxOuLkEgcaIEtMs7g==
=t5lF
-----END PGP SIGNATURE-----

--Sig_/yu1Y5hZLN/zdua8pDSzLnfu--
