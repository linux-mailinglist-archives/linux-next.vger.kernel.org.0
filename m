Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA4274AABE
	for <lists+linux-next@lfdr.de>; Fri,  7 Jul 2023 07:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbjGGFrV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 7 Jul 2023 01:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbjGGFrU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Jul 2023 01:47:20 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689C319BD
        for <linux-next@vger.kernel.org>; Thu,  6 Jul 2023 22:47:19 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6686ef86110so927908b3a.2
        for <linux-next@vger.kernel.org>; Thu, 06 Jul 2023 22:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688708839; x=1691300839;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAvpISnydoFWHqQk7bImyRAY/c0bnv6qrhMGgGyMhhY=;
        b=Zy8W5lHJTad1YEeB5b6krk0nPtoGPBw249SleGYm8eYRKDy8kgDHGRQmAzProRjj9C
         ZA6n1SHCyYdmza/16J5txdF8Ra3jP4vmGhNr1IJthuSYn5ENXEKDJQl9We1+hx4ExA3d
         4AipisBM0dD6HGPOrT7iGrAnl7Bw8xn5nPcE5ok762+55FapMBVfBrO3ODXjBWDu2QnA
         FH127RchZQiEDHkDo9k/YGkI74sazJJN3L5jP9r6djIW9XXe9C50u7ELdxFhgZJ4i1X4
         NVBTXF9X+sv3P4Xchgkx6K8WkmhCdcQTnhn/LH0R3Dpk2TvzKHGx5dcG3258TSqijQ6X
         sJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688708839; x=1691300839;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAvpISnydoFWHqQk7bImyRAY/c0bnv6qrhMGgGyMhhY=;
        b=aUNCEMYF0BECTJY1sGYdnDhmC5hyjoiXa4env5yV0ss1MKaLHEuLmxZDj2IvzoCY6u
         lNayadYocuD+vY49EtAyS28TKYkGvdf+XBA8Sf0eey6MUgERiwAfuX5ePDUA8FMzyPEF
         +VRhN3r0a4CEgolQDS2xknN8QF8026uc9HG/j2WQC/uCWk//mMkxOL4T/zMZgGW0Sdfk
         VeUe3FIIOTsyKVKU8ohJfshdFQCOm9qJQpFbDgryrdpPpAiVsPBWaxPoLzMwz1QElHGJ
         WCmjnBTDSReRPEk6jpU+qvy3qv7aPP0AUDbUXk59X81wIQknXkce2MualGd4a7rq9UGc
         ExNQ==
X-Gm-Message-State: ABy/qLYTroxNO7HIJP+ZKqmUMmASv0iMzBusH4t91bGgDOPFL0IX8RY2
        B2VDJW1P9WBi1AWg4vqxi4RHoQ==
X-Google-Smtp-Source: APBJJlEkryK+Im9QKPXSsQlHuvQpZ2OrLluHoKw6NMANX53P/yWi8uzpp2a2uJLD9k+j67MTRXqQZQ==
X-Received: by 2002:a05:6a00:c87:b0:681:ccc3:3cd9 with SMTP id a7-20020a056a000c8700b00681ccc33cd9mr3759673pfv.19.1688708838768;
        Thu, 06 Jul 2023 22:47:18 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id l14-20020a65680e000000b0055b0c330b30sm1928754pgt.84.2023.07.06.22.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 22:47:18 -0700 (PDT)
Date:   Thu, 06 Jul 2023 22:47:18 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 22:45:22 PDT (-0700)
Subject:     Re: linux-next: Tree for Jul 6 (arch/riscv/)
In-Reply-To: <278886bf-f469-a8cc-130a-f3e4614e7e1f@infradead.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     rdunlap@infradead.org
Message-ID: <mhng-0a55bc01-88cb-412a-ac38-7919f6f596fc@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 06 Jul 2023 16:40:27 PDT (-0700), rdunlap@infradead.org wrote:
> Hi Palmer,
>
> On 7/6/23 14:46, Palmer Dabbelt wrote:
>> On Thu, 06 Jul 2023 14:36:05 PDT (-0700), rdunlap@infradead.org wrote:
>>>
>>>
>>> On 7/6/23 14:32, Palmer Dabbelt wrote:
>>>> On Thu, 06 Jul 2023 14:27:53 PDT (-0700), rdunlap@infradead.org wrote:
>>>>>
>>>>>
>>>>> On 7/5/23 18:57, Stephen Rothwell wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> Please do *not* add any v6.6 related stuff to your linux-next included
>>>>>> branches until after v6.5-rc1 has been released.
>>>>>>
>>>>>> Changes since 20230705:
>>>>>>
>>>>>
>>>>> on riscv64:
>>>>>
>>>>> WARNING: modpost: vmlinux: section mismatch in reference: $xrv64i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0+0x14 (section: .text.unlikely.set_bit.constprop.0) -> numa_nodes_parsed (section: .init.data)
>>>>>
>>>>>
>>>>> Full randconfig file is attached.
>>>>
>>>> Thanks, I'm giving it a look.  Do you happen to also have your toolchain version easily availiable?  The mapping symbols are new and we've seen some odd stuff happen, something is likely broken somewhere...
>>>
>>> I'm using gcc-13.1.0 from  https://mirrors.edge.kernel.org/pub/tools/crosstool/
>>
>> Cool, those are pretty easy to run.  I've yet to actually reproduce the
>> failures, but I'd guess we just want to ignore the mapping symbols with
>> something like
>>
>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>> index b29b29707f10..2f801469301d 100644
>> --- a/scripts/mod/modpost.c
>> +++ b/scripts/mod/modpost.c
>> @@ -614,6 +614,18 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
>>         /* Expoline thunks are linked on all kernel modules during final link of .ko */
>>         if (strstarts(symname, "__s390_indirect_jump_r"))
>>             return 1;
>> +
>> +    /*
>> +     * RISC-V defines various special symbols that start with "$".  The
>> +     * mapping symbols, which exist to differentiate between incompatible
>> +     * instruction encodings when disassembling, show up all over the place
>> +     * and are generally not meant to be treated like other symbols.  So
>> +     * just ignore any of the special symbols.
>> +     */
>> +    if (info->hdr->e_machine == EM_RISCV)
>> +        if (symname[0] == '$')
>> +            return 1;
>> +
>>     /* Do not ignore this symbol */
>>     return 0;
>> }
>>
>> I haven't even built that, though...
>
> That builds without any errors or warnings, but it doesn't fix the section mismatch
> warning.

Turns out there's a hook for mapping symbols, this fixes it for me:

https://lore.kernel.org/r/20230707054007.32591-1-palmer@rivosinc.com/

>> These also trip up backtraces, so we probably need something over there as
>> well.

I think that might fix the backtraces as well.
