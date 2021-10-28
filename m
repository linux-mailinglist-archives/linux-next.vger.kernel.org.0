Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5F543E13E
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 14:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhJ1MvV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 08:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhJ1MvU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 08:51:20 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053B9C061570;
        Thu, 28 Oct 2021 05:48:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hg5362VY6z4xcC;
        Thu, 28 Oct 2021 23:48:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635425330;
        bh=qMIVbPc9SEDlDIFTYISLkEwQi2Z5ZL+FYPGu4EViXs8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=txWcebiBUbLAbnV5UVc2+9STGvJ6StNQBssgLRiCUi8s3I/7CXIGU5o7X9BVV3zd3
         CnXFZp+qjz3IZ/zv2ZCPDGNbRdkQmDJqS1Y4o354dgmc8HIwG6Rwm9XvJ3MdX2gq//
         sEY+BYSBO8FW+zHsjl19xHQa+6NtFS2C9ChLTHdgiCprrbCDqdTOScQGhBTJQEM+S/
         TYAuaeIhhPxhWunVlOTJID3uL861BCO5coizx+Z8+w0Rzy3otetHI3rQ5o24wD4OAT
         5xiurrvCOUkhFprRv4d+7MKKJUG4pEdZrJgYwBOKbuKa11QcoID/lJLhhvRFT+vkVM
         tCD0aRlHpJUaQ==
Date:   Thu, 28 Oct 2021 23:48:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Xianting Tian <xianting.tian@linux.alibaba.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: Re: linux-next: Tree for Oct 25
Message-ID: <20211028234846.78e715df@canb.auug.org.au>
In-Reply-To: <8c917fd9-c569-560e-5d6f-e19417f61cdf@linux.alibaba.com>
References: <20211025204921.73cb3011@canb.auug.org.au>
        <20211027224231.1634cc6c@canb.auug.org.au>
        <864bbf0b-e6db-1a97-80f5-a92968a4e086@linux.alibaba.com>
        <20211028155126.0b187410@canb.auug.org.au>
        <8c917fd9-c569-560e-5d6f-e19417f61cdf@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1tUimrjlVqkmddHu6NgRM5=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1tUimrjlVqkmddHu6NgRM5=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Xianting,

On Thu, 28 Oct 2021 15:59:02 +0800 Xianting Tian <xianting.tian@linux.aliba=
ba.com> wrote:
>
> =E5=9C=A8 2021/10/28 =E4=B8=8B=E5=8D=8812:51, Stephen Rothwell =E5=86=99=
=E9=81=93:
> > Hi Xianting,
> >
> > On Thu, 28 Oct 2021 09:51:00 +0800 Xianting Tian <xianting.tian@linux.a=
libaba.com> wrote: =20
> >> =E5=9C=A8 2021/10/27 =E4=B8=8B=E5=8D=887:42, Stephen Rothwell =E5=86=
=99=E9=81=93: =20
> >>> Hi all,
> >>>
> >>> On Mon, 25 Oct 2021 20:49:21 +1100 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote: =20
> >>>> There seems to be something amiss with cnosole output in today's rel=
ease
> >>>> (at least on my ppc qemu boot tests). =20
> >>> The console output seems to be back today.  I assume its repair had
> >>> something to do with commit
> >>>
> >>>     60f41e848492 ("Revert "tty: hvc: pass DMA capable memory to put_c=
hars()"") =20
> >>>   >> hi Stephen=EF=BC=8C =20
> >>
> >> Thanks for the info, Could you share more details about the issue you =
met? is it about early console print issue?
> >> =20
> > Here is the diff between my boot logs: =20
> thanks, I checked the log, Can I understand it as you missed some early b=
ootup log=C2=A0 when use new release?

yes, the console messages stopped for a while when we switched from the
bootconsole to the final hvc0 console.

> > @@ -124,81 +124,9 @@
> >    clocksource: timebase mult[1f40000] shift[24] registered
> >    Console: colour dummy device 80x25
> >    printk: console [hvc0] enabled
> > - printk: console [hvc0] enabled
> > - printk: bootconsole [udbg0] disabled
> >    printk: bootconsole [udbg0] disabled
> > - pid_max: default: 32768 minimum: 301
> > - Mount-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
> > - Mountpoint-cache hash table entries: 8192 (order: 0, 65536 bytes, lin=
ear)
	.
	.
	.
--=20
Cheers,
Stephen Rothwell

--Sig_/1tUimrjlVqkmddHu6NgRM5=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6nC4ACgkQAVBC80lX
0GzX3wf+PRVNguV/NwLbWRT59xlF0tVHUbYcYcAc1em3mhah0nP67tss8gl20XRo
R2IZtPuKyll07tZXo3E5ZkIenDCaLmXluAwpMEgNaSpTZ9ty8lfRzAMV5iUnJ+Cs
zeufcPzmQ1PGZ5TKW1chojT9c5ibGBs9ki+NiiJnmMouaUb+54sceQKW010DRcFf
uUOrfUri9XP3t8y6gOJYnaU9u8uJAz/WGvqnMY/ILyoli5Tj0YPcRZQnAnrq2n8l
gc+SR2WO50P6nvyoSbN1j38/C5K0RgmDp4JxGUt3eHPuaynXeluWNaSqUc/uAidD
8B95dGtRxCy3nH2oDGbLQduWRagwcA==
=E/Nf
-----END PGP SIGNATURE-----

--Sig_/1tUimrjlVqkmddHu6NgRM5=--
