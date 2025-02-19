Return-Path: <linux-next+bounces-5495-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E7A3B114
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 06:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3510C3AFD03
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 05:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D79A1B81DC;
	Wed, 19 Feb 2025 05:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="g8O6Yc6F"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FC61AF0DC;
	Wed, 19 Feb 2025 05:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739944196; cv=none; b=GeRDNuZrjhQuyNvhQxGNfFt4zrsuMFjbsKEHJMqnxIFfvh/oh9/JwkRYR3D9YGnYPYCwAbaLSGWzOuTcLuJDWRlts9rWSAByY9T7lzPKGqLj1egFlR56l8JZ2BNkGCJqVnpWGgLjpi8kk1AZkjbazPsKbg0c5rag2i+5YIXLhH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739944196; c=relaxed/simple;
	bh=OyNwxmbNs7YpwqFUGZwNvqSdBj8u14YfhIt4c+byVbQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bm3YIh7X+TKQUcKwQjIb/yd1bPQtHQKj/F91aHOiMfqDXEZWdiaXHDndWdF/juCQDtfyd9KmjW8vc9kyYnbKDCcFPOEM5gYv8AVPHK5n1GpthTpwxr+/Zu/iqDMjGJRwj7rh6HoM7CHAdsdCLe5cVEk0g+KSRxuit0dorBIJHVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=g8O6Yc6F; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIxluG007930;
	Wed, 19 Feb 2025 05:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DlSMfg
	iPnDwuemdvuxNC8ndrB15CyhAUTewsr6te6to=; b=g8O6Yc6F2jtIJvPuJxlAW8
	sElBdow1C0Q1Yk+L8Hhts727xqsE2IR4TnsbuG58R4OsmVd2OnKYMnYc4Boqhsjb
	s+lADZSYSqn0eVZRQoxVjiIqO6WG2ZAPzUZ8PZBm4Rlfg4jvPoHC6ZgPG6de4UHr
	/vI1cJJq+nuL5n0frkjYPeNs1uADAA+gcw9SKotrGYPcwr+EBEojtEVFSqpmAH+K
	4PsevT1TjkiN1Y0SXZJzomhwWXS5uZD4lnP53aUDCgUVEiYOo0BObqqolyRfHshf
	/odjXB5BwlxoyySpeczb3fnW0VJm+LYVaknOuTfsyNP4/r7u3+mm5mWjet0gRHKQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44vyyq25gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 05:49:39 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51J2uP1c002323;
	Wed, 19 Feb 2025 05:49:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44w03x2cn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 05:49:38 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51J5nbsx60555620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 05:49:37 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59C2F20040;
	Wed, 19 Feb 2025 05:49:37 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E824020043;
	Wed, 19 Feb 2025 05:49:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Feb 2025 05:49:36 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 68DD76015C;
	Wed, 19 Feb 2025 16:49:33 +1100 (AEDT)
Message-ID: <866cbf9a3a5b9605b368b694f1ed333eb9394923.camel@linux.ibm.com>
Subject: Re: linux-next: build warning after merge of the powerpc tree
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Madhavan Srinivasan
	 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC
	 <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next
 Mailing List <linux-next@vger.kernel.org>
Date: Wed, 19 Feb 2025 16:49:21 +1100
In-Reply-To: <20250219154649.49986660@canb.auug.org.au>
References: <20250219154649.49986660@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rt1nlQhdMa46Ko5gKqHA2HVVCa65_Fb7
X-Proofpoint-ORIG-GUID: rt1nlQhdMa46Ko5gKqHA2HVVCa65_Fb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1011
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=888 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190040

On Wed, 2025-02-19 at 15:46 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the powerpc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> WARNING: Documentation/ABI/testing/sysfs-class-cxl not found
>=20
> Introduced by commit
>=20
> =C2=A0 5731d41af924 ("cxl: Deprecate driver")
>=20
> The reference is from Documentation/arch/powerpc/cxl.rst
>=20
> I don't know why this has appeared just now.

I think this warning is added by ff7ff6eb4f809 ("docs: media: Allow
creating cross-references for RC ABI").

I can send a patch to fix the reference in cxl.rst.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

