Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 658CC1800F2
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 16:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgCJPBX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 11:01:23 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40987 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgCJPBX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 11:01:23 -0400
Received: by mail-ot1-f66.google.com with SMTP id s15so5191838otq.8
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2020 08:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dX3tIfhg8Pgw7VaqAcNR8DRUcVBfEcC2G/jhaGAghMc=;
        b=HZ15u88YqS/n+EfRybOQiygomwrVZICw36HdPWInCHkT8w3PLO7pDGDQM80oUoZTyr
         DfypAudJYavBBE15UuSXR58HSmbiiPUouB8r1GiWVaRueImc6Z3YAogIQjwPgfz/zT4z
         P+AhGBDs/Nq8XdqSxnDZv/A56Iqe+lEYwBJGCOXjpN756jzpiNVmq3n+FDbIxna/KWSe
         jM4SAfRBQtsmUOboGcrUjpuVgbJjGfcxaEQ8PuyJN4R/7u2Xhh/AhPaSKfJhnwq5JmsI
         U0UVDV5FtbE7a76Mb6y9jtG4snHvs3dD6Ggu+L1Ky2eGCykG4tBzKtNfp68nwGpS1L9b
         ivbw==
X-Gm-Message-State: ANhLgQ34zt8cD77eN8GzgLKZQiOLhNQTZ2du0q0OIvRhhmsn0KweT695
        OE1qw6jBoCgaLYIH8iqL3cA=
X-Google-Smtp-Source: ADFU+vuQuFenZSPppKiEGnjSnrmQcdZgNpbb5fhlH5HInmerm41VCtvaEccg65uDW45jDgzov0aZXA==
X-Received: by 2002:a9d:4798:: with SMTP id b24mr10336276otf.243.1583852480995;
        Tue, 10 Mar 2020 08:01:20 -0700 (PDT)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
        by smtp.gmail.com with ESMTPSA id z23sm11802570otm.79.2020.03.10.08.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:01:19 -0700 (PDT)
Date:   Tue, 10 Mar 2020 16:01:14 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        David Rientjes <rientjes@google.com>,
        Christopher Lameter <cl@linux.com>,
        linuxppc-dev@lists.ozlabs.org,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200310150114.GO8447@dhcp22.suse.cz>
References: <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
 <20200227121214.GE3771@dhcp22.suse.cz>
 <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com>
 <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz>
 <20200227182650.GG3771@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227182650.GG3771@dhcp22.suse.cz>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu 27-02-20 19:26:54, Michal Hocko wrote:
> [Cc ppc maintainers]
[...]
> Please have a look at http://lkml.kernel.org/r/52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com
> for the boot log with the debugging patch which tracks set_numa_mem.
> This seems to lead to a crash in the slab allocator bebcause
> node_to_mem_node(0) for memory less node resolves to the memory less
> node http://lkml.kernel.org/r/dd450314-d428-6776-af07-f92c04c7b967@suse.cz.
> The original report is http://lkml.kernel.org/r/3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com

ping 
-- 
Michal Hocko
SUSE Labs
