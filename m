Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C457043C8BC
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 13:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241691AbhJ0Lnh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 07:43:37 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:35313 "EHLO pegase2.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230336AbhJ0Lng (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Oct 2021 07:43:36 -0400
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4HfRbV2BBhz9sSg;
        Wed, 27 Oct 2021 13:41:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1CyGxDHopVgI; Wed, 27 Oct 2021 13:41:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4HfRbV1Hjrz9sRr;
        Wed, 27 Oct 2021 13:41:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 16CD68B778;
        Wed, 27 Oct 2021 13:41:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 4A3tr9kP0AiX; Wed, 27 Oct 2021 13:41:10 +0200 (CEST)
Received: from [192.168.232.182] (unknown [192.168.232.182])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 720E18B776;
        Wed, 27 Oct 2021 13:41:09 +0200 (CEST)
Message-ID: <2012df5e-62ec-06fb-9f4d-e27dde184a3f@csgroup.eu>
Date:   Wed, 27 Oct 2021 13:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
Content-Language: fr-FR
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Paul Moore <paul@paul-moore.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Richard Guy Briggs <rgb@redhat.com>
References: <20211026133147.35d19e00@canb.auug.org.au>
 <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
 <87tuh2aepp.fsf@mpe.ellerman.id.au>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87tuh2aepp.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



Le 27/10/2021 à 13:29, Michael Ellerman a écrit :
> Paul Moore <paul@paul-moore.com> writes:
>> On Tue, Oct 26, 2021 at 6:55 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>>>> Hi all,
>>>>
>>>> Today's linux-next merge of the audit tree got conflicts in:
>>>>
>>>>    arch/powerpc/kernel/audit.c
>>>>    arch/powerpc/kernel/compat_audit.c
>>>>
>>>> between commit:
>>>>
>>>>    566af8cda399 ("powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC")
>>>>
>>>> from the powerpc tree and commits:
>>>>
>>>>    42f355ef59a2 ("audit: replace magic audit syscall class numbers with macros")
>>>>    1c30e3af8a79 ("audit: add support for the openat2 syscall")
>>>>
>>>> from the audit tree.
>>>
>>> Thanks.
>>>
>>> I guess this is OK, unless the audit folks disagree. I could revert the
>>> powerpc commit and try it again later.
>>>
>>> If I don't hear anything I'll leave it as-is.
>>
>> Hi Michael,
>>
>> Last I recall from the powerpc/audit thread there were still some
>> issues with audit working properly in your testing, has that been
>> resolved?
> 
> No.
> 
> There's one test failure both before and after the conversion to use the
> generic code.
> 
>> If nothing else, -rc7 seems a bit late for this to hit -next for me to
>> feel comfortable about this.
> 
> OK. I'll revert the patch in my tree.
> 

But it's been in the pipe since end of August and no one reported any 
issue other issue than the pre-existing one, so what's the new issue 
that prevents us to merge it two monthes later, and how do we walk 
forward then ?

Thanks
Christophe
