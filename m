Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E64A6170AC3
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 22:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbgBZVqA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 16:46:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:34454 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727552AbgBZVp7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Feb 2020 16:45:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 48406AC42;
        Wed, 26 Feb 2020 21:45:57 +0000 (UTC)
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
To:     Michal Hocko <mhocko@kernel.org>,
        Christopher Lameter <cl@linux.com>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
References: <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
 <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com>
 <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
From:   Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; prefer-encrypt=mutual; keydata=
 mQINBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABtCBWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBzdXNlLmN6PokCVAQTAQoAPgIbAwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBKlA1DSZLC6OmRA9UCJPp+fMgqZkBQJcbbyGBQkH8VTqAAoJECJPp+fMgqZkpGoP
 /1jhVihakxw1d67kFhPgjWrbzaeAYOJu7Oi79D8BL8Vr5dmNPygbpGpJaCHACWp+10KXj9yz
 fWABs01KMHnZsAIUytVsQv35DMMDzgwVmnoEIRBhisMYOQlH2bBn/dqBjtnhs7zTL4xtqEcF
 1hoUFEByMOey7gm79utTk09hQE/Zo2x0Ikk98sSIKBETDCl4mkRVRlxPFl4O/w8dSaE4eczH
 LrKezaFiZOv6S1MUKVKzHInonrCqCNbXAHIeZa3JcXCYj1wWAjOt9R3NqcWsBGjFbkgoKMGD
 usiGabetmQjXNlVzyOYdAdrbpVRNVnaL91sB2j8LRD74snKsV0Wzwt90YHxDQ5z3M75YoIdl
 byTKu3BUuqZxkQ/emEuxZ7aRJ1Zw7cKo/IVqjWaQ1SSBDbZ8FAUPpHJxLdGxPRN8Pfw8blKY
 8mvLJKoF6i9T6+EmlyzxqzOFhcc4X5ig5uQoOjTIq6zhLO+nqVZvUDd2Kz9LMOCYb516cwS/
 Enpi0TcZ5ZobtLqEaL4rupjcJG418HFQ1qxC95u5FfNki+YTmu6ZLXy+1/9BDsPuZBOKYpUm
 3HWSnCS8J5Ny4SSwfYPH/JrtberWTcCP/8BHmoSpS/3oL3RxrZRRVnPHFzQC6L1oKvIuyXYF
 rkybPXYbmNHN+jTD3X8nRqo+4Qhmu6SHi3Vq
Message-ID: <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
Date:   Wed, 26 Feb 2020 22:45:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200226184152.GQ3771@dhcp22.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/26/20 7:41 PM, Michal Hocko wrote:
> On Wed 26-02-20 18:25:28, Cristopher Lameter wrote:
>> On Mon, 24 Feb 2020, Michal Hocko wrote:
>>
>>> Hmm, nasty. Is there any reason why kmalloc_node behaves differently
>>> from the page allocator?
>>
>> The page allocator will do the same thing if you pass GFP_THISNODE and
>> insist on allocating memory from a node that does not exist.
> 
> I do not think that the page allocator would blow up even with
> GFP_THISNODE. The allocation would just fail on memory less node.
> 
> Besides that kmalloc_node shouldn't really have an implicit GFP_THISNODE
> semantic right? At least I do not see anything like that documented
> anywhere.

Seems like SLAB at least behaves like the page allocator. See
____cache_alloc_node() where it basically does:

page = cache_grow_begin(cachep, gfp_exact_node(flags), nodeid);
...
if (!page)
	fallback_alloc(cachep, flags)

gfp_exact_node() adds __GFP_THISNODE among other things, so the initial
attempt does try to stick only to the given node. But fallback_alloc()
doesn't. In fact, even if kmalloc_node() was called with __GFP_THISNODE
then it wouldn't work as intended, as fallback_alloc() doesn't get the
nodeid, but instead will use numa_mem_id(). That part could probably be
improved.

SLUB's ___slab_alloc() has for example this:
if (node != NUMA_NO_NODE && !node_present_pages(node))
    searchnode = node_to_mem_node(node);

That's from Joonsoo's 2014 commit a561ce00b09e ("slub: fall back to
node_to_mem_node() node if allocating on memoryless node"), suggesting
that the scenario in this bug report should work. Perhaps it just got
broken unintentionally later.

And AFAICS the whole path leading to alloc_slab_page() also doesn't add
__GFP_THISNODE, but will keep it if caller passed it, and ultimately it
does:


if (node == NUMA_NO_NODE)
    page = alloc_pages(flags, order);
else
    page = __alloc_pages_node(node, flags, order);

So yeah looks like SLUB's kmalloc_node() is supposed to behave like the
page allocator's __alloc_pages_node() and respect __GFP_THISNODE but not
enforce it by itself. There's probably just some missing data structure
initialization somewhere right now for memoryless nodes.
