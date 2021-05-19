Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC7D3896C3
	for <lists+linux-next@lfdr.de>; Wed, 19 May 2021 21:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhESTcO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 May 2021 15:32:14 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:57116 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbhESTcO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 May 2021 15:32:14 -0400
X-Greylist: delayed 341 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 May 2021 15:32:13 EDT
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 979E020BEFED
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
References: <20210519080143.583d415d@canb.auug.org.au>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <3c2c877d-aa02-5202-e8e8-53b8470b0154@omp.ru>
Date:   Wed, 19 May 2021 22:25:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519080143.583d415d@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

On 5/19/21 1:01 AM, Stephen Rothwell wrote:

[...]
> In commit
> 
>   1437568b56f8 ("pata_octeon_cf: avoid WARN_ON() in ata_host_activate()")
> 
> Fixes tag
> 
>   Fixes: 3c929c6f5aa7 ("MIPS/OCTEON/ata: Convert pata_octeon_cf.c to use device tree.")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'
> 
> Maybe you meant
> 
> Fixes: 43f01da0f279 ("MIPS/OCTEON/ata: Convert pata_octeon_cf.c to use device tree.")

   This one!

> or
> 
> Fixes: 3c929c6f5aa7 ("libata: New driver for OCTEON SOC Compact Flash interface (v7).")

   Perhaps this could be fixed still, Jens?

MBR, Sergey
