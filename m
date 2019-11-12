Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDB3F86F9
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 03:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfKLClv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 21:41:51 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:60834 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbfKLClv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 21:41:51 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAC2cxWm056567;
        Tue, 12 Nov 2019 02:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=yAG7acMsZQBRuoFmvUxTJV5rQ0fEVFZnQXbKjy8cNYE=;
 b=lcs63yK7dvGmCHzzY+ZszlhOZikgJ+g0JJ+Ft7mOY8z36c6dcwO4o1s+jfPVfAXN5IBj
 hMDXh6YPOd3QSK1UJhJYlgWz/zihqGdAx6G7OgR0DbGi0Sr5TEge7AHwvg12npwcqP2O
 KO4qmRMiXXmVuXs9q4WsbckeDXAzFb+vzbkDuKgtC3K3A1QKMjE/obCLXNkFp96JhcLx
 qC2kiCvYpInVWVBEgVmVovg4rdZEN7Bf+wZeeRrWtbMKdPeCCGXnNG0UMsl0tuZHGzvP
 OQycRtMg/c0SblRj3CUfwKZ0TAsbVhwE3Yfn4UJkTz47swQtqTeS7mrb1TQ0Wf4ZtMnS dw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2w5ndq1w2p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Nov 2019 02:41:33 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAC2bxEC143093;
        Tue, 12 Nov 2019 02:41:32 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2w67kmwsay-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Nov 2019 02:41:32 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAC2fVB1019173;
        Tue, 12 Nov 2019 02:41:31 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 11 Nov 2019 18:41:31 -0800
Date:   Mon, 11 Nov 2019 18:41:30 -0800
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, xfs <linux-xfs@vger.kernel.org>
Subject: Re: Coverity: xlog_write_iclog(): Memory - corruptions
Message-ID: <20191112024130.GA6212@magnolia>
References: <201911111734.4D8A1DB3DF@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911111734.4D8A1DB3DF@keescook>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=853
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911120020
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911120020
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[Might as well add the XFS list]

On Mon, Nov 11, 2019 at 05:34:25PM -0800, coverity-bot wrote:
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191108 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> 79b54d9bfcdc ("xfs: use bios directly to write log buffers")
> 
> Coverity reported the following:
> 
> *** CID 1487853:  Memory - corruptions  (BAD_FREE)
> /fs/xfs/xfs_log.c: 1819 in xlog_write_iclog()
> 1813     		submit_bio(split);
> 1814
> 1815     		/* restart at logical offset zero for the remainder */
> 1816     		iclog->ic_bio.bi_iter.bi_sector = log->l_logBBstart;
> 1817     	}
> 1818
> vvv     CID 1487853:  Memory - corruptions  (BAD_FREE)

Isn't this a duplicate of 1451989 in the main kernel coverity scan?
Which, AFAICT 145989 is a false positive since iclog->ic_bio does not
itself become the target of a bio_chain.

--D

> vvv     "submit_bio" frees address of "iclog->ic_bio".
> 1819     	submit_bio(&iclog->ic_bio);
> 1820     }
> 1821
> 1822     /*
> 1823      * We need to bump cycle number for the part of the iclog that is
> 1824      * written to the start of the log. Watch out for the header magic
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487853 ("Memory - corruptions")
> Fixes: 79b54d9bfcdc ("xfs: use bios directly to write log buffers")
> 
> 
> Thanks for your attention!
> 
> -- 
> Coverity-bot
