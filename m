Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9EF62A30D3
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 18:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbgKBRFI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 12:05:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37474 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727150AbgKBRFH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 12:05:07 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A2H2DPX169583;
        Mon, 2 Nov 2020 12:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=dnB9HMROvk1UXtoPJ14XhJclqswSfUIDTv5jZc9SJcE=;
 b=K+ej7kRwYXIBmfxQCqE8ld/ya2RWg3+2ibLotECtZSIRXcsr5lJ4CqE7UemSo9MzWi8F
 ATVzOrtyZo9XfkqzMH8PYpB8s7M6381K7REQmaIm0SLVGuEJTwz4MXMwhlAgUWj2DiuK
 8NjfyDnnnhr9/8MtAOndURjF/DoW7ZmTxu54Z6YUSWOjoBytwVJNvHvwzo2K4dy7lEsx
 dVqnRxqXY9YqgB0SgR6idqQzWCgI/XsMkxrkGZKuJEIKEAFXRkk/JKg4NpgyTicb1rGP
 0fLK7dfSxWqMf1S7ypcJBw4zxNeiLufPOxVTh+ERlXuDpYoyUzD1rnSx51dYwfb0vunF 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 34jecs8864-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Nov 2020 12:04:50 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A2H2Pj5170804;
        Mon, 2 Nov 2020 12:04:49 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 34jecs8849-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Nov 2020 12:04:49 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A2GlV2X017477;
        Mon, 2 Nov 2020 17:04:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma05fra.de.ibm.com with ESMTP id 34h01qs6r4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Nov 2020 17:04:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0A2H4iMH28967260
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 2 Nov 2020 17:04:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D085952052;
        Mon,  2 Nov 2020 17:04:44 +0000 (GMT)
Received: from osiris (unknown [9.171.89.103])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 74A1C52050;
        Mon,  2 Nov 2020 17:04:44 +0000 (GMT)
Date:   Mon, 2 Nov 2020 18:04:43 +0100
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Qian Cai <cai@redhat.com>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        oleg@redhat.com, tglx@linutronix.de,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] s390: add support for TIF_NOTIFY_SIGNAL
Message-ID: <20201102170443.GA4494@osiris>
References: <362e3645e2c0891309c07e244a147f0c32f106da.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <362e3645e2c0891309c07e244a147f0c32f106da.camel@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-02_12:2020-11-02,2020-11-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=679 adultscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011020128
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 02, 2020 at 11:59:41AM -0500, Qian Cai wrote:
> On Sun, 2020-11-01 at 17:31 +0000, Heiko Carstens wrote:
> > On Thu, Oct 29, 2020 at 10:21:11AM -0600, Jens Axboe wrote:
> > > Wire up TIF_NOTIFY_SIGNAL handling for s390.
> > > 
> > > Cc: linux-s390@vger.kernel.org
> > > Signed-off-by: Jens Axboe <axboe@kernel.dk>
> 
> Even though I did confirm that today's linux-next contains this additional patch
> from Heiko below, a z10 guest is still unable to boot. Reverting the whole
> series (reverting only "s390: add support for TIF_NOTIFY_SIGNAL" introduced
> compiling errors) fixed the problem, i.e., git revert --no-edit
> af0dd809f3d3..7b074c15374c [1]
> 
> .config: https://cailca.coding.net/public/linux/mm/git/files/master/s390.config

I'll take a look at it, but probably not today anymore.
