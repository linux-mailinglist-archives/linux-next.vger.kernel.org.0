Return-Path: <linux-next+bounces-6991-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECD7AC8F97
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 15:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87E351668FB
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 13:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5B322D4DC;
	Fri, 30 May 2025 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MosivN65"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE6923371A;
	Fri, 30 May 2025 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748610671; cv=none; b=JQOsTAv6+2vuYxirUfPj8H6nFC30e+xJU7XPjF1t57KxedX+rG2ANPU6DzuOST20Kzha1NslRZHKs/2COAr0j1LgqmRG3Cm2GDX/pDoXDAMeMiZUdwTaoVRxRJh57mbW9FlJLosvuo9PSRnYKDD6Uccb4ndu4/BxbG9UKvlVzNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748610671; c=relaxed/simple;
	bh=5LPky/zFxCggcgxb7xyG3s/dy//BkaHMoujLGKefdOw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EVd4/fr+pSgQEk/XN8/1Ky6Ie/4s2MpILEIUpNgqMdgsuLQLtU16l1ACawn6xJ0YOytO53v1apXnUc17+tjo9L+SgumXYxW6RJouXfpGs1KlWmE/fV/7WE0FAD25gTsXvsDPt4/vJQz1PE8wZ4cwl+aEBYN3zoboDC6u+Uqj1JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MosivN65; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U3mZeN028086;
	Fri, 30 May 2025 13:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xUdSk2
	fCj7k3RtBY4ecnuRtB4NrEo3PLl91QLK/z9i8=; b=MosivN650PMPU7ed3A9+je
	9xUkWVnwaHzViMM6wZZM4gWQfpMqDH4ByUu9or0XzQ2ngNtMZUTuo9HA2rZZI2Mj
	Qau91APCxu3F+TSjW9dyGfVYXaadp5JWQ9DbaKg6NhCIaIJ2sNgLL80MQWcoyCV5
	g/J/47Mak0FMwB7UY8aR3L8gOJ5FgNKj4QGTrXhVCJwAjHZRWtWtCLJhgYsEoPTR
	yYUt4/yQo8PpgPUZ1lcmmiH0dvcSKUDVSfilOK9p8b8mlSTEBL5HWY2qOGUrgWHd
	Cwo3FaB1PRpMnLkVH8oJf5m54hxeVGEGV1Nu1Y53sI6S8EpqUdRL1PanO1yBzUkg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40gukqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:10:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBHnaF029613;
	Fri, 30 May 2025 13:10:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46usxn9dtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:10:48 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54UDAklo33685800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 13:10:46 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 519B020043;
	Fri, 30 May 2025 13:10:46 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9335320040;
	Fri, 30 May 2025 13:10:43 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.248.61])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 30 May 2025 13:10:43 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: linux-next: build warning after merge of the powerpc tree
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <20250530094400.2743f5b3@canb.auug.org.au>
Date: Fri, 30 May 2025 18:40:29 +0530
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F3FE2064-91FD-40C2-B7E6-F5DBDD4E8389@linux.ibm.com>
References: <20250513202809.7e23ed2d@canb.auug.org.au>
 <20250530094400.2743f5b3@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9cPKb7uKomjw4iC8hARgn2sS7t_1_h38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNCBTYWx0ZWRfXxH92MnFkF8Y2 iPlcjH687j9/X9fC8S8mRv5jtKBB4YlcsM9ci9ggq9vjmRHXlRN6cl0MsAWv6lCkbTuv2BPB7n/ VcG1mIjmX9aLb/bdgxMx5DOw0uORibWN4HPcwIyAAAk/WMqllsywYAjd89Izbeebhw3HVA0qCum
 iQk24QpZNmzpbZ0LARhWf2xGc6p2T5e8lpT0DDZoj/pAZJF5lxV9UU6ks2ykWUO3/uoSiQIQCOW UxWLcLMm9Bol1RUfowIGHFeH3/ck3NVozqjYs0JlETSAQmmbzbH4fGVXCOtM02itagvGUlEtria MCzrNMqF4jTqv+lF/tyhWEKeqJBu7UGKESSSLvUiELjP1yKzTzVOrOzuPTdfOIwOhuv4I6Sfy41
 Kp5p9BZh4vKBQEKWD0gsHWs9iF45QbiOunoNiCs18q14TsihRbnqviSsT7M+MR3chZkRqdax
X-Proofpoint-ORIG-GUID: 9cPKb7uKomjw4iC8hARgn2sS7t_1_h38
X-Authority-Analysis: v=2.4 cv=UflRSLSN c=1 sm=1 tr=0 ts=6839ae59 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=rOUgymgbAAAA:8 a=6Xf-EFKR-PQXkqza3xkA:9
 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=962 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300114



> On 30 May 2025, at 5:14=E2=80=AFAM, Stephen Rothwell =
<sfr@canb.auug.org.au> wrote:
>=20
> Hi all,
>=20
> On Tue, 13 May 2025 20:28:09 +1000 Stephen Rothwell =
<sfr@canb.auug.org.au> wrote:
>>=20
>> After merging the powerpc tree, today's linux-next build (htmldocs)
>> produced this warning:
>>=20
>> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included =
in any toctree
>>=20
>> Introduced by commit
>>=20
>>  ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM =
debugfs interface")
>=20
> I am still seeing this warning.
>=20
> --=20
> Cheers,
> Stephen Rothwell
Hi Stephen

Fix for this is posted here:

=
https://lore.kernel.org/linuxppc-dev/7FF625BF-03E1-4EB4-BEE2-BEAEB1C5DD96@=
linux.ibm.com/T/#mfc338052037792cc45f870edeca036ca02dcf58e

Thanks
Athira




