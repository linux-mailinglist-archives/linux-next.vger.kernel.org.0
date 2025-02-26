Return-Path: <linux-next+bounces-5572-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F04A45337
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 03:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C018217C8F7
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 02:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A743C21C9F2;
	Wed, 26 Feb 2025 02:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bup8C7U4"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F4AEAFA;
	Wed, 26 Feb 2025 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740537744; cv=none; b=olHvuPteyF6r5Gzm5nJtYo8Vxyhs4gzJ1qELAmMMe5NoS4k+lks0TOwabYO6jMjD64xj7P+uVw5WUkIE9Co8mz8np+s3WM5AY2YSBwYSxj40g1bzzFcH/tmMCpAm0d2UDSo2nDVhms/BXcQXWqX68b/DmgvspfL48yQo13o9Fes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740537744; c=relaxed/simple;
	bh=cA1AK7IWbqLpHMDJ8Fzst2Pc5MoIWfCgadowEgtBDec=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QtdVR00Y5XMxpp2fpwjmJjMkvQgkXbFzVuGQ3KNf7RbFq4CiJa3IJ3ngRl7QwgDwgZpQxhjE9lCZTwaMGAtvgPrRcT7FRIY5xX7X9KVSPvMyAl5xZsmwUvk3tcL9T9viWGmC8XzgPd2JnWtYcvZHhLxaomJL7IKxtcvEPsLwwwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bup8C7U4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMXGwA017829;
	Wed, 26 Feb 2025 02:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6KUdVZJ5RjL/QrmdW7sbJiVGOvh5SK6EesNMI5yXR8=; b=bup8C7U4UXzMQSW+
	TNZ10izKgaQ5+X+8JjIXs6lhFxoIJmqqo6OUsj23uGMOGy6dFdItgqw8zBayGdBT
	3vXuZEgiGgcrZUZlnqV47OAo2rzpBmzfTEfKmWOVGAxvP8QO82WZMRxhPyVp1/7e
	en5+CXZI2aDQEwuT9LAh7xBAGPXs0UH2/ZGZDxlHP73limrdbgxSR89HcalqHtFS
	OngvTk7WGrIKS0ZmOynJnjTKM+ZaCfyaJugNdndgEn7mD3iV2ZeUNk3uk3iNFs47
	UyfOrTmguHgauOnV/DuJITkOQHMvGcLrqK+npWaaPG9qMrY/p3uo49naomugTFpf
	DS8YVw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn0fcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 02:41:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q2fwCX032016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 02:41:59 GMT
Received: from [10.133.33.36] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 18:41:57 -0800
Message-ID: <09ef2b10-106a-43d4-9ab6-9c5039c0ded5@quicinc.com>
Date: Wed, 26 Feb 2025 10:41:55 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the devicetree tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robh@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next
 Mailing List <linux-next@vger.kernel.org>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
	<thomas.weissschuh@linutronix.de>
References: <20250226130718.0a652b44@canb.auug.org.au>
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <20250226130718.0a652b44@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: du4xG6vHm99mL6F_nslcD_oQ1MjxyWmS
X-Proofpoint-GUID: du4xG6vHm99mL6F_nslcD_oQ1MjxyWmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260019

On 2/26/2025 10:07 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the devicetree tree got a conflict in:
> 
>   drivers/of/of_private.h
> 
> between commit:
> 
>   e6649328dc07 ("of: address: Add kunit test for __of_address_resource_bounds()")
> 
> from Linus' tree and commit:
> 
>   f443029c9a6e ("of: Introduce and apply private is_pseudo_property()")
> 
> from the devicetree tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

thank you @Stephen, LGTM for the fix.

