Return-Path: <linux-next+bounces-6508-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4132AA83BD
	for <lists+linux-next@lfdr.de>; Sun,  4 May 2025 05:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FC407ABC5B
	for <lists+linux-next@lfdr.de>; Sun,  4 May 2025 03:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C4514A4E7;
	Sun,  4 May 2025 03:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Lu/EC0ax"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8D6EEA9
	for <linux-next@vger.kernel.org>; Sun,  4 May 2025 03:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746328911; cv=none; b=AptyPCm42bAgEaZzCOmuZveXo3XxE+ZJ4QOHhDNevUkEsgTfEdFyX9QlZ7Y76vQ0JRy700m1ZNqsg6/W9gwLnoKumJQlgg9e1p7d3gVYp2bijt6vVntpYZDOHUk74iLZnfgh1dTmm2NChKNi3GNTpQ3VQuUGjXO5yGYS4GSNy2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746328911; c=relaxed/simple;
	bh=Gmd7xxuYlL7qMGu2TpZO3smsCHFtN+32af++zDcT3ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d5cX3zY4bzVOzNYk4SkRNnpGAKZzEiRfY35dA7o9nqVLcJccR2Qvk0rDjU5XOCVA6fCljKpgDHWIgJk1H86r8Ti2QRHqSe5dpNWqieMtaqlSjDb5pSaxmf//7OXRL14YuZfFBLXp2IpCx+nBorE83AQSNSOuQAdkING6CuGxRv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Lu/EC0ax; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543JO1Gt022692;
	Sun, 4 May 2025 03:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=049eM6
	yuHcAq0fB9qDTdhtbELa2b2PosHJAHBSzyqrs=; b=Lu/EC0axgHsuP1D8ywT8uE
	9HshKwbU72UeiViuBnoWsRtVFfb6DY/sK5fTAznMYubHy2wEQ/iblQEKtMIYu1nR
	BA2M3ISVyZQLU2rXAwmLYp+3AvSqZ/SAYJXyU0glnmSU1ZxP5PlN9FDGF2zaqF1f
	MrAH1flYwU59iX1PlyTOsshuxP2Wmti+nFifB7AP8X5XEVwpgc3K9pHg6mqPew/9
	oz33aZVNYOV9UUC40TYR4h5two5K4sbmiTA4yQfAfhRGiGLh+VtDxihhuyLm3kQN
	u/y/uFXy/FH2X6TC4LC1GS/jdCL21cELbH/is4DvOlCxd5FVuOEMjM2j5vI2s9Ag
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dh2ktbys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:40 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5440BSvB001313;
	Sun, 4 May 2025 03:21:39 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dwft0hkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:39 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443LZDa34669150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:21:36 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E21FE20043;
	Sun,  4 May 2025 03:21:35 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CAF720040;
	Sun,  4 May 2025 03:21:32 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:31 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>
Cc: sfr@canb.auug.org.au, tyreld@linux.ibm.com, linux-next@vger.kernel.org,
        hbabu@us.ibm.com
Subject: Re: [PATCH] powerpc/pseries: Include linux/types.h in papr-platform-dump.h
Date: Sun,  4 May 2025 08:51:29 +0530
Message-ID: <174632869190.233894.13264364429035388504.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429211419.1081354-1-haren@linux.ibm.com>
References: <20250429211419.1081354-1-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=fLE53Yae c=1 sm=1 tr=0 ts=6816dd44 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=IJ5uNYSzlZeX1pgoDwQA:9 a=QEXdDO2ut3YA:10
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: szN0peu7zDLhaVqNeR9kNtclkP7uBoR7
X-Proofpoint-ORIG-GUID: szN0peu7zDLhaVqNeR9kNtclkP7uBoR7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyNyBTYWx0ZWRfXycLrlYNgGivR VrjNHIrd4erJBws9p+7q8okStZUlsdivR9HQ+yIbn6aXkWLM+iQU9nxoTmBCnn6+3DtEypxCudy mG+/C5gFp9sxd8X2x//7PPzhB1iG0RKKBVhOJgN+0w2Qte7mYgfmScDHXt/e8qmMl90+/Dv6LxT
 aOm6WJthA9FVAEMENIDl4rW1cilPAQDWPk20mF9/RdxG5pWj5ZMIxxpoPipC3lyD7dv55Yaql50 B65n790+/1OdHhhxIhLe/rX8+CCnujZ6XSTqNFQFhc0eZL7kT7V8EtmJdvesRgHbwE3yLcyCMN8 heDoryHeXLq8d/gWz1zmjk0Yt1I1up2Wat0RtTGMNFGtuzUtPOMivKOqa3JaWrorOKxE+ewQdRZ
 eL0VD7q49a/35f2mXmPuY6Br7iK7j35GbP3BofqQvjEBfAaaUF8pQUoFQfpWtC0Z5CAjRYBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 mlxlogscore=931
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040027

On Tue, 29 Apr 2025 14:14:18 -0700, Haren Myneni wrote:
> Fix the following build warning:
> usr/include/asm/papr-platform-dump.h:12: found __[us]{8,16,32,64} type without #include <linux/types.h>
> 
> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
> Closes: https://lore.kernel.org/linux-next/20250429185735.034ba678@canb.auug.org.au/
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: Include linux/types.h in papr-platform-dump.h
      https://git.kernel.org/powerpc/c/925e8620db51ca6bd5c87256dc71c38770b8f6e1

Thanks

