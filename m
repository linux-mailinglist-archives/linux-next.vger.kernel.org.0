Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91A364E9F00
	for <lists+linux-next@lfdr.de>; Mon, 28 Mar 2022 20:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243190AbiC1SgM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Mar 2022 14:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237113AbiC1SgL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Mar 2022 14:36:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8FC4CD6A;
        Mon, 28 Mar 2022 11:34:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF334611D6;
        Mon, 28 Mar 2022 18:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE483C340F0;
        Mon, 28 Mar 2022 18:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648492469;
        bh=bBbJyKWaKqZSl867ct1z9j/2rS/3DFocRJvGbOT/w6U=;
        h=Date:From:To:Cc:Subject:From;
        b=Q/KglgPgJ0pk2GoUg8dncSjJA8u9jOYjpkxG9q8RC5NG+J5UKiIf/6oG28/azbE0N
         kgc9jImchiPRIXxpne/on6epcAP1NQnYRIx21vZhu3W1HOGdZ5k+uTP4LIhKOJyRip
         NjfkAcDHGtL8CHiEUEpzzuTUaWwyh1AvGWIyvMWPskTJLrdF0e78O81iG2FHQRJQo2
         Ekr425EAcGkwjLr3CW8gfDxOZMCcmikcJiXQlWsn3GmYkD8tkEQrynXXpYy5svEANz
         aSWIHyAcOY9VBpciThtHTkXxm14BTtbnSr1BBG5w+GgwZnutA5+MA0tXMj0DRoABWk
         qvMZChIOA/XZA==
Date:   Mon, 28 Mar 2022 11:34:21 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>
Cc:     linux-s390@vger.kernel.org, linux-next@vger.kernel.org,
        llvm@lists.linux.dev
Subject: s390 defconfig fails to build after
 4afeb670710efa5cd5ed8b1d9f2d22d6ce332bcc
Message-ID: <YkH/rRikE2CilpqU@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Apologies if this has been reported or fixed already, I did not see a
report when searching lore.kernel.org and it is reproducible as of
commit 7dcfe50f58d2 ("s390/pci: rename get_zdev_by_bus() to
zdev_from_bus()") in s390/linux.git.

Our continuous integration noticed a build failure on next-20220328 in
arch/s390/kernel/entry.S, which does not appear to be compiler specific,
as I can reproduce this with GCC easily:

https://builds.tuxbuild.com/2716QwFVG9408TJ43vkEc7trVCI/build.log

$ make -skj"$(nproc)" ARCH=s390 CROSS_COMPILE=s390x-linux-gnu- defconfig arch/s390/kernel/entry.o
arch/s390/kernel/entry.S: Assembler messages:
arch/s390/kernel/entry.S:335: Error: Unrecognized opcode: `jgnop'
arch/s390/kernel/entry.S:493: Error: Unrecognized opcode: `jgnop'
arch/s390/kernel/entry.S:494: Error: Unrecognized opcode: `jgnop'

Bisect converged on commit 4afeb670710e ("s390/alternatives: use
instructions instead of byte patterns"):

# bad: [7dcfe50f58d28e0e2ba79e9e4333888bcf9442a4] s390/pci: rename get_zdev_by_bus() to zdev_from_bus()
# good: [895ae58da4a2360d9c2d255cd9fc8de64e265022] s390/zcrypt: Add admask to zcdn
git bisect start '7dcfe50f58d2' '895ae58da4a2'
# bad: [09bc20c8fb35cf1afed1612b287e9ddbe6a7d73c] s390/kprobes: enable kretprobes framepointer verification
git bisect bad 09bc20c8fb35cf1afed1612b287e9ddbe6a7d73c
# good: [f09354ffd84eef3c88efa8ba6df05efe50cfd16a] s390/traps: improve panic message for translation-specification exception
git bisect good f09354ffd84eef3c88efa8ba6df05efe50cfd16a
# bad: [2d6c0008be64bd813008d2a796108e89edec1030] s390/ap: use insn format for new instructions
git bisect bad 2d6c0008be64bd813008d2a796108e89edec1030
# bad: [6982dba181deba54c5ccb301aaed6f6ec14c6310] s390/alternatives: use insn format for new instructions
git bisect bad 6982dba181deba54c5ccb301aaed6f6ec14c6310
# bad: [4afeb670710efa5cd5ed8b1d9f2d22d6ce332bcc] s390/alternatives: use instructions instead of byte patterns
git bisect bad 4afeb670710efa5cd5ed8b1d9f2d22d6ce332bcc
# first bad commit: [4afeb670710efa5cd5ed8b1d9f2d22d6ce332bcc] s390/alternatives: use instructions instead of byte patterns

I can reproduce with TuxMake's [1] gcc-8, gcc-9, and gcc-10 containers,
but not the gcc-11 one. The version information of GCC and binutils of
each container is provided below in case it helps with reproducing.
Given this is out of line assembly, I am sure the compiler has little to
do with it, but as the compiler is the driver for .S files, I included
it to be thorough.

s390x-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0
GNU assembler (GNU Binutils for Debian) 2.31.1

s390x-linux-gnu-gcc (Debian 9.3.0-22) 9.3.0
GNU assembler (GNU Binutils for Debian) 2.35.2

s390x-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110
GNU assembler (GNU Binutils for Debian) 2.35.2

s390x-linux-gnu-gcc (Debian 11.2.0-18) 11.2.0
GNU assembler (GNU Binutils for Debian) 2.38

[1]: https://tuxmake.org/

Cheers,
Nathan
