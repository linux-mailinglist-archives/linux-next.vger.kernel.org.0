Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37D46CF0EA
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 04:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbfJHCtN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Oct 2019 22:49:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58401 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729212AbfJHCtN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Oct 2019 22:49:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46nMHm0qPQz9sNF;
        Tue,  8 Oct 2019 13:49:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570502948;
        bh=/567uIb1VV3/VBspvEx5JSr/q+3w1t0oh/b9m5/CrS8=;
        h=Date:From:To:Cc:Subject:From;
        b=UOADYmKEk42ZhX+Kj4q4tU9ltJOInaBzCPp6C5TNnVhDTCT09Lm5g3dD1f5L7ozXC
         PgG66GaLmR72J39PbNeDqQTkbS7NXajrTOmxUdUWDNkfostL9Rk+0UTwevFsKdPp/+
         Hjs20XdZ64JTyFW4PoC3qmpNVbE1QlMD5aA4/QyfGO9T0Bhae/yiz/at5syshwl1hq
         vpr6egun3q/jm/vJQpxEkgkQ/8agn4jmcRfeinABr5plSNV+0CPM67W0R1WcbYFg89
         3EW+xVNUxe62zdtwQ9P9iGQWrCExGouaILVCF1+ztFhUypDJDyImHeBilGdKc5GyAJ
         DIVdgXJv8NncQ==
Date:   Tue, 8 Oct 2019 13:49:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
Subject: linux-next: build failure after merge of the staging tree
Message-ID: <20191008134907.0094ca86@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zBeJEVsbQ=gjF31v36.qUUW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zBeJEVsbQ=gjF31v36.qUUW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/linux/gpio/consumer.h:5,
                 from drivers/staging/wfx/bh.c:8:
drivers/staging/wfx/bh.c: In function 'rx_helper':
drivers/staging/wfx/bh.c:86:19: warning: passing argument 1 of '__swab16s' =
makes pointer from integer without a cast [-Wint-conversion]
   86 |   le16_to_cpus(hif->len);
include/uapi/linux/byteorder/big_endian.h:97:38: note: in definition of mac=
ro '__le16_to_cpus'
   97 | #define __le16_to_cpus(x) __swab16s((x))
      |                                      ^
drivers/staging/wfx/bh.c:86:3: note: in expansion of macro 'le16_to_cpus'
   86 |   le16_to_cpus(hif->len);
      |   ^~~~~~~~~~~~
In file included from include/linux/swab.h:5,
                 from include/uapi/linux/byteorder/big_endian.h:13,
                 from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/linux/gpio/consumer.h:5,
                 from drivers/staging/wfx/bh.c:8:
