Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676EF4EA2CD
	for <lists+linux-next@lfdr.de>; Tue, 29 Mar 2022 00:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiC1WN0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Mar 2022 18:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiC1WN0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Mar 2022 18:13:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BA429B12C;
        Mon, 28 Mar 2022 15:02:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E6EF6153F;
        Mon, 28 Mar 2022 21:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DFDC34100;
        Mon, 28 Mar 2022 21:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648504385;
        bh=oNs0fACiFDhDkycLiYXHQaGNFojDAo6v1AQHrYGCu2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AHpsLaobXbTDIEC9UlU7FeCro6s04ki/GTaTC4isZ1IWnqRP64A5mrdUXa9SW0W4g
         p5beKLeP5sC+e5P7DnSaN6lUYQtDf7WwWGfVPeAGwaigqcmMPwbbevsDxl3aj0uzxV
         k6Xtf88KB2UI7zCUzeM/L4NZQKfIOyJzJp5U/oixBMbKXQPOjFEA+ckYxCX8XWi7Yg
         arCAFU7rp2lE5YvvIarvIWfgo8ELcZxnl3rN9Bwvq1q7xoU9ZnJjwmOVuReck7RfG4
         9wtmv2QOD4KNYksX8bPVDg3kkMEPcyeNg/nxQFHUnRSaAzGf8HvdS5b4uvDcSFhjZd
         yuEQ6mLBnDDsg==
Date:   Mon, 28 Mar 2022 14:52:58 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        linux-s390@vger.kernel.org, linux-next@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: s390 defconfig fails to build after
 4afeb670710efa5cd5ed8b1d9f2d22d6ce332bcc
Message-ID: <YkIuOnd6SWBYuKLz@dev-arch.thelio-3990X>
References: <YkH/rRikE2CilpqU@dev-arch.thelio-3990X>
 <your-ad-here.call-01648503866-ext-8764@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <your-ad-here.call-01648503866-ext-8764@work.hours>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 28, 2022 at 11:44:26PM +0200, Vasily Gorbik wrote:
> On Mon, Mar 28, 2022 at 11:34:21AM -0700, Nathan Chancellor wrote:
> > Hi all,
> > 
> > Apologies if this has been reported or fixed already, I did not see a
> > report when searching lore.kernel.org and it is reproducible as of
> > commit 7dcfe50f58d2 ("s390/pci: rename get_zdev_by_bus() to
> > zdev_from_bus()") in s390/linux.git.
> > 
> > Our continuous integration noticed a build failure on next-20220328 in
> > arch/s390/kernel/entry.S, which does not appear to be compiler specific,
> > as I can reproduce this with GCC easily:
> > 
> > https://builds.tuxbuild.com/2716QwFVG9408TJ43vkEc7trVCI/build.log
> > 
> > $ make -skj"$(nproc)" ARCH=s390 CROSS_COMPILE=s390x-linux-gnu- defconfig arch/s390/kernel/entry.o
> > arch/s390/kernel/entry.S: Assembler messages:
> > arch/s390/kernel/entry.S:335: Error: Unrecognized opcode: `jgnop'
> > arch/s390/kernel/entry.S:493: Error: Unrecognized opcode: `jgnop'
> > arch/s390/kernel/entry.S:494: Error: Unrecognized opcode: `jgnop'
> 
> Thank you for reporting this!
> 
> jgnop mnemonic has been introduced with binutils commit
> b10b530a4566 ("IBM Z: Add support for HLASM extended mnemonics")
> 
> and is part of binutils-2_36 and newer.
> 
> I fixed it by using old "brcl 0,0" alternative here:
> https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git/commit/?h=features&id=faf79934e65aff90284725518a5ec3c2241c65ae

Awesome, thank you a lot for the quick fix!

Cheers,
Nathan
