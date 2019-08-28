Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF1ABA0772
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 18:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfH1Qeh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 12:34:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57772 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726395AbfH1Qeh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Aug 2019 12:34:37 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 600B65859E;
        Wed, 28 Aug 2019 16:34:37 +0000 (UTC)
Received: from treble (ovpn-121-55.rdu2.redhat.com [10.10.121.55])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 04FF3194BE;
        Wed, 28 Aug 2019 16:34:35 +0000 (UTC)
Date:   Wed, 28 Aug 2019 11:34:33 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 27 (objtool)
Message-ID: <20190828163433.4ltoxmtuujkqspar@treble>
References: <20190827190526.6f27e763@canb.auug.org.au>
 <6c42e32f-901d-be78-e69b-cb9ff8703932@infradead.org>
 <20190827155911.ct2zzo2zhcrauf3z@treble>
 <2e8b18a0-a09c-b67e-c99f-45066ab9d511@infradead.org>
 <20190828155147.v6eowc7rr7upr7dr@treble>
 <f354f4be-99c7-346f-c7c5-ac5ce8a72a16@infradead.org>
 <20190828161331.kvikro257blxtzu5@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190828161331.kvikro257blxtzu5@treble>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 28 Aug 2019 16:34:37 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 28, 2019 at 11:13:31AM -0500, Josh Poimboeuf wrote:
> Turns out this patch does break something:
> 
>   arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x25: can't find jump dest instruction at .text+0x9c
> 
> I'll need to figure out a better way to whitelist that
> XEN_EMULATE_PREFIX fake instruction thing.  I'll probably just teach
> the objtool decoder about it.

Hi Masami,

Is it possible for the kernel x86 decoder to recognize the
XEN_EMULATE_PREFIX prefix?

        asm(XEN_EMULATE_PREFIX "cpuid"
                : "=a" (*ax),
                  "=b" (*bx),
                  "=c" (*cx),
                  "=d" (*dx)
                : "0" (*ax), "2" (*cx));

is disassembled to:

      33:       0f 0b                   ud2
      35:       78 65                   js     9c <xen_store_tr+0xc>
      37:       6e                      outsb  %ds:(%rsi),(%dx)
      38:       0f a2                   cpuid

which confuses objtool.  Presumably that would confuse other users of
the decoder as well.

That's a highly unlikely sequence of instructions, maybe the kernel
decoder should recognize it as a single instruction.

-- 
Josh
