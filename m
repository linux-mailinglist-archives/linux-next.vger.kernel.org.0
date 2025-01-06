Return-Path: <linux-next+bounces-5058-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADF0A027A6
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 15:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C267F3A1101
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 14:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA491DD9A6;
	Mon,  6 Jan 2025 14:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TcvW4mlv"
X-Original-To: linux-next@vger.kernel.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2541DE3AE
	for <linux-next@vger.kernel.org>; Mon,  6 Jan 2025 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173024; cv=none; b=OD0ZJ5rrl5T2NByVdurzvNfDfA0wfwIp0nwcG1iRRZm4iuwK0A0oGvrYUpEha0byGQR7faCfJthK81xSuqEw0J8DxB/Lp9xJBcq5QfXB7TRGV5h46FSerLV6wU51MfCcyJ4WNjqVTrHxOEDlp16zzvKnCCkEyCmJED189+OvUyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173024; c=relaxed/simple;
	bh=dFuR3HZGxCWY6lEf19CDHzAnQ7NkZXjvltfKoUuVloM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTFKGFcpjN91ZkXaCEgguhZ+umbDwAbs5kpnnwOGk7b9iZeij3RUHk3Gkya+g2DevvVxA+HEYB9Pb1vZ44/ihFvKH2niRcyP7UUviAPD7dpTp9YGXTBqTiRCy33Gc77jWqklJt2hHZl5jcDWxZIJPhKhAiqIRvRaNnRYW1tIfKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TcvW4mlv; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <c2e792ef-054e-4dfd-a966-f975d3b92ab6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736173012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhPIrUoGX5RBPxqj+Ed4GghX0VGtSzAu7R2R+Z1yQq0=;
	b=TcvW4mlv0VkXvzalAUmMhJiD+2UPipuor51U5cLs9TeZm/HH34Q41kInT7ULMc+fEP60nK
	QTwU8GXrlxoVTzLqJZ8kXT4btl4CqwqavolEANFgP95WFcY/Cbk105CepZrROYwavsVAKp
	rjEnqDciLQP1r6mDHg87IWmbuuMjNI0=
Date: Mon, 6 Jan 2025 15:16:50 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Junxian Huang <huangjunxian6@hisilicon.com>,
 Leon Romanovsky <leon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Yuyu Li <liyuyu6@huawei.com>
References: <20250106105106.3d94b0c3@canb.auug.org.au>
 <20250106120252.000a2afa@canb.auug.org.au>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20250106120252.000a2afa@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 06.01.25 02:02, Stephen Rothwell wrote:
> Hi all,
>
> On Mon, 6 Jan 2025 10:51:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Today's linux-next merge of the rdma tree got a conflict in:
>>
>>    drivers/infiniband/sw/rxe/rxe_net.c
>>
>> between commit:
>>
>>    2ac5415022d1 ("RDMA/rxe: Remove the direct link to net_device")
>>
>> from Linus' tree and commit:
>>
>>    958152336cfa ("RDMA/rxe: Remove deliver net device event")
>>
>> from the rdma tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc drivers/infiniband/sw/rxe/rxe_net.c
>> index 8cc64ceeb356,d400aaab0e70..000000000000
>> --- a/drivers/infiniband/sw/rxe/rxe_net.c
>> +++ b/drivers/infiniband/sw/rxe/rxe_net.c
>> @@@ -595,13 -577,7 +585,13 @@@ void rxe_port_down(struct rxe_dev *rxe
>>    
>>    void rxe_set_port_state(struct rxe_dev *rxe)
>>    {
>>   -	if (ib_get_curr_port_state(rxe->ndev) == IB_PORT_ACTIVE)
>>   +	struct net_device *ndev;
>>   +
>>   +	ndev = rxe_ib_device_get_netdev(&rxe->ib_dev);
>>   +	if (!ndev)
>>   +		return;
>>   +
>> - 	if (netif_running(ndev) && netif_carrier_ok(ndev))
>> ++	if (ib_get_curr_port_state(ndev) == IB_PORT_ACTIVE)
>>    		rxe_port_up(rxe);
>>    	else
>>    		rxe_port_down(rxe);
> It also needed the following merge fix patch:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 6 Jan 2025 11:36:03 +1100
> Subject: [PATCH] fix up for "RDMA/rxe: Remove deliver net device event"
>
> interacting with "RDMA/rxe: Remove the direct link to net_device"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   drivers/infiniband/sw/rxe/rxe_verbs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.c b/drivers/infiniband/sw/rxe/rxe_verbs.c
> index 47d57046fad4..6152a0fdfc8c 100644
> --- a/drivers/infiniband/sw/rxe/rxe_verbs.c
> +++ b/drivers/infiniband/sw/rxe/rxe_verbs.c
> @@ -62,7 +62,7 @@ static int rxe_query_port(struct ib_device *ibdev,
>   	ret = ib_get_eth_speed(ibdev, port_num, &attr->active_speed,
>   			       &attr->active_width);
>   
> -	attr->state = ib_get_curr_port_state(rxe->ndev);
> +	attr->state = ib_get_curr_port_state(ndev);
>   	if (attr->state == IB_PORT_ACTIVE)
>   		attr->phys_state = IB_PORT_PHYS_STATE_LINK_UP;
>   	else if (dev_get_flags(ndev) & IFF_UP)

To the above 2 changes, I am fine with them. The changes are from the 
following commit.

When I worked on the commit 2ac5415022d1 ("RDMA/rxe: Remove the direct 
link to net_device"),

the commit 958152336cfa ("RDMA/rxe: Remove deliver net device event") is 
not merged into linux upstream.

commit 958152336cfafdec1f42d3d44253805282dc1321
Author: Yuyu Li <liyuyu6@huawei.com>
Date:   Fri Nov 22 18:53:02 2024 +0800

     RDMA/rxe: Remove deliver net device event

     Since the netdev events of link status is now handled in ib_core,
     remove the related code in drivers.

     In addition, remove the setting of port->attr.state in rxe_port_up()
     and rxe_port_down(), as it is only used in rxe_query_port(), and it
     can be replaced by ib_get_curr_port_state().

     Signed-off-by: Yuyu Li <liyuyu6@huawei.com>
     Signed-off-by: Junxian Huang <huangjunxian6@hisilicon.com>
     Signed-off-by: Leon Romanovsky <leon@kernel.org>

Thanks a lot.

Zhu Yanjun

-- 
Best Regards,
Yanjun.Zhu


