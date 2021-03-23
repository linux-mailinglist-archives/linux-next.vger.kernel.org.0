Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8049346DEC
	for <lists+linux-next@lfdr.de>; Wed, 24 Mar 2021 00:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234270AbhCWXpS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 19:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhCWXpC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Mar 2021 19:45:02 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6ECC061574;
        Tue, 23 Mar 2021 16:45:01 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so222933pjg.5;
        Tue, 23 Mar 2021 16:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=nSNWyifnGM/SHRYNc7p2BxnG2G619EuZ1+nP6+U39iE=;
        b=a2eE0pKdoJQOzQlKczS+HyKD4N+BbKNRiYBHXQTGo8+tU/Dt/Pa4zOspy2p/W9HFj0
         X9cGB7TQLYkDNYnG3SI71E46JkH0kvCck9Q43PMkbs+PvnUMIkT184Kv+5BLQoqQOj+k
         h5Cf+AaJAzqaU/SXeHCSvIidHlNryn1WndpNhMJhW070p7+tRYIL0vjLx7btmQTW3n9G
         r4lcAeujpc1k88hfFI5OpuOd2YBw0Pt1WUp8H/n9gv9L0oYtddnCXPgFASPhM4YhAeB9
         IUYaHumsSeTt/ENjOV4gw9Zakm4T8MqfEhvHl/hn4eaVidGppCAYrAiYjuIi6ZnXgp1H
         izXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=nSNWyifnGM/SHRYNc7p2BxnG2G619EuZ1+nP6+U39iE=;
        b=YBb18/Qe+Y4cUSKpbyRgZScjEpzHZgfxXyuOt9OpVrLgoSUKUZ9NUOfKY11OLFikgG
         UIPtUWOZ24DK1PFOyKY5CWiF77c/wTd1d77b6wsEBakCyoSDRHNDpRvB63Z5OZpUuAaX
         /pFrgL/ujpUhCShfgALFjOKg1Z3CVW3D1WZIaa0DHPj++0s5t6IJ65qzar9UGcwLofZa
         JLR0+X6YAj4UOaQlJ4bMB/35yTvjHBHytJagvtTnKdPXPZY7QINbxqGfVc+7mozn9ejU
         k9bxm+blMVYnRL9uBYGf4+SDj1Gz/O0g0pZcOa23bQcNqDeR3T1hWn5C0+zR9NHMET3b
         g0IQ==
X-Gm-Message-State: AOAM532rZzLMgbVm/0BGIFf5zsKa4/e7ca4fo8TrZmk2P8bJpYd5pf8A
        RRb25NJVCvBik+pWTRUrB55sqTgAGc7+wQ==
X-Google-Smtp-Source: ABdhPJzb0tR9YscdFqMpLHj57yUZZwSYZMM2pyCs7DrdpCPFbWNJ6aXK7xVbF9ayCieVPswZYfdXWQ==
X-Received: by 2002:a17:90b:4910:: with SMTP id kr16mr500922pjb.26.1616543101046;
        Tue, 23 Mar 2021 16:45:01 -0700 (PDT)
Received: from localhost (193-116-197-97.tpgi.com.au. [193.116.197.97])
        by smtp.gmail.com with ESMTPSA id i7sm256169pfq.184.2021.03.23.16.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 16:45:00 -0700 (PDT)
Date:   Wed, 24 Mar 2021 09:44:54 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210318205607.63aebcc6@canb.auug.org.au>
        <20210324075852.4ed75c39@canb.auug.org.au>
In-Reply-To: <20210324075852.4ed75c39@canb.auug.org.au>
MIME-Version: 1.0
Message-Id: <1616542815.ow5fqk9o39.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Excerpts from Stephen Rothwell's message of March 24, 2021 6:58 am:
> Hi all,
>=20
> On Thu, 18 Mar 2021 20:56:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
>>=20
>> After merging the akpm-current tree, today's linux-next build (sparc
>> defconfig) failed like this:
>>=20
>> In file included from arch/sparc/include/asm/pgtable_32.h:25:0,
>>                  from arch/sparc/include/asm/pgtable.h:7,
>>                  from include/linux/pgtable.h:6,
>>                  from include/linux/mm.h:33,
>>                  from mm/vmalloc.c:12:
>> mm/vmalloc.c: In function 'vmalloc_to_page':
>> include/asm-generic/pgtable-nopud.h:51:27: error: implicit declaration o=
f function 'pud_page'; did you mean 'put_page'? [-Werror=3Dimplicit-functio=
n-declaration]
>>  #define p4d_page(p4d)    (pud_page((pud_t){ p4d }))
>>                            ^
>> mm/vmalloc.c:643:10: note: in expansion of macro 'p4d_page'
>>    return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
>>           ^~~~~~~~
>> mm/vmalloc.c:643:25: warning: return makes pointer from integer without =
a cast [-Wint-conversion]
>>    return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
>> mm/vmalloc.c:651:25: warning: return makes pointer from integer without =
a cast [-Wint-conversion]
>>    return pud_page(*pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
>>           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>=20
>> Caused by commit
>>=20
>>   70d18d470920 ("mm/vmalloc: fix HUGE_VMAP regression by enabling huge p=
ages in vmalloc_to_page")
>>=20
>> I have applied the following hack path for today (hopefully someone can
>> come up with something better):
>>=20
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Thu, 18 Mar 2021 18:32:58 +1100
>> Subject: [PATCH] hack to make SPARC32 build
>>=20
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  mm/vmalloc.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>=20
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 57b7f62d25a7..96444d64129a 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -640,7 +640,11 @@ struct page *vmalloc_to_page(const void *vmalloc_ad=
dr)
>>  	if (p4d_none(*p4d))
>>  		return NULL;
>>  	if (p4d_leaf(*p4d))
>> +#ifdef CONFIG_SPARC32
>> +		return NULL;
>> +#else
>>  		return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
>> +#endif
>>  	if (WARN_ON_ONCE(p4d_bad(*p4d)))
>>  		return NULL;
>> =20
>> @@ -648,7 +652,11 @@ struct page *vmalloc_to_page(const void *vmalloc_ad=
dr)
>>  	if (pud_none(*pud))
>>  		return NULL;
>>  	if (pud_leaf(*pud))
>> +#ifdef CONFIG_SPARC32
>> +		return NULL;
>> +#else
>>  		return pud_page(*pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
>> +#endif
>>  	if (WARN_ON_ONCE(pud_bad(*pud)))
>>  		return NULL;
>> =20
>> --=20
>> 2.30.0
>=20
> I am still applying this hack.

Oh I missed your first mail, thanks for the ping. I'll have a look=20
today.

Thanks,
Nick
