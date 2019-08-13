Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 114D48BD2F
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 17:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbfHMPbZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 11:31:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57784 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728738AbfHMPbZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 11:31:25 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7DFCVG5064510;
        Tue, 13 Aug 2019 11:31:15 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ubx5p5h7n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Aug 2019 11:31:15 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7DFULnj023572;
        Tue, 13 Aug 2019 15:31:13 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma02dal.us.ibm.com with ESMTP id 2u9nj63gkb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Aug 2019 15:31:13 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7DFVDxu54133090
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Aug 2019 15:31:13 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 026FDB2064;
        Tue, 13 Aug 2019 15:31:13 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DA024B205F;
        Tue, 13 Aug 2019 15:31:12 +0000 (GMT)
Received: from paulmck-ThinkPad-W541 (unknown [9.70.82.154])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 13 Aug 2019 15:31:12 +0000 (GMT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id BF70E16C0E5D; Tue, 13 Aug 2019 08:31:13 -0700 (PDT)
Date:   Tue, 13 Aug 2019 08:31:13 -0700
From:   "Paul E. McKenney" <paulmck@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20190813153113.GD28441@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <20190813175732.2c97d412@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813175732.2c97d412@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-13_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130158
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 13, 2019 at 05:57:32PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (powerpc allnoconfig)
> failed like this:
> 
> drivers/base/core.c: In function 'device_links_read_lock_held':
> drivers/base/core.c:106:9: error: implicit declaration of function 'lock_is_held'; did you mean 'lockref_get'? [-Werror=implicit-function-declaration]
>   return lock_is_held(&device_links_lock);
>          ^~~~~~~~~~~~
>          lockref_get
> 
> Caused by commit
> 
>   4a3a5474b4c1 ("driver/core: Convert to use built-in RCU list checking")
> 
> lock_is_held() us only available if CONFIG_LOCKDEP is set.

Joel, one approach would be to make lock_is_held() variant of
device_links_read_lock_held() be a macro rather than a function.
Another would be to use #ifdef so as to invoke lock_is_held() only when
lockdep is enabled.

Or do you have a better approach?

							Thanx, Paul

> I have reverted that commit for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


