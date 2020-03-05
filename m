Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 139A6179F56
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 06:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgCEFhy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 00:37:54 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37913 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbgCEFhx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Mar 2020 00:37:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Xzzf3bpFz9sPg;
        Thu,  5 Mar 2020 16:37:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583386671;
        bh=uwsly7r56LR1gOgzYn8JlKEjCgBFw6Bgr3L0ffm2qGA=;
        h=Date:From:To:Cc:Subject:From;
        b=eT8UZZeOXhiytl80Ij4zcOXho21Uo/c2x5KatJ6sHGRwXQOq52Ful1deU/NwcTgZp
         RMDKTV/ev6eQJZcr5bwtMql9wBhXRTPNNB4/7zu6NjTfmAfFuQowEGjoXHPowucrwX
         R2/xOj+fTk3yWIR0TZYxkOJ5JjO67XGfEF1T3/R5tljltsQJ0ZCQds7sHIQ+vdQ2uC
         WREf/4W+a9HX35mqsZlyJ9ehAGOuEzK+u9L1Pi8Qx5C1r/dXuLvb9vYzQuJhIiv+54
         V2AR/H/niiD6mbagRRWRLEYY5N3GIng3oSzSlnoKQsGcl5IsQobl/eLMd9FP8ju/Xe
         ojLY3Usxr/Vjw==
Date:   Thu, 5 Mar 2020 16:37:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Walter Wu <walter-zh.wu@mediatek.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200305163743.7128c251@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qCODnZABl+nVPlHcR_c1_U=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qCODnZABl+nVPlHcR_c1_U=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

mm/kasan/common.o: warning: objtool: kasan_report()+0x17: call to report_en=
abled() with UACCESS enabled
In file included from include/linux/bitmap.h:9,
                 from include/linux/cpumask.h:12,
                 from arch/x86/include/asm/paravirt.h:17,
                 from arch/x86/include/asm/irqflags.h:72,
                 from include/linux/irqflags.h:16,
                 from include/linux/rcupdate.h:26,
                 from include/linux/rculist.h:11,
                 from include/linux/pid.h:5,
                 from include/linux/sched.h:14,
                 from include/linux/uaccess.h:6,
                 from arch/x86/include/asm/fpu/xstate.h:5,
                 from arch/x86/include/asm/pgtable.h:26,
                 from include/linux/kasan.h:15,
                 from lib/test_kasan.c:12:
In function 'memmove',
    inlined from 'kmalloc_memmove_invalid_size' at lib/test_kasan.c:301:2:
include/linux/string.h:441:9: warning: '__builtin_memmove' specified bound =
18446744073709551614 exceeds maximum object size 9223372036854775807 [-Wstr=
ingop-overflow=3D]
  441 |  return __builtin_memmove(p, q, size);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  519e500fac64 ("kasan: add test for invalid size in memmove")

That's a bit annoying during a normal x86_64 allmodconfig build ...

--=20
Cheers,
Stephen Rothwell

--Sig_/qCODnZABl+nVPlHcR_c1_U=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5gkCcACgkQAVBC80lX
0GxG5Qf/eCX+x5T2DJ2WL5i9H06GtsJzZX4xIvikvbcofdRdeMCP7mtZG2kEQhz/
6WXEZ57/XNa7HCSLctFkGV1BSp8HeB2sESTOG7Augg392rUa8uej5zCzJC8wskkY
vt0TfTjBEDeTHmUwLyYBheXAKcSWNiby8YIN9eIyu63UCZz/5Vvuf+LcJz4t7Vab
elWzl4uEvqsKlVwkIkZJpn0vUJkHGdTatiGteu8m1OLdgKb1HBOXh+R003fhzrog
cUftGsyZ69XVs8vf2fglw9D3BMkj5ywi88OoZvr+VFoWVNYPPdKziH9LASQwGkCa
LA+EWqJ2NDhGmqBHNUY2D/mnq4tktg==
=ugqg
-----END PGP SIGNATURE-----

--Sig_/qCODnZABl+nVPlHcR_c1_U=--
