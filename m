Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FF51C3ED8
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 17:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgEDPoY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 May 2020 11:44:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21568 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728983AbgEDPoX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2020 11:44:23 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 044F2XpZ139280;
        Mon, 4 May 2020 11:44:18 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 30s50ys4ce-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 04 May 2020 11:44:18 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 044Ffo2O012898;
        Mon, 4 May 2020 15:44:15 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma03ams.nl.ibm.com with ESMTP id 30s0g5n435-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 04 May 2020 15:44:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 044Fh3vg61735376
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 4 May 2020 15:43:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D867B4C04A;
        Mon,  4 May 2020 15:44:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E51214C040;
        Mon,  4 May 2020 15:44:11 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.201.44])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon,  4 May 2020 15:44:11 +0000 (GMT)
Date:   Mon, 4 May 2020 18:44:10 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Marc Hartmayer <mhartmay@linux.ibm.com>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: Tree for May 4 --> mm: free_area_init: allow
 defining max_zone_pfn in descending order does increase memory use
Message-ID: <20200504154410.GF342687@linux.ibm.com>
References: <20200504173547.2cdd83bf@canb.auug.org.au>
 <9e9edd1e-6653-a585-0e22-69930a07dce1@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e9edd1e-6653-a585-0e22-69930a07dce1@de.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-05-04_09:2020-05-04,2020-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1011 suspectscore=0 mlxlogscore=798 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005040124
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Ho Christian,

On Mon, May 04, 2020 at 04:50:06PM +0200, Christian Borntraeger wrote:
> Mike,
> commit 51a2f644fd020d5f090044825c388444d11029d ("mm: free_area_init: allow defining max_zone_pfn in descending order")
> does increase the memory use on s390 (e.g. 700 MB vs.1.8 GB).
> 
> Something is odd in this patch. Any idea?

Yeah, this patch is buggy. In short, it breaks zone size calculation on
s390 and some other architectures.

I've just replied at [1] with more details and a fix.

[1] https://lore.kernel.org/linux-mm/20200504153901.GM14260@kernel.org/

-- 
Sincerely yours,
Mike.
