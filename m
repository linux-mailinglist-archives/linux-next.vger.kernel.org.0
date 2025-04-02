Return-Path: <linux-next+bounces-6144-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D3CA79021
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 15:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AC801894948
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 13:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E849201271;
	Wed,  2 Apr 2025 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Yxv6+DLz"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DC41DA5F;
	Wed,  2 Apr 2025 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601398; cv=none; b=pudt7D85Pl5Lli55qGWKQC4qUxTZCyRx1NMnqFa4kbJGgDLH+UVUr8Y6MYJXOZz4CWHDkIrv0lp95ZoT5y77HQhB4XVE9b2ge4ZmenE7jk0TPP0bUjZZEGIeuxb/89ZwnVQqEQulS/kJiLw6d4rdvdgIun19WwQ2j07H4hi38MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601398; c=relaxed/simple;
	bh=Tdt83M3brKmyt7PlTp3VngVmmy24EXxSH2mKPAcE7rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqdKmaKQJd0wFWNS17P70/K0pvqb7ry8qoTe+E4uwzxRkMlvKciVnCiuKqE1uJjCf8OHcDSRWR35JHDQNB5Nne8bKNeyc+aoE58+3Xt8BOIRamRnarknaPlmu/tIB7qXKs7NhH5GStqff/DKmPmSeAKz6uWbFJ8MRwJvZGWGD9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Yxv6+DLz; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532A3dWW029551;
	Wed, 2 Apr 2025 13:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NGqrtN
	G4PaixOSZS7kJ0sXu+eeh4MJzh4nHiIRA4mEI=; b=Yxv6+DLz4OO5bCqkOCVp7A
	U4Hx3XzZnI2z6y+xsyCcH9i6EPr8kRc12z4FwMdYsRJLWy6cfTuzapYvLN8tUmiu
	+kPAFkKQDfzMnfmWkmfK31aSWUtqHvfp7hJG1aNWlT/lsgQIqpTj38nFpSU4v/tv
	UoS+qgpRXNDxMy2LlznQKRUwxlVK1gLm89/QZncoTMPTHNGT8RlOz1zsmUA0LJ0w
	S9UwbI90ne53qxitkmITM1lKhesTRAnrLxFBQKVFwMuL+9zrxS1Rl7v/8iB2OcKg
	uqLfRQcg6Qv8gNgcFvJ6QYMI8wng3ndWerxFQHQ/8GxLPkLZOC4KPHGodLAJaFPg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45rmax5k66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 13:42:53 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 532Bwn1a004788;
	Wed, 2 Apr 2025 13:42:52 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45puk009ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 13:42:52 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 532DgqQx26018432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 13:42:52 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ECCF58056;
	Wed,  2 Apr 2025 13:42:52 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16EBA58052;
	Wed,  2 Apr 2025 13:42:48 +0000 (GMT)
Received: from [9.61.254.101] (unknown [9.61.254.101])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Apr 2025 13:42:47 +0000 (GMT)
Message-ID: <b41d0438-9940-43c8-8ed8-8f105909a8d3@linux.ibm.com>
Date: Wed, 2 Apr 2025 19:12:46 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: paulmck@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Jiang <dave.jiang@intel.com>,
        Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org,
        dave@stgolabs.net, jonathan.cameron@huawei.com,
        alison.schofield@intel.com, vishal.l.verma@intel.com,
        ira.weiny@intel.com, gourry@gourry.net, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
 <20250331171755.GC289482@nvidia.com>
 <67eaf14b7c611_201f0294ba@dwillia2-xfh.jf.intel.com.notmuch>
 <4641ce2f-74eb-45ea-a2f8-c7d0db905b7a@linux.ibm.com>
 <79a032b5-b13d-43fd-b56e-01098122e104@intel.com>
 <66ae49a8-d7f9-4fd9-b94e-9be26fd9aea4@paulmck-laptop>
 <e9c57344-43f3-4f90-9894-eb4f5a1b22f2@intel.com>
 <20250402114722.35cbd9d5@canb.auug.org.au>
 <478264e8-af94-462b-929f-f7afdf8466bd@paulmck-laptop>
 <ce38cbe3-429d-466b-bc8c-7dbb7c596ab9@linux.ibm.com>
 <20250402114412.GA342109@nvidia.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250402114412.GA342109@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x9wctKrpfhBDnvnStiUCmQBotDyt_QoC
X-Proofpoint-ORIG-GUID: x9wctKrpfhBDnvnStiUCmQBotDyt_QoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504020085


On 02/04/25 5:14 pm, Jason Gunthorpe wrote:
> On Wed, Apr 02, 2025 at 11:57:04AM +0530, Venkat Rao Bagalkote wrote:
>>> So the various kernel-build howtos will be updated?  Or is a patch
>>> forthcoming?
> I was going to pick up Dan's patch after the merge window closes


I have tested the proposed patch by applying on top of main line kernel, 
and kernel builds with out any issue.

Note: Tested this patch by uninstalling uuid-devel package.

Commit Head on which this patch was 
applied:acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1

In case if you decided to merge this patch, please add below tags.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

>
>> FYI, now the issue is on the main line kernel also.
> I thought the header test stuff was disabled now?? How are people
> hitting this?


On main line, I started seeing this issue with below head commit.

Commit ID: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516


Regards,

Venkat.

>
> Jason
>

