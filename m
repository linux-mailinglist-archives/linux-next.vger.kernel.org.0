Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFE1168C34
	for <lists+linux-next@lfdr.de>; Sat, 22 Feb 2020 04:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgBVDiM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Feb 2020 22:38:12 -0500
Received: from gentwo.org ([3.19.106.255]:58734 "EHLO gentwo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbgBVDiM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Feb 2020 22:38:12 -0500
Received: by gentwo.org (Postfix, from userid 1002)
        id 6BF443F625; Sat, 22 Feb 2020 03:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by gentwo.org (Postfix) with ESMTP id 696023F624;
        Sat, 22 Feb 2020 03:38:11 +0000 (UTC)
Date:   Sat, 22 Feb 2020 03:38:11 +0000 (UTC)
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
In-Reply-To: <20200218152441.GH4151@dhcp22.suse.cz>
Message-ID: <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com> <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com> <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com> <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com> <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com> <20200218142620.GF4151@dhcp22.suse.cz> <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com> <20200218152441.GH4151@dhcp22.suse.cz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 18 Feb 2020, Michal Hocko wrote:

> Anyway, I do not think it is expected that kmalloc_node just blows up
> on those nodes. The page allocator simply falls back to the closest
> node. Something for kmalloc maintainers I believe.

That is the case for an unconstrained allocation. kmalloc_node means that
you want memory from that node. And If there is no such node then it is an
error.

> A short summary. kmalloc_node blows up when trying to allocate from a
> memory less node.

Use kmalloc instead? And set a memory allocation policy?

