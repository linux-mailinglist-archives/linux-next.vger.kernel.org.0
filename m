Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3963258B2A
	for <lists+linux-next@lfdr.de>; Tue,  1 Sep 2020 11:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgIAJNX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Sep 2020 05:13:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38370 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726044AbgIAJNX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Sep 2020 05:13:23 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08191lCw161621;
        Tue, 1 Sep 2020 05:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=vh82ZqvfNYHb8TupkvFMZAEUYq2dnHzN3E8hPu0gHQE=;
 b=eNP8G/KeFYdbMrKBMXkHUuwN04Tg/mRQVuyIKIEhviyh4nNQLEz46r4IifFIC2Pjvyls
 fRK6NgfHNnaRnG2dUGx7vEB8GD01kIBCQImLPC9FjBRVBsFwdAwCHVJ3w1/NNXj+8y5W
 RsJfNhCXxgOa/Rali6tWfQwXGbtOccW+XhaFPhond4gOgKs4DGvTNRf5o4HRxmAmIKhl
 VY6K/b1VJVz/zlxeHmshlpcG59MapdRh9asACXecYipJGwrRIHcC5MwkZZdi+Q+XHeso
 V6dIXfw+V/GsAHFRRDbOdxZZWOMTTNRj59o6ZcWIMS0qKb8ptaPRcpFloI8mBhcOya0a OA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0a-001b2d01.pphosted.com with ESMTP id 339k4g8qr7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Sep 2020 05:13:15 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0819CWFl021820;
        Tue, 1 Sep 2020 09:13:13 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma03fra.de.ibm.com with ESMTP id 337en89xyj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Sep 2020 09:13:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0819DBxK33030576
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 1 Sep 2020 09:13:11 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E642E52052;
        Tue,  1 Sep 2020 09:13:10 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.200.53])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 3683052050;
        Tue,  1 Sep 2020 09:13:10 +0000 (GMT)
Date:   Tue, 1 Sep 2020 12:13:08 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the arc-current tree
Message-ID: <20200901091308.GD424181@linux.ibm.com>
References: <20200901184928.057f6082@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901184928.057f6082@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-01_04:2020-09-01,2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=998 suspectscore=5
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010075
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 01, 2020 at 06:49:28PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   7000c9462d1b ("arc: fix memory initialization for systems with two memory banks")
> 
> Fixes tag
> 
>   Fixes: 51930df5801e ("mm: free_area_init: allow defining max_zone_pfn in descend ing order")

It's line rewrapping:                                                               ^

> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'
> 
> -- 
> Cheers,
> Stephen Rothwell

-- 
Sincerely yours,
Mike.
