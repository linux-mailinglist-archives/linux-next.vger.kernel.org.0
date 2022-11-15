Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32E562A208
	for <lists+linux-next@lfdr.de>; Tue, 15 Nov 2022 20:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiKOTiR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Nov 2022 14:38:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiKOTiP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Nov 2022 14:38:15 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A56DA19D
        for <linux-next@vger.kernel.org>; Tue, 15 Nov 2022 11:38:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 0770FCE1906
        for <linux-next@vger.kernel.org>; Tue, 15 Nov 2022 19:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C90C433D6;
        Tue, 15 Nov 2022 19:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668541090;
        bh=zYIeJK9lCpnFrexV3yyYrCDfX+PcgD8Y/QIayEQNvrc=;
        h=Date:From:To:Cc:Subject:From;
        b=p/13jU1tiJWqtWLEYKyE9BllmG25d+PyqFh6hmUAoGiS8jexBVzOclhV4wDuYxQx2
         o+7qaOOm7wS6ZKaQRhfPMC7dR9Ig6Y7Q/I7PqRqlvdH4CyUwoslBZE7J4IyvbMb5Ew
         kfTqoPROP5WBu6AlOQjHFP5m7SKxL3iqSnBjn630DraJTWdzVWmO1umc2YK64OhAOa
         sydiUzJtCsmvuuHBaKYkh9DCdiMMima1BixD6Ye+n71yQhtGOJc8I1rX40ejlSk4bg
         UNw4v4TnXKFAWgPc4LPoPfczpXchZWkclqhiHtHQf2Tds/37Ij4YA6J2XQwyDp84Ol
         OFeJT7rgkQT9g==
Date:   Tue, 15 Nov 2022 19:38:06 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     conor@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
        linux-next@vger.kernel.org
Subject: RISC-V DT/SoC branch changes
Message-ID: <Y3PqngfnCG/jVyJp@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hey Stephen,

Currently you've got two of my branches in linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-for-next
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-fixes
which are named risc-v-mc and risc-v-mc-fixes respectively iirc.

We're doing some re-jigging in RISC-V land, and I'm gonna be taking
patches for other RISC-V devicetrees in addition to the Microchip ones.
I'll also taking patches for drivers/soc that are for RISC-V SoCs.
The PRs for both will be made against the soc tree rather than the RISC-V
one.

Would it be possible to drop my existing two trees & add:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-next
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-for-next
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-fixes

Please LMK if you need any more information.

Thanks,
Conor.

