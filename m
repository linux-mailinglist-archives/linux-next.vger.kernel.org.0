Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8046438E71
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 06:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbhJYEmG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 00:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhJYEmG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 00:42:06 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA21C061745;
        Sun, 24 Oct 2021 21:39:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hd2L72NKlz4xbP;
        Mon, 25 Oct 2021 15:39:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635136783;
        bh=RaZntV467jJhI65Nc4URoJTuDEc8f5+1tJdidFOL3xQ=;
        h=Date:From:To:Cc:Subject:From;
        b=ldtXs5wzJZoHwaayPf56OV+AtuqIhrz2AEGNHz5C0WPOP0rN9CaGxSGLzs13Bi/3v
         Bvj05l4cutUWYUsSyd4OQAUoX7kTqtmQdsy5CMK2WvkyZt//wPEWfUAvXF0OYN1LrS
         mS+DlPS0vXVJRzWnTxA5qZNT5mxs+2RBrAvB7J9xJkHUf1hPvkNmhAfKIe8YtI7lV9
         Ebkh5mOXpd/c0DcCmHwJ6lVlpDcnJ6NEzptgGJAPa+j/AL+QafcSpVvsCbSMB1trmJ
         5MjCyqM8cexN82i8uVYpmcSigXKpatnwJeHluBtF024GRgoUNnJsdanXoasY4QJMwC
         rxCsT+7mC+h+Q==
Date:   Mon, 25 Oct 2021 15:39:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ftrace tree
Message-ID: <20211025153942.0c31bd06@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mcChzwc4swO.RnXTtuIDi95";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mcChzwc4swO.RnXTtuIDi95
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: vmlinux.o(.text.unlikely+0x90082): Section mismatch in re=
ference from the function xbc_alloc_mem() to the function .init.text:memblo=
ck_alloc_try_nid()
The function xbc_alloc_mem() references
the function __init memblock_alloc_try_nid().
This is often because xbc_alloc_mem lacks a __init=20
annotation or the annotation of memblock_alloc_try_nid is wrong.

Introduced by commit

  4ee1b4cac236 ("bootconfig: Cleanup dummy headers in tools/bootconfig")

--=20
Cheers,
Stephen Rothwell

--Sig_/mcChzwc4swO.RnXTtuIDi95
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2NQ4ACgkQAVBC80lX
0Gwk8Qf+IvF+aCHvU3Ar+xWxDYXyyfs8r1yc6mNV7+AZPMm365uF8oPXHqXPUZko
PR/8jsppjVSsIiofGVypvij4nadrk6zjwBPUUzWxa01sRc7tDIhDe9hqvJ5w42C7
7/iQjtlF8WCKRxTvFM2C++8wWcpKv5P7Vi7IA8NbEt6a2z1r4pVfj2G2V2/Onijo
ynuGoQjAJN+lbgpTLsflKikhN4NAeK0X2M7qUeX99SKX4uZa4t654YnYjlfZZaYM
lBjuTwH+vosqRW4rq2dyNXbQ97Bp9G86+6OQqSyNr/QG36qE+jlUdMiUDXMBXkwU
VS4JHAxmYNZTNu6/0ZJoz5MC7acWcw==
=XZML
-----END PGP SIGNATURE-----

--Sig_/mcChzwc4swO.RnXTtuIDi95--
