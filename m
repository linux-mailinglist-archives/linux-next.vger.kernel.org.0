Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7DA26A9E0
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 18:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbgIOQd0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 12:33:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16850 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727707AbgIOQcb (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Sep 2020 12:32:31 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08FG7ThS089884;
        Tue, 15 Sep 2020 12:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=CiMC+z0wTA6D28sdb4pjOXGM2p9+N1YiCpn2f1a2JgY=;
 b=rHHsuwSTQMZAYo+Bp5TZyC1SCIpF3HFkAegFokwCEaFh3UlYZiXiOQgxSUJwlZcJh5tP
 oO/VP9TpgeexDhBHetBCMCzehYIBdvamkyoOjogNAQyonhL6PmX1YwIp0GmhhNHdk40s
 htt2IdIosuXQaey8GR9d1HARTbh1KjMwIZdFXwTYjeDU49i1E7CjMeOnsQ5fdcqzwJcp
 GJa4mbQT/WklBPB/L5VEVmPnAmk5GsY8qv8+55fbGupX4GKRHu6p/6Z5xQM6F1JR83zm
 zKSjcLQGOL01vsxrm61h+C2O3e3i+ZZGQufodf/T7efflce5o3Dd+BC4kccNARfq3vf4 TA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33jx26wh5c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Sep 2020 12:31:32 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08FGN9Ed010481;
        Tue, 15 Sep 2020 16:31:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma06ams.nl.ibm.com with ESMTP id 33hb1j2uaw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Sep 2020 16:31:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 08FGVSOg26739124
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Sep 2020 16:31:28 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 558A0AE04D;
        Tue, 15 Sep 2020 16:31:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 86C0BAE051;
        Tue, 15 Sep 2020 16:31:27 +0000 (GMT)
Received: from [9.199.38.191] (unknown [9.199.38.191])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 15 Sep 2020 16:31:27 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Re: [5.9.0-rc5-20200914] Kernel crash while running LTP(mlock201)
From:   Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20200915130907.GE5449@casper.infradead.org>
Date:   Tue, 15 Sep 2020 22:01:26 +0530
Cc:     Michael Ellerman <mpe@ellerman.id.au>, linux-next@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DA564420-EEF2-40D3-9A7B-3FDC0ABCF802@linux.vnet.ibm.com>
References: <3DCED508-4DC0-42AA-9CFF-3AB260ED1E9A@linux.vnet.ibm.com>
 <87o8m7p9jd.fsf@mpe.ellerman.id.au>
 <20200915130907.GE5449@casper.infradead.org>
To:     Matthew Wilcox <willy@infradead.org>
X-Mailer: Apple Mail (2.3445.104.15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-15_11:2020-09-15,2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=776
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150130
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


> On 15-Sep-2020, at 6:39 PM, Matthew Wilcox <willy@infradead.org> =
wrote:
>=20
> On Tue, Sep 15, 2020 at 09:24:38PM +1000, Michael Ellerman wrote:
>> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
>>> While running LTP tests (specifically mlock201) against =
next-20200914 tree
>>> on a POWER9 LPAR results in following crash.
>>=20
>> Looks the same as:
>>=20
>> https://lore.kernel.org/linux-mm/20200914085545.GB28738@shao2-debian/
>=20
> =
https://lore.kernel.org/linux-mm/20200914112738.GM6583@casper.infradead.or=
g/

Thanks. The patch fixes the problem for me.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

thanks
-Sachin

