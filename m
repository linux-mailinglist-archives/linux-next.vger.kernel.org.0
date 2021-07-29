Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48D83D9C8B
	for <lists+linux-next@lfdr.de>; Thu, 29 Jul 2021 06:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhG2EWD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jul 2021 00:22:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45694 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229485AbhG2EWD (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jul 2021 00:22:03 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16T4FEtZ182812;
        Thu, 29 Jul 2021 00:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lhTVW3t0lTF5kza0RELN9IffV7THs5vCoJtihBxvY3w=;
 b=GJzzg3zwiEa86QHC6SaV8sCDIKmHuyJntUFheqCQd74yNm+fsSZR/BWlUhDB+cUo762t
 GtNvpdTtxsnrgJOvyG0ZXWtim0ub84I3gz1cto8zKp+BhlhQ06tiTty3f62/N7MND2du
 e2RYiTdRV5hVbCwLKCj0gwtxoK04kgXvX/8di0wlf9M8kZ0N2UlymFDyvMo7gFflGjwG
 h6ZthjWZoWP6SxypOGh2A7R6GtgntNemWim28v1WN87cKKnWEBUPZE8gIhgLyTvrfOcS
 bJCUZNzGOC131DlyDGY87vEFWmlqyr2odiemd4bhyK6W4Z2rWp53fcnSQQ5cK+2etZRY Bg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3a3n4y8483-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Jul 2021 00:21:45 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16T4D5kg007046;
        Thu, 29 Jul 2021 04:21:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma06ams.nl.ibm.com with ESMTP id 3a235khen5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Jul 2021 04:21:43 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16T4LffY25559496
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Jul 2021 04:21:41 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 029BEA405B;
        Thu, 29 Jul 2021 04:21:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 22762A4062;
        Thu, 29 Jul 2021 04:21:38 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.126.126])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu, 29 Jul 2021 04:21:37 +0000 (GMT)
Content-Type: text/plain;
        charset=utf-8
Subject: Re: [powerpc][next-20210727] Boot failure - kernel BUG at
 arch/powerpc/kernel/interrupt.c:98!
From:   Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
Date:   Thu, 29 Jul 2021 09:51:36 +0530
Cc:     Will Deacon <will@kernel.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org,
        Claire Chang <tientzu@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org
Message-Id: <63F21E55-B11E-4B30-B436-C063C405D9C5@linux.vnet.ibm.com>
References: <1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com>
 <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
To:     Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TmBeoEqtp6gufjRfjgGV6pBLwHd7ZQEp
X-Proofpoint-ORIG-GUID: TmBeoEqtp6gufjRfjgGV6pBLwHd7ZQEp
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-29_03:2021-07-27,2021-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1011 mlxlogscore=768 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107290024
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On 28-Jul-2021, at 11:05 PM, Nathan Chancellor <nathan@kernel.org> wrote:
>=20
> On Wed, Jul 28, 2021 at 01:31:06PM +0530, Sachin Sant wrote:
>> linux-next fails to boot on Power server (POWER8/POWER9). Following trac=
es
>> are seen during boot
>>=20
>> [    0.010799] software IO TLB: tearing down default memory pool
>> [    0.010805] ------------[ cut here ]------------
>> [    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!
>> [    0.010812] Oops: Exception in kernel mode, sig: 5 [#1]
=E2=80=A6=E2=80=A6.
>=20
> I noticed this with OpenSUSE's ppc64le config [1] and my bisect landed on
> commit ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()"). That

Indeed. Thanks Nathan.
Bisect points to this commit.  Reverting the commit allows the kernel to bo=
ot.

Thanks
-Sachin

> series just keeps on giving... Adding some people from that thread to
> this one. Original thread:
> https://lore.kernel.org/r/1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet=
.ibm.com/
>=20
> [1]: https://github.com/openSUSE/kernel-source/raw/master/config/ppc64le/=
default
>=20
> Cheers,
> Nathan

