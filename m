Return-Path: <linux-next+bounces-5494-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC93A3B0DF
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 06:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1376A3AAF38
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 05:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83FF1ADC90;
	Wed, 19 Feb 2025 05:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FXedfW88"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FFC4594A;
	Wed, 19 Feb 2025 05:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739942645; cv=none; b=BghrMU/B9jevrGPvqwcYPyxco8P20XFm4cnscmmH0G5fmZAbd4M7mj+pQUwOcgbPGqQTVgziGgI+qlaveH22io9BV4oQmKe3q6nCrdFpfW/mXXSOqx47DjTpMmqW7heDBO/LEtSjb05YkaenAuz6C7KpM699NH5NsKRfZbcTyPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739942645; c=relaxed/simple;
	bh=8dXS/ID3Ln7n07ZCb8L20suW6kqS6u1SNP4uNJ47AII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skZIaVCx9mI+eWK8R3UbMGxlUqhwUYQNlAMYNMyu/xdETlpGkDXAsCdQTox0VAdUEZAWZVphCMs1YzDPbhT/NqiZlWLcTGw5GuRUBRscuLKv7W40phCPzjynTvVOrktkxS6c9MnLUPq6nRzl1Hmc7/A7HVJgFSAm1DhRh2/OwOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FXedfW88; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J20dwm029252;
	Wed, 19 Feb 2025 05:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kk7+QV
	Ej19NZp6WkIhyvV8dyYoqmsPfwZQd5jboUv10=; b=FXedfW88sgZ16A+UOXtxN6
	z0kEbh60ly20s8kEPj9Sr54Un/95N27kHFrZvNfGCqIen5bYBm5pdWOsPx96cw+U
	MRIRWxq277azCge6C8QR7367CeykjHLt8IU2G4V8B5FdfdZBQ0BMF3lHhfYRqqUy
	qeMC7Au/cupAmTOq3AqoLB+jGrwBVX25g2xjUnLXfT+jXZAO+zvnqqrmHsCKQzD4
	bmdsy+ZLm8JYYQkAO+flFbRnC1ey0BNfrS9fbXX/hUAtInl8ugcaliSluaQUktr+
	3Aab8CCwNEHjmU9X0Yl3p2tGxOd26wUnPnzTciNaylMlznsL/YS8HY/ni2ti70yQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w6508kw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 05:23:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51J2obEO005776;
	Wed, 19 Feb 2025 05:23:45 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44w02xaag0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 05:23:45 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51J5NibM28181060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 05:23:44 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F9AC58052;
	Wed, 19 Feb 2025 05:23:44 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB4B15805A;
	Wed, 19 Feb 2025 05:23:39 +0000 (GMT)
Received: from [9.43.108.86] (unknown [9.43.108.86])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Feb 2025 05:23:39 +0000 (GMT)
Message-ID: <6d17f7d6-a508-4e81-bfaa-c8cf45a71a3e@linux.ibm.com>
Date: Wed, 19 Feb 2025 10:53:36 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the powerpc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>, martin.petersen@oracle.com
Cc: Andrew Donnellan <ajd@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250219154649.49986660@canb.auug.org.au>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250219154649.49986660@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5_8__2iVXqbKYg8q0frquZGcAvjmXywZ
X-Proofpoint-GUID: 5_8__2iVXqbKYg8q0frquZGcAvjmXywZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=942 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1011 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190036



On 2/19/25 10:16 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> WARNING: Documentation/ABI/testing/sysfs-class-cxl not found
> 
> Introduced by commit
> 
>   5731d41af924 ("cxl: Deprecate driver")
> 
> The reference is from Documentation/arch/powerpc/cxl.rst
> 
> I don't know why this has appeared just now.

Ok IIUC, 

There is a 2 patch series to remove the cxl and cxlflash driver

https://lore.kernel.org/lkml/20250203072801.365551-1-ajd@linux.ibm.com/T/

Now Martin has already applied first patch (cxlflasg driver removal) in 
his staging tree

https://lore.kernel.org/lkml/20250203072801.365551-1-ajd@linux.ibm.com/T/#r8d7bb4c05256551cdcd6b7b563a8255409b07d70

Now, I was looking at applying the second patch in my tree,
But it is not apply cleanly and has dependency.

So Martin, I can send my Acked-by for the second patch, 
can you take the second patch also via your tree?
which will resolve the issue here 

Maddy
> 


