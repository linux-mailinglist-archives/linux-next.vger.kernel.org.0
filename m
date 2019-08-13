Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0C4D8BB62
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 16:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbfHMOXM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 10:23:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25540 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729513AbfHMOXM (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 10:23:12 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7DEJ7cq111818;
        Tue, 13 Aug 2019 10:23:00 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ubxub09te-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Aug 2019 10:23:00 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7DEJjkL016478;
        Tue, 13 Aug 2019 14:22:59 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma03dal.us.ibm.com with ESMTP id 2u9nj6x95n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Aug 2019 14:22:59 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7DEMwoa46530858
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Aug 2019 14:22:58 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B1968B2065;
        Tue, 13 Aug 2019 14:22:58 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 95178B205F;
        Tue, 13 Aug 2019 14:22:58 +0000 (GMT)
Received: from paulmck-ThinkPad-W541 (unknown [9.70.82.154])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 13 Aug 2019 14:22:58 +0000 (GMT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id 6743E16C1293; Tue, 13 Aug 2019 07:22:59 -0700 (PDT)
Date:   Tue, 13 Aug 2019 07:22:59 -0700
From:   "Paul E. McKenney" <paulmck@linux.ibm.com>
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the rcu
 tree
Message-ID: <20190813142259.GZ28441@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <20190813155048.59dd9bdf@canb.auug.org.au>
 <0d7ff624-dce3-3961-b9a6-7de8eba2bdee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d7ff624-dce3-3961-b9a6-7de8eba2bdee@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-13_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130152
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 13, 2019 at 10:50:05AM +0200, Rafael J. Wysocki wrote:
> On 8/13/2019 7:50 AM, Stephen Rothwell wrote:
> >Hi all,
> >
> >Today's linux-next merge of the driver-core tree got a conflict in:
> >
> >   drivers/base/power/runtime.c
> >
> >between commit:
> >
> >   4a3a5474b4c1 ("driver/core: Convert to use built-in RCU list checking")
> >
> >from the rcu tree and commit:
> >
> >   515db266a9da ("driver core: Remove device link creation limitation")
> >
> >from the driver-core tree.
> >
> >I fixed it up (see below) and can carry the fix as necessary. This
> >is now fixed as far as linux-next is concerned, but any non trivial
> >conflicts should be mentioned to your upstream maintainer when your tree
> >is submitted for merging.  You may also want to consider cooperating
> >with the maintainer of the conflicting tree to minimise any particularly
> >complex conflicts.
> >
> The fix looks good to me, thanks!

Same here, and thank you!

							Thanx, Paul
