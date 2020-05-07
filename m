Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D305A1C7E62
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 02:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgEGANl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 May 2020 20:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728073AbgEGANl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2020 20:13:41 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D887C061A0F;
        Wed,  6 May 2020 17:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=jIXCMyIbImO8rm+oSDaQ2NCQ0Osl596aq9/e8JwCpJ8=; b=R1v9bA5VIwE6ZoPd5DtaIU67FX
        FqrIiDLQQ8dMAf8/BA9c6R5+asnL12HNe0AUUseNBpor9jJ42IYTpkrpcXKhfIF4mvfK9HeoJncnb
        n25fF5aTQ7OWtl1/85tTQqY6XGfl26WHHO09KZPqw4wyOblOQKn63h6ip0j3QaapLfYpLEj6CZ4JT
        V1cfXjjPrIY3G2lM/z7CM7yDQEDFEiN16oH2Icmb9czMh2cDaS/bTnd6tlKibeVXbJE2lr/cUGDuW
        yyAPLYhnachD/h9GclpcjhpubwTiPDBoaVoaeqmAEhELJdl7tVOrRogQQlAfEwpXIXcH+BrMqTOtO
        ewppQ04w==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWUAX-0004mp-6l; Thu, 07 May 2020 00:13:41 +0000
Subject: Re: linux-next: Tree for Apr 14 (objtool crazy)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20200414123900.4f97a83f@canb.auug.org.au>
 <e01557a7-746a-6af0-d890-707e9dd86b86@infradead.org>
 <20200414221914.hbvp4dvh47at4nlg@treble>
 <20200507085011.6d2edf32@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9c7ce0f6-b15d-5205-352f-f82bfbcf7f29@infradead.org>
Date:   Wed, 6 May 2020 17:13:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507085011.6d2edf32@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/6/20 3:50 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 14 Apr 2020 17:19:14 -0500 Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>>
>> On Tue, Apr 14, 2020 at 06:50:15AM -0700, Randy Dunlap wrote:
>>> On 4/13/20 7:39 PM, Stephen Rothwell wrote:  
>>>> Hi all,
>>>>
>>>> Changes since 20200413:
>>>>   
>>>
>>>
>>> I killed objtool after 49 minutes of CPU time:
>>>
>>>   PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND    
>>>  6159 rdunlap   30  10   42756   8028      0 R 100.0 0.099  49:19.02 objtool 
>>>
>>>
>>> /bin/sh: line 1:  6159 Terminated              ./tools/objtool/objtool orc generate --no-fp --no-unreachable --uaccess drivers/i2c/busses/i2c-parport.o  
>>
>> I took an initial look at this one.  I can dig more tomorrow unless
>> Peter beats me to it.
>>
>> (gdb) bt
>> #0  0x000000000040df55 in sec_offset_hash (sec=0xc30930, offset=4334561216) at elf.h:104
>> #1  0x000000000040e907 in find_rela_by_dest_range (elf=0x7ffff64a4010, sec=0xc30930, offset=18446744073709551608, len=1) at elf.c:227
>> #2  0x000000000040ea67 in find_rela_by_dest (elf=0x7ffff64a4010, sec=0xc30710, offset=18446744073709551608) at elf.c:246
>> #3  0x0000000000408038 in find_jump_table (file=0x427620 <file>, func=0xc32bf0, insn=0xc4f840) at check.c:1118
>> #4  0x0000000000408242 in mark_func_jump_tables (file=0x427620 <file>, func=0xc32bf0) at check.c:1170
>> #5  0x00000000004083b6 in add_jump_table_alts (file=0x427620 <file>) at check.c:1215
>> #6  0x0000000000408b95 in decode_sections (file=0x427620 <file>) at check.c:1413
>> #7  0x000000000040bf44 in check (_objname=0x7fffffffceff "drivers/i2c/busses/i2c-parport.o", orc=true) at check.c:2508
>> #8  0x0000000000405580 in cmd_orc (argc=1, argv=0x7fffffffc9d8) at builtin-orc.c:41
>> #9  0x0000000000411297 in handle_internal_command (argc=6, argv=0x7fffffffc9d0) at objtool.c:96
>> #10 0x0000000000411349 in main (argc=6, argv=0x7fffffffc9d0) at objtool.c:119
>>
>> It's an infinite loop in find_rela_by_dest_range() because offset is -8.
>> That comes from find_jump_table():
>>
>>   table_offset = text_rela->addend;
>>   table_sec = text_rela->sym->sec;
>>   ...
>>   table_rela = find_rela_by_dest(file->elf, table_sec, table_offset);
>>
>> which comes from this gem:
>>
>> 00000000000001fd <line_set>:
>>  1fd:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
>>  204:	00 00 00 
>> 			1ff: R_X86_64_64	.rodata-0x8
>>
>> So objtool is getting confused by that -0x8 rela addend.
> 
> Did this get fixed?
> 

Yes.  It's here:
https://lore.kernel.org/lkml/02b719674b031800b61e33c30b2e823183627c19.1587842122.git.jpoimboe@redhat.com/


-- 
~Randy

