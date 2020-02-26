Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 757261707E6
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 19:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgBZSoO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 13:44:14 -0500
Received: from gentwo.org ([3.19.106.255]:58986 "EHLO gentwo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727064AbgBZSoO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Feb 2020 13:44:14 -0500
Received: by gentwo.org (Postfix, from userid 1002)
        id CDCF43EC0C; Wed, 26 Feb 2020 18:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by gentwo.org (Postfix) with ESMTP id CCCE63EBB8;
        Wed, 26 Feb 2020 18:44:13 +0000 (UTC)
Date:   Wed, 26 Feb 2020 18:44:13 +0000 (UTC)
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
In-Reply-To: <20200226184152.GQ3771@dhcp22.suse.cz>
Message-ID: <alpine.DEB.2.21.2002261843200.8915@www.lameter.com>
References: <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com> <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com> <20200218115525.GD4151@dhcp22.suse.cz> <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com> <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com> <20200218152441.GH4151@dhcp22.suse.cz> <alpine.DEB.2.21.2002220337030.2000@www.lameter.com> <20200224085812.GB22443@dhcp22.suse.cz> <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 26 Feb 2020, Michal Hocko wrote:

> Besides that kmalloc_node shouldn't really have an implicit GFP_THISNODE
> semantic right? At least I do not see anything like that documented
> anywhere.

Kmalloc_node does not support memory policies etc. Only kmalloc does.
kmalloc_node is mostly used by subsystems that have determined the active
nodes and want a targeted allocation on those nodes.


