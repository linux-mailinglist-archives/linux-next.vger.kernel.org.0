Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490553B3CB1
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 08:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbhFYGap (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 02:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48899 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231406AbhFYGao (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Jun 2021 02:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624602503;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sIoHe1dv/Px9G99hVUaTNA02aE7yvWh4n1fZW/mQPxM=;
        b=HKZgJcYsYvpuNQhtIrXinUw3LBJUc0nWczQKo2fr0uwacWNyw4nMya7ChpGk/09obeN5Ar
        WFHktVrslHH53o1LxTOM83FL0vLddcFweucue/NGXVIgRki9hmJUwCRu89Ac2/SjF7+R6V
        I8BJ2aZ1SWwrfLo+Zz+fIa5Nb1tAh1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-m6s6sbZIOrmKzWjswvEP_A-1; Fri, 25 Jun 2021 02:28:21 -0400
X-MC-Unique: m6s6sbZIOrmKzWjswvEP_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E5418414A1;
        Fri, 25 Jun 2021 06:28:20 +0000 (UTC)
Received: from [10.64.54.233] (vpn2-54-233.bne.redhat.com [10.64.54.233])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DE405D6A8;
        Fri, 25 Jun 2021 06:28:17 +0000 (UTC)
Reply-To: Gavin Shan <gshan@redhat.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     David Hildenbrand <david@redhat.com>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210624194301.7474ce76@canb.auug.org.au>
From:   Gavin Shan <gshan@redhat.com>
Message-ID: <0b1d5003-830e-b284-0fca-cc62d9192b65@redhat.com>
Date:   Fri, 25 Jun 2021 16:28:15 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20210624194301.7474ce76@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 6/24/21 7:43 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> mm/page_reporting.c:14:37: error: initializer element is not constant
>     14 | unsigned int page_reporting_order = pageblock_order;
>        |                                     ^~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>    223f64d9e679 ("mm/page_reporting: export reporting order as module parameter")
> 
> pageblock_order is defined to be various things depending on CONFIG_
> symbols.
> 
> I have reverted that commit (and the following three) for today.
> 

Yes, Please drop this series for now.

The v3 was applied and caused the build error. Actually, we need
v5, which was posted couple of hours ago.

    v5: https://lkml.org/lkml/2021/6/24/1137

Thanks,
Gavin

