Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33AF6CFA49
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 14:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730316AbfJHMqS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Oct 2019 08:46:18 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46669 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730249AbfJHMqS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Oct 2019 08:46:18 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 96910207B8;
        Tue,  8 Oct 2019 08:46:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 08 Oct 2019 08:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=EdI8sCEFdDc6Y+uEa5ouuEc5HjI
        RSH6K92pefphxdNM=; b=df3SblY3TwB23IMomoUXpYWfyzW7SOh7AMVUWQyUcm3
        COVds/lYazsfPmSDm9bFY9lZsttPmsM2PegLzybIvWLPEBkr7uK+di2vJErGQ0bB
        kKDeWKNZB+b/wck/NU5KOHhk3WeWF6bB2Htjc+x1yVkLHDYzfAd53NQK/l3HowJ7
        oX8LuGcWki4n86z4UOq/DxvcyjUGG8eFLI4JNzW5pwdEpw7j7rKGOb2cxK4aWVii
        3NqkWzQC4TmF4eh22rXOk+wr0sytMGTjtJ3nZBLTJu7VD7PO+PG6+mjUDjPHYTMl
        dTsGa9KMHYwbJ8+B5pyQ8X25EIIYdhsxJrB1nO55SkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EdI8sC
        EFdDc6Y+uEa5ouuEc5HjIRSH6K92pefphxdNM=; b=g+eAoDC4bYqX3pMyzGVU0w
        Z3pjM4G58X6QLLlShpMAquJVKEBDe5qKD9A02a2OO6/ideqBh/llGHBTYKTMDCzL
        irrzt+W/Gx+oNtEZX7O74ABASJYqYdV0dQ90F8SKx3dTq+CNIijp1frK6QMppY+X
        sYOSHRKkuf4EW52RUGNLSpYUVbDoZV2hhyxOa6gvxLiMEk5zv26SHA0dTPy2MPwZ
        Pl13CJApdQj8GzhDShKWten5RVv/UJkib4ix5wTKhNxSxoABRWnp+5/FpbxCqs56
        0NRH/LtWaA/HOwumkvGhb8GDzE/AQ5xbeYk3rMhJdVtvPMsBHbVuMWLVMHFBqiew
        ==
X-ME-Sender: <xms:FoWcXQx0ZOF5zmtxfo2OhJhIDEbZOSC6EAdvecwTcn3mMzjAdyMu0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheelgdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeelrddvtdehrddufeeird
    duheehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:FoWcXYgmPTylvXJ1CmiKSyoXZOcEuibF5PlU1a1OANoYazU6SFpYLA>
    <xmx:FoWcXdWEss3BC7FGmGbk9fsjBg4FJMMXHO5fmHaJZ3yunLCCWp0oMw>
    <xmx:FoWcXS32tDFN7QAj0nTAmt0UvYINlu5ZpmiwLx5tjkC13geVd4_llA>
    <xmx:F4WcXTCc9GlFTqNlIrLdogdV1rr4GV_WKSGZ7ZU-vbzFQZh3gG5U-w>
Received: from localhost (unknown [89.205.136.155])
        by mail.messagingengine.com (Postfix) with ESMTPA id ECB238006A;
        Tue,  8 Oct 2019 08:46:13 -0400 (EDT)
