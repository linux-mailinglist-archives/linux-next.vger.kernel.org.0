Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817DC2E0DD3
	for <lists+linux-next@lfdr.de>; Tue, 22 Dec 2020 18:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgLVRYx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Dec 2020 12:24:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:37108 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727384AbgLVRYx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Dec 2020 12:24:53 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 84A8AB285;
        Tue, 22 Dec 2020 17:24:11 +0000 (UTC)
Subject: Re: DM's filesystem lookup in dm_get_dev_t() [was: Re: linux-next:
 manual merge of the device-mapper tree with Linus' tree]
To:     Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@lst.de>,
        linux-block@vger.kernel.org, dm-devel@redhat.com
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alasdair G Kergon <agk@redhat.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201222095056.7a5ac0a0@canb.auug.org.au>
 <20201222131528.GA29822@lst.de> <20201222145327.GC12885@redhat.com>
From:   Hannes Reinecke <hare@suse.de>
Message-ID: <288d1c58-c0e2-9d6f-4816-48c66536fe8b@suse.de>
Date:   Tue, 22 Dec 2020 18:24:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201222145327.GC12885@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/22/20 3:53 PM, Mike Snitzer wrote:
> [added linux-block and dm-devel, if someone replies to this email to
> continue "proper discussion" _please_ at least drop sfr and linux-next
> from Cc]
> 
> On Tue, Dec 22 2020 at  8:15am -0500,
> Christoph Hellwig <hch@lst.de> wrote:
> 
>> Mike, Hannes,
>>
>> I think this patch is rather harmful.  Why does device mapper even
>> mix file system path with a dev_t and all the other weird forms
>> parsed by name_to_dev_t, which was supposed to be be for the early
>> init code where no file system is available.
> 
> OK, I'll need to revisit (unless someone beats me to it) because this
> could've easily been a blind-spot for me when the dm-init code went in.
> Any dm-init specific enabling interface shouldn't be used by more
> traditional DM interfaces.  So Hannes' change might be treating symptom
> rather than the core problem (which would be better treated by factoring
> out dm-init requirements for a name_to_dev_t()-like interface?).
> 
> DM has supported passing maj:min and blockdev names on DM table lines
> forever... so we'll need to be very specific about where/why things
> regressed.
> 

Ok. The problem from my perspective is that device-mapper needs to
a) ensure that the arbitrary string passed in with the table definition 
refers to a valid block device
and
b) the block device can be opened with O_EXCL, so that device-mapper can 
then use it.

Originally (ie prior to commit 644bda6f3460) dm_get_device() just 
converted the string to a 'dev_t' representation, and then the block 
device itself was checked and opened in dm_get_table_device().
'lookup_bdev' was just being used to convert the path if the string was 
not in the canonical major:minor format, as then it was assumed that it 
referred to a block device node, and then lookup_bdev kinda makes sense.

However, lookup_bdev() now always recurses into the filesystem, causing 
multipath to stall in an all-paths-down scenario.

So, the real issue is the table definiton; as it also accepts a device 
to be specified by the block device _node_ name, we need to have a way 
of converting that into a dev_t.

If lookup_bdev() is the wrong interface for that, by all means, please, 
do tell me. I'd be happy to draft up a patch.

Alternatively, if Mike says that only major:minor is the valid format 
for a table definition we can kill that code completely. But clearly _I_ 
cannot make the call here.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
