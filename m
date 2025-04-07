Return-Path: <linux-next+bounces-6170-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01016A7D8E9
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 11:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A66ED16E64B
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 08:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE5122AE49;
	Mon,  7 Apr 2025 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CbLgWycD"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D222AE5E;
	Mon,  7 Apr 2025 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016387; cv=none; b=XSBanttIsfuEqNZtulTMccusgB5Qktl37Jrvj7RWTRhe4CTMh7N0Dkdmcv9SBbDBWQbQIQ8MIp0rtgJSFbXO26YUE+VZLqvyvODQ+TGH6qPgTireMb5CpcRW6tZn42P/4yfKsalMStMnE5b0j55hKwj+MhkLo/nfhrOmWCy/Bb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016387; c=relaxed/simple;
	bh=QukZAP/ULk9OvNrWPpJlqCslREUkQ5qQmKtJqtFGgqg=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=JWTYrrUWs3I1H/5vLyU4LFHoI3iJoefZP/LhJodXltt1+ghmImcSTJdshetvoQ9TNq+uRBio0IoKzsUuuBIx4953AFS2IBdxivwOzUis9YCNfyom+U2Mi6IElE/wHCAzzBLYgXqCgQSrv1pQU9+979DGztCWyy7kCftbuVBEiVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CbLgWycD; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378NQ5L017568;
	Mon, 7 Apr 2025 08:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=QukZAP/ULk9OvNrWPpJlqCslREUk
	Q5qQmKtJqtFGgqg=; b=CbLgWycDGGtIk6WqfLt654ilx6qyrrwFTx9uQL3rtHls
	2k14dU7xANDpSh0fUEHpPY7YuKgoYI6RJ4R81Qz0C73XlMsj4ykDpuVJOZxRobSH
	4qdfTWMK/HlM+VqFxD1JACXVVDlWt2GpdQJUEiG9Pqkt4BnQ0X+lCrTAVcjNGbN+
	EPFiCs+8qT1WtLEa6sbXpDC1Tr4kNkcYa4SQLkhkP7BffnMwnuK0lUjD2i2zWYL4
	kzfXjxLWUb+9kdSLtFm6h1f7c6ootHlm3qXPgkB1sSEStL/DkvL9X0GBxsmWBY8g
	992IPwbEVl/COW/ywagXk42L7yxlqEs/NZ+ixgbd0Q==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uu1pkeyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 08:59:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5374bweH011326;
	Mon, 7 Apr 2025 08:59:32 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf7yd6td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 08:59:32 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5378xVG119595944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:59:31 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D56258055;
	Mon,  7 Apr 2025 08:59:31 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E5D8158043;
	Mon,  7 Apr 2025 08:59:29 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.255.9])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  7 Apr 2025 08:59:29 +0000 (GMT)
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
Subject: Re: linux-next: build warnings after merge of Linus' tree
Message-Id: <9B0D38E4-3414-43B9-8F41-D552755DC81E@linux.ibm.com>
Date: Mon, 7 Apr 2025 14:29:17 +0530
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        mathieu.desnoyers@efficios.com, rdunlap@infradead.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
To: peterz@infradead.org
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RB4JDKZU8B1RvoOy8htbA07n5K3dBLaU
X-Proofpoint-ORIG-GUID: RB4JDKZU8B1RvoOy8htbA07n5K3dBLaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=427 spamscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070064

On IBM Power9 only below warning is observed.=20

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o

I have tested the patch and the above reported warning is fixed. Please =
add below tag.


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.



