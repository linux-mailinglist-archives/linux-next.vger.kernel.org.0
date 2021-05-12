Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9071137ED76
	for <lists+linux-next@lfdr.de>; Thu, 13 May 2021 00:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238864AbhELUfm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 16:35:42 -0400
Received: from www62.your-server.de ([213.133.104.62]:39052 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386840AbhELUWY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 May 2021 16:22:24 -0400
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <daniel@iogearbox.net>)
        id 1lgvLx-000DTY-Em; Wed, 12 May 2021 22:21:09 +0200
Received: from [85.7.101.30] (helo=linux.home)
        by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <daniel@iogearbox.net>)
        id 1lgvLx-000Mnz-8N; Wed, 12 May 2021 22:21:09 +0200
Subject: Re: linux-next: Tree for May 12 (arch/x86/net/bpf_jit_comp32.o)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>
References: <20210512175623.2687ac6f@canb.auug.org.au>
 <08f677a5-7634-b5d2-a532-ea6d3f35200c@infradead.org>
 <daf46ee7-1a18-9d5a-c3b3-7fc55ec23b30@iogearbox.net>
 <751025d2-9c46-a4b9-4f54-fbe5fa7a2564@infradead.org>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <e11480b2-a057-9621-74ba-6e3e4fc1b306@iogearbox.net>
Date:   Wed, 12 May 2021 22:21:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <751025d2-9c46-a4b9-4f54-fbe5fa7a2564@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.2/26168/Wed May 12 13:07:33 2021)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/12/21 9:26 PM, Randy Dunlap wrote:
> On 5/12/21 11:53 AM, Daniel Borkmann wrote:
>> On 5/12/21 8:01 PM, Randy Dunlap wrote:
>>> On 5/12/21 12:56 AM, Stephen Rothwell wrote:
>>> on i386:
>>>
>>> ld: arch/x86/net/bpf_jit_comp32.o: in function `do_jit':
>>> bpf_jit_comp32.c:(.text+0x28c9): undefined reference to `__bpf_call_base'
>>> ld: arch/x86/net/bpf_jit_comp32.o: in function `bpf_int_jit_compile':
>>> bpf_jit_comp32.c:(.text+0x3694): undefined reference to `bpf_jit_blind_constants'
>>> ld: bpf_jit_comp32.c:(.text+0x3719): undefined reference to `bpf_jit_binary_free'
>>> ld: bpf_jit_comp32.c:(.text+0x3745): undefined reference to `bpf_jit_binary_alloc'
>>> ld: bpf_jit_comp32.c:(.text+0x37d3): undefined reference to `bpf_jit_prog_release_other'
>>> ld: kernel/extable.o: in function `search_exception_tables':
>>> extable.c:(.text+0x42): undefined reference to `search_bpf_extables'
>>> ld: kernel/extable.o: in function `kernel_text_address':
>>> extable.c:(.text+0xee): undefined reference to `is_bpf_text_address'
>>> ld: kernel/kallsyms.o: in function `kallsyms_lookup_size_offset':
>>> kallsyms.c:(.text+0x254): undefined reference to `__bpf_address_lookup'
>>> ld: kernel/kallsyms.o: in function `kallsyms_lookup_buildid':
>>> kallsyms.c:(.text+0x2ee): undefined reference to `__bpf_address_lookup'
>>
>> Thanks for reporting, could you double check the following diff:
>>
>> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
>> index 26b591e23f16..bd04f4a44c01 100644
>> --- a/kernel/bpf/Kconfig
>> +++ b/kernel/bpf/Kconfig
>> @@ -37,6 +37,7 @@ config BPF_SYSCALL
>>
>> config BPF_JIT
>>      bool "Enable BPF Just In Time compiler"
>> +    depends on BPF
>>      depends on HAVE_CBPF_JIT || HAVE_EBPF_JIT
>>      depends on MODULES
>>      help
> 
> That's good. Thanks.

Thanks, pushed fix to bpf tree.
