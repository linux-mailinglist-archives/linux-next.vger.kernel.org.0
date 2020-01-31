Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8FE614E9F5
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2020 10:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgAaJSc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jan 2020 04:18:32 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54641 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728159AbgAaJSb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 31 Jan 2020 04:18:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 488BTw54LNz9sRR;
        Fri, 31 Jan 2020 20:18:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1580462309;
        bh=cCI4WreJl9TPaQKBLWhchJurIy1jFBvqbedUEJxwYO0=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=mBhwEQHDz1XN3CYCwbbKhv0GeXIMwF6PpEKmhsU6baEkq/O5znNz1kxwO04DdH2cV
         cQHk2ukvWfkffBL51JWySB3i6n7Xl7+K7RF1CR+iQJlUb4nIovevkPsf/8IiWcXORj
         GnpcWStMenr/9iLqB+KmRYUxsIRmXjpWUw5hp3ZUkzSpP5jJKbtBG4k1xfmDmVRV+b
         DxTrd/E5w6IIfyo7oKOaCcXqhx0VhKUuGDld1R6qNtw50PBEprXULq816EfAofOTaJ
         iSMjmoBQSKBOxBN5hak7fA5eN3jYxhDXL/fQxIQu/+805iAC1oUuQmmADCj4gw1uOq
         PWLBEBWRkYeDw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Alex Ghiti <alex@ghiti.fr>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexei Starovoitov <ast@kernel.org>,
        linux-next@vger.kernel.org, Zong Li <zong.li@sifive.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH v2] powerpc: Do not consider weak unresolved symbol relocations as bad
In-Reply-To: <8a8d45c6-4ad2-c682-abfb-3d97188d0d45@ghiti.fr>
References: <20200118170335.21440-1-alex@ghiti.fr> <8a8d45c6-4ad2-c682-abfb-3d97188d0d45@ghiti.fr>
Date:   Fri, 31 Jan 2020 20:18:25 +1100
Message-ID: <87wo98f0gu.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Alex Ghiti <alex@ghiti.fr> writes:
> On 1/18/20 12:03 PM, Alexandre Ghiti wrote:
>> Commit 8580ac9404f6 ("bpf: Process in-kernel BTF") introduced two weak
>> symbols that may be unresolved at link time which result in an absolute
>> relocation to 0. relocs_check.sh emits the following warning:
>>
>> "WARNING: 2 bad relocations
>> c000000001a41478 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_start
>> c000000001a41480 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_end"
>>
>> whereas those relocations are legitimate even for a relocatable kernel
>> compiled with -pie option.
>>
>> relocs_check.sh already excluded some weak unresolved symbols explicitly:
>> remove those hardcoded symbols and add some logic that parses the symbols
>> using nm, retrieves all the weak unresolved symbols and excludes those from
>> the list of the potential bad relocations.
>>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>
>> Changes in v2:
>> - Follow Stephen advice of using grep -F instead of looping over weak symbols
>>    using read, patch is way smaller and cleaner.
>> - Add missing nm in comment
>>
>>   arch/powerpc/Makefile.postlink     |  4 ++--
>>   arch/powerpc/tools/relocs_check.sh | 20 ++++++++++++--------
>>   2 files changed, 14 insertions(+), 10 deletions(-)
>>
...
>
> Hi guys,
>
>
> Any thought about that ?
>
> I do think this patch makes the whole check about absolute relocations 
> clearer.
> And in the future, it will avoid anyone to spend some time on those 
> "bad" relocations
> which actually aren't.

Sorry I missed the v2. Will pick it up.

cheers
