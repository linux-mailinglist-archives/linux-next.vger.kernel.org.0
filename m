Return-Path: <linux-next+bounces-6142-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8A7A78815
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 08:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E78F18907F7
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 06:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B17233140;
	Wed,  2 Apr 2025 06:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gMwE1mUY"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC11723312D;
	Wed,  2 Apr 2025 06:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743575250; cv=none; b=gISbtSVsE5G2/GCeS7HJCbePuOyuFw2kRAaRYFTAyF4BmqkQingwJ23KQpOVLYmxux+4ap+2Di8PiYr4EBe64I+fyn1flEr4eIj5Nkm7t/jXPk9LiayiIwpEPPWrH711VZkexlerq745yMz4GfYVRI23MQQPxalO2AOoE8tz9qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743575250; c=relaxed/simple;
	bh=SJKs5MsANUlt7S2DYNjnDdjbH+PRcr/dBPptfQWldP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SnWAUa+5Ywykgw9KO4QJahe3ZUhDqs2mXyAgQki3IVIyJNqiI3ZfsazXksM6cDpkUZNeV6Dtl8rh0iq7bT2Rk0fnVmBXHMzYlhtbEgntOxYRoT7gqdpuvs9ETOUs4r+eVzstHLrIEVsOPm9T7QjGKrwWXF143wZymYIEiXSM9O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gMwE1mUY; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531NDHY6006680;
	Wed, 2 Apr 2025 06:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YL+AUF
	vrhgU1wEerfy8+1pvRm/SgbGvNwrHfplw2NHQ=; b=gMwE1mUYV0BVtthR0FuZ8W
	yjVMnILKGt2WXYcqiDbDA9mVI3X5/31Uwt8Jo0vYJCIhaVE544HRPdipjvI+GgAO
	pifDw2kCudOndnVWkQ1xPmda/2Un51H0T1DBdtwBjszbb9xlJMzAtflPWlIHGjdT
	0P5CNSbQuovHB9LRwH87/0iXGpKFIWDObv+zZBR9cgPRbCRlWaR7i9ch7EAXqXEO
	s0bxEtu4LE1B/836gZMr5umZVRUn4qHgWED4/p2nTyVuzBpWvcnL4jrpZbNp8Ke8
	KB+R27Lt61cyMhR6RpmTv10flzN5MOGMSzM92W4bcEt0aeEHhMsC2GrAJZOZIyCQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45rg67msad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 06:27:13 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53264Z3w005420;
	Wed, 2 Apr 2025 06:27:12 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45pww2e634-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 06:27:12 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5326RCTp24314554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 06:27:12 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 037BC583F8;
	Wed,  2 Apr 2025 06:27:12 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B8A1583EE;
	Wed,  2 Apr 2025 06:27:06 +0000 (GMT)
Received: from [9.61.254.101] (unknown [9.61.254.101])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Apr 2025 06:27:06 +0000 (GMT)
Message-ID: <ce38cbe3-429d-466b-bc8c-7dbb7c596ab9@linux.ibm.com>
Date: Wed, 2 Apr 2025 11:57:04 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
To: paulmck@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Jiang <dave.jiang@intel.com>,
        Dan Williams
 <dan.j.williams@intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>, linux-cxl@vger.kernel.org,
        dave@stgolabs.net, jonathan.cameron@huawei.com,
        alison.schofield@intel.com, vishal.l.verma@intel.com,
        ira.weiny@intel.com, gourry@gourry.net, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
 <20250331132439.GD10839@nvidia.com>
 <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
 <20250331171755.GC289482@nvidia.com>
 <67eaf14b7c611_201f0294ba@dwillia2-xfh.jf.intel.com.notmuch>
 <4641ce2f-74eb-45ea-a2f8-c7d0db905b7a@linux.ibm.com>
 <79a032b5-b13d-43fd-b56e-01098122e104@intel.com>
 <66ae49a8-d7f9-4fd9-b94e-9be26fd9aea4@paulmck-laptop>
 <e9c57344-43f3-4f90-9894-eb4f5a1b22f2@intel.com>
 <20250402114722.35cbd9d5@canb.auug.org.au>
 <478264e8-af94-462b-929f-f7afdf8466bd@paulmck-laptop>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <478264e8-af94-462b-929f-f7afdf8466bd@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 17idWzlD9R56I_OxTOzV8SN1XkNGo2wS
X-Proofpoint-GUID: 17idWzlD9R56I_OxTOzV8SN1XkNGo2wS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=994
 suspectscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504020040


On 02/04/25 9:51 am, Paul E. McKenney wrote:
> On Wed, Apr 02, 2025 at 11:47:22AM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> On Tue, 1 Apr 2025 17:18:23 -0700 Dave Jiang <dave.jiang@intel.com> wrote:
>>>> I of course do have some concerns about the number of userspace packages
>>>> that might be required if CXL is adding seven of them...  ;-)
>>> Technically it's only 1 package. libuuid-devel. Do the other 6 come
>>> with the installation of libuuid-devel
>>> ?
I had to install only libuuid-devel on my system for this to work.
>> On my debian build machine, I only need uuid-dev and libuuid1 installed ...
> And libuuid-devel works on my Fedora systems.
>
> So the various kernel-build howtos will be updated?  Or is a patch
> forthcoming?
>
> 							Thanx, Paul


FYI, now the issue is on the main line kernel also.


Regards,

Venkat.


