Return-Path: <linux-next+bounces-6507-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C05EFAA83BC
	for <lists+linux-next@lfdr.de>; Sun,  4 May 2025 05:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DB4818970ED
	for <lists+linux-next@lfdr.de>; Sun,  4 May 2025 03:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067B7149E17;
	Sun,  4 May 2025 03:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iNYJcRsg"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598F6130A7D
	for <linux-next@vger.kernel.org>; Sun,  4 May 2025 03:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746328905; cv=none; b=WOjN4j3gpMgp1I3EKiPua9Y6gMEsQqg+NcBDEy0mgCI9MU3saDGA0i0msu2A4qQs9oovB78VlgYSoiit3/122j65w8rHY8GfP9Vjyg+Oy7zD0C6SvVSQbpQyI9Zl6DzNwsR1SBRAjHhEkCoSL3DXi9kFr362toLX9GGUUiNYLeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746328905; c=relaxed/simple;
	bh=83G1x1abiB2351CoJ6h3d/+XYRXCPuxuwQ7kmwDjZ0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UYJfFPCf3zs31rv32T6CYiV5j8/tvhFUQ3XhlTI6a66EraF7ZsJeqw22T+0CCHs8DczTGR/84+GWk1RtNyxxU0lY5b67SxmUcnP50l1tfMUALK337F6y6B48VNUdPP5K2y9hnuO8FG4IW/X4BA5IjFL9GGQmw7vNkvd3oOK+GlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iNYJcRsg; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543NfqH2017088;
	Sun, 4 May 2025 03:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=v7cT19
	u7KwDZy5zU1KqVIBbQ05cJwXNl9ZOTJ/i5sb8=; b=iNYJcRsgwrbSs4TKMpmWPF
	MFwlpsRBet3gMgDBem9sJsX+A8VyY9LZFSWhcKS8GLSdHvHM9XUnGz2/uJD79C5+
	v+JSsQk4FbyfM9MgxwRayukDpgZAk2y3sK38H7n7dEz6VEUZYaGc4j0tAW6xDJCM
	1af4Ynx0sg8/saa3zVimDbjF2/SQL4B/OuwNDtjjRd7TjZCPvixkpLBYxkuWdfhu
	4x2HTLPm7hS/D8Uj19RUPqJhlUDRM144eD/Rj3aVWA3QwiPNRfObD5Gjk02uqa6i
	bL/4teTekIL3/YfwICcp1USmqMbb5xHUZFjP4wFczFUJ5vRQID3UPPjZa0L6jw2Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46du9v8n39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:34 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5441JbOx002815;
	Sun, 4 May 2025 03:21:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxfngb4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:33 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443LT5w44892576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:21:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5A602004B;
	Sun,  4 May 2025 03:21:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C0F020040;
	Sun,  4 May 2025 03:21:26 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:25 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>
Cc: sfr@canb.auug.org.au, tyreld@linux.ibm.com, linux-next@vger.kernel.org,
        hbabu@us.ibm.com
Subject: Re: [PATCH] Documentation: Fix description format for powerpc RTAS ioctls
Date: Sun,  4 May 2025 08:51:23 +0530
Message-ID: <174632869190.233894.9391450115429095949.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430022847.1118093-1-haren@linux.ibm.com>
References: <20250430022847.1118093-1-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DU4JN7KePvu9aY2cIpaDpsfEfSv3veAz
X-Authority-Analysis: v=2.4 cv=XNowSRhE c=1 sm=1 tr=0 ts=6816dd3e cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=ioz5gwpxbLTQyuavpQQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DU4JN7KePvu9aY2cIpaDpsfEfSv3veAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyNyBTYWx0ZWRfX9b24keTsBbHd z025L8zA/fqE6czyuq4lwOZcgD7IGyVW/wO1pqGMGI8J01zvcII8WU3m4Uzgctwl8eiXyVt2lpg Gavgs+5iLTH4pMVWqu+/i+bE5zfNDZtZU3R2QgK58UDstPu9j7Iq8+GE853sJYUJks7Cx3d53l5
 +m2wgowxpAQRU/sYLOmedBQqUA1xQVMOS0J2oel5X5bYRxvaRDofOSp3Zhs07TOW2KAWyI5GdU5 EbJwln47vvXbp6I8Wm3gtIzI9Pw6TyWCL2rynUNl7Jj9cyd8MJGhIynV7DxHq4UwOuLSRjhTF5I d+E8uiIuvb0u2PHvScPQk9jpnXorVXFffCzhUeFFeX4lja/gixdMbj+PmJLWpIJn17EEPdB2axU
 6/EW4ZB66tt0TiEhWhLJRT0U/yVX9GmF6CmpQ7ioZuoAk/PEj4fa/fnfMK8tAwuyCOABxX2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=708 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040027

On Tue, 29 Apr 2025 19:28:47 -0700, Haren Myneni wrote:
> Fix the description format for the following build warnings:
> 
> "Documentation/userspace-api/ioctl/ioctl-number.rst:369:
> ERROR: Malformed table. Text in column margin in table line 301.
> 
> 0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h
> powerpc/pseries indices API
>                             <mailto:linuxppc-dev>
> 0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h
> powerpc/pseries Platform Dump API
>                             <mailto:linuxppc-dev>
> 0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h
> powerpc/pseries Physical Attestation API
>                             <mailto:linuxppc-dev>"
> 
> [...]

Applied to powerpc/next.

[1/1] Documentation: Fix description format for powerpc RTAS ioctls
      https://git.kernel.org/powerpc/c/03c9d1a5a30d93bff31b4eb0a52f030b4c7f73ea

Thanks

