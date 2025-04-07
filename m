Return-Path: <linux-next+bounces-6172-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EECFA7DC78
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 13:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2ACD3A746B
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 11:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF6823BCF3;
	Mon,  7 Apr 2025 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Z+Hq1zCQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59AB23C8BB;
	Mon,  7 Apr 2025 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025920; cv=none; b=uqBs46FYxls+/O8WEY+tg09lS50djpMoB+h2vZJUmkgbmerAPOXEu8KZNWf8b8yIehyJ0XwDot5UeiAy2Xn05CBd2Z1k1bYmSV5+2o6n3vUoZjSpj8v2U50mkvq6BeMds7UizMTtAcL61sdsdz2gRM+3FoA4nCLlpIoLP+t2fKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025920; c=relaxed/simple;
	bh=1NEeEf3PBym/AYW+9G0XRQ0YgPkbn1hPa7KLg0dFXcw=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=rGeHXO8Z6rWwtVf4qEfFXgWJx8HowXVtZbgBJVrCgttVSJoyMdjO0qFvYeP/FXwRW+dvn40dXRFYtIcIamkiaYxdXfDcld6e770+kfJ7CghRu2aGIO6dw0+/IenB6cgfNF9OeppKkE+HtL+KDfdn48qhUTMyjOtFMu2CG5ca/+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Z+Hq1zCQ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378GrIP020812;
	Mon, 7 Apr 2025 11:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=1NEeEf3PBym/AYW+9G0XRQ0YgPkb
	n1hPa7KLg0dFXcw=; b=Z+Hq1zCQMmisKHtxh4/hqVMxESWKAlQ8pswhILuGpGd5
	MifXP3/ZvdDwsxVOeF8I1O65bxC3XbIKuIvg/QxDYHEpoRZ26/tv1mePJLPuilhy
	f0675WpmTxyZXGqD9u8gQblhBvJNvrt9Xdynb99KK3wDR/Zsbsarke5FikjJ1xty
	rH7f7XMBsPUL5lBtDmKnGiAftZEP7jErCt9SmrducgmA+h6aqfqcXKxxWrcaDdht
	KBvAd8zXDsel+s/iC+LPpJySBM0WRPXs5k37QBs0vGGDjMCiZMGqk6a5OvofOSl8
	06lwlFKXYmWdfjne7a3RUFGCNwar+Y6HnzlwDhwKfA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uu1pm5k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 11:38:07 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 537BX717020028;
	Mon, 7 Apr 2025 11:38:07 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uu1pm5jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 11:38:07 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 537AoHK1025537;
	Mon, 7 Apr 2025 11:38:06 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbkngsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 11:38:06 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 537Bc5Ng30999132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 11:38:05 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5562F58043;
	Mon,  7 Apr 2025 11:38:05 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E280958059;
	Mon,  7 Apr 2025 11:38:01 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.255.9])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  7 Apr 2025 11:38:01 +0000 (GMT)
From: Venkat <venkat88@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH 10/10] kunit: slub: add module description
Message-Id: <DC0A949B-A21C-460A-A368-377B4A28F141@linux.ibm.com>
Date: Mon, 7 Apr 2025 17:07:48 +0530
Cc: akpm@linux-foundation.org, arnd@arndb.de, feng.79.tang@gmail.com,
        jeff.johnson@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, linux@roeck-us.net, masahiroy@kernel.org,
        rmoar@google.com, Stephen Rothwell <sfr@canb.auug.org.au>,
        vbabka@suse.cz, xiaopei01@kylinos.cn
To: arnd@kernel.org, akpm@linux-foundation.org
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sGd__CG-Qqc9oL1RY_BugIK2ts-ZZaVp
X-Proofpoint-ORIG-GUID: xuuccnJ-CAvhy-FQ1qyPqEv0ILXr-cRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=871 spamscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070082

Hello,


I am observing this warning on the mainline kernel on IBM Power9 Server. =
Similar warnings are reported on the linux-next as well [1] .

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o

Repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

HEAD Commit: 0af2f6be1b4281385b618cb86ad946eded089ac8.

[1]: =
https://lore.kernel.org/all/20250407084858.74a128d2@canb.auug.org.au/

I have made below changes and it fixes the issue.

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index d47c472b0520..848b682a2d70 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -325,4 +325,5 @@ static struct kunit_suite test_suite =3D {
 };
 kunit_test_suite(test_suite);
=20
+MODULE_DESCRIPTION("Kunit tests for slub allocator");
 MODULE_LICENSE("GPL");


If its acceptable please add below tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.=

