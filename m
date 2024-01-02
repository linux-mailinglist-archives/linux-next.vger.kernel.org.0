Return-Path: <linux-next+bounces-579-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2DB821EA8
	for <lists+linux-next@lfdr.de>; Tue,  2 Jan 2024 16:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C89C4283B7F
	for <lists+linux-next@lfdr.de>; Tue,  2 Jan 2024 15:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BD81400D;
	Tue,  2 Jan 2024 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JWvtEVP8"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E361214A9A;
	Tue,  2 Jan 2024 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 402FOd2W026524;
	Tue, 2 Jan 2024 15:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=znCV/hOQIXm2Tq1dKd06kIRkS9zB+gSlfWugTnieSPM=; b=JW
	vtEVP8UpS4r2RkaQXaDE8WpDkKq0RwSk7XI7zI9ibQh0UL8NJ1t9EKJM5rmhlGMt
	OVw1lLRSKk7sHDDbhMgikWJb9GuiF4xOhpP/py0RsYc32d0Rc0/1XbTDU7aE27dk
	Ryk7GfAtmu6mLlteKE8tP+PBS/sntlwnvu8lwIJmsZTCB1PUKourI31jkDBF1ME4
	SS53N1+xTTB9XeWsAPNhDZ4XZLLq88hpHiVWK4cpwL7K+7jyOTH86cPyKEA011Ts
	KLyjLcnZgrFY6ttfNqssTqyWn1rn/+zaYQTX92qLDPvoLOAOLgJWDPU3jmHFQujC
	IcqqPZddmuLyyg0xMshA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vcg418k1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 15:24:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 402FOclH002978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jan 2024 15:24:38 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 2 Jan
 2024 07:24:37 -0800
Message-ID: <bd7ef073-99c3-5d38-ca5b-236ac0415fe3@quicinc.com>
Date: Tue, 2 Jan 2024 08:24:36 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: linux-next: manual merge of the drm tree with the mm tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
CC: DRI <dri-devel@lists.freedesktop.org>,
        "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
	<linux-next@vger.kernel.org>
References: <20240102105223.7634699d@canb.auug.org.au>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240102105223.7634699d@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HG0nRJiN0Ssj6wclFH0SkvqQ7EE_1HUa
X-Proofpoint-ORIG-GUID: HG0nRJiN0Ssj6wclFH0SkvqQ7EE_1HUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020118

On 1/1/2024 4:52 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drm tree got a conflict in:
> 
>    drivers/accel/qaic/qaic_data.c
> 
> between commit:
> 
>    78f5d33f3dd4 ("mm, treewide: rename MAX_ORDER to MAX_PAGE_ORDER")
> 
> from the mm tree and commit:
> 
>    47fbee5f27ed ("accel/qaic: Update MAX_ORDER use to be inclusive")
> 
> from the drm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks Stephen.  Your fixup is correct.

-Jeff

