Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D45D016295D
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2020 16:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgBRPYp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Feb 2020 10:24:45 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34644 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgBRPYp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Feb 2020 10:24:45 -0500
Received: by mail-wm1-f66.google.com with SMTP id s144so2436617wme.1
        for <linux-next@vger.kernel.org>; Tue, 18 Feb 2020 07:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WF5nuerORwTKU2LdOD06412iR6E4PQ55wctVgD1QbZA=;
        b=ZLHiN8waW2aJQ8jdrVeb0RxEvsp7CkpzoCW/tm75bpVJR2KrQZIt5tOjb/8xCbhsG7
         wixC2it7cFmucQti/Pn44d42hBG7uLrRoHvJYHlzJjsWV8zLr6LTWbOElJKsM4fbVuyr
         Ra4QkfejP8zRqyf7VOYvXFjCcq5y6ueM/490OQE9rRqIWFnnL8f8a+I4S1GO1hXurtpy
         8i4Sh61pQp4KpCtM70ySEqpg+oVZJyKaXTXzg2TRA9tq776moiFIy6oHTqi6OIakiXvt
         iemylWHPPqp1e6zvj+cZ+5mSBy41EshpLMSmQPijZrDch1KAQQuXag+f9ImbtNSGw3Bv
         qJYg==
X-Gm-Message-State: APjAAAV9fNn2cN+qHhadvITULuuzRTkbvN6ZtVs+IVziElKzy9A7DqCm
        pW6vXI6l4jV1nwcDD9DdzV0=
X-Google-Smtp-Source: APXvYqzpSJj6qrSybFT0mjUD/YGni0vccUWIowyCmX38SpilgquuDnPuAUh5eHHoc62hLywZ39flFw==
X-Received: by 2002:a05:600c:3d1:: with SMTP id z17mr3868397wmd.90.1582039483432;
        Tue, 18 Feb 2020 07:24:43 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
        by smtp.gmail.com with ESMTPSA id b67sm3847476wmc.38.2020.02.18.07.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 07:24:42 -0800 (PST)
Date:   Tue, 18 Feb 2020 16:24:41 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Cristopher Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc:     Kirill Tkhai <ktkhai@virtuozzo.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200218152441.GH4151@dhcp22.suse.cz>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com>
 <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
 <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com>
 <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue 18-02-20 20:41:12, Sachin Sant wrote:
> 
> >> Yes, I can recreate the same problem with the patch applied on top of
> >> 5.6.0-rc2. 
> > 
> > And just to make sure. This was with http://lkml.kernel.org/r/fff0e636-4c36-ed10-281c-8cdb0687c839@virtuozzo.com
> > right?
> > 
> Yes, the same patch.
> 
> > If yes, is it possible that the specific node is somehow crippled (e.g.
> > some nodes don't have any memory and thus the allocator blows up)? In
> > other words what is the numa topology? (numactl -H)
> > 
> 
> Here is the o/p of numactl
> 
> # numactl -H
> available: 2 nodes (0-1)
> node 0 cpus:
> node 0 size: 0 MB
> node 0 free: 0 MB

OK, so what I expected. The node0 is memory less or simply not present
at all. Fun!

Anyway, I do not think it is expected that kmalloc_node just blows up
on those nodes. The page allocator simply falls back to the closest
node. Something for kmalloc maintainers I believe.

A short summary. kmalloc_node blows up when trying to allocate from a
memory less node.

> node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> node 1 size: 35247 MB
> node 1 free: 30907 MB
> node distances:
> node   0   1 
>   0:  10  40 
>   1:  40  10 
> # 
> 
> Thanks
> -Sachin

-- 
Michal Hocko
SUSE Labs
