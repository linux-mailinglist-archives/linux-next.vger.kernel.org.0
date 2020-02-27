Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE951716DE
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 13:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbgB0MMS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 07:12:18 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36409 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728856AbgB0MMR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 07:12:17 -0500
Received: by mail-ot1-f67.google.com with SMTP id j20so2700593otq.3
        for <linux-next@vger.kernel.org>; Thu, 27 Feb 2020 04:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wAy/HoXlPsKGVv3Arb2L5dXTkVg8l5DWVj+VU2leEfY=;
        b=rlIr46VBTDP9u/7mmkE7py+opcehTdirIzNAPsK/c5fxwW3sshzZCgoGqpGtQMrmc5
         WUbP8S0fs7VLiswxjEnOjDV99EMmerpT7r7kQtpRSj9wdaD88jBrNx2atbpwO4d/PfNb
         Q04icg6e6c2HLt6ZKW/Tv+jYNwD+ZzDXNOa5dESXUZk1YfYkdmcXjoJu/8qC9fqmghVb
         OfA8mSKgOVlARes45lSz1QFu0a+VJjcA/x//Cq5Jj5t7GZOjslJZvFTF0gofr3i5Tjp3
         a2pFveSeYiBkbUQyiXFiQpchheeJgVAfC68TcB8pkcQ9VRCsld7SlRpryqtwqFttMtfN
         TKwA==
X-Gm-Message-State: APjAAAXprpdHl699AbXLKVvJcBzzh7nsr+pWiNr5Y+FPMBo2RjUG3X60
        XvECjPBkfI2ehpaYm0dR8Zc=
X-Google-Smtp-Source: APXvYqy57WOtkiVEsLREk9cIvpOLT2XJeuMjo9L51/5HtEeQwhafxUUEiHowfCJ3CzEaUupx1TqcOg==
X-Received: by 2002:a05:6830:1e2d:: with SMTP id t13mr3169668otr.128.1582805537162;
        Thu, 27 Feb 2020 04:12:17 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
        by smtp.gmail.com with ESMTPSA id a15sm822938otf.75.2020.02.27.04.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 04:12:16 -0800 (PST)
Date:   Thu, 27 Feb 2020 13:12:14 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     Vlastimil Babka <vbabka@suse.cz>,
        Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc:     Christopher Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200227121214.GE3771@dhcp22.suse.cz>
References: <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 26-02-20 23:29:24, Vlastimil Babka wrote:
> On 2/26/20 10:45 PM, Vlastimil Babka wrote:
> > 
> > 
> > if (node == NUMA_NO_NODE)
> >     page = alloc_pages(flags, order);
> > else
> >     page = __alloc_pages_node(node, flags, order);
> > 
> > So yeah looks like SLUB's kmalloc_node() is supposed to behave like the
> > page allocator's __alloc_pages_node() and respect __GFP_THISNODE but not
> > enforce it by itself. There's probably just some missing data structure
> > initialization somewhere right now for memoryless nodes.
> 
> Upon more digging, I think the problem could manifest if
> node_to_mem_node(0) (_node_numa_mem_[0]) returned 0 instead of 1,
> because it wasn't initialized properly for a memoryless node. Can you
> e.g. print it somewhere?

A very good hint indeed. I would do this
diff --git a/include/linux/topology.h b/include/linux/topology.h
index eb2fe6edd73c..d9f1b6737e4d 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -137,6 +137,8 @@ static inline void set_numa_mem(int node)
 {
 	this_cpu_write(_numa_mem_, node);
 	_node_numa_mem_[numa_node_id()] = node;
+	pr_info("%s %d -> %d\n", __FUNCTION__, numa_node_id(), node);
+	dump_stack();
 }
 #endif
 
Btw. it would be also helpful to get
`faddr2line ___slab_alloc+0x334' from your kernel Sachin.
-- 
Michal Hocko
SUSE Labs
