Return-Path: <linux-next+bounces-6980-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826BFAC827A
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 21:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE100A4002E
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 19:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D461DED63;
	Thu, 29 May 2025 19:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YMHEHjD9"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C81647;
	Thu, 29 May 2025 19:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748545868; cv=none; b=hN9gnFb19i1Rl8+C6wmtYV/jiVdCbcsFK/arzv4z78Uv2ZulghRLNhOxy6xn4/K8LAayaQDKK4haesTy/3DLaszv6cBQSotS6+2dS27MQPBjh68w/FnUA3Vs3qqFeWSzzSf2xLv4IFeO/helD0fFy1EvZoT7pHDvmG3YXs6T5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748545868; c=relaxed/simple;
	bh=pr4M0bvpcxHz1vilhmzwplUEFexryIXuDkfJMqZx/bU=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DFuVT0ByLVOtEDFTPrKa6bDmr8OaoCVXVzl9MEeCIRX03NXluLj0OYDUjvOrfufq3jXgAHVnjgnw+w2aYfnAfQe275RA3qW+KRChKMXAsqRj0JSBRqL8R85ny2pkXPbTVor3mTqiAXN/8cAttxWMrVGnee4S5gmJbKbHKQA4Aho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YMHEHjD9; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TD33TB004354;
	Thu, 29 May 2025 19:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8DpMau
	1p7Ew4goUjGI6Xb7TMFJSj1/RZemgjGWectyo=; b=YMHEHjD9H2tX1LDD5bPw0e
	LmkKly4h0Sfhi5jspkLQLX47VAJ2Lw4H60euxqlO1gEGSsoeTdM+xyciCUAbDoxw
	277jeo9dwk9DuUsylKUacVD5Tt+2jBNdZNqgrK1RmKXLaPa7QQGhpNzMXdOORS37
	8zrWIKBJyeW/fMs/K2fsFFvJ6fiuz6uvOz9zVquMtVICOHFIzjfAgl9lTrvTfHnX
	lG0312SWdlwToq7EhmC8mOroTmZPh9/zO3NKl6TACHB1KwCmPDjol9gF7s6LLZLD
	JpoMc4GD0/LKpvBjF1Yl6Ta2xn4LH3MNcdUrt0enE/BIyZaLASuCBJYgSMaS+FWw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40hqhgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 19:10:56 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54TJ94YZ029153;
	Thu, 29 May 2025 19:10:56 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40hqhgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 19:10:56 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54THYxVF026914;
	Thu, 29 May 2025 19:10:55 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46uu53djxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 19:10:55 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54TJAsi233817158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 May 2025 19:10:54 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF4A05804B;
	Thu, 29 May 2025 19:10:54 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9A2758065;
	Thu, 29 May 2025 19:10:53 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.31.96.173])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 May 2025 19:10:53 +0000 (GMT)
Message-ID: <c17b1932657164acfbf98f8ab9ec08d88ba827e8.camel@linux.ibm.com>
Subject: Re: linux-next: manual merge of the integrity tree with the
 mm-nonmm-unstable tree
From: Mimi Zohar <zohar@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton
	 <akpm@linux-foundation.org>
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin	
 <dmitry.kasatkin@gmail.com>,
        Eric Biggers <ebiggers@google.com>,
        Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
 <linux-next@vger.kernel.org>,
        Steven Chen	 <chenste@linux.microsoft.com>,
        Tushar Sugandhi <tusharsu@linux.microsoft.com>
In-Reply-To: <20250529142748.052c3d2b@canb.auug.org.au>
References: <20250430142331.468074f1@canb.auug.org.au>
	 <20250529142748.052c3d2b@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 May 2025 15:10:53 -0400
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDE4NSBTYWx0ZWRfXwHOxsuY7JviX g6n7R9Wy233jwWqcLntY4bZbKdsfXixGD5XLqi1pKLTwyW7DDhj2WZmr8nqYIiCH9ZECK7xPzwF qKjegprIQ+yNrX5akHesJq++CNXe3Jxz+hTPcI0o8QvG74Z8L20fNfYO1PNNLEQCAwfXcWcXhRL
 tgva/PWskg6GWVNdAm8bDKVru/N0lRoIO6wYA1Jrpde1ScY/MkINZ7+fJAHLYntioWViJLYeEhu fnVvsz7ZyCj/Afb2XuNpwvhAHJN5U6xJFXT34KYoHacXbqd5dNmjmNQ4IciYtSRVb1NwF+xyP6w kn7y/PG5Rx7bLkCI+Nm0eT6/RYhTI/HAQI8XKy860n25+EeFVlmAuZoiNddE5j3Z+BoV9UBEN0H
 oAhCsDrreaiAg9wWGzVmpHo3n3n65ouOHpG3jOiIywAYTIThfIf+oOsG8PopYbLEaS6DFlks
X-Proofpoint-GUID: iDBvIEBlbJKMsff0imNYL6Ggd0gjG48X
X-Authority-Analysis: v=2.4 cv=WOd/XmsR c=1 sm=1 tr=0 ts=6838b140 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=rOUgymgbAAAA:8 a=217aLbuwkW1_cpe-OwgA:9 a=QEXdDO2ut3YA:10
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: boPgGoO6w8sEsqXFvjlrQ7p90sg-B8Vh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_08,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290185

On Thu, 2025-05-29 at 14:27 +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Wed, 30 Apr 2025 14:23:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
>
> wrote:
> >=20
> > Today's linux-next merge of the integrity tree got a conflict in:
> >=20
> > =C2=A0=C2=A0 kernel/kexec_file.c
> >=20
> > between commit:
> >=20
> > =C2=A0=C2=A0 912e32afb858 ("kexec_file: use SHA-256 library API instead=
 of
> > crypto_shash API")
> >=20
> > from the mm-nonmm-unstable tree and commit:
> >=20
> > =C2=A0=C2=A0 9ee8888a80fe ("ima: kexec: skip IMA segment validation aft=
er kexec soft
> > reboot")
> >=20
> > from the integrity tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.=C2=A0 You may also want to consider cooperati=
ng
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
> >=20
> > --=20
> > Cheers,
> > Stephen Rothwell
> >=20
> > diff --cc kernel/kexec_file.c
> > index ac915eabb901,0adb645072aa..000000000000
> > --- a/kernel/kexec_file.c
> > +++ b/kernel/kexec_file.c
> > @@@ -762,7 -800,17 +786,14 @@@ static int kexec_calculate_store_digest
> > =C2=A0=C2=A0=C2=A0		if (ksegment->kbuf =3D=3D pi->purgatory_buf)
> > =C2=A0=C2=A0=C2=A0			continue;
> > =C2=A0=C2=A0=20
> > +=C2=A0		/*
> > +=C2=A0		 * Skip the segment if ima_segment_index is set and matches
> > +=C2=A0		 * the current index
> > +=C2=A0		 */
> > +=C2=A0		if (check_ima_segment_index(image, i))
> > +=C2=A0			continue;
> > +=20
> > =C2=A0 -		ret =3D crypto_shash_update(desc, ksegment->kbuf,
> > =C2=A0 -					=C2=A0 ksegment->bufsz);
> > =C2=A0 -		if (ret)
> > =C2=A0 -			break;
> > =C2=A0 +		sha256_update(&state, ksegment->kbuf, ksegment->bufsz);
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0		/*
> > =C2=A0=C2=A0=C2=A0		 * Assume rest of the buffer is filled with zero an=
d
>=20
> This is now a conflict between the mm-nonmm-stable tree and Linus' tree.

Thanks Stephen.  It looks good to me.

Mimi


