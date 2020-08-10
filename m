Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18B6240B2F
	for <lists+linux-next@lfdr.de>; Mon, 10 Aug 2020 18:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgHJQbb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Aug 2020 12:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgHJQbb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Aug 2020 12:31:31 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBC6C061756;
        Mon, 10 Aug 2020 09:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=FMM2Oh5ZcSDbnvQyC1t6T96Kd/pYSYYJIBdqY44N+mE=; b=VcCcrVlTv4q8hsDw2XhWxjImqo
        1f9DJZEH46qIh7p2rkLn4PG88vV4p0bFar1lLmZYAcAnqwkhTAiw429X/TX1tUyN0psM1k4rzhFyC
        Ui8zFdkoEGd4AWQRbkB0IZBhUDj+YjVNCFxkddwgBeka9S7Tx3QR2KxoidCQn5qvjWB71pzfIFaX0
        Z0+i50mpuP1Lzsa33G6uCbb/edkwV+OWceRKtUI2dsywROH+KBPj46cClTkvRk7PUKjsxebypErvZ
        iuTMTLmK4HzvkNpr9HgNiqYvuqDpVO3GNB7kq+aJP4qFQTjJ4tnMFQUqfCfCdeYzXd9a7jrWqdGP1
        C+ByazgQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k5Ahq-0001Ko-0D; Mon, 10 Aug 2020 16:31:26 +0000
Subject: Re: linux-next: Tree for Aug 10 (drivers/vdpa/mlx5/net)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eli Cohen <eli@mellanox.com>,
        virtualization@lists.linux-foundation.org
References: <20200810141028.2140cfb2@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5a7a0e6d-842a-78f6-aeac-c5b4c27b7186@infradead.org>
Date:   Mon, 10 Aug 2020 09:31:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810141028.2140cfb2@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/9/20 9:10 PM, Stephen Rothwell wrote:
> Hi all,
> 


on i386:

Lots (63) of left shift warnings: {not all are shown here}


  CC      drivers/vdpa/mlx5/net/mlx5_vnet.o
In file included from ../include/linux/bits.h:6:0,
                 from ../include/linux/bitops.h:5,
                 from ../include/linux/kernel.h:12,
                 from ../include/linux/vdpa.h:5,
                 from ../drivers/vdpa/mlx5/net/mlx5_vnet.c:4:
../drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'print_features':
../include/vdso/bits.h:7:26: warning: left shift count >= width of type [-Wshift-count-overflow]
 #define BIT(nr)   (UL(1) << (nr))
                          ^
../drivers/vdpa/mlx5/net/mlx5_vnet.c:27:60: note: in expansion of macro 'BIT'
   BIT(VIRTIO_NET_F_MQ) | BIT(VIRTIO_NET_F_CTRL_MAC_ADDR) | BIT(VIRTIO_NET_F_HASH_REPORT) |  \
                                                            ^~~
../drivers/vdpa/mlx5/net/mlx5_vnet.c:186:18: note: in expansion of macro 'VALID_FEATURES_MASK'
  if (features & ~VALID_FEATURES_MASK)
                  ^~~~~~~~~~~~~~~~~~~
../include/vdso/bits.h:7:26: warning: left shift count >= width of type [-Wshift-count-overflow]
 #define BIT(nr)   (UL(1) << (nr))
                          ^
../drivers/vdpa/mlx5/net/mlx5_vnet.c:28:3: note: in expansion of macro 'BIT'
   BIT(VIRTIO_NET_F_RSS) | BIT(VIRTIO_NET_F_RSC_EXT) | BIT(VIRTIO_NET_F_STANDBY) |           \
   ^~~
../drivers/vdpa/mlx5/net/mlx5_vnet.c:186:18: note: in expansion of macro 'VALID_FEATURES_MASK'
  if (features & ~VALID_FEATURES_MASK)
                  ^~~~~~~~~~~~~~~~~~~
../include/vdso/bits.h:7:26: warning: left shift count >= width of type [-Wshift-count-overflow]
 #define BIT(nr)   (UL(1) << (nr))
                          ^
../drivers/vdpa/mlx5/net/mlx5_vnet.c:28:27: note: in expansion of macro 'BIT'
   BIT(VIRTIO_NET_F_RSS) | BIT(VIRTIO_NET_F_RSC_EXT) | BIT(VIRTIO_NET_F_STANDBY) |           \
                           ^~~
../drivers/vdpa/mlx5/net/mlx5_vnet.c:186:18: note: in expansion of macro 'VALID_FEATURES_MASK'
  if (features & ~VALID_FEATURES_MASK)
                  ^~~~~~~~~~~~~~~~~~~
../include/vdso/bits.h:7:26: warning: left shift count >= width of type [-Wshift-count-overflow]
 #define BIT(nr)   (UL(1) << (nr))
                          ^
../drivers/vdpa/mlx5/net/mlx5_vnet.c:28:55: note: in expansion of macro 'BIT'
   BIT(VIRTIO_NET_F_RSS) | BIT(VIRTIO_NET_F_RSC_EXT) | BIT(VIRTIO_NET_F_STANDBY) |           \
                                                       ^~~
../drivers/vdpa/mlx5/net/mlx5_vnet.c:186:18: note: in expansion of macro 'VALID_FEATURES_MASK'
  if (features & ~VALID_FEATURES_MASK)
                  ^~~~~~~~~~~~~~~~~~~
../include/vdso/bits.h:7:26: warning: left shift count >= width of type [-Wshift-count-overflow]
 #define BIT(nr)   (UL(1) << (nr))
                          ^
../drivers/vdpa/mlx5/net/mlx5_vnet.c:29:3: note: in expansion of macro 'BIT'
   BIT(VIRTIO_NET_F_SPEED_DUPLEX) | BIT(VIRTIO_F_NOTIFY_ON_EMPTY) |                          \
   ^~~
../drivers/vdpa/mlx5/net/mlx5_vnet.c:186:18: note: in expansion of macro 'VALID_FEATURES_MASK'
  if (features & ~VALID_FEATURES_MASK)
                  ^~~~~~~~~~~~~~~~~~~
../include/vdso/bits.h:7:26: warning: left shift count >= width of type [-Wshift-count-overflow]
 #define BIT(nr)   (UL(1) << (nr))
                          ^
../drivers/vdpa/mlx5/net/mlx5_vnet.c:30:30: note: in expansion of macro 'BIT'
   BIT(VIRTIO_F_ANY_LAYOUT) | BIT(VIRTIO_F_VERSION_1) | BIT(VIRTIO_F_ACCESS_PLATFORM) |      \
                              ^~~
../drivers/vdpa/mlx5/net/mlx5_vnet.c:186:18: note: in expansion of macro 'VALID_FEATURES_MASK'
  if (features & ~VALID_FEATURES_MASK)
                  ^~~~~~~~~~~~~~~~~~~



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
