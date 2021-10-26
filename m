Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F1E43AB90
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 07:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233324AbhJZFN7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 01:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbhJZFN5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 01:13:57 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D76BC061745;
        Mon, 25 Oct 2021 22:11:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hdg0M4ZV3z4xbP;
        Tue, 26 Oct 2021 16:11:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635225092;
        bh=Dt88rHeP7o+tYva9CgghXgxt3bjXFV9LutevvkXchLU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Bn98nhEH2e2imUOFXx62gb+GnE2B4M3un56B5bTFqHJdQYgJOhQOWyxrs7SYz4Pxo
         4FSLnUjO2FwAGOdpmPnapnAm6CA6vweI1tKJWJq/E4735gGuXTnRkDSf9aMeNKzjHh
         HvApy1hOSv/jo1/lKXhcImTfZT5gnDCVveTpd/8JJVLb3pHHq/wBt3WfNKipJFM8HH
         ALkkAr2tDzfZZSh2I1HVBpQMgEMZj7Aw2u4pcSzVTLN6gr3vDn/vGD0PtDYeeb82S7
         zhCyKsjAM0mpE8ZMowL3kahg+cXHi6eMtar/cS6RR3jzOP8fqn8zgbvykv2U+3C4e1
         By3L840SJ3cIA==
Date:   Tue, 26 Oct 2021 16:11:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Oct 25 (bootconfig: xbc_alloc_mem())
Message-ID: <20211026161130.0d308f46@canb.auug.org.au>
In-Reply-To: <fe148532-a26d-103a-bcb5-4a749763d71a@infradead.org>
References: <20211025204921.73cb3011@canb.auug.org.au>
        <fe148532-a26d-103a-bcb5-4a749763d71a@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/stWXY/RxGm8wIDtitIfAC.0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/stWXY/RxGm8wIDtitIfAC.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Mon, 25 Oct 2021 20:20:02 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> on i386:
>=20
> WARNING: modpost: vmlinux.o(.text.unlikely+0x29b16): Section mismatch in =
reference from the function xbc_alloc_mem() to the function .init.text:memb=
lock_alloc_try_nid()
> The function xbc_alloc_mem() references
> the function __init memblock_alloc_try_nid().
> This is often because xbc_alloc_mem lacks a __init
> annotation or the annotation of memblock_alloc_try_nid is wrong.
>=20
> Looks like lib/bootconfig.c::xbc_alloc_mem() should be marked
> as __init (when it's built for KERNEL).

See: https://lore.kernel.org/lkml/20211025153942.0c31bd06@canb.auug.org.au/

P.S. please trim your replies.
--=20
Cheers,
Stephen Rothwell

--Sig_/stWXY/RxGm8wIDtitIfAC.0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3jgIACgkQAVBC80lX
0Gz54wf8CQhHFl3kATxDouQSvXj/nZHi34g5g7AgTQ4fshNbSelZ7+iATVXFmTE5
d8HvmUUoGlf9Z3NQjJn5oNrk4Vqe0VotVoRgxD30qFvfOxyONm3VB5N2bdJ6Gu3Y
ZNetAiTyMRpjkAP0XaoKtEdp6eLzW3R6bUv3JPDCWt9LLTehM9sBApADdwRSqkGK
9RrD5+s8ESLlfTetCNMIzKKXrFqNoWJs9MzlRAJ6GrNFGHLGZRqfPAuGRLQvYYoy
u2RR+JAiHFvbov0Z+jGOlfpufbUz6vg7WwogAY18U54LxvwzMPFFaoDzb/kjibOB
h1eRtyPjcG62h/O7k/xxWR9soOpG9g==
=bxP8
-----END PGP SIGNATURE-----

--Sig_/stWXY/RxGm8wIDtitIfAC.0--
