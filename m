Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68A0318452D
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 11:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgCMKsK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 06:48:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53057 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726364AbgCMKsK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 06:48:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48f2Tz1sGtz9sQx;
        Fri, 13 Mar 2020 21:48:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1584096489;
        bh=TNViHpKk4+9SVYM3ONqfC3TtBfsR1McnFUkkh1JnlwQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=DyJSbF/Wt9DbDw6xPgz+T8Hd8fnbglhUwE//2Z1WjkfY3/YZphz5JzYJiRn+7IL44
         WTWTo+Cvf/b99Ycqu2Xm6wX4ZRec0wioNZ0zn7yit23SbRHeApoY71Mm+zCNeVvOTR
         S//rDaCv8QMLkXvNuy5EtuwayqC/eYQZh4LRmP0W4aziUzQmLwJUomDWCqZddugkLK
         TaTGvI7onl9YZzXur6VJtNqxD2/SXeLnBMBs+Ry3xxyqODSfWK9qb9yJTdQdA1PDb4
         P5UblCPRmKDd6kGa6z0BtsyVG69Gn9NptnCBpcKmmAbBtZREsHFdzCprlGy5IwV5NP
         7RyVweIAi100A==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc:     Michal Hocko <mhocko@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Pekka Enberg <penberg@kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        David Rientjes <rientjes@google.com>,
        Christopher Lameter <cl@linux.com>,
        linuxppc-dev@lists.ozlabs.org,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
In-Reply-To: <F0FBAD4E-3257-4DFD-BFE2-4AD7D811CFB3@linux.vnet.ibm.com>
References: <alpine.DEB.2.21.2002220337030.2000@www.lameter.com> <20200224085812.GB22443@dhcp22.suse.cz> <alpine.DEB.2.21.2002261823270.8012@www.lameter.com> <20200226184152.GQ3771@dhcp22.suse.cz> <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz> <dd450314-d428-6776-af07-f92c04c7b967@suse.cz> <20200227121214.GE3771@dhcp22.suse.cz> <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com> <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz> <20200227182650.GG3771@dhcp22.suse.cz> <20200310150114.GO8447@dhcp22.suse.cz> <87a74lix5p.fsf@mpe.ellerman.id.au> <F0FBAD4E-3257-4DFD-BFE2-4AD7D811CFB3@linux.vnet.ibm.com>
Date:   Fri, 13 Mar 2020 21:48:06 +1100
Message-ID: <875zf8y1i1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
>> The patch below might work. Sachin can you test this? I tried faking up
>> a system with a memoryless node zero but couldn't get it to even start
>> booting.
>> 
> The patch did not help. The kernel crashed during
> the boot with the same call trace.
>
> BUG_ON() introduced with the patch was not triggered.

OK, that's weird.

I eventually managed to get a memoryless node going in sim, and it
appears to work there.

eg in dmesg:

  [    0.000000][    T0] numa:   NODE_DATA [mem 0x2000fffa2f80-0x2000fffa7fff]
  [    0.000000][    T0] numa:     NODE_DATA(0) on node 1
  [    0.000000][    T0] numa:   NODE_DATA [mem 0x2000fff9df00-0x2000fffa2f7f]
  ...
  [    0.000000][    T0] Early memory node ranges
  [    0.000000][    T0]   node   1: [mem 0x0000000000000000-0x00000000ffffffff]
  [    0.000000][    T0]   node   1: [mem 0x0000200000000000-0x00002000ffffffff]
  [    0.000000][    T0] Could not find start_pfn for node 0
  [    0.000000][    T0] Initmem setup node 0 [mem 0x0000000000000000-0x0000000000000000]
  [    0.000000][    T0] On node 0 totalpages: 0
  [    0.000000][    T0] Initmem setup node 1 [mem 0x0000000000000000-0x00002000ffffffff]
  [    0.000000][    T0] On node 1 totalpages: 131072
  
  # dmesg | grep set_numa
  [    0.000000][    T0] set_numa_mem: mem node for 0 = 1
  [    0.005654][    T0] set_numa_mem: mem node for 1 = 1

So is the problem more than just node zero having no memory?

cheers
