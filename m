Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5AD1709B5
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 21:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbgBZUb7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 15:31:59 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43561 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727306AbgBZUb7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Feb 2020 15:31:59 -0500
Received: by mail-pf1-f193.google.com with SMTP id s1so343236pfh.10
        for <linux-next@vger.kernel.org>; Wed, 26 Feb 2020 12:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=DssbOlJH2ojyRkFsMNLMtEa2IE6NcEhC6tj2pM0TkDM=;
        b=B/fXCr6w3ivZpRP0pR+ozKOqWQvhe6K8mFugjyi/3NVPUnSSbw/wVhwJsUli4Q+dF+
         L5/WNNUpOcOx3CI0iIyW9ZlSNS6bJuaqssvO7ZIeD/4+ox8oxkbFLR0XWw9ny0M3zhSK
         Ro75VvE9ZNSS01fcyA+/Qa+AitVSAgDxp3zLCXpQh7i4IpkcDVH/ih64W+sj+VkSssm6
         tDoMyWI/Or4x8R+wyZtq2FT7/I/9OyLQrKgeW9dOonIrcEqBfrMRCg3sjcFw6ipYvsCa
         y+0Wwj5whNgmkCWMJ44BcOhxYlFXH8OfppLc3w0VRP5auV79ev7OTpH2HpLgzPkImL4V
         VMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=DssbOlJH2ojyRkFsMNLMtEa2IE6NcEhC6tj2pM0TkDM=;
        b=YXHpQ6ry4hp+8qjc7DjYJ3QENU9HDYeZvnObIKUk2CSty0WBNu26pqmrZobc3wEn2B
         ZvlLB+8Qrned0CqvO8O7P42MsJ3UiOklV84bPKEkGMd88/eUnRY0mK9lK+riEIuCBRaY
         dAwEE5AwYAtTy4MBvK/uznAPmR0x5k3MGJfqVdvvMWuGpqXh20ZoLfcJoFajcz0k0AOj
         Cdm/KVMiUtIHg9uBcXNAlTs5Viz8qD/xmkEU8hyLrotHo73b5J0all5kR88eeAgzByBP
         A3FHhsIj+3kr+JnGFAPXuO8W8y+GJGjLEUpj6Da9KGoUF0Smjj3yBM8l0bU4Eg3aOoIn
         ALxA==
X-Gm-Message-State: APjAAAUTdsgQHItDwmHSRCXYUd/VjNmhGK4kDAAPwrunBgdyuBUD79du
        7L1mvB6Wt9+exAnDAjce6eO/BA==
X-Google-Smtp-Source: APXvYqwUhhH/H/dJXiwpB9VALVveANSXhbGFW4yfoypzGwSX+IMDJUTEIJMx841VFbdu+dVCnzJ26w==
X-Received: by 2002:a63:4d6:: with SMTP id 205mr604982pge.10.1582749118188;
        Wed, 26 Feb 2020 12:31:58 -0800 (PST)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id k24sm541444pgm.61.2020.02.26.12.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 12:31:57 -0800 (PST)
Date:   Wed, 26 Feb 2020 12:31:56 -0800 (PST)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Michal Hocko <mhocko@kernel.org>
cc:     Christopher Lameter <cl@linux.com>,
        Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
In-Reply-To: <20200226190147.GR3771@dhcp22.suse.cz>
Message-ID: <alpine.DEB.2.21.2002261228060.208847@chino.kir.corp.google.com>
References: <20200218115525.GD4151@dhcp22.suse.cz> <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com> <20200218142620.GF4151@dhcp22.suse.cz> <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com> <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com> <20200224085812.GB22443@dhcp22.suse.cz> <alpine.DEB.2.21.2002261823270.8012@www.lameter.com> <20200226184152.GQ3771@dhcp22.suse.cz> <alpine.DEB.2.21.2002261843200.8915@www.lameter.com>
 <20200226190147.GR3771@dhcp22.suse.cz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 26 Feb 2020, Michal Hocko wrote:

> On Wed 26-02-20 18:44:13, Cristopher Lameter wrote:
> > On Wed, 26 Feb 2020, Michal Hocko wrote:
> > 
> > > Besides that kmalloc_node shouldn't really have an implicit GFP_THISNODE
> > > semantic right? At least I do not see anything like that documented
> > > anywhere.
> > 
> > Kmalloc_node does not support memory policies etc. Only kmalloc does.
> > kmalloc_node is mostly used by subsystems that have determined the active
> > nodes and want a targeted allocation on those nodes.
>  
> I am sorry but I have hard time to follow your responses here. They open
> more questions than they answer for me. The primary point here is that
> kmalloc_node on a memory less node blows up and panics the kernel. I
> strongly believe this is a bug. We cannot really make all callers of
> kmalloc_node and co. to be hotplug aware.
> 
> Another question is the semantic of kmalloc_node when the node cannot
> satisfy the request. I have always thought that the allocation would
> simply fall back to any other node unless __GFP_THISNODE is explicitly
> specified.
> 

Am I right in classifying this as a trade-off between an 
unlikely(!node_state(nid, N_MEMORY)) directly in kmalloc_node() vs fixing 
up a caller passing a memoryless nid?

Seems like we wouldn't want to penalize kmalloc_node() for making such a 
check for 99.99% of allocators that don't need it and would rather do a 
node_to_mem_node(nid) or numa_mem_id() in the caller?
