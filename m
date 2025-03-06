Return-Path: <linux-next+bounces-5671-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E75AEA547B2
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 11:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FAB216F64F
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 10:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D29204C31;
	Thu,  6 Mar 2025 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GKk6CSsL"
X-Original-To: linux-next@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2501A2045B6
	for <linux-next@vger.kernel.org>; Thu,  6 Mar 2025 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741256664; cv=none; b=m5nQVGzcVAje8UBL0sGikvx/UDvL+RCk10MT9swY9vXBv2n2YKn4Vw4Fa+uAIQbYQ/xJSZnxpqSVg1IdV9FULBpoUDuJVYOEugMQl9u/GvA6cp6Ahqk0NgFWuWoV3ikEqvyW51H9pGGTVHDgr+immqlIxXiAb/LiHfRHnuIiTdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741256664; c=relaxed/simple;
	bh=Uo69lXKS0GaN/wbhkOYfWNI6Y6MihgXFm+nP4SXRWVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+ns7zRoVOVziy3qLYX1hY+kBxeYnzcBf50eOyCM8g3GkUVrAN3eMEy8XR5S1ei9YPZKDGLkUljCGjdWft90lKyhGLM0hJPD3c32go7sMoaMxV+Ly0YyaSt2jDjlWD71yK/OuEfmnnL7PVUK66BtkB9EruE/8FZmSJV8e+hBBlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GKk6CSsL; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <6d589863-1eba-46dc-a9ff-905d5380cd53@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741256649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sos9IN0yeAPRIxW6qwHtKttNUd7BC/DSQbq25FgfCoo=;
	b=GKk6CSsLLsLhNaZuPDw1eyZC33Jukyga7WFDO4/D87gsR/GZaaHgaeM5qUAiIcFIbqCrPu
	+3adOWT3LALN/GapAEKqm8HarQ5DDPEevWFmWSxL0INJqTBsfsShC/XUSwJ+HUj4KbcVuZ
	ECrx2q9XUydvjQo9q4eJq6k44OiDKKE=
Date: Thu, 6 Mar 2025 11:24:08 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250306123733.5212bf69@canb.auug.org.au>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20250306123733.5212bf69@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi, Stephen

I am the author of the commit 8ce2eb9dfac8 ("RDMA/rxe: Fix the failure 
of ibv_query_device() and ibv_query_device_ex() tests").

My replies are inline. Thanks a lot.

"

diff --cc drivers/infiniband/sw/rxe/rxe.c
index e27478fe9456,4e56a371deb5..000000000000
--- a/drivers/infiniband/sw/rxe/rxe.c
+++ b/drivers/infiniband/sw/rxe/rxe.c
@@@ -72,10 -71,45 +69,39 @@@ static void rxe_init_device_param(struc
       rxe->attr.max_pkeys            = RXE_MAX_PKEYS;
       rxe->attr.local_ca_ack_delay        = RXE_LOCAL_CA_ACK_DELAY;

  -    ndev = rxe_ib_device_get_netdev(&rxe->ib_dev);
  -    if (!ndev)
  -        return;
  -
+     if (ndev->addr_len) {
+         memcpy(rxe->raw_gid, ndev->dev_addr,
+             min_t(unsigned int, ndev->addr_len, ETH_ALEN));
+     } else {
+         /*
+          * This device does not have a HW address, but
+          * connection mangagement requires a unique gid.
+          */
+         eth_random_addr(rxe->raw_gid);
+     }
+
       addrconf_addr_eui48((unsigned char *)&rxe->attr.sys_image_guid,
-             ndev->dev_addr);
+             rxe->raw_gid);

  -    dev_put(ndev);
  -


------The above snippet is fine with me.


       rxe->max_ucontext            = RXE_MAX_UCONTEXT;
+
+     if (IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING)) {
+         rxe->attr.kernel_cap_flags |= IBK_ON_DEMAND_PAGING;
+
+         /* IB_ODP_SUPPORT_IMPLICIT is not supported right now. */
+         rxe->attr.odp_caps.general_caps |= IB_ODP_SUPPORT;
+
+         rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |= 
IB_ODP_SUPPORT_SEND;
+         rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |= 
IB_ODP_SUPPORT_RECV;
+         rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |= 
IB_ODP_SUPPORT_SRQ_RECV;
+
+         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
IB_ODP_SUPPORT_SEND;
+         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
IB_ODP_SUPPORT_RECV;
+         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
IB_ODP_SUPPORT_WRITE;
+         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
IB_ODP_SUPPORT_READ;
+         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
IB_ODP_SUPPORT_ATOMIC;
+         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
IB_ODP_SUPPORT_SRQ_RECV;
+     }
   }



---------The above snippet is from on_demand paging commits. I do not 
why it is involved in this commit.

---------It should appear in on_demand_paging patchset.


   /* initialize port attributes */
@@@ -107,13 -141,18 +133,13 @@@ static void rxe_init_port_param(struct
   /* initialize port state, note IB convention that HCA ports are always
    * numbered from 1
    */
  -static void rxe_init_ports(struct rxe_dev *rxe)
  +static void rxe_init_ports(struct rxe_dev *rxe, struct net_device *ndev)


----------In this snippet, the variable "struct net_device *ndev" is not 
used in the function rxe_init_ports, it should be removed.

----------Thanks a lot.

Zhu Yanjun


   {
       struct rxe_port *port = &rxe->port;
  -    struct net_device *ndev;

       rxe_init_port_param(port);
  -    ndev = rxe_ib_device_get_netdev(&rxe->ib_dev);
  -    if (!ndev)
  -        return;
       addrconf_addr_eui48((unsigned char *)&port->port_guid,
-                 ndev->dev_addr);
+                 rxe->raw_gid);
  -    dev_put(ndev);
       spin_lock_init(&port->port_lock);
   }

"

On 06.03.25 02:37, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the rdma tree got a conflict in:
>
>    drivers/infiniband/sw/rxe/rxe.c
>
> between commit:
>
>    8ce2eb9dfac8 ("RDMA/rxe: Fix the failure of ibv_query_device() and ibv_query_device_ex() tests")
>
> from the rdma-fixes tree and commit:
>
>    d34d0bdb500e ("RDMA/rxe: Replace netdev dev addr with raw_gid")
>
> from the rdma tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
-- 
Best Regards,
Yanjun.Zhu


