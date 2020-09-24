Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA22E27681C
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 07:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgIXFLl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 01:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbgIXFLl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2020 01:11:41 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1B5C0613D2
        for <linux-next@vger.kernel.org>; Wed, 23 Sep 2020 22:11:41 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q4so1016950pjh.5
        for <linux-next@vger.kernel.org>; Wed, 23 Sep 2020 22:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IbzPox5jnfS/DQmh8djlNye1AT0DWj0P7hHtIMKDwWQ=;
        b=FkkyUKYxCpfoJ2ecMoGh6ROu3M69X5VALvn5grx2GvyJL0d0IvLBVhOrEDy7CW2CDO
         1nUK7ocrk2L91TMbHmwE3MKp0UdP/SpWzKk1dLhCxLvrQtpYBlcYbiMlrOToGJ7wZCfr
         kK43FF2/8yP3ieU98Uj5+BfguC5S22hL5AQ6DJzjqy6WnYWEgW3ou5/374se6TooKhN/
         Yd/Wyrs+ay97YO3xhzcawwaNrtXWcTU/nq1JGCOD793yt47DkyVh/ATuUx15F3D59Xe6
         Y6Z0h07so/a9YQdQEYfhzjeWo8oPYGEHWobYZCQ6uhcNG/eJWPuH7YSoAMjkZgOFE4jK
         oGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IbzPox5jnfS/DQmh8djlNye1AT0DWj0P7hHtIMKDwWQ=;
        b=lswu0oHIGZJG/XP6HmmSzATjN6BClOgkBu8gTxLmCov/fxAcT2uph3U0SemwcS5BgB
         0fTwqbkFhHGSlP/no0E0Q4L2CbWLnUmgD3aDB3nmajQ1w4hpmJ/RbaQMqbGVjRfvEihD
         dHtklbtX8QNwQq//u5mObB+eSLk+r3yjVL3Golir9HDFM6mL5t8U9A2jr0UG+BQyDfz2
         Gq6vrmcOsDAIx74asBbxScIcQOLZupW1Gcl7E6SkyZxo4xdNt7bd8m7T28oKoodUaGA9
         VUzDQV2mVYe8+AjMZDqvJpT/SymrI7TioiQG4Uau4f/bkdlZOkftuawo86GXv0ZR1K3Q
         QHOg==
X-Gm-Message-State: AOAM5303ftmQwUmk7amg+8f2imYK/tQFfc1WjzIR/NNgtUDnabya8dnn
        qmN/OEUaxDkVfhiCOGO0au3K7w==
X-Google-Smtp-Source: ABdhPJxDqx2cNvY5ZYZXAj3yz7pPa4YrB0VaL8i1aMei83D4I+xii9AnLbYiY+iyOBht0JR1Fz4+UA==
X-Received: by 2002:a17:90a:ead5:: with SMTP id ev21mr2241627pjb.188.1600924300494;
        Wed, 23 Sep 2020 22:11:40 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au. [124.171.83.152])
        by smtp.gmail.com with ESMTPSA id a2sm1225190pfk.201.2020.09.23.22.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 22:11:39 -0700 (PDT)
Subject: Re: [PATCH v2] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
To:     =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
        Qian Cai <cai@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Oliver O'Halloran <oohall@gmail.com>,
        linuxppc-dev@lists.ozlabs.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200807101854.844619-1-clg@kaod.org>
 <9c5eca863c63e360662fae7597213e8927c2a885.camel@redhat.com>
 <fce8ffe1-521c-8344-c7ad-53550e408cdc@kaod.org>
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <6716add0-9244-4da1-a578-f7faeb529e77@ozlabs.ru>
Date:   Thu, 24 Sep 2020 15:11:34 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <fce8ffe1-521c-8344-c7ad-53550e408cdc@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 23/09/2020 17:06, Cédric Le Goater wrote:
> On 9/23/20 2:33 AM, Qian Cai wrote:
>> On Fri, 2020-08-07 at 12:18 +0200, Cédric Le Goater wrote:
>>> When a passthrough IO adapter is removed from a pseries machine using
>>> hash MMU and the XIVE interrupt mode, the POWER hypervisor expects the
>>> guest OS to clear all page table entries related to the adapter. If
>>> some are still present, the RTAS call which isolates the PCI slot
>>> returns error 9001 "valid outstanding translations" and the removal of
>>> the IO adapter fails. This is because when the PHBs are scanned, Linux
>>> maps automatically the INTx interrupts in the Linux interrupt number
>>> space but these are never removed.
>>>
>>> To solve this problem, we introduce a PPC platform specific
>>> pcibios_remove_bus() routine which clears all interrupt mappings when
>>> the bus is removed. This also clears the associated page table entries
>>> of the ESB pages when using XIVE.
>>>
>>> For this purpose, we record the logical interrupt numbers of the
>>> mapped interrupt under the PHB structure and let pcibios_remove_bus()
>>> do the clean up.
>>>
>>> Since some PCI adapters, like GPUs, use the "interrupt-map" property
>>> to describe interrupt mappings other than the legacy INTx interrupts,
>>> we can not restrict the size of the mapping array to PCI_NUM_INTX. The
>>> number of interrupt mappings is computed from the "interrupt-map"
>>> property and the mapping array is allocated accordingly.
>>>
>>> Cc: "Oliver O'Halloran" <oohall@gmail.com>
>>> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>
>> Some syscall fuzzing will trigger this on POWER9 NV where the traces pointed to
>> this patch.
>>
>> .config: https://gitlab.com/cailca/linux-mm/-/blob/master/powerpc.config
> 
> OK. The patch is missing a NULL assignement after kfree() and that
> might be the issue. 
> 
> I did try PHB removal under PowerNV, so I would like to understand 
> how we managed to remove twice the PCI bus and possibly reproduce. 
> Any chance we could grab what the syscall fuzzer (syzkaller) did ? 



My guess would be it is doing this in parallel to provoke races.



-- 
Alexey
