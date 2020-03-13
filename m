Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D226184605
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 12:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgCMLfj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 07:35:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:45876 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgCMLfj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 07:35:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 87436B03B;
        Fri, 13 Mar 2020 11:35:35 +0000 (UTC)
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
To:     Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Michal Hocko <mhocko@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Pekka Enberg <penberg@kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        David Rientjes <rientjes@google.com>,
        Christopher Lameter <cl@linux.com>,
        linuxppc-dev@lists.ozlabs.org,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>
References: <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
 <20200227121214.GE3771@dhcp22.suse.cz>
 <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com>
 <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz>
 <20200227182650.GG3771@dhcp22.suse.cz> <20200310150114.GO8447@dhcp22.suse.cz>
 <87a74lix5p.fsf@mpe.ellerman.id.au>
 <F0FBAD4E-3257-4DFD-BFE2-4AD7D811CFB3@linux.vnet.ibm.com>
 <875zf8y1i1.fsf@mpe.ellerman.id.au>
 <20200313111246.GB25144@linux.vnet.ibm.com>
From:   Vlastimil Babka <vbabka@suse.cz>
Message-ID: <11e69587-8b64-6088-cb5c-d7d719842535@suse.cz>
Date:   Fri, 13 Mar 2020 12:35:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313111246.GB25144@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/13/20 12:12 PM, Srikar Dronamraju wrote:
> * Michael Ellerman <mpe@ellerman.id.au> [2020-03-13 21:48:06]:
> 
>> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
>> >> The patch below might work. Sachin can you test this? I tried faking up
>> >> a system with a memoryless node zero but couldn't get it to even start
>> >> booting.
>> >> 
>> > The patch did not help. The kernel crashed during
>> > the boot with the same call trace.
>> >
>> > BUG_ON() introduced with the patch was not triggered.
>> 
>> OK, that's weird.
>> 
>> I eventually managed to get a memoryless node going in sim, and it
>> appears to work there.
>> 
>> eg in dmesg:
>> 
>>   [    0.000000][    T0] numa:   NODE_DATA [mem 0x2000fffa2f80-0x2000fffa7fff]
>>   [    0.000000][    T0] numa:     NODE_DATA(0) on node 1
>>   [    0.000000][    T0] numa:   NODE_DATA [mem 0x2000fff9df00-0x2000fffa2f7f]
>>   ...
>>   [    0.000000][    T0] Early memory node ranges
>>   [    0.000000][    T0]   node   1: [mem 0x0000000000000000-0x00000000ffffffff]
>>   [    0.000000][    T0]   node   1: [mem 0x0000200000000000-0x00002000ffffffff]
>>   [    0.000000][    T0] Could not find start_pfn for node 0
>>   [    0.000000][    T0] Initmem setup node 0 [mem 0x0000000000000000-0x0000000000000000]
>>   [    0.000000][    T0] On node 0 totalpages: 0
>>   [    0.000000][    T0] Initmem setup node 1 [mem 0x0000000000000000-0x00002000ffffffff]
>>   [    0.000000][    T0] On node 1 totalpages: 131072
>>   
>>   # dmesg | grep set_numa
>>   [    0.000000][    T0] set_numa_mem: mem node for 0 = 1
>>   [    0.005654][    T0] set_numa_mem: mem node for 1 = 1
>> 
>> So is the problem more than just node zero having no memory?
>> 
> 
> The problem would happen with possible nodes which are not yet present. i.e
> no cpus, no memory attached to those nodes.
> 
> Please look at
> http://lore.kernel.org/lkml/20200312131438.GB3277@linux.vnet.ibm.com/t/#u
> for more details.
> 
> The summary being: pgdat/Node_Data for such nodes is not allocated. Hence

Michael's log shows that his pgdat is still allocated. But perhaps Sachin had
also your 3 patches from the other thread applied, in addition to Michael's
patch. So in his case pgdat for node 0 would indeed be no longer allocated, and
thus SLUB code was crashing in node_present_pages() instead.

> the node_present_pages(nid) called  where nid is a possible but not yet
> present node fails. Currently node_present_pages(nid) and node_to_mem_node
> don't seem to be equipped to handle possible but not present nodes.
> 
>> cheers
> 

