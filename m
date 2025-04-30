Return-Path: <linux-next+bounces-6455-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40635AA45F7
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 10:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 142249A6C23
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 08:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64ADA2AEE1;
	Wed, 30 Apr 2025 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oI+gajO/"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665E91E4110
	for <linux-next@vger.kernel.org>; Wed, 30 Apr 2025 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003136; cv=none; b=DIeZiy7ucBun8Vz+NyVNew8OADZ1+xKiSTM7sRRvQZP8vX0Ed4ITxbSnvGTpuKQxXl/XgImKfw/KIlMAGzA/7wm+3LX0wVLkKlqfO85mKDuPrh9x4H2tZ21i0N3bPggSSY7TUv/RwNCg4PBipyhz8IMtpeabMfrdEd+kN2bhyRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003136; c=relaxed/simple;
	bh=O6ERljeQyLZfoMU9ca1HROaPngLGqxlcZ/bj8TlLuFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=apx2Mi+3iXFbOzhBwCwn3YZvnFStq8f1YAra1f7aFLaEU7KJE7lNMJvQ5p8gClVSvEja5qT/BQJrkUnI2J2smKuFlrMzQWyH10SS+91IBjf/sU5xjLzbPNKCz2b7+VUnbAkvy4TD+01tjgPPZtLVf6kfsqm/9FFuaowIoigbEn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oI+gajO/; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLdPep005635;
	Wed, 30 Apr 2025 08:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2vUG+j
	OF/19Cna8icuQDDgfattdqcWsq0Wo0amIfiiI=; b=oI+gajO/XEMs/sQIU8vBX5
	qVwo5gTjh9vFocxvUgCmMcyUybmHsCeQifXWRoETAZVfBPvSTtywqiTBaSUWdq/0
	vPMPPW8R0G664eEIK+tVmx1yAMkTs3SYtNh65vhDzGb0CzTTPM1IomVBnwsMS9eD
	h6dPHsPzV1dICICRJpKYJNynoZRkrOx6yHZTTgpTz3GR5ttEg825AwxEwCzsGes0
	qk5T5/7Gqm94iQEtdw2JCrZ15SFprQRMB8E6A48nbONZlKfyq5aIluVt9cuMwALR
	IJd6VP8caUCYetuCn5RTtamauZfpiiXYVFxqyuhCHd1ugEtGShrD6wX34U2xah0w
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b6vb21up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 08:52:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53U75xDq000749;
	Wed, 30 Apr 2025 08:51:59 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469atpf4dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 08:51:59 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53U8ptrH27460148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 08:51:56 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B14605805C;
	Wed, 30 Apr 2025 08:51:55 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70D015805B;
	Wed, 30 Apr 2025 08:51:53 +0000 (GMT)
Received: from [9.61.255.15] (unknown [9.61.255.15])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Apr 2025 08:51:53 +0000 (GMT)
Message-ID: <0154e7ff-0749-4b58-9d14-461f202e11a2@linux.ibm.com>
Date: Wed, 30 Apr 2025 14:21:51 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Fix description format for powerpc RTAS
 ioctls
Content-Language: en-GB
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, sfr@canb.auug.org.au, tyreld@linux.ibm.com,
        linux-next@vger.kernel.org, hbabu@us.ibm.com
References: <20250430022847.1118093-1-haren@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250430022847.1118093-1-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=BISzrEQG c=1 sm=1 tr=0 ts=6811e4b1 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8 a=qZps65uiUj1HJl5wbdcA:9
 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: oWwvs6Zba69wHgrxeAQVH5Mew5RTf8Yw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA2MCBTYWx0ZWRfX0/eHGn8PGU0i ul9tagCPquMZ/cjMn4FQ9cRQq7SRzP929Zijel2AK5TSGzdnvdW0H7j7QZdSA1i369neKf74a0c QeeuHyxERlHMJ6BqCn4lsKYF+AuIqmGytrC5gM3cVe2aID1vIHzvYHrTapJ2ixsl4+0Zd6+S5dd
 JA0RXKlHj9kyG+U2sK3bIgqyJCMpbPREoNOxUwSuvVux7jH6JqN4/H0PNNFVA1vXjbnAzVP2Gd4 3X9nA3tSrxJPt/2TbD6+bSqsgxDYhjBZ3njDXlZB+84S5jOsV4W/ZDNWv/IuFxyVvrKdo/W3pxy SW4/VpBY5jbt5Y/GwMLmtqvA5pwSzQJ/7FnaXxY13ATU0l9WpZjT5Tyg7zly3dQzkZ0DNSt890Q
 bMolSSuXWChrG64zcWuve0pirrsjNM8XJke7i+XkKxw4dPi+bPbahBB64ixyrBlCSUs6z2F3
X-Proofpoint-ORIG-GUID: oWwvs6Zba69wHgrxeAQVH5Mew5RTf8Yw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300060


On 30/04/25 7:58 am, Haren Myneni wrote:
> Fix the description format for the following build warnings:
>
> "Documentation/userspace-api/ioctl/ioctl-number.rst:369:
> ERROR: Malformed table. Text in column margin in table line 301.
>
> 0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h
> powerpc/pseries indices API
>                              <mailto:linuxppc-dev>
> 0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h
> powerpc/pseries Platform Dump API
>                              <mailto:linuxppc-dev>
> 0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h
> powerpc/pseries Physical Attestation API
>                              <mailto:linuxppc-dev>"
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Fixes: 43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls")
> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
> Fixes: 86900ab620a4 ("powerpc/pseries: Add a char driver for physical-attestation RTAS")
> Closes: https://lore.kernel.org/linux-next/20250429181707.7848912b@canb.auug.org.au/
> ---
>   Documentation/userspace-api/ioctl/ioctl-number.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 017a23aeadc3..fee5c4731501 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -366,11 +366,11 @@ Code  Seq#    Include File                                           Comments
>                                                                        <mailto:linuxppc-dev>
>   0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            powerpc/pseries system parameter API
>                                                                        <mailto:linuxppc-dev>
> -0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             powerpc/pseries indices API
> +0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h            powerpc/pseries indices API
>                                                                        <mailto:linuxppc-dev>
> -0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       powerpc/pseries Platform Dump API
> +0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h      powerpc/pseries Platform Dump API
>                                                                        <mailto:linuxppc-dev>
> -0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerpc/pseries Physical Attestation API
> +0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h    powerpc/pseries Physical Attestation API
>                                                                        <mailto:linuxppc-dev>
>   0xB3  00     linux/mmc/ioctl.h
>   0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>


Tested this patch by applying on top of next-20250429 and it fixes the 
reported warning. Hence,


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


