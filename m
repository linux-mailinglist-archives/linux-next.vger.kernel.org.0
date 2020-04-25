Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7241B8A29
	for <lists+linux-next@lfdr.de>; Sun, 26 Apr 2020 01:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgDYXwF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 25 Apr 2020 19:52:05 -0400
Received: from ozlabs.org ([203.11.71.1]:50813 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbgDYXwF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 25 Apr 2020 19:52:05 -0400
Received: by ozlabs.org (Postfix, from userid 1034)
        id 498nrg046wz9sSJ; Sun, 26 Apr 2020 09:52:02 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 45591da765885f7320a111d290b3a28a23eed359
In-Reply-To: <20200422154129.11f988fd@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Haren Myneni <haren@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Message-Id: <498nrg046wz9sSJ@ozlabs.org>
Date:   Sun, 26 Apr 2020 09:52:02 +1000 (AEST)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2020-04-22 at 05:41:29 UTC, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from <command-line>:32:
> ./usr/include/asm/vas-api.h:15:2: error: unknown type name '__u32'
>    15 |  __u32 version;
>       |  ^~~~~
> ./usr/include/asm/vas-api.h:16:2: error: unknown type name '__s16'
>    16 |  __s16 vas_id; /* specific instance of vas or -1 for default */
>       |  ^~~~~
> ./usr/include/asm/vas-api.h:17:2: error: unknown type name '__u16'
>    17 |  __u16 reserved1;
>       |  ^~~~~
> ./usr/include/asm/vas-api.h:18:2: error: unknown type name '__u64'
>    18 |  __u64 flags; /* Future use */
>       |  ^~~~~
> ./usr/include/asm/vas-api.h:19:2: error: unknown type name '__u64'
>    19 |  __u64 reserved2[6];
>       |  ^~~~~
> 
> Caused by commit
> 
>   45f25a79fe50 ("powerpc/vas: Define VAS_TX_WIN_OPEN ioctl API")
> 
> uapi headers should be self contained.  I have added the following patch
> for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 22 Apr 2020 15:28:26 +1000
> Subject: [PATCH] powerpc/vas: uapi headers should be self contained
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/45591da765885f7320a111d290b3a28a23eed359

cheers
