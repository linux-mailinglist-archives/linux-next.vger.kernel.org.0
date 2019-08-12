Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99E118979D
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 09:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfHLHOQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 03:14:16 -0400
Received: from ozlabs.org ([203.11.71.1]:49781 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725819AbfHLHOQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 03:14:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466Rsx4Nbvz9s7T;
        Mon, 12 Aug 2019 17:14:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565594053;
        bh=3Mq0WAunHGyNQWfkysN1G3I3mXAvo40t6Z+4Ao4y5mk=;
        h=Date:From:To:Cc:Subject:From;
        b=OXrdo30EiwfhuhFS1QM802vAQU3Ni8t4pGovz9KFB7qfq0COBierlUKrvMqpbFJJ2
         rJLmab0iOqelTT8lTBY8+B0HIUrhafDPSQK6kRvU9gI/eAF+QOlU2JTaYpqq6IaDK+
         NTsEM+Hw9/diIpr+D98srWfhVG8U4mc97tEICL+LFRcjSV8d/EjpN/N0NqsAhYGuqg
         4jVplpD6GfbcyOPeNgjill0casP/ezOB9Sm0NGV8IqZuMLqKt38j5LAOK/Hx/n6e+r
         8QRR8UxVA+LY7A0FNua/dOmeLEPgpPGPBnumxBf34TxFmiQNWo2troakswDGpblH5l
         /PEwQGpZJE16A==
Date:   Mon, 12 Aug 2019 17:14:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: linux-next: build warning after merge of the slave-dma tree
Message-ID: <20190812171411.31ec6ae3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BVWyJg0=0F7RxTfY3dyOzMZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BVWyJg0=0F7RxTfY3dyOzMZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the slave-dma tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

WARNING: "omap_dma_filter_fn" [vmlinux] is a static EXPORT_SYMBOL_GPL
WARNING: "edma_filter_fn" [vmlinux] is a static EXPORT_SYMBOL

Introduced by commits

  9c71b9eb3cb2 ("dmaengine: omap-dma: make omap_dma_filter_fn private")
  d2bfe7b5d182 ("dmaengine: edma: make edma_filter_fn private")

--=20
Cheers,
Stephen Rothwell

--Sig_/BVWyJg0=0F7RxTfY3dyOzMZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1REcMACgkQAVBC80lX
0GxeGgf/R6Kwq6hoUOzRJXT14YjO1c5JSk/bFmn9OK0v3sXRZEWhVFIyxjp3OEJ0
Mk6EN45Blw1yHfEfegwnsqjKNcr/RjoimjPSAVRaxq3EavbLvgeV5psmk9JPUriv
fFozEHavt1PLj/uqsTGP6STTpGlwv+Af2pC6ChZ80iPzqQstBvRFxwTTm37CLpjv
77UjMDbA48rtoVHjWk03fHlOTNWdLgbmVNh2+zZ6FYLfA6PeulhJxtJnZtlprxsB
4JrGXgSosTKJ8z2ivpQA9i6U9Z6B1jT3+wIz6KXWSb2qelRF/nhS5IbsDKx8sE/6
C5JfVs7Dafdg/BfrL738Pu2Q1JqS7A==
=1uFL
-----END PGP SIGNATURE-----

--Sig_/BVWyJg0=0F7RxTfY3dyOzMZ--
