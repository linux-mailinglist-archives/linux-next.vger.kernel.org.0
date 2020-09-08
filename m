Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AC72612B4
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 16:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729406AbgIHO3R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 10:29:17 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30625 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729922AbgIHO1E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 10:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599575164;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iz+7zzBpkiJrIKI0XTqvxV8tNmeNS+Jw/qROZpGe5DE=;
        b=A6GI9P1iwRsBLAln+b2QxzOslWVosILO9qj1Y5w7cMRQKFXrRRWIcijQ++pVhPTufP1Dgb
        /lwjMWj9ffApYfWkW8GeSsvyj38OPHKewLxEIIRJ/Fp18b8Us0sKps9ngeno3C93psbTTJ
        Yf8GgobsWzhDhM4OPkgD9Qo/J2raerc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-gbnLPucUPMqc6J3Xih0mPw-1; Tue, 08 Sep 2020 09:14:44 -0400
X-MC-Unique: gbnLPucUPMqc6J3Xih0mPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 259B51074644;
        Tue,  8 Sep 2020 13:14:43 +0000 (UTC)
Received: from treble (ovpn-117-163.rdu2.redhat.com [10.10.117.163])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id CD5187D923;
        Tue,  8 Sep 2020 13:14:41 +0000 (UTC)
Date:   Tue, 8 Sep 2020 08:14:39 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: build warnings in Linus' tree
Message-ID: <20200908131439.xj6nzi6nny3u5icb@treble>
References: <20200908091102.4c2d7b37@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200908091102.4c2d7b37@canb.auug.org.au>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 08, 2020 at 09:11:02AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Building Linus' tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:
> 
> arch/x86/kernel/cpu/mce/core.o: warning: objtool: mce_panic()+0x2a3: unreachable instruction
> net/core/skbuff.o: warning: objtool: skb_push.cold()+0x1b: unreachable instruction
> arch/x86/mm/mmio-mod.o: warning: objtool: pre()+0x21a: unreachable instruction
> arch/x86/kvm/vmx/vmx.o: warning: objtool: vmx_handle_exit_irqoff()+0x142: unreachable instruction
> kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x26: unreachable instruction
> kernel/cred.o: warning: objtool: get_task_cred.cold()+0x19: unreachable instruction
> drivers/misc/sgi-gru/grukservices.o: warning: objtool: gru_wait_abort_proc()+0x97: unreachable instruction
> drivers/scsi/pcmcia/aha152x_core.o: warning: objtool: is_complete()+0x6c6: unreachable instruction
> drivers/message/fusion/mptbase.o: warning: objtool: mpt_SoftResetHandler()+0x4a5: unreachable instruction
> drivers/scsi/aic7xxx/aic79xx_core.o: warning: objtool: ahd_intr()+0x2a9: unreachable instruction
> drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.o: warning: objtool: otx2_sq_append_tso()+0xab6: unreachable instruction
> fs/btrfs/extent_io.o: warning: objtool: __set_extent_bit.cold()+0x12: unreachable instruction
> fs/btrfs/backref.o: warning: objtool: btrfs_backref_finish_upper_links()+0x818: unreachable instruction
> fs/btrfs/relocation.o: warning: objtool: update_backref_cache.isra.0()+0x3bf: unreachable instruction
> drivers/atm/horizon.o: warning: objtool: rx_data_av_handler()+0x452: unreachable instruction

I suspect these will all be fixed by this livepatching pull request:

  https://lkml.kernel.org/r/20200907082036.GC8084@alley

-- 
Josh

