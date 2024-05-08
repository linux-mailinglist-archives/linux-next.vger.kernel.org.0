Return-Path: <linux-next+bounces-2229-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B13728BFE9C
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 15:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C67F2897C6
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 13:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB546FE06;
	Wed,  8 May 2024 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hGjCzRZj"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBF06F514;
	Wed,  8 May 2024 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174494; cv=none; b=kxvlhuIsIgaEa0brs1ZOwIicA7WoALtFe7lNw2TNEp/p2qRRwWWuNVp2SRpuVScYYIgZFdDHcT/QL/BAMnQAX99j0eHpq0ckZ+7UP1t3GDTiDXu/mbSkarlaZkse1UIlsXd7JQ0Zjm3rjRx93Fucasp9SWGY/mu9DsLUd70jwP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174494; c=relaxed/simple;
	bh=ssaG7LKbJUkwN9FIh78/iyjTlMmbcPt8tPMh8MlDX/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S01kX0kcd9o3VDjbjgxl2X07Vta3EOtAa53v11lWuftL7wc7vdt0EpBnVru3V+QU4R7yd+rsU9CSi3JG7ayjhMlmuDLYwh9aLo4/0kkNguB9/TeA5DYfXKs9QII6jcQWerM3Ngojlc0wvoUQHKH3rqjBGcRjwdPtNQzSZDIp8IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hGjCzRZj; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 448DL9WH017863;
	Wed, 8 May 2024 13:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=CDqHnKT8vhO5HdyY5jQPjAI+5F/MYn/SRXL9aPBLaXk=;
 b=hGjCzRZjowD3g5gIC3PLqY3QMyy3Y1W04lw+XwZzlb9JCQ1zE/2HYS0tegV8Gbakfs07
 FL6r4DvblfS3YHx+cjHHjSFfuUg6CUSLZQbRu2iu3ulBG3WeySHTiTzOpJ9a/AJp7Aaj
 Vs5ycqyEaZMzykaYX2xflDs83bJpDwK+qPX5NUQ4kjHTY8QxRZNT0h5K7JjmiDFSXFFa
 rP1RBDGsGYMq0CIYs7KdyVlyA3AKfZ/AsTt1P3FrN/xORTXjbBpSIplAvvlcFkwRxy3g
 2mbhEDvMrHWBQwPdxlu7MGl2t6o1eZ28izzirAy/cqJvh4Q7NsYHYVuuDOP5eSBmENvn 3w== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y09tv027a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 13:20:59 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 448BV6lT017387;
	Wed, 8 May 2024 13:18:35 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xyshsvtjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 13:18:35 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 448DIR4A45613336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 May 2024 13:18:29 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DB0E2004E;
	Wed,  8 May 2024 13:18:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7ADD520040;
	Wed,  8 May 2024 13:18:27 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  8 May 2024 13:18:27 +0000 (GMT)
Date: Wed, 8 May 2024 15:18:26 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Jens Remus <jremus@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the s390 tree with the kbuild tree
Message-ID: <20240508131826.6522-B-hca@linux.ibm.com>
References: <20240508095726.32237e53@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508095726.32237e53@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TMTV4g1THWxioHQfmuweizNX44lq7cqA
X-Proofpoint-GUID: TMTV4g1THWxioHQfmuweizNX44lq7cqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=955 phishscore=0
 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405080094

Hi Stephen,

On Wed, May 08, 2024 at 09:57:26AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the s390 tree got a conflict in:
> 
>   scripts/Makefile.vdsoinst
> 
> between commit:
> 
>   d6d223135547 ("kbuild: simplify generic vdso installation code")
> 
> from the kbuild tree and commit:
> 
>   4cfae05eb3aa ("s390/vdso: Create .build-id links for unstripped vdso files")
> 
> from the s390 tree.

...

> diff --cc scripts/Makefile.vdsoinst
> index bf72880c50d0,a81ca735003e..000000000000
> --- a/scripts/Makefile.vdsoinst
> +++ b/scripts/Makefile.vdsoinst
> @@@ -20,8 -21,8 +20,8 @@@ $$(dest): $(1) FORC
>   	$$(call cmd,install)
>   
>   # Some architectures create .build-id symlinks
> - ifneq ($(filter arm sparc x86, $(SRCARCH)),)
> + ifneq ($(filter arm s390 sparc x86, $(SRCARCH)),)
>  -link := $(install-dir)/.build-id/$$(shell $(READELF) -n $$(src) | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p').debug
>  +link := $(install-dir)/.build-id/$$(shell $(READELF) -n $(1) | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p').debug

You can drop this fixup, since I removed the above referenced commit from
the s390 tree again.

