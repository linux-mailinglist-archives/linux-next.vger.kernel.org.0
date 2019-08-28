Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5145A069D
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 17:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfH1Pvw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 11:51:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61074 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbfH1Pvw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Aug 2019 11:51:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0C72C308212A;
        Wed, 28 Aug 2019 15:51:52 +0000 (UTC)
Received: from treble (ovpn-121-55.rdu2.redhat.com [10.10.121.55])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AF755D9E2;
        Wed, 28 Aug 2019 15:51:50 +0000 (UTC)
Date:   Wed, 28 Aug 2019 10:51:47 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Aug 27 (objtool)
Message-ID: <20190828155147.v6eowc7rr7upr7dr@treble>
References: <20190827190526.6f27e763@canb.auug.org.au>
 <6c42e32f-901d-be78-e69b-cb9ff8703932@infradead.org>
 <20190827155911.ct2zzo2zhcrauf3z@treble>
 <2e8b18a0-a09c-b67e-c99f-45066ab9d511@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e8b18a0-a09c-b67e-c99f-45066ab9d511@infradead.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 28 Aug 2019 15:51:52 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 27, 2019 at 12:05:42PM -0700, Randy Dunlap wrote:
> On 8/27/19 8:59 AM, Josh Poimboeuf wrote:
> > On Tue, Aug 27, 2019 at 08:40:07AM -0700, Randy Dunlap wrote:
> >> On 8/27/19 2:05 AM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20190826:
> >>>
> >>
> >> on x86_64:
> >>
> >> arch/x86/kvm/vmx/vmx.o: warning: objtool: vmx_handle_exit_irqoff()+0x33: unreachable instruction
> >>
> >>> gcc --version
> >> gcc (SUSE Linux) 7.4.0
> >>
> >>
> >> want more info?
> > 
> > Yes, can you provide the .o and the .config?
> > 
> 
> Sure.  The .o was 508KB, so I compressed it.

Thanks Randy.  Here's a tentative fix.  I need to make sure it doesn't
break anything else.

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 176f2f084060..35a40d610474 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -556,7 +556,7 @@ static int add_jump_destinations(struct objtool_file *file)
 		    insn->type != INSN_JUMP_UNCONDITIONAL)
 			continue;
 
-		if (insn->ignore || insn->offset == FAKE_JUMP_OFFSET)
+		if (insn->offset == FAKE_JUMP_OFFSET)
 			continue;
 
 		rela = find_rela_by_dest_range(insn->sec, insn->offset,
