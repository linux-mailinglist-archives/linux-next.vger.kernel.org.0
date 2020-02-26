Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D2A170A04
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 21:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbgBZUwU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 15:52:20 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52293 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727379AbgBZUwU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Feb 2020 15:52:20 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so879234wmc.2
        for <linux-next@vger.kernel.org>; Wed, 26 Feb 2020 12:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WJFduaxlSsHHS4gNp/foxgTH7UCDLpFZpZFWJkHONbI=;
        b=NKgxVFR2zYczbQMjQsoAYK9kJcHjxdUYrlWGhFRvzqcK12BIlpar0T6aYiistRRm8a
         it1Hmt5WJ4CsBLuimhGnoJAKNS/akQJyUx7t/mqVO3MxCLnnkDxqdAV5TdQ1fwGVfU5d
         H7QOCF29RkGfh9iCqizIQ+Ll5QnNmjix1y55X4elKOllg+AMY6/2NjrdVtXa8MtoKyAY
         uv0pHItf441sTJR0XSMea4gFjdwNAXhAvB1evJHMJWncVimrOIOv+XZDESjm7bgY+Wbl
         h0Ebh38kej3ga+cMJ3NTE19sSK5yqQP/WOaFyhuCaHO2rfQV4pBph3UQTnkFr/9T0wJ2
         BRMA==
X-Gm-Message-State: APjAAAVnJVG17KVq/Mziz4AXaechZhzPXPTYoVC0hLoZMFNOgw7TQolE
        qS0MnfAVKRgHhUvVDL1WmsU=
X-Google-Smtp-Source: APXvYqynGzzZnLeuN+i15owlhUBU+X4Bq1UMtWfOYs19d9h4lZGatMicrImoFFdMiGhIL206VIuNpg==
X-Received: by 2002:a1c:e483:: with SMTP id b125mr707978wmh.187.1582750337898;
        Wed, 26 Feb 2020 12:52:17 -0800 (PST)
Received: from localhost (ip-37-188-190-100.eurotel.cz. [37.188.190.100])
        by smtp.gmail.com with ESMTPSA id l8sm4487632wmj.2.2020.02.26.12.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 12:52:17 -0800 (PST)
Date:   Wed, 26 Feb 2020 21:52:15 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     David Rientjes <rientjes@google.com>
Cc:     Christopher Lameter <cl@linux.com>,
        Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200226205215.GW3771@dhcp22.suse.cz>
References: <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261843200.8915@www.lameter.com>
 <20200226190147.GR3771@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261228060.208847@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2002261228060.208847@chino.kir.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 26-02-20 12:31:56, David Rientjes wrote:
> On Wed, 26 Feb 2020, Michal Hocko wrote:
> 
> > On Wed 26-02-20 18:44:13, Cristopher Lameter wrote:
> > > On Wed, 26 Feb 2020, Michal Hocko wrote:
> > > 
> > > > Besides that kmalloc_node shouldn't really have an implicit GFP_THISNODE
> > > > semantic right? At least I do not see anything like that documented
> > > > anywhere.
> > > 
> > > Kmalloc_node does not support memory policies etc. Only kmalloc does.
> > > kmalloc_node is mostly used by subsystems that have determined the active
> > > nodes and want a targeted allocation on those nodes.
> >  
> > I am sorry but I have hard time to follow your responses here. They open
> > more questions than they answer for me. The primary point here is that
> > kmalloc_node on a memory less node blows up and panics the kernel. I
> > strongly believe this is a bug. We cannot really make all callers of
> > kmalloc_node and co. to be hotplug aware.
> > 
> > Another question is the semantic of kmalloc_node when the node cannot
> > satisfy the request. I have always thought that the allocation would
> > simply fall back to any other node unless __GFP_THISNODE is explicitly
> > specified.
> > 
> 
> Am I right in classifying this as a trade-off between an 
> unlikely(!node_state(nid, N_MEMORY)) directly in kmalloc_node() vs fixing 
> up a caller passing a memoryless nid?

The thing is that any check for node online/populated followed by the
allocation is inherently racy without using memory hotplug locking
around that and I am pretty sure this is a step into a wrong direction.

Is there any problem to initialize slub internal data structures for all
possible nodes? This wouldn't require any checks into hot paths.

-- 
Michal Hocko
SUSE Labs
