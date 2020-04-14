Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9701A8E73
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 00:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387585AbgDNWTZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 18:19:25 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50539 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387583AbgDNWTY (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 18:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586902762;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yL6cjrdLQOUSqErBo6QoCuDORXmlrgCzzoA47tfOvfU=;
        b=FIO5vamYSj1cLgaGv1rAx89r5GlbvetVCjCNGZZsD0alzcO6hrHbgZ+v0L2rS9WTLzizsy
        i+5r1yZbBfT6V/tw0xHy4L0/vFWKrKUEko6hnuqNfSKJ82vKTucG5VR6PTl06ktTJ1cQpy
        7dvy4ZnfrSvy3oeS0sSy5GrUywaQrHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-j6syM9dhMDOsGPla-pJb0g-1; Tue, 14 Apr 2020 18:19:20 -0400
X-MC-Unique: j6syM9dhMDOsGPla-pJb0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03F5519067E3;
        Tue, 14 Apr 2020 22:19:19 +0000 (UTC)
Received: from treble (ovpn-116-146.rdu2.redhat.com [10.10.116.146])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 928009F9B0;
        Tue, 14 Apr 2020 22:19:17 +0000 (UTC)
Date:   Tue, 14 Apr 2020 17:19:14 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Apr 14 (objtool crazy)
Message-ID: <20200414221914.hbvp4dvh47at4nlg@treble>
References: <20200414123900.4f97a83f@canb.auug.org.au>
 <e01557a7-746a-6af0-d890-707e9dd86b86@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e01557a7-746a-6af0-d890-707e9dd86b86@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 14, 2020 at 06:50:15AM -0700, Randy Dunlap wrote:
> On 4/13/20 7:39 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200413:
> > 
> 
> 
> I killed objtool after 49 minutes of CPU time:
> 
>   PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND    
>  6159 rdunlap   30  10   42756   8028      0 R 100.0 0.099  49:19.02 objtool 
> 
> 
> /bin/sh: line 1:  6159 Terminated              ./tools/objtool/objtool orc generate --no-fp --no-unreachable --uaccess drivers/i2c/busses/i2c-parport.o

I took an initial look at this one.  I can dig more tomorrow unless
Peter beats me to it.

(gdb) bt
#0  0x000000000040df55 in sec_offset_hash (sec=0xc30930, offset=4334561216) at elf.h:104
#1  0x000000000040e907 in find_rela_by_dest_range (elf=0x7ffff64a4010, sec=0xc30930, offset=18446744073709551608, len=1) at elf.c:227
#2  0x000000000040ea67 in find_rela_by_dest (elf=0x7ffff64a4010, sec=0xc30710, offset=18446744073709551608) at elf.c:246
#3  0x0000000000408038 in find_jump_table (file=0x427620 <file>, func=0xc32bf0, insn=0xc4f840) at check.c:1118
#4  0x0000000000408242 in mark_func_jump_tables (file=0x427620 <file>, func=0xc32bf0) at check.c:1170
#5  0x00000000004083b6 in add_jump_table_alts (file=0x427620 <file>) at check.c:1215
#6  0x0000000000408b95 in decode_sections (file=0x427620 <file>) at check.c:1413
#7  0x000000000040bf44 in check (_objname=0x7fffffffceff "drivers/i2c/busses/i2c-parport.o", orc=true) at check.c:2508
#8  0x0000000000405580 in cmd_orc (argc=1, argv=0x7fffffffc9d8) at builtin-orc.c:41
#9  0x0000000000411297 in handle_internal_command (argc=6, argv=0x7fffffffc9d0) at objtool.c:96
#10 0x0000000000411349 in main (argc=6, argv=0x7fffffffc9d0) at objtool.c:119

It's an infinite loop in find_rela_by_dest_range() because offset is -8.
That comes from find_jump_table():

  table_offset = text_rela->addend;
  table_sec = text_rela->sym->sec;
  ...
  table_rela = find_rela_by_dest(file->elf, table_sec, table_offset);

which comes from this gem:

00000000000001fd <line_set>:
 1fd:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 204:	00 00 00 
			1ff: R_X86_64_64	.rodata-0x8

So objtool is getting confused by that -0x8 rela addend.

-- 
Josh

