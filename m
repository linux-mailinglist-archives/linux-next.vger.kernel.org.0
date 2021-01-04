Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1814A2E8F2C
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 02:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbhADB1k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 Jan 2021 20:27:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbhADB1j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 Jan 2021 20:27:39 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32355C061793;
        Sun,  3 Jan 2021 17:26:59 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D8HzM6zlVz9sSs;
        Mon,  4 Jan 2021 12:26:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609723616;
        bh=9Im/8Hv5Sd6bN9YMdRIX4JRbfRoWlIqqAPJgCz6l4l8=;
        h=Date:From:To:Cc:Subject:From;
        b=VB94TTohUqM0dvK5UyNgAS7TvMS+ryhv2TK1dNMP8hsAZa9Rz/2iREUyH+X/UXT+Y
         gbO4AhleDnPYsgoo0qBnT191fK97buFIV28UG+/jSWdhpFqMYq0aw2TW2rVTmELs7i
         yM9FHT8FkO44p0cY4CP9SXyQcuJn/VLpmeOFPJwxyXZ3DOKRmi9tz60aWKfupKLDSp
         f/QQazz56Av2EVB7CVg597gwW5w84dDDIOThv14XSlRrt1S1xTt11svE+dnSvICKAl
         KPnA7nXK3WCNNlpxMqsNprBgl+sWava/HiUpSFJz5VLrlJm7dsZ90uV9xZJNLWsk+W
         lGLSEj6vK+B6Q==
Date:   Mon, 4 Jan 2021 12:26:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Song Chen <chensong_2000@189.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failures after merge of the staging tree
Message-ID: <20210104122653.6f35b9bb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ARPb/QYlp33ER/Q.8JmL.l2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ARPb/QYlp33ER/Q.8JmL.l2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/printk.h:6,
                 from include/linux/kernel.h:16,
                 from drivers/staging/board/kzm9d.c:4:
drivers/staging/board/kzm9d.c:28:17: error: initialization of 'initcall_t' =
{aka 'int (*)(void)'} from incompatible pointer type 'void (*)(void)' [-Wer=
ror=3Dincompatible-pointer-types]
   28 | device_initcall(kzm9d_init);
      |                 ^~~~~~~~~~
include/linux/init.h:197:50: note: in definition of macro '___define_initca=
ll'
  197 |   __attribute__((__section__(#__sec ".init"))) =3D fn;
      |                                                  ^~
include/linux/init.h:229:30: note: in expansion of macro '__define_initcall'
  229 | #define device_initcall(fn)  __define_initcall(fn, 6)
      |                              ^~~~~~~~~~~~~~~~~
drivers/staging/board/kzm9d.c:28:1: note: in expansion of macro 'device_ini=
tcall'
   28 | device_initcall(kzm9d_init);
      | ^~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
In file included from include/linux/printk.h:6,
                 from include/linux/kernel.h:16,
                 from include/asm-generic/bug.h:20,
                 from arch/arm/include/asm/bug.h:60,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:12,
                 from include/asm-generic/current.h:5,
                 from ./arch/arm/include/generated/asm/current.h:1,
                 from include/linux/sched.h:12,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from include/linux/dma-mapping.h:7,
                 from drivers/staging/board/armadillo800eva.c:12:
drivers/staging/board/armadillo800eva.c:90:17: error: initialization of 'in=
itcall_t' {aka 'int (*)(void)'} from incompatible pointer type 'void (*)(vo=
id)' [-Werror=3Dincompatible-pointer-types]
   90 | device_initcall(armadillo800eva_init);
      |                 ^~~~~~~~~~~~~~~~~~~~
include/linux/init.h:197:50: note: in definition of macro '___define_initca=
ll'
  197 |   __attribute__((__section__(#__sec ".init"))) =3D fn;
      |                                                  ^~
include/linux/init.h:229:30: note: in expansion of macro '__define_initcall'
  229 | #define device_initcall(fn)  __define_initcall(fn, 6)
      |                              ^~~~~~~~~~~~~~~~~
drivers/staging/board/armadillo800eva.c:90:1: note: in expansion of macro '=
device_initcall'
   90 | device_initcall(armadillo800eva_init);
      | ^~~~~~~~~~~~~~~

Caused by commit

  850c35bb28ec ("staging: board: Remove macro board_staging")

I have used the staging tree from next-20201223 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ARPb/QYlp33ER/Q.8JmL.l2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/ybt0ACgkQAVBC80lX
0GzhQAf+PgUCLpbnFS74afwRx4mVv0Wm6BXasSQOShYVYRR3xUcqdhefS0fD7KUy
US71br1/RMAae5/P4TE/gW74a5+EoectI/YWjnTeLIb7rUPv8rrav+tPUrUDhhav
vl9jxVswVXJbXwJTHeTz31RC/tUCvfo3ME2kUocCW8TcXr8/Sxkkr2AdgSKgbq0d
f86m4Qb4Xm0niFkDPTTv3Sp8ndUH7gQL6ACzXSnWBphnGkErfejocCjtpKKaM6rc
zB4In9sG2TtTsq7QbtuWA2qbqNTSAbsGPNo4x2Ra/HVqXKzZg6jTD6uDeD2q4O04
cFNYS8XT49mCgF9ELB64Ahh6Xkp8lQ==
=XJqI
-----END PGP SIGNATURE-----

--Sig_/ARPb/QYlp33ER/Q.8JmL.l2--