Date:   Tue, 8 Oct 2019 14:46:12 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <20191008124612.GA2803978@kroah.com>
References: <20191008134907.0094ca86@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008134907.0094ca86@canb.auug.org.au>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 08, 2019 at 01:49:07PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the staging tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/linux/gpio/consumer.h:5,
>                  from drivers/staging/wfx/bh.c:8:
> drivers/staging/wfx/bh.c: In function 'rx_helper':
> drivers/staging/wfx/bh.c:86:19: warning: passing argument 1 of '__swab16s' makes pointer from integer without a cast [-Wint-conversion]
>    86 |   le16_to_cpus(hif->len);
> include/uapi/linux/byteorder/big_endian.h:97:38: note: in definition of macro '__le16_to_cpus'
>    97 | #define __le16_to_cpus(x) __swab16s((x))
>       |                                      ^
> drivers/staging/wfx/bh.c:86:3: note: in expansion of macro 'le16_to_cpus'
>    86 |   le16_to_cpus(hif->len);
>       |   ^~~~~~~~~~~~
> In file included from include/linux/swab.h:5,
>                  from include/uapi/linux/byteorder/big_endian.h:13,
>                  from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/linux/gpio/consumer.h:5,
>                  from drivers/staging/wfx/bh.c:8:
> include/uapi/linux/swab.h:230:37: note: expected '__u16 *' {aka 'short unsigned int *'} but argument is of type 'uint16_t' {aka 'short unsigned int'}
>   230 | static inline void __swab16s(__u16 *p)
>       |                              ~~~~~~~^
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/linux/gpio/consumer.h:5,
>                  from drivers/staging/wfx/bh.c:8:
> drivers/staging/wfx/bh.c:91:19: warning: passing argument 1 of '__swab16s' makes pointer from integer without a cast [-Wint-conversion]
>    91 |   le16_to_cpus(hif->len);
> include/uapi/linux/byteorder/big_endian.h:97:38: note: in definition of macro '__le16_to_cpus'
>    97 | #define __le16_to_cpus(x) __swab16s((x))
>       |                                      ^
> drivers/staging/wfx/bh.c:91:3: note: in expansion of macro 'le16_to_cpus'
>    91 |   le16_to_cpus(hif->len);
>       |   ^~~~~~~~~~~~
> In file included from include/linux/swab.h:5,
>                  from include/uapi/linux/byteorder/big_endian.h:13,
>                  from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/linux/gpio/consumer.h:5,
>                  from drivers/staging/wfx/bh.c:8:
> include/uapi/linux/swab.h:230:37: note: expected '__u16 *' {aka 'short unsigned int *'} but argument is of type 'uint16_t' {aka 'short unsigned int'}
>   230 | static inline void __swab16s(__u16 *p)
>       |                              ~~~~~~~^
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/net/mac80211.h:16,
>                  from drivers/staging/wfx/key.c:8:
> drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
> drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__swab32s' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   139 |  cpu_to_le32s(&val);
> include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of macro '__cpu_to_le32s'
>    94 | #define __cpu_to_le32s(x) __swab32s((x))
>       |                                      ^
> drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to_le32s'
>   139 |  cpu_to_le32s(&val);
>       |  ^~~~~~~~~~~~
> In file included from include/linux/swab.h:5,
>                  from include/uapi/linux/byteorder/big_endian.h:13,
>                  from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/net/mac80211.h:16,
>                  from drivers/staging/wfx/key.c:8:
> include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned int *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
>   242 | static __always_inline void __swab32s(__u32 *p)
>       |                                       ~~~~~~~^
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/net/mac80211.h:16,
>                  from drivers/staging/wfx/scan.c:8:
> drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
> drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__swab32s' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   139 |  cpu_to_le32s(&val);
> include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of macro '__cpu_to_le32s'
>    94 | #define __cpu_to_le32s(x) __swab32s((x))
>       |                                      ^
> drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to_le32s'
>   139 |  cpu_to_le32s(&val);
>       |  ^~~~~~~~~~~~
> In file included from include/linux/swab.h:5,
>                  from include/uapi/linux/byteorder/big_endian.h:13,
>                  from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/net/mac80211.h:16,
>                  from drivers/staging/wfx/scan.c:8:
> include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned int *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
>   242 | static __always_inline void __swab32s(__u32 *p)
>       |                                       ~~~~~~~^
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/linux/list.h:9,
>                  from include/linux/module.h:9,
>                  from drivers/staging/wfx/main.c:13:
> drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
> drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__swab32s' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   139 |  cpu_to_le32s(&val);
> include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of macro '__cpu_to_le32s'
>    94 | #define __cpu_to_le32s(x) __swab32s((x))
>       |                                      ^
> drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to_le32s'
>   139 |  cpu_to_le32s(&val);
>       |  ^~~~~~~~~~~~
> In file included from include/linux/swab.h:5,
>                  from include/uapi/linux/byteorder/big_endian.h:13,
>                  from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/linux/list.h:9,
>                  from include/linux/module.h:9,
>                  from drivers/staging/wfx/main.c:13:
> include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned int *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
>   242 | static __always_inline void __swab32s(__u32 *p)
>       |                                       ~~~~~~~^
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/net/mac80211.h:16,
>                  from drivers/staging/wfx/data_tx.c:8:
> drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
> drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__swab32s' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   139 |  cpu_to_le32s(&val);
> include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of macro '__cpu_to_le32s'
>    94 | #define __cpu_to_le32s(x) __swab32s((x))
>       |                                      ^
> drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to_le32s'
>   139 |  cpu_to_le32s(&val);
>       |  ^~~~~~~~~~~~
> In file included from include/linux/swab.h:5,
>                  from include/uapi/linux/byteorder/big_endian.h:13,
>                  from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/net/mac80211.h:16,
>                  from drivers/staging/wfx/data_tx.c:8:
> include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned int *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
>   242 | static __always_inline void __swab32s(__u32 *p)
>       |                                       ~~~~~~~^
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/net/mac80211.h:16,
>                  from drivers/staging/wfx/data_tx.c:8:
> drivers/staging/wfx/data_tx.c: In function 'wfx_tx_inner':
> include/uapi/linux/byteorder/big_endian.h:35:26: warning: conversion from 'short unsigned int' to 'uint8_t' {aka 'unsigned char'} changes value from '1024' to '0' [-Woverflow]
>    35 | #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
>       |                          ^
> include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
>    90 | #define cpu_to_le16 __cpu_to_le16
>       |                     ^~~~~~~~~~~~~
> drivers/staging/wfx/data_tx.c:623:16: note: in expansion of macro 'cpu_to_le16'
>   623 |  hif_msg->id = cpu_to_le16(HIF_REQ_ID_TX);
>       |                ^~~~~~~~~~~
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/net/mac80211.h:16,
>                  from drivers/staging/wfx/sta.c:8:
> drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
> drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__swab32s' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   139 |  cpu_to_le32s(&val);
> include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of macro '__cpu_to_le32s'
>    94 | #define __cpu_to_le32s(x) __swab32s((x))
>       |                                      ^
> drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to_le32s'
>   139 |  cpu_to_le32s(&val);
>       |  ^~~~~~~~~~~~
> In file included from include/linux/swab.h:5,
>                  from include/uapi/linux/byteorder/big_endian.h:13,
>                  from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/asm-generic/bug.h:19,
>                  from arch/powerpc/include/asm/bug.h:120,
>                  from include/linux/bug.h:5,
>                  from include/net/mac80211.h:16,
>                  from drivers/staging/wfx/sta.c:8:
> include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned int *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
>   242 | static __always_inline void __swab32s(__u32 *p)
>       |                                       ~~~~~~~^
> In file included from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/linux/list.h:9,
>                  from include/linux/wait.h:7,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:6,
>                  from include/linux/debugfs.h:15,
>                  from drivers/staging/wfx/debug.c:8:
> drivers/staging/wfx/hif_tx_mib.h: In function 'hif_set_mfp':
> drivers/staging/wfx/hif_tx_mib.h:139:15: error: passing argument 1 of '__swab32s' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   139 |  cpu_to_le32s(&val);
> include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of macro '__cpu_to_le32s'
>    94 | #define __cpu_to_le32s(x) __swab32s((x))
>       |                                      ^
> drivers/staging/wfx/hif_tx_mib.h:139:2: note: in expansion of macro 'cpu_to_le32s'
>   139 |  cpu_to_le32s(&val);
>       |  ^~~~~~~~~~~~
> In file included from include/linux/swab.h:5,
>                  from include/uapi/linux/byteorder/big_endian.h:13,
>                  from include/linux/byteorder/big_endian.h:5,
>                  from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                  from include/asm-generic/bitops/le.h:6,
>                  from arch/powerpc/include/asm/bitops.h:243,
>                  from include/linux/bitops.h:26,
>                  from include/linux/kernel.h:12,
>                  from include/linux/list.h:9,
>                  from include/linux/wait.h:7,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:6,
>                  from include/linux/debugfs.h:15,
>                  from drivers/staging/wfx/debug.c:8:
> include/uapi/linux/swab.h:242:46: note: expected '__u32 *' {aka 'unsigned int *'} but argument is of type 'struct hif_mib_protected_mgmt_policy *'
>   242 | static __always_inline void __swab32s(__u32 *p)
>       |                                       ~~~~~~~^
> 
> Caused by commits from the staging tree.
> 
> I have disabled CONFIG_WFX for today.

Should be fixed soon, thanks for the report.

greg k-h