include/uapi/linux/swab.h:230:37: note: expected '__u16 *' {aka 'short unsi=
gned int *'} but argument is of type 'uint16_t' {aka 'short unsigned int'}
  230 | static inline void __swab16s(__u16 *p)
      |                              ~~~~~~~^
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/linux/gpio/consumer.h:5,
                 from drivers/staging/wfx/bh.c:8:
drivers/staging/wfx/bh.c:91:19: warning: passing argument 1 of '__swab16s' =
makes pointer from integer without a cast [-Wint-conversion]
   91 |   le16_to_cpus(hif->len);
include/uapi/linux/byteorder/big_endian.h:97:38: note: in definition of mac=
ro '__le16_to_cpus'
   97 | #define __le16_to_cpus(x) __swab16s((x))
      |                                      ^
drivers/staging/wfx/bh.c:91:3: note: in expansion of macro 'le16_to_cpus'
   91 |   le16_to_cpus(hif->len);
      |   ^~~~~~~~~~~~
In file included from include/linux/swab.h:5,
                 from include/uapi/linux/byteorder/big_endian.h:13,
                 from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/linux/gpio/consumer.h:5,
                 from drivers/staging/wfx/bh.c:8:
include/uapi/linux/swab.h:230:37: note: expected '__u16 *' {aka 'short unsi=
gned int *'} but argument is of type 'uint16_t' {aka 'short unsigned int'}
  230 | static inline void __swab16s(__u16 *p)
      |                              ~~~~~~~^
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/net/mac80211.h:16,
                 from drivers/staging/wfx/key.c:8:
drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__sw=
ab32s' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
  139 |  cpu_to_le32s(&val);
include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of mac=
ro '__cpu_to_le32s'
   94 | #define __cpu_to_le32s(x) __swab32s((x))
      |                                      ^
drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to=
_le32s'
  139 |  cpu_to_le32s(&val);
      |  ^~~~~~~~~~~~
In file included from include/linux/swab.h:5,
                 from include/uapi/linux/byteorder/big_endian.h:13,
                 from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/net/mac80211.h:16,
                 from drivers/staging/wfx/key.c:8:
include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned i=
nt *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
  242 | static __always_inline void __swab32s(__u32 *p)
      |                                       ~~~~~~~^
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/net/mac80211.h:16,
                 from drivers/staging/wfx/scan.c:8:
drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__sw=
ab32s' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
  139 |  cpu_to_le32s(&val);
include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of mac=
ro '__cpu_to_le32s'
   94 | #define __cpu_to_le32s(x) __swab32s((x))
      |                                      ^
drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to=
_le32s'
  139 |  cpu_to_le32s(&val);
      |  ^~~~~~~~~~~~
In file included from include/linux/swab.h:5,
                 from include/uapi/linux/byteorder/big_endian.h:13,
                 from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/net/mac80211.h:16,
                 from drivers/staging/wfx/scan.c:8:
include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned i=
nt *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
  242 | static __always_inline void __swab32s(__u32 *p)
      |                                       ~~~~~~~^
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/linux/list.h:9,
                 from include/linux/module.h:9,
                 from drivers/staging/wfx/main.c:13:
drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__sw=
ab32s' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
  139 |  cpu_to_le32s(&val);
include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of mac=
ro '__cpu_to_le32s'
   94 | #define __cpu_to_le32s(x) __swab32s((x))
      |                                      ^
drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to=
_le32s'
  139 |  cpu_to_le32s(&val);
      |  ^~~~~~~~~~~~
In file included from include/linux/swab.h:5,
                 from include/uapi/linux/byteorder/big_endian.h:13,
                 from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/linux/list.h:9,
                 from include/linux/module.h:9,
                 from drivers/staging/wfx/main.c:13:
include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned i=
nt *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
  242 | static __always_inline void __swab32s(__u32 *p)
      |                                       ~~~~~~~^
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/net/mac80211.h:16,
                 from drivers/staging/wfx/data_tx.c:8:
drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__sw=
ab32s' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
  139 |  cpu_to_le32s(&val);
include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of mac=
ro '__cpu_to_le32s'
   94 | #define __cpu_to_le32s(x) __swab32s((x))
      |                                      ^
drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to=
_le32s'
  139 |  cpu_to_le32s(&val);
      |  ^~~~~~~~~~~~
In file included from include/linux/swab.h:5,
                 from include/uapi/linux/byteorder/big_endian.h:13,
                 from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/net/mac80211.h:16,
                 from drivers/staging/wfx/data_tx.c:8:
include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned i=
nt *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
  242 | static __always_inline void __swab32s(__u32 *p)
      |                                       ~~~~~~~^
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/net/mac80211.h:16,
                 from drivers/staging/wfx/data_tx.c:8:
drivers/staging/wfx/data_tx.c: In function 'wfx_tx_inner':
include/uapi/linux/byteorder/big_endian.h:35:26: warning: conversion from '=
short unsigned int' to 'uint8_t' {aka 'unsigned char'} changes value from '=
1024' to '0' [-Woverflow]
   35 | #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
      |                          ^
include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu=
_to_le16'
   90 | #define cpu_to_le16 __cpu_to_le16
      |                     ^~~~~~~~~~~~~
drivers/staging/wfx/data_tx.c:623:16: note: in expansion of macro 'cpu_to_l=
e16'
  623 |  hif_msg->id =3D cpu_to_le16(HIF_REQ_ID_TX);
      |                ^~~~~~~~~~~
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/net/mac80211.h:16,
                 from drivers/staging/wfx/sta.c:8:
drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__sw=
ab32s' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
  139 |  cpu_to_le32s(&val);
include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of mac=
ro '__cpu_to_le32s'
   94 | #define __cpu_to_le32s(x) __swab32s((x))
      |                                      ^
drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to=
_le32s'
  139 |  cpu_to_le32s(&val);
      |  ^~~~~~~~~~~~
In file included from include/linux/swab.h:5,
                 from include/uapi/linux/byteorder/big_endian.h:13,
                 from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:120,
                 from include/linux/bug.h:5,
                 from include/net/mac80211.h:16,
                 from drivers/staging/wfx/sta.c:8:
include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned i=
nt *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
  242 | static __always_inline void __swab32s(__u32 *p)
      |                                       ~~~~~~~^
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/linux/list.h:9,
                 from include/linux/wait.h:7,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:6,
                 from include/linux/debugfs.h:15,
                 from drivers/staging/wfx/debug.c:8:
drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__sw=
ab32s' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
  139 |  cpu_to_le32s(&val);
include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of mac=
ro '__cpu_to_le32s'
   94 | #define __cpu_to_le32s(x) __swab32s((x))
      |                                      ^
drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to=
_le32s'
  139 |  cpu_to_le32s(&val);
      |  ^~~~~~~~~~~~
In file included from include/linux/swab.h:5,
                 from include/uapi/linux/byteorder/big_endian.h:13,
                 from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:243,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/linux/list.h:9,
                 from include/linux/wait.h:7,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:6,
                 from include/linux/debugfs.h:15,
                 from drivers/staging/wfx/debug.c:8:
include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned i=
nt *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
  242 | static __always_inline void __swab32s(__u32 *p)
      |                                       ~~~~~~~^

Caused by commits from the staging tree.

I have disabled CONFIG_WFX for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/zBeJEVsbQ=gjF31v36.qUUW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2b+SMACgkQAVBC80lX
0Gwx7wgAhuqF73mTVHFlbvF4uXeFQg41HIPzlfSADdiumygR9alm6LF2R4v3nu3U
T0uwp5tNIsXhNQesQahanyce3KrxUZt/IVCfN2OMxAT8ros8ogYTmZjoeORpQxkQ
vZBSr1iWfOOSYW4CWSNUyixwWoxx3aGy7mecyKq3y+UhC0mTNQ3eTJKRz/RZ3Woo
UdQbmvJsYF01lxc587EspRFWKVlMEM9tSyf4nTP9/TQ1EfDC3dyvzzrDrcLj9DbG
pSbBcIi58rXXO7p5P393ydHcZkaV8qJMbSVwUyXcDeBkddR6exVf4nvv5UUojLEw
Wp0nZifnurWre/gFk6KVzjjEe7IEKg==
=8j5c
-----END PGP SIGNATURE-----

--Sig_/zBeJEVsbQ=gjF31v36.qUUW--
