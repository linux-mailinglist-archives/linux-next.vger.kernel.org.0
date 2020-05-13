Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8F81D18D0
	for <lists+linux-next@lfdr.de>; Wed, 13 May 2020 17:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729250AbgEMPLU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 May 2020 11:11:20 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:43318 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbgEMPLU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2020 11:11:20 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04DF7DEC014596;
        Wed, 13 May 2020 15:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=M7tgw7hQmZDZ9d1ChBVFlk09jVIDx3jqCjHhRB1m9TI=;
 b=EvBKpFq8qD5mFfdo2m2ZU2l0N/Odm/zYRYiOXvH4Mi68c0/r77mgxYyfigdqTaqrnOK2
 5kcFD6WBlr2MAeP9KYE1U+DFV/FftUk2yCGAM8StyV2iuaXaSMgfkdQERhXDPsRFU+rc
 O4Pwssz8GVW507lJDxLJvb95eyBlvPMGSXfIvtyzC15CqWX4Eg5FTohF0NC6CbUwkkO4
 82LCIhMJFmOwKh0TFzRn56LqPyg9BdEcUgclS/k5ueFuUGgpb3vhoH2qhla9000xEWab
 XXqFw40B2sy6aqc1CGLP7iBdyQmZrpxarfPsZHDeiR0OMK99BSRQC7qIPrqq3Pkcc9yl nA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 3100xwct6b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 May 2020 15:11:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04DF8afw009989;
        Wed, 13 May 2020 15:09:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 3100ym8m3h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 May 2020 15:09:06 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04DF938P005780;
        Wed, 13 May 2020 15:09:04 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 13 May 2020 08:09:03 -0700
Date:   Wed, 13 May 2020 18:08:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Miklos Szeredi <miklos@szeredi.hu>,
        Amir Goldstein <amir73il@gmail.com>
Cc:     linux-unionfs@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v3] ovl: potential crash in ovl_fid_to_fh()
Message-ID: <20200513150855.GD3041@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513102346.6c04d912@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9620 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005130136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9620 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1011 cotscore=-2147483648
 mlxscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005130136
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The "buflen" value comes from the user and there is a potential that it
could be zero.  In do_handle_to_path() we know that "handle->handle_bytes"
is non-zero and we do:

	handle_dwords = handle->handle_bytes >> 2;

So values 1-3 become zero.  Then in ovl_fh_to_dentry() we do:

	int len = fh_len << 2;

So now len is in the "0,4-128" range and a multiple of 4.  But if
"buflen" is zero it will try to copy negative bytes when we do the
memcpy in ovl_fid_to_fh().

	memcpy(&fh->fb, fid, buflen - OVL_FH_WIRE_OFFSET);

And that will lead to a crash.  Thanks to Amir Goldstein for his help
with this patch.

Fixes: cbe7fba8edfc ("ovl: make sure that real fid is 32bit aligned in memory")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
v2: Move the check after the other checks
v3: Fix Fixes tag

 fs/overlayfs/export.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
index 475c61f53f0fe..ed5c1078919cc 100644
--- a/fs/overlayfs/export.c
+++ b/fs/overlayfs/export.c
@@ -783,6 +783,9 @@ static struct ovl_fh *ovl_fid_to_fh(struct fid *fid, int buflen, int fh_type)
 	if (fh_type != OVL_FILEID_V0)
 		return ERR_PTR(-EINVAL);
 
+	if (buflen <= OVL_FH_WIRE_OFFSET)
+		return ERR_PTR(-EINVAL);
+
 	fh = kzalloc(buflen, GFP_KERNEL);
 	if (!fh)
 		return ERR_PTR(-ENOMEM);
-- 
2.26.2
