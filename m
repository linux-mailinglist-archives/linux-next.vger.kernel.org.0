Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF52843B351
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 15:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234026AbhJZNpY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 09:45:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37580 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230420AbhJZNpX (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 09:45:23 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QCg0oO029310;
        Tue, 26 Oct 2021 13:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=UBYGMXPSx3UdboRc4Q9XodDJTnbG4Tc0Ww1y03wAVHg=;
 b=UVQlwtPupJmFN6nv2lhB60hexc1zw23mbl44L3d05fZRmLntK2bfuWq95GZbHgwehjmU
 ZA8V2tht5qFcQTicEy2ouqBN9rhknAsP0lssJwoPGVb2JGQBIUwuW0T434r3olKdZ7Oq
 IbRhPWcOqyYlIPvQXc8DfWMOvnh33nLIZ/jAiyhwG4rWtP81KMoUUQw9mt68ay9Zbb4c
 G9vLdzTRFcCT9lqlXVWl9r80soqKEuvCYRhQo0UGgK0L1jeV/nU9GKuJX/5i84r8AZsT
 JlnI+UeLrfe5HMB5rUuswFEhJB3CnVIubYZnQuMxS68n6YrMtuDCFsTnHUJnnuVr1mzn zw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4k3yr21-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Oct 2021 13:42:32 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19QDLAk8017283;
        Tue, 26 Oct 2021 13:42:32 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4k3yr10-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Oct 2021 13:42:31 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19QDboOQ027758;
        Tue, 26 Oct 2021 13:42:29 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma06fra.de.ibm.com with ESMTP id 3bx4ehnntg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Oct 2021 13:42:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19QDgQaC55837044
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Oct 2021 13:42:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1801011C05E;
        Tue, 26 Oct 2021 13:42:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CB11B11C058;
        Tue, 26 Oct 2021 13:42:25 +0000 (GMT)
Received: from localhost (unknown [9.171.26.69])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 26 Oct 2021 13:42:25 +0000 (GMT)
Date:   Tue, 26 Oct 2021 15:42:24 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jiri Olsa <jolsa@redhat.com>, linux-next@vger.kernel.org
Subject: Re: Upcoming merge conflict between ftrace and s390 trees
Message-ID: <your-ad-here.call-01635255744-ext-3853@work.hours>
References: <YXAqZ/EszRisunQw@osiris>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YXAqZ/EszRisunQw@osiris>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wNXFm0KEabCfvKiazIfDela-L-N6935Z
X-Proofpoint-ORIG-GUID: B9_Lf0xiU_4qZQ956Tw00bGsEbJrlGVf
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=896 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260078
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 20, 2021 at 04:40:39PM +0200, Heiko Carstens wrote:
> just as heads-up: there will be an upcoming merge conflict between
> ftrace and s390 trees in linux-next which will cause a compile error
> for s390.
> 
> With the s390 tree this commit is already in linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git/commit/?h=features&id=c316eb4460463b6dd1aee6d241cb20323a0030aa
> 
> And soon this patch will likely be within the ftrace tree:
> https://lore.kernel.org/lkml/20211008091336.33616-9-jolsa@kernel.org/
> 
> Maybe Steven could reply to this when he applies it.

Hi Stephen,

could you please pick up this fixup from Heiko in linux-next on top of
s390 tree? ftrace changes mentioned are now in linux-next and this fixup
is needed to avoid s390 build error.

Thank you,
Vasily
