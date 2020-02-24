Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5414416A0E0
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2020 09:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbgBXI6Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Feb 2020 03:58:16 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38435 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgBXI6Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Feb 2020 03:58:16 -0500
Received: by mail-wr1-f68.google.com with SMTP id e8so9361434wrm.5
        for <linux-next@vger.kernel.org>; Mon, 24 Feb 2020 00:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H2Cct5hWHL+uQC/bm8Prlx7dsjSsRBh79w87Fgtt9TA=;
        b=Map5D94VRU1zLb8f19HfjRA4bJ7Wl0h/OCYQcxn12JY/e9+HeK0fTtEmWhZ0QebxUv
         xHNCg7G25sz5ECQNFbD1RG3YeynJ2Bg0OSwqD4Mv0xjXesAzvoB41mPv+6EXruAOG1m0
         7lZ+CBRlYUzs3x+3j1u92mb0HknntVBjbVDaRjFfa/uCtrGFr9xbmSGexpLeCmYtbc0t
         VsLLKJZRLiyV/bL5iuNufe6u+9vNEJP3041cHfjLFHl1ZBA4IPm2uGbAVT6uHbFywsag
         a5uuaE9B/0/2FpW6AbCerzNyxdNwA6F1JubNWWT8/x5FIE9R6UozFMKnMDwCU7Zd2i4i
         I7xw==
X-Gm-Message-State: APjAAAV+xUmnFs1SSB+qTUdpjkNb/XDphGqwe8NR908EWBAxmpaqER4y
        55dCJLMmSMStGUzOCzyGlZA=
X-Google-Smtp-Source: APXvYqwI6GLQ96fHtBV39r/Kowb15Ks1F1Wur7CqhfRydMNy5c7m6Bj+2tsJRhgk5dCrnqTmrDx97w==
X-Received: by 2002:a5d:5263:: with SMTP id l3mr64736786wrc.405.1582534694073;
        Mon, 24 Feb 2020 00:58:14 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
        by smtp.gmail.com with ESMTPSA id z133sm17730879wmb.7.2020.02.24.00.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 00:58:13 -0800 (PST)
Date:   Mon, 24 Feb 2020 09:58:12 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     Christopher Lameter <cl@linux.com>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200224085812.GB22443@dhcp22.suse.cz>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com>
 <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
 <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com>
 <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat 22-02-20 03:38:11, Cristopher Lameter wrote:
> On Tue, 18 Feb 2020, Michal Hocko wrote:
> 
> > Anyway, I do not think it is expected that kmalloc_node just blows up
> > on those nodes. The page allocator simply falls back to the closest
> > node. Something for kmalloc maintainers I believe.
> 
> That is the case for an unconstrained allocation. kmalloc_node means that
> you want memory from that node. And If there is no such node then it is an
> error.

Hmm, nasty. Is there any reason why kmalloc_node behaves differently
from the page allocator?

> > A short summary. kmalloc_node blows up when trying to allocate from a
> > memory less node.
> 
> Use kmalloc instead? And set a memory allocation policy?

The current code (memcg_expand_one_shrinker_map resp. memcg_alloc_shrinker_maps)
already use kvmalloc. Kirill's patch wanted to make those data structure
on the respective node and kvmalloc_node sounded like the right thing to
do. It comes as a surprise that the kernel simply blows up on a memory
less node rather than falling back to a close node gracefully. I suspect
this already happens when the target node is out of memory, right?

How would a memory allocation policy help in this case btw.?

-- 
Michal Hocko
SUSE Labs
