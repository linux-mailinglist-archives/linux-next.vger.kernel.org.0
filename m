Return-Path: <linux-next+bounces-6171-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2204A7DA2D
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 11:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6D1B188B683
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 09:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDA1225412;
	Mon,  7 Apr 2025 09:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="szBIIE2v"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ED7188734;
	Mon,  7 Apr 2025 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019241; cv=none; b=qEn1EEqGII+5bZum7WRmUwmMz7KzAiKkLy0rHRIyLMgspgxAXtn9P3nhB5cVgw5xCtwbNKXze3xK/za6dZKgnFEVyOrGzNMuhUe1CUFzEhZ7QlG0WxvjZPxRC3hUNhRdioQg3PRXtKtuV54B0h0tRIRCKcNO2NrzQMOIOS2iXwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019241; c=relaxed/simple;
	bh=vf6M3lg33KLJ/vprW0PAOSoPqYB41I383pWT+BQvwVk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ntap22+jojRsxP6aPw2qDDsrwI2z88tUdJi279685hbOJB5Auxi00GjnG8+8YyALhVM5fk2aOryWn+dVyCE1VNxyc4paLiD9fTCjFWAi2i9Tx9eZWZJk3NaquDBxcsT4iVKEPBqK0uVb3OdsiF/LdpZ/aVmHS4lOn1rtq6Nz/mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=szBIIE2v; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5379WFL0024219;
	Mon, 7 Apr 2025 09:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vf6M3l
	g33KLJ/vprW0PAOSoPqYB41I383pWT+BQvwVk=; b=szBIIE2vvGy2B1b07fixvO
	dXiMPAqi3j13fYMB9Loaf9tDoKJcqWHXMuo1m8BYESqQ6DrhJvR/vQGYRqi/foyL
	61OiKp86oWBWmUKzh0olA8XBw9IVarku3c9TZQ94cI9RF8r3Zz/aJvxX+pF8Usxh
	emI/0U7/VxOhzuJ9/Oszc7qZm2nauFvncDcU/yY13h6vqcIzYbXp3Bfy/xlIDSdT
	aeNdIDmV2t8T4yDr2L26PkFkk0QDRtoR3zaILkm20WUFecXtUlbkWmxPnxBqZNET
	s/MrPXkD4EaZgquQqLPr/7ktYzOh12O0SQm0lISdIoxFALRDUvsAb/SYHuq0E0mQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45v0spjj71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 09:47:07 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53796KU9024583;
	Mon, 7 Apr 2025 09:47:06 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45ueut5d70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 09:47:06 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5379l5sU30081678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 09:47:06 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD62658056;
	Mon,  7 Apr 2025 09:47:05 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60DFC5805D;
	Mon,  7 Apr 2025 09:47:03 +0000 (GMT)
Received: from [9.61.255.9] (unknown [9.61.255.9])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Apr 2025 09:47:03 +0000 (GMT)
Message-ID: <e5df899e-4edf-41cc-8611-720a67b0a584@linux.ibm.com>
Date: Mon, 7 Apr 2025 15:17:01 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of Linus' tree
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: peterz@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        mathieu.desnoyers@efficios.com, rdunlap@infradead.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <9B0D38E4-3414-43B9-8F41-D552755DC81E@linux.ibm.com>
Content-Language: en-GB
In-Reply-To: <9B0D38E4-3414-43B9-8F41-D552755DC81E@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vI9fyKVr5Wi6k2UXEX-HiTBhTSpYk9Fp
X-Proofpoint-ORIG-GUID: vI9fyKVr5Wi6k2UXEX-HiTBhTSpYk9Fp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=686
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070067

I think I have messed up. Please ignore below mail.

On 07/04/25 2:29 pm, Venkat wrote:
> On IBM Power9 only below warning is observed.
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
>
> I have tested the patch and the above reported warning is fixed. Please add below tag.
>
>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>
> Regards,
> Venkat.
>
>
>

