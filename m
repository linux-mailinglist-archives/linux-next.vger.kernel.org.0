Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBB33A8972
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 21:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhFOTYa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 15:24:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20882 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229946AbhFOTY3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 15:24:29 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15FJ3ige068549;
        Tue, 15 Jun 2021 15:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=CbeQvqjWYMEKIm/ohd1i/mP8vgkL07rDKlVpu0ojC1c=;
 b=EbTJXgQyBbHny+WfsPb8xFRbI2X5tr2lfEa+Yo5wMgLKy2+q4VNDKTABBouQmxV/J1Gk
 1BrV87Gb/sTAQcL8BDrgB9g6t8oP/gaKKGBIg4JCEDyiSsPNIv/qnF7oO4dpyIw90nyJ
 VvVaq3LXfV63g3IYLpBu797ZoDKggVGeHqTaPJwTaIMoznSbWE9e5Jw/OkTE/Pbh6rGS
 xW26tnb/4c6TARHVeTrGPSJgjw/hs4PdOe6lNOhVnuPUit1OqiXqp83QQx5IvC3+blKw
 QuH+XzOxslnHvHPTtzgVvpgaiZd4hU5Jg3RiA3Tsh+8QBlH4niLJw7crK/+KWbhnT+5A gQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3970pmk4nh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Jun 2021 15:21:44 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15FJLfc7019130;
        Tue, 15 Jun 2021 19:21:41 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03fra.de.ibm.com with ESMTP id 394mj90wsf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Jun 2021 19:21:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15FJKYbP26149338
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Jun 2021 19:20:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 191DC4C044;
        Tue, 15 Jun 2021 19:21:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 64A1F4C040;
        Tue, 15 Jun 2021 19:21:35 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.174.39])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 15 Jun 2021 19:21:35 +0000 (GMT)
Date:   Tue, 15 Jun 2021 22:21:32 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Qian Cai <quic_qiancai@quicinc.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Miles Chen <miles.chen@mediatek.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>, lkft-triage@lists.linaro.org,
        regressions@lists.linux.dev,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [next] [arm64] kernel BUG at arch/arm64/mm/physaddr.c
Message-ID: <YMj9vHhHOiCVN4BF@linux.ibm.com>
References: <CA+G9fYvvm2tW5QAe9hzPgs7sV8udsoufxs0Qu6N0ZjV0Z686vw@mail.gmail.com>
 <20210615124745.GA47121@C02TD0UTHF1T.local>
 <20210615131902.GB47121@C02TD0UTHF1T.local>
 <076665b9-9fb1-71da-5f7d-4d2c7f892103@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <076665b9-9fb1-71da-5f7d-4d2c7f892103@quicinc.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7__BV3WxWPyUURMkkduVQYEarOn1Xzpx
X-Proofpoint-ORIG-GUID: 7__BV3WxWPyUURMkkduVQYEarOn1Xzpx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-15_07:2021-06-15,2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150119
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 15, 2021 at 10:50:31AM -0400, Qian Cai wrote:
> 
> 
> On 6/15/2021 9:19 AM, Mark Rutland wrote:
> > Looking some more, it looks like that's correct in isolation, but it
> > clashes with commit:
> > 
> >   5831eedad2ac6f38 ("mm: replace CONFIG_NEED_MULTIPLE_NODES with CONFIG_NUMA")
> 
> Just a data point. Reverting the commit alone fixed the same crash for me.

Yeah, that commit didn't take into the account the change in
pgdat_to_phys().

The patch below should fix it. In the long run I think we should get rid of
contig_page_data and allocate NODE_DATA(0) for !NUMA case as well.

Andrew, can you please add this as a fixup to "mm: replace
CONFIG_NEED_MULTIPLE_NODES with CONFIG_NUMA"?


diff --git a/mm/sparse.c b/mm/sparse.c
index a0e9cdb5bc38..6326cdf36c4f 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -347,7 +347,7 @@ size_t mem_section_usage_size(void)
 
 static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
 {
-#ifndef CONFIG_NEED_MULTIPLE_NODES
+#ifndef CONFIG_NUMA
 	return __pa_symbol(pgdat);
 #else
 	return __pa(pgdat);

-- 
Sincerely yours,
Mike.
