Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6296B17079E
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 19:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbgBZSZ3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 13:25:29 -0500
Received: from gentwo.org ([3.19.106.255]:58926 "EHLO gentwo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727144AbgBZSZ3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Feb 2020 13:25:29 -0500
Received: by gentwo.org (Postfix, from userid 1002)
        id 5726E3EC05; Wed, 26 Feb 2020 18:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by gentwo.org (Postfix) with ESMTP id 5630E3EC04;
        Wed, 26 Feb 2020 18:25:28 +0000 (UTC)
Date:   Wed, 26 Feb 2020 18:25:28 +0000 (UTC)
From:   Christopher Lameter <cl@linux.com>
X-X-Sender: cl@www.lameter.com
To:     Michal Hocko <mhocko@kernel.org>
cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
In-Reply-To: <20200224085812.GB22443@dhcp22.suse.cz>
Message-ID: <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com> <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com> <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com> <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com> <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com> <20200218142620.GF4151@dhcp22.suse.cz> <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com> <20200218152441.GH4151@dhcp22.suse.cz> <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 24 Feb 2020, Michal Hocko wrote:

> Hmm, nasty. Is there any reason why kmalloc_node behaves differently
> from the page allocator?

The page allocator will do the same thing if you pass GFP_THISNODE and
insist on allocating memory from a node that does not exist.


> > > A short summary. kmalloc_node blows up when trying to allocate from a
> > > memory less node.
> >
> > Use kmalloc instead? And set a memory allocation policy?
>
> The current code (memcg_expand_one_shrinker_map resp. memcg_alloc_shrinker_maps)
> already use kvmalloc. Kirill's patch wanted to make those data structure
> on the respective node and kvmalloc_node sounded like the right thing to
> do. It comes as a surprise that the kernel simply blows up on a memory
> less node rather than falling back to a close node gracefully. I suspect
> this already happens when the target node is out of memory, right?

No. If the target node is out of memory then direct reclaim is going to be
invovked.

> How would a memory allocation policy help in this case btw.?

It would allow fallback to other nodes.


