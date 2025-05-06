Return-Path: <linux-next+bounces-6539-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3FAABBE9
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 09:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 423363B361A
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 07:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954932222B2;
	Tue,  6 May 2025 06:04:43 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644A3215F56
	for <linux-next@vger.kernel.org>; Tue,  6 May 2025 06:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746511483; cv=none; b=owS1abTxc+AmsznG029d4vpoHAYvAVg+sM5ZmrRK2Nvd9ZASPymK8HWsOEaMgh8kEktG853nCWeMGa70Z9Y3UgkYqOUSf5xo7LAj4BknB5G2+Gh4JLhHAMjjrbSoESHfuWE/8p/d2MzlNFzYwimx5WyziE+TnkGeF56L1KZ6wow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746511483; c=relaxed/simple;
	bh=qqKps+n0LRRLxShYnCmSmbPZWcxbol6xXJh54a3P+v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mb3f9zNoYJfDAaRTRy3fWGJvZAAbckDYIldKD7LOPPAZs9o9n72D7k23Rrn0ghahagH8/eI3+r3dIN/XxgC6uZpjFmm20xB7kBJOrHPx1FrnVzK19zsQxjPkUqMMN5lzqT0GWEd9xHjMLLivGu5PBHDJ/Ile/eUleANXdgWB0x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Zs7BV1zt4zsTHy;
	Tue,  6 May 2025 14:04:02 +0800 (CST)
Received: from kwepemf100018.china.huawei.com (unknown [7.202.181.17])
	by mail.maildlp.com (Postfix) with ESMTPS id E00A8140257;
	Tue,  6 May 2025 14:04:35 +0800 (CST)
Received: from [10.67.120.168] (10.67.120.168) by
 kwepemf100018.china.huawei.com (7.202.181.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 6 May 2025 14:04:35 +0800
Message-ID: <ac171cd6-82a8-e3b6-addc-c1c515470c9f@hisilicon.com>
Date: Tue, 6 May 2025 14:04:34 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [BUG] allmodconfig build failure in hns_roce_trace.h
Content-Language: en-US
To: <paulmck@kernel.org>, Leon Romanovsky <leon@kernel.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>
References: <0ea657ca-71cb-498d-a5d5-43300f30523d@paulmck-laptop>
From: Junxian Huang <huangjunxian6@hisilicon.com>
In-Reply-To: <0ea657ca-71cb-498d-a5d5-43300f30523d@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100018.china.huawei.com (7.202.181.17)



On 2025/5/6 5:50, Paul E. McKenney wrote:
> Hello!
> 
> I ran into an allmodconfig build error in next-20250505 and a few of
> its predecessors on x86.  The patch shown below makes it build without
> errors, and might even be a proper patch.
> 
> An alternative fix might be to use the "-I" compiler command-line argument
> to inform it of this additional place to look for include files.
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> hns: Fix hns_roce_trace.h allmodconfig build failure
> 
> When doing an allmodconfig build next-20250505 and a few of its predecessors on x86, I
> get the following build error:
> 
> In file included from drivers/infiniband/hw/hns/hns_roce_trace.h:213,
>                  from drivers/infiniband/hw/hns/hns_roce_hw_v2.c:53:
> ./include/trace/define_trace.h:110:42: fatal error: ./hns_roce_trace.h: No such file or directory
>   110 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
>       |                                          ^
> compilation terminated.
> 
> This appears to have been introduced by this commit:
> 
> 02007e3ddc07 ("RDMA/hns: Add trace for flush CQE")
> 
> Fix (or at least suppress) this by adding the path needed to find the
> include file.
> 
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> ---
> 
> diff --git a/drivers/infiniband/hw/hns/hns_roce_trace.h b/drivers/infiniband/hw/hns/hns_roce_trace.h
> index 23cbdbaeffaa4..bec69b6dca5da 100644
> --- a/drivers/infiniband/hw/hns/hns_roce_trace.h
> +++ b/drivers/infiniband/hw/hns/hns_roce_trace.h
> @@ -207,7 +207,7 @@ DEFINE_EVENT(cmdq, hns_cmdq_resp,
>  #endif /* __HNS_ROCE_TRACE_H */
>  
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_FILE hns_roce_trace
> +#define TRACE_INCLUDE_FILE ../../../drivers/infiniband/hw/hns/hns_roce_trace

Hi Paul, thanks for the report.

I'd prefer not to change this part as it is the standard definition of
trace headers. Can you please test the patch below?

Thanks,
Junxian

diff --git a/drivers/infiniband/hw/hns/Makefile b/drivers/infiniband/hw/hns/Makefile
index 7917af8e6380..baf592e6f21b 100644
--- a/drivers/infiniband/hw/hns/Makefile
+++ b/drivers/infiniband/hw/hns/Makefile
@@ -4,6 +4,7 @@
 #

 ccflags-y :=  -I $(srctree)/drivers/net/ethernet/hisilicon/hns3
+ccflags-y +=  -I $(src)

 hns-roce-hw-v2-objs := hns_roce_main.o hns_roce_cmd.o hns_roce_pd.o \
        hns_roce_ah.o hns_roce_hem.o hns_roce_mr.o hns_roce_qp.o \


>  #undef TRACE_INCLUDE_PATH
>  #define TRACE_INCLUDE_PATH .
>  #include <trace/define_trace.h>

