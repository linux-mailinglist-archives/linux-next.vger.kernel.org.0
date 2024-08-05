Return-Path: <linux-next+bounces-3232-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05733947571
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 08:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 891D7B21424
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 06:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D4814386C;
	Mon,  5 Aug 2024 06:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QIeuNY1c"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444C31422D8;
	Mon,  5 Aug 2024 06:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722840038; cv=none; b=mFW6Usd2fMr1SBFZbQodeWnXdI3JQ2U8DJu/pUi6zSBSoH7oCpCkN6Weg92zWutStNiAz6l/C6dalI1+S4Dbzt45xb74jCCbEASvzRvQP4kwyZ6bGTxjKLrgwLyFF+8XCj4slxXpjB67tNtUaawGrbxpWD0wItNAEbIUQNQh/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722840038; c=relaxed/simple;
	bh=aJRfhiIbWQVLXrwG9zNRILhbCXs+DmTaWi88lr6wAaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gNcGCgd0U6P3mGunYVwPkEpU6qhsoIyhWIZb7vABxQ/os+CabIPlc4ixDJrYgO3Y35vTGpcfCtxn6Wu8II1kcDNukkUFa7lHIMNbRohKpVh0qGPG17c5SWcYTjyOPs0f0fegiJx/u3uWERiRNc55PoA3XEZ5ksO8e5z1sILK3lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QIeuNY1c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4752VZL1011262;
	Mon, 5 Aug 2024 06:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymwEHek5Tsow+Rz0WJFFuCl9y9sAycjEONo9X1O1m9I=; b=QIeuNY1ccjxEwX0+
	urHhVy0ZVEE8LC2BMmEqfTlru/ODir5CxUCrlfBUVIU+EZ5Q+zBEEHCldvULrIp+
	8h3Ox+NVKDtrvy4CrFUeLQWcI2FgV72FS+zESABMS0XXMz0LxlI2pQ+8h7GvLW4z
	IrP8j+T/7asRhVTeWcEkqIKZG+O+mqkZA/xzdbkUdg0tSbOaohtG9SwRry+KQ6Ip
	JTdfIfJ+RMokBeP0EWQ5bNrM8tlYY2samGjRUEU4YBMGGn7NRksirI4h+ImCa/AO
	POX+rFnZTNWo9Sqs08DC5ofAavfGmKfeVygG9hy0hiAAN4jk5UPd/kmc0uPtcdvQ
	2RLsAA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbj6k4vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 06:40:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4756eR4X024487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Aug 2024 06:40:27 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 4 Aug 2024
 23:40:25 -0700
Message-ID: <1d71f3b2-5964-fc31-3ca8-686b37dfc622@quicinc.com>
Date: Mon, 5 Aug 2024 12:09:45 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: linux-next: build failure after merge of the qcom tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Gross <agross@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
	<linux-next@vger.kernel.org>
References: <20240802094820.29059653@canb.auug.org.au>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <20240802094820.29059653@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qR__dKNfst1LkxCZyW4hMxUK4iRNsOBo
X-Proofpoint-GUID: qR__dKNfst1LkxCZyW4hMxUK4iRNsOBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-04_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 mlxlogscore=814 clxscore=1011 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408050046

Hi Stephen, Bjorn,


Apologies for the error, I have posted a patch [1] to fix it.

[1] 
https://lore.kernel.org/linux-arm-msm/20240805063049.446091-1-quic_skakitap@quicinc.com/


Thanks,

Satya Priya

On 8/2/2024 5:18 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the qcom tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/clk/qcom/camcc-sm8150.c: In function 'cam_cc_sm8150_probe':
> drivers/clk/qcom/camcc-sm8150.c:2141:36: error: passing argument 1 of 'qcom_cc_really_probe' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   2141 |         ret = qcom_cc_really_probe(pdev, &cam_cc_sm8150_desc, regmap);
>        |                                    ^~~~
>        |                                    |
>        |                                    struct platform_device *
> In file included from drivers/clk/qcom/camcc-sm8150.c:21:
> drivers/clk/qcom/common.h:72:48: note: expected 'struct device *' but argument is of type 'struct platform_device *'
>     72 | extern int qcom_cc_really_probe(struct device *dev,
>        |                                 ~~~~~~~~~~~~~~~^~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>    ea73b7aceff6 ("clk: qcom: Add camera clock controller driver for SM8150")
>
> I have used the qcom tree from next-20240801 for today.
>

