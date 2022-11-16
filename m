Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B96B862CDC9
	for <lists+linux-next@lfdr.de>; Wed, 16 Nov 2022 23:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbiKPWhp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Nov 2022 17:37:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbiKPWhk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Nov 2022 17:37:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF8F6B3A0
        for <linux-next@vger.kernel.org>; Wed, 16 Nov 2022 14:37:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0F66962000
        for <linux-next@vger.kernel.org>; Wed, 16 Nov 2022 22:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74401C433D6;
        Wed, 16 Nov 2022 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668638258;
        bh=pnpZHj2zuIwApOsQh6KZCtBuY2eySCKvMvA12ghmN14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h50Q8JFZ8EBPQzZF0qzZEWrvbrOj40Mc4blvJB/jOu3fDjZCBnaRfccl6ACL/tpBK
         BNGTA0bduZn/IpiBr7ny8g0Lo6fIrbP/WB8n1oqGB8AvKcMgPjsSRfNKzbNK0AWC8Y
         /iRA1aVJ97Wb+Bc+xYhO3/gqAUmSNp5Hm7SC6/GIJNx0JEyV50Bj4S8RjytodohlYw
         sCJxfNB1Yke3QNgP1hkXfB0oFKvx+XnSlpT+n2Qtzuc2YEN/gTwUlZ/qJ+KjM5s9s8
         O+x0+iENgw3cnWhZsKi0yrpRB7YqWxICr1M+3U0vskYGeY7YI/RXbr9kZ4vSIQ060Y
         rFdpd8wVSIWyw==
Date:   Wed, 16 Nov 2022 22:37:34 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     palmer@dabbelt.com, arnd@arndb.de, linux-next@vger.kernel.org
Subject: Re: RISC-V DT/SoC branch changes
Message-ID: <Y3VmLtVSkpf4vHYb@spud>
References: <Y3PqngfnCG/jVyJp@spud>
 <20221117093010.74cf9d0a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117093010.74cf9d0a@canb.auug.org.au>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 17, 2022 at 09:30:10AM +1100, Stephen Rothwell wrote:
> Hi Conor,
> 
> On Tue, 15 Nov 2022 19:38:06 +0000 Conor Dooley <conor@kernel.org> wrote:
> >
> > Currently you've got two of my branches in linux-next:
> > https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-for-next
> > https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-fixes
> > which are named risc-v-mc and risc-v-mc-fixes respectively iirc.
> > 
> > We're doing some re-jigging in RISC-V land, and I'm gonna be taking
> > patches for other RISC-V devicetrees in addition to the Microchip ones.
> > I'll also taking patches for drivers/soc that are for RISC-V SoCs.
> > The PRs for both will be made against the soc tree rather than the RISC-V
> > one.
> > 
> > Would it be possible to drop my existing two trees & add:
> > https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-next
> > https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes
> > https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-for-next
> > https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-fixes
> 
> All done from today.

Great, thanks a mill Stephen.

