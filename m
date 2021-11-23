Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9022B459C8F
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 08:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbhKWHHu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 02:07:50 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:38182 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhKWHHr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 02:07:47 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7233B21910;
        Tue, 23 Nov 2021 07:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637651079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zV+ycCXSvMAUGlG3uooDj5A3Hsy4w4owD3rkqp0rJXE=;
        b=NtpqFEVF1mp0kWCwy+N5NNjoDy37FvhAx4yQ0onKXyVO6DwKddtUQyJfze7k2yLvG97rpG
        /DNJdnbUP2RREBtmRAHgQmSJLzj0NVBcQj61c3DSugwDIm1Vs3+GuK67po81u+UDwQTBbI
        wgDmjQzoOlCpV7Mbwgb5QoA2KMdqCBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637651079;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zV+ycCXSvMAUGlG3uooDj5A3Hsy4w4owD3rkqp0rJXE=;
        b=4Tt92RtbKcnWLklRt2ktPwYcQ3Rx2IreYNR2g3v/drXFdvhrjgeZCMQeVsnFboQe7zvyoB
        qUtu8xZ5LdQuQqAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 587C813CEF;
        Tue, 23 Nov 2021 07:04:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id bZUzFYeSnGEiWAAAMHmgww
        (envelope-from <bp@suse.de>); Tue, 23 Nov 2021 07:04:39 +0000
Date:   Tue, 23 Nov 2021 08:04:34 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings in Linus' tree
Message-ID: <YZySgpmBcNNM2qca@zn.tnic>
References: <20211123094419.08000327@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211123094419.08000327@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 23, 2021 at 09:44:19AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Building Linus' tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:
> 
> WARNING: modpost: vmlinux.o(.text.unlikely+0x63df): Section mismatch in reference from the function prepare_command_line() to the variable .init.data:builtin_cmdline
> The function prepare_command_line() references
> the variable __initdata builtin_cmdline.
> This is often because prepare_command_line lacks a __initdata 
> annotation or the annotation of builtin_cmdline is wrong.

Doesn't trigger with my toolchain, because it simply inlines that
function.

Anyway, fix is trivial, thanks for reporting.

---
From 4f4226a7dce0c5b6d911574f7fa5870c4ee693ff Mon Sep 17 00:00:00 2001
From: Borislav Petkov <bp@suse.de>
Date: Tue, 23 Nov 2021 07:53:57 +0100
Subject: [PATCH] x86/boot: Mark prepare_command_line() __init

Fix:

  WARNING: modpost: vmlinux.o(.text.unlikely+0x64d0): Section mismatch in reference \
   from the function prepare_command_line() to the variable .init.data:command_line
  The function prepare_command_line() references
  the variable __initdata command_line.
  This is often because prepare_command_line lacks a __initdata
  annotation or the annotation of command_line is wrong.

Apparently some toolchains do different inlining decisions.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Borislav Petkov <bp@suse.de>
Link: https://lore.kernel.org/r/20211123094419.08000327@canb.auug.org.au
---
 arch/x86/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index c410be738ae7..6a190c7f4d71 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -742,7 +742,7 @@ dump_kernel_offset(struct notifier_block *self, unsigned long v, void *p)
 	return 0;
 }
 
-static char *prepare_command_line(void)
+static char * __init prepare_command_line(void)
 {
 #ifdef CONFIG_CMDLINE_BOOL
 #ifdef CONFIG_CMDLINE_OVERRIDE
-- 
2.29.2

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Ivo Totev, HRB 36809, AG Nürnberg
