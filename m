Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42DD51EB39F
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 05:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgFBDHV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Jun 2020 23:07:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60918 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725841AbgFBDHU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Jun 2020 23:07:20 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0522X4bV101055;
        Mon, 1 Jun 2020 23:07:15 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31cw8tr21s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 01 Jun 2020 23:07:15 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0523630i004988;
        Tue, 2 Jun 2020 03:07:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03ams.nl.ibm.com with ESMTP id 31bf47w5by-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Jun 2020 03:07:13 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 05237BcU54985066
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 2 Jun 2020 03:07:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DDB80A4055;
        Tue,  2 Jun 2020 03:07:10 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E9DBAA4040;
        Tue,  2 Jun 2020 03:07:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.91.137])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue,  2 Jun 2020 03:07:09 +0000 (GMT)
Subject: Re: linux-next: Signed-off-by missing for commit in the ext4 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Theodore Ts'o" <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200529221128.668844ca@canb.auug.org.au>
From:   Ritesh Harjani <riteshh@linux.ibm.com>
Date:   Tue, 2 Jun 2020 08:37:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200529221128.668844ca@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Message-Id: <20200602030709.E9DBAA4040@d06av23.portsmouth.uk.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-01_12:2020-06-01,2020-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1011 adultscore=0
 suspectscore=0 mlxlogscore=999 cotscore=-2147483648 priorityscore=1501
 spamscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006020012
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 5/29/20 5:41 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>    560d6b3da024 ("ext4: mballoc: fix possible NULL ptr & remove BUG_ONs from DOUBLE_CHECK")
> 
> is missing a Signed-off-by from its author.

My bad. I guess it got missed due to the three dotted lines.

https://patchwork.ozlabs.org/project/linux-ext4/patch/9a54f8a696ff17c057cd571be3d15ac3ec1407f1.1589086800.git.riteshh@linux.ibm.com/

-ritesh
