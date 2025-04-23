Return-Path: <linux-next+bounces-6348-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E6EA97BC0
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 02:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AB2C1897855
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 00:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BF3255E31;
	Wed, 23 Apr 2025 00:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FXQ+sjiY"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070DB1F2B88;
	Wed, 23 Apr 2025 00:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745368955; cv=none; b=sMcoq9WrdAaHOwEvwDH8bz0JBkNjftAwFaRzKpWAguSJWETXN0WsG70TmWM1jVczNv6HdBo1rev5z+Ly8To5rWF/x4gvJrg1mn/jOctpeOpdh/7ShgFEL+lpufPnBehEcIGXDPJgtPsKVlqqZ3y5DaakUz3LlbLm9S0H0Ilognw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745368955; c=relaxed/simple;
	bh=vRxj+FE88pNhlcEn8/W3fItUCEJa95sjbjD77bx46ug=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PGDzdW12/rfeczpunAPVASnSbRqemKJQM1s57mZZCI5NVIoco8TiSlEPjFqPVFnkvpZhWr4DmvhYX8X+F/Ay4LxGwFXfHj3E34TtVdLi1J4TS7CMgavTdmirBsAgDSgXMsbzTYc+WuYLs4BZwRfr/4At9D0EJE5G2Pb1uc0BQk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FXQ+sjiY; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MM18vd012804;
	Wed, 23 Apr 2025 00:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cBZqXQ
	IkDyFQhlJgb6cQfanBQadUkMoKu5Qig70Km+I=; b=FXQ+sjiYPj1GIhcvTjn81L
	9CcL9abYuOiBQhmgJtn9FHkSQlJfTLHPSAN83wlqNuDP8MNoib8Zvw4qVRJbiNWE
	+dXvfLH9eZNb5p3otBaLWZFFlQ4I2ylLO4vRzSB2CcOBahuQ341cK7FBSRxm4net
	fzsWNikQuHf4n/ApmogsOmH+uLNpusdDx2LWkM2aee0YQBGzBRiBPVIVCwhle7gi
	/vhvIpYwe8l3h1oA9W+94MNsIMTjPcIZ2j4WFbW7oKT48mNrEqHVY+iOI8zLOgAQ
	ZTwPgdcaSSHNCY78FlOn4PnNHpMIIidpaIUEt3p8IYbSsxEzaNUsisQPks3Y0njg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466jp3rmf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 00:42:20 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53N0elKO010883;
	Wed, 23 Apr 2025 00:42:19 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466jp3rmew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 00:42:19 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKnFGC008670;
	Wed, 23 Apr 2025 00:42:18 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jfxgpxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 00:42:18 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53N0gIK429623002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 00:42:18 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 120965804B;
	Wed, 23 Apr 2025 00:42:18 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 285545805B;
	Wed, 23 Apr 2025 00:42:17 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.45.91])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Apr 2025 00:42:17 +0000 (GMT)
Message-ID: <dc9bd25b60c1185e28214293c015e2b3f30f76bf.camel@linux.ibm.com>
Subject: Re: linux-next: duplicate patch in the integrity tree
From: Mimi Zohar <zohar@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Mimi Zohar
	 <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc: Roberto Sassu <roberto.sassu@huawei.com>,
        Linux Kernel Mailing List
	 <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
	 <linux-next@vger.kernel.org>
Date: Tue, 22 Apr 2025 20:42:16 -0400
In-Reply-To: <20250423083952.7fae69b0@canb.auug.org.au>
References: <20250423083952.7fae69b0@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3T4j1Ui_QBfVpgYd0g_qSpF2P8KTmJkI
X-Proofpoint-ORIG-GUID: XzXFaTmQ6IsYmoCp8XYeaF-yV-TgOVCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAwMSBTYWx0ZWRfX2hm+G0g9BjvB IoWMF/wRabSt9P6ha4CaN6dW5ogjv1g0h5R68ukzZZZikpXe70NU5GdgkTlMQmQImNwSlaVpXzG 7+GTf5JtWt+3Wtj+yLKYBcEpRIRwmGMK+S8De+ByzzUhX8yL5tZIbzzFlihSX26pTGAF07CVdeF
 bEMIKOqEEPXC6bdiMAakrMX1wtIY6YhhFutRF9U1oxsdzCmqchFtOjfAWGzO0p0HtgkZyRdJNN7 uLUs0ltvN6GUUiLDbDkjTGjIvT00Ec2tb7Z+x5jWKvLRLub/sJEGniVR9SblOOISDLHJXYZ422r FxStXafCYWpUFTGknZJxgSU21emlZ+3D2HV8QtANHAAQypxtUQvmtRn1BLQhUDZ0WuYmnHBTPam
 uRs7bUrN7hdEq8oNnOjUiYmmhtCXrB3pSbyvPP4ehMKzYCC/BK/QIoY1lQvxanISE6Jy00Bw
X-Authority-Analysis: v=2.4 cv=N9wpF39B c=1 sm=1 tr=0 ts=6808376c cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=4TkunlOkxh8sHfZMeKYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_11,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230001

Hi Stephen,

On Wed, 2025-04-23 at 08:39 +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commit is also in Linus Torvalds' tree as a different commi=
t
> (but the same patch):
>=20
>   976e5b974fef ("ima: process_measurement() needlessly takes inode_lock()=
 on MAY_READ")
>=20
> This is commit
>=20
>   30d68cb0c37e ("ima: process_measurement() needlessly takes inode_lock()=
 on MAY_READ")
>=20
> in Linus' tree.

Yes, I know.  Roberto unnecessarily rebased on -rc3 before sending the pull
request.  As soon as -rc4 is out, I'll resync with Linus.

Mimi

