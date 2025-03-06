Return-Path: <linux-next+bounces-5672-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EABFAA549BC
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 12:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D6C1894CBB
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 11:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035E320CCC8;
	Thu,  6 Mar 2025 11:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IjUM4kKA"
X-Original-To: linux-next@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85382063D7
	for <linux-next@vger.kernel.org>; Thu,  6 Mar 2025 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260926; cv=none; b=lp4jMN6FadGnvB7kKt3Bgec2+gQOAv+SAMTT76PAmswIiHsgCmgkIBNPrGn/QDxkxtdL3tjBJCWInSW2wlc8YjpcMG6vGaqeJzAeeRVZi3NlWAX961wraPKY+98yfnPlVnIzQlg1ydFpruWRYbYU7q/2plN9KjvW6EszT04sjwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260926; c=relaxed/simple;
	bh=GLLnxJI9yfqrTY4RrclP0nRYB0xiLPfhZUWdc3VqxbE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Qw54LnVguMDTqlKoV8AtcGq8yzVJwSH8jTlRJY2Nv3gE32aZYMVyCCaIVz7EbJrqM5xPEHJqQNvKZ47K9qCz4jZk6xcN8dAt2Z57w0CYnQaHmY23+dLJIghx2cpHu2gI92JjD6hnfB+W1iMRTC2fuL+HDIgk0kf0gHtdgtgJAXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IjUM4kKA; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <67aa4220-3ed9-4444-abc5-e368e4fcf1ed@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741260918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pakHtTDvixUn3xbzrLB5kmRvJbRII92nAkob5P0R+Q0=;
	b=IjUM4kKApb1mIGGTiwQAKAQpKxIx5MeGaWtJpCNuKu2EttVfKgnHAnf/WJ6y75TY6y4W6a
	Ace2YOKIVC8MOl/J1zhoYk7KEoyJA7A8VPJQ31dnvPVXj7jzc9nGGETmBZfSlqrtVUAGOf
	qLrIa2VUq/eofG7jpjIE5jV8MvQHbh0=
Date: Thu, 6 Mar 2025 12:35:16 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250306123733.5212bf69@canb.auug.org.au>
 <6d589863-1eba-46dc-a9ff-905d5380cd53@linux.dev>
Content-Language: en-US
In-Reply-To: <6d589863-1eba-46dc-a9ff-905d5380cd53@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi, Stephen

I git clone the latest source code from linux-next.

The head commit is 565351ae7e0c Add linux-next specific files for 20250306

The following should be applied. In linux-next, because raw_gid is used, 
in the function rxe_init_ports, ndev is no longer used.

So this variable ndev should be removed.

diff --git a/drivers/infiniband/sw/rxe/rxe.c 
b/drivers/infiniband/sw/rxe/rxe.c
index b248c68bf9b1..c83e2cf82748 100644
--- a/drivers/infiniband/sw/rxe/rxe.c
+++ b/drivers/infiniband/sw/rxe/rxe.c
@@ -133,7 +133,7 @@ static void rxe_init_port_param(struct rxe_port *port)
  /* initialize port state, note IB convention that HCA ports are always
   * numbered from 1
   */
