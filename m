Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01909280ACD
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 01:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732836AbgJAXD6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 19:03:58 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:54230 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbgJAXD5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 19:03:57 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 091N1Avi141327;
        Thu, 1 Oct 2020 23:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 from : mime-version : to : cc : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=vOPqAmXxwNywmBL8EtvY+0JDVVyhFlGepf2Y739w2Pc=;
 b=d1/RCwI5+xIGyu2UOABJnHOrhFZ8kzIhWSQc9d7d9gh7Sh2FWuAntDy3ZgQ0RCsz/WEz
 ik5bDbK9eV81tM+M1OYfhNMmv4gtK+L64ZC0qahxAlzI0Z7CQ1utKpZTucqWbkGbNI0E
 ClnqWJcADvUMHcMhOpUVmo0ts1y6TeUiV/+BBS5z3I3MZghauuzZ51ni4Hc4JpT8nENo
 RGCq9dqKJMCK4ojQbiFR2QZz0FVFJSc6TBFAOYSHrP+Lud/LtZKQQR/JQaYmIKTRqkKY
 Jdu6tDrh0dEqogOjxP89R/zI5QA2TZlNrFIIle1KeYDUUEaYkJgmajDKZW0popg0dS// Uw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 33swkm8r23-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 01 Oct 2020 23:03:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 091N11Xm125453;
        Thu, 1 Oct 2020 23:03:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 33uv2hjebp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Oct 2020 23:03:47 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 091N3iAh014839;
        Thu, 1 Oct 2020 23:03:44 GMT
Received: from [10.159.142.93] (/10.159.142.93)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 01 Oct 2020 16:03:44 -0700
Message-ID: <5F76604E.6080304@oracle.com>
Date:   Thu, 01 Oct 2020 16:03:42 -0700
From:   si-wei liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Michael S. Tsirkin" <mst@redhat.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the vhost tree
References: <20201002083200.685639e9@canb.auug.org.au>
In-Reply-To: <20201002083200.685639e9@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9761 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010010185
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9761 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010010185
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks Stephen, the SHA1 referenced is not correct. A v2 patch is posted.

Thanks,
-Siwei


On 10/1/2020 3:32 PM, Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>    c9795f8fbb41 ("vhost-vdpa: fix page pinning leakage in error path")
>
> Fixes tag
>
>    Fixes: 20453a45fb06 ("vhost: introduce vDPA-based backend")
>
> has these problem(s):
>
>    - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: 4c8cf31885f6 ("vhost: introduce vDPA-based backend")
>

