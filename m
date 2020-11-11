Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333042AEB43
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 09:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbgKKI0g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 03:26:36 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28706 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbgKKI0f (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Nov 2020 03:26:35 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AB8O6GC003382;
        Wed, 11 Nov 2020 03:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cUmKwLEAyQVRF4lV9GFoZMc6wfddiF5gnKiTJOkJ0rA=;
 b=ljchvJrCF3n/yPcTgvcEaNJH5vnnBc6f6YQFukrWrP3f3Kq5PMvqxK77eQXrxD1M8tr5
 iY3tTkcJPINN2IqDUVEN5Gx/7HCVZXVjm6dpBI4sKT64/7Yi6aS5G+TAa5KIg7P9lMFI
 JQLdHro3lm6ZaVHs14R0A2mjN7Qf/5ba4oPJg2tMF1O8oyWfAYmBcrBMSz7FLk0CLF3P
 RaqTnZH8EQ47Pfqg3rPJ3O6YguNQS82reafSzuzJmmSsv9iqaOFPshE85VFYUV04SLwH
 76jxhAgaLCGDc4ufPGo3L+lBJNCZIJ/ct4ja8L7nmGe3a4FHjYrM3grmINd9tPT6d5JE 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 34qkt0b0ks-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Nov 2020 03:26:27 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AB8QQbV012197;
        Wed, 11 Nov 2020 03:26:26 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 34qkt0b0k4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Nov 2020 03:26:26 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AB8Lfv1024018;
        Wed, 11 Nov 2020 08:26:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma04ams.nl.ibm.com with ESMTP id 34p26pkay8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Nov 2020 08:26:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0AB8QLkD4194840
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Nov 2020 08:26:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1FD164C040;
        Wed, 11 Nov 2020 08:26:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5E2F04C04E;
        Wed, 11 Nov 2020 08:26:20 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.72.90])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 11 Nov 2020 08:26:20 +0000 (GMT)
Subject: Re: [PATCH 2/2] mm: simplify follow_pte{,pmd}
To:     Christoph Hellwig <hch@lst.de>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     akpm@linux-foundation.org, dan.j.williams@intel.com,
        daniel@ffwll.ch, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-nvdimm@lists.01.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        clang-built-linux@googlegroups.com,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
References: <20201029101432.47011-3-hch@lst.de>
 <20201111022122.1039505-1-ndesaulniers@google.com>
 <20201111081800.GA23492@lst.de>
From:   Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <673267d5-93f5-7278-7a9d-a7b35ede6d48@de.ibm.com>
Date:   Wed, 11 Nov 2020 09:26:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201111081800.GA23492@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_02:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=950 suspectscore=0 clxscore=1011 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110043
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 11.11.20 09:18, Christoph Hellwig wrote:
> On Tue, Nov 10, 2020 at 06:21:22PM -0800, Nick Desaulniers wrote:
>> Sorry, I think this patch may be causing a regression for us for s390?
>> https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/432129279#L768
>>
>> (via https://lore.kernel.org/linux-mm/20201029101432.47011-3-hch@lst.de)
> 
> Hmm, the call to follow_pte_pmd in the s390 code does not actually exist
> in my tree.

This is a mid-air collision in linux-next between

b2ff5796a934 ("mm: simplify follow_pte{,pmd}")
a67a88b0b8de ("s390/pci: remove races against pte updates")