-static void rxe_init_ports(struct rxe_dev *rxe, struct net_device *ndev)
+static void rxe_init_ports(struct rxe_dev *rxe)
  {
         struct rxe_port *port = &rxe->port;

@@ -162,7 +162,7 @@ static void rxe_init(struct rxe_dev *rxe, struct 
net_device *ndev)
         /* init default device parameters */
         rxe_init_device_param(rxe, ndev);

-       rxe_init_ports(rxe, ndev);
+       rxe_init_ports(rxe);
         rxe_init_pools(rxe);

         /* init pending mmap list */

Thanks a lot.

Zhu Yanjun

On 06.03.25 11:24, Zhu Yanjun wrote:
> Hi, Stephen
>
> I am the author of the commit 8ce2eb9dfac8 ("RDMA/rxe: Fix the failure 
> of ibv_query_device() and ibv_query_device_ex() tests").
>
> My replies are inline. Thanks a lot.
>
> "
>
> diff --cc drivers/infiniband/sw/rxe/rxe.c
> index e27478fe9456,4e56a371deb5..000000000000
> --- a/drivers/infiniband/sw/rxe/rxe.c
> +++ b/drivers/infiniband/sw/rxe/rxe.c
> @@@ -72,10 -71,45 +69,39 @@@ static void rxe_init_device_param(struc
>       rxe->attr.max_pkeys            = RXE_MAX_PKEYS;
>       rxe->attr.local_ca_ack_delay        = RXE_LOCAL_CA_ACK_DELAY;
>
>  -    ndev = rxe_ib_device_get_netdev(&rxe->ib_dev);
>  -    if (!ndev)
>  -        return;
>  -
> +     if (ndev->addr_len) {
> +         memcpy(rxe->raw_gid, ndev->dev_addr,
> +             min_t(unsigned int, ndev->addr_len, ETH_ALEN));
> +     } else {
> +         /*
> +          * This device does not have a HW address, but
> +          * connection mangagement requires a unique gid.
> +          */
> +         eth_random_addr(rxe->raw_gid);
> +     }
> +
>       addrconf_addr_eui48((unsigned char *)&rxe->attr.sys_image_guid,
> -             ndev->dev_addr);
> +             rxe->raw_gid);
>
>  -    dev_put(ndev);
>  -
>
>
> ------The above snippet is fine with me.
>
>
>       rxe->max_ucontext            = RXE_MAX_UCONTEXT;
> +
> +     if (IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING)) {
> +         rxe->attr.kernel_cap_flags |= IBK_ON_DEMAND_PAGING;
> +
> +         /* IB_ODP_SUPPORT_IMPLICIT is not supported right now. */
> +         rxe->attr.odp_caps.general_caps |= IB_ODP_SUPPORT;
> +
> +         rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |= 
> IB_ODP_SUPPORT_SEND;
> +         rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |= 
> IB_ODP_SUPPORT_RECV;
> +         rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |= 
> IB_ODP_SUPPORT_SRQ_RECV;
> +
> +         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
> IB_ODP_SUPPORT_SEND;
> +         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
> IB_ODP_SUPPORT_RECV;
> +         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
> IB_ODP_SUPPORT_WRITE;
> +         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
> IB_ODP_SUPPORT_READ;
> +         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
> IB_ODP_SUPPORT_ATOMIC;
> +         rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |= 
> IB_ODP_SUPPORT_SRQ_RECV;
> +     }
>   }
>
>
>
> ---------The above snippet is from on_demand paging commits. I do not 
> why it is involved in this commit.
>
> ---------It should appear in on_demand_paging patchset.
>
>
>   /* initialize port attributes */
> @@@ -107,13 -141,18 +133,13 @@@ static void rxe_init_port_param(struct
>   /* initialize port state, note IB convention that HCA ports are always
>    * numbered from 1
>    */
>  -static void rxe_init_ports(struct rxe_dev *rxe)
>  +static void rxe_init_ports(struct rxe_dev *rxe, struct net_device 
> *ndev)
>
>
> ----------In this snippet, the variable "struct net_device *ndev" is 
> not used in the function rxe_init_ports, it should be removed.
>
> ----------Thanks a lot.
>
> Zhu Yanjun
>
>
>   {
>       struct rxe_port *port = &rxe->port;
>  -    struct net_device *ndev;
>
>       rxe_init_port_param(port);
>  -    ndev = rxe_ib_device_get_netdev(&rxe->ib_dev);
>  -    if (!ndev)
>  -        return;
>       addrconf_addr_eui48((unsigned char *)&port->port_guid,
> -                 ndev->dev_addr);
> +                 rxe->raw_gid);
>  -    dev_put(ndev);
>       spin_lock_init(&port->port_lock);
>   }
>
> "
>
> On 06.03.25 02:37, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the rdma tree got a conflict in:
>>
>>    drivers/infiniband/sw/rxe/rxe.c
>>
>> between commit:
>>
>>    8ce2eb9dfac8 ("RDMA/rxe: Fix the failure of ibv_query_device() and 
>> ibv_query_device_ex() tests")
>>
>> from the rdma-fixes tree and commit:
>>
>>    d34d0bdb500e ("RDMA/rxe: Replace netdev dev addr with raw_gid")
>>
>> from the rdma tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
-- 
Best Regards,
Yanjun.Zhu


